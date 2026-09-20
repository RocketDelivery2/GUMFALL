# GUMFALL Engine Evaluation Runbook

**Status:** PROPOSED execution protocol / NOT PERFORMED benchmark results
**Issue:** #3 — Evaluate game-engine options
**Decision:** DEC-001 remains OPEN
**Related:** [Engine Evaluation ADR](ENGINE_EVALUATION_ADR.md) · [Architecture](../technical/ARCHITECTURE.md) · [Performance Budgets](../technical/PERFORMANCE_BUDGETS.md)

---

## 1. Purpose

This runbook makes the four engine-evaluation prototypes comparable and auditable.

It does not select an engine. It defines how evidence must be produced before DEC-001 can be resolved.

Use [ENGINE_EVALUATION_RESULT_TEMPLATE.md](ENGINE_EVALUATION_RESULT_TEMPLATE.md) for each executed candidate/prototype result.

Every candidate run must preserve the same authoritative simulation intent and record enough metadata for another contributor to reproduce the result.

---

## 2. Evidence Package

Each candidate/prototype run must record:

The helper `tools/Collect-EngineEvaluationEnvironment.ps1` may be used to capture a non-identifying environment JSON baseline. It intentionally excludes hostname, username, serial numbers, and network identifiers.

- engine name and exact version;
- engine modules/packages used;
- operating system and build;
- CPU, RAM, GPU, and driver version where presentation is involved;
- source branch and commit SHA;
- build configuration;
- test seed/input identifier;
- measured output;
- pass/fail against the ADR criterion;
- raw logs or machine-readable result artifact;
- known limitations and deviations.

Screenshots or videos may support human review but never replace authoritative numeric/log evidence for determinism, Body Integrity, or networking.

Each machine-readable result manifest must validate against `schemas/engine_evaluation_result.schema.json`. The repository gate runs `tools/Test-EngineEvaluationEvidence.ps1`, which also rejects PASS/FAIL manifests that omit execution time, measurements, or evidence artifacts, and rejects selected identifying metadata keys.

Recommended public evidence layout:

```text
evidence/engine-evaluation/
  unity/
  unreal/
  godot/
  o3de/
  custom/
```

Do not commit credentials, proprietary SDK material, private anti-cheat logic, protected drop configurations, or private legal/IP records.

---

## 3. Prototype 1 — Determinism

**ADR target:** fixed-tick simulation at 60 Hz; identical inputs must produce bit-identical same-platform outputs.

### Required scenario

- two simulated entities;
- integer or otherwise explicitly controlled authoritative state representation;
- position and velocity state;
- one bounded collision interaction;
- deterministic seeded random sequence;
- recorded ordered input sequence;
- fixed number of simulation ticks declared in the result metadata.

### Required evidence

- initial-state hash;
- input-sequence hash;
- final-state hash;
- per-tick or periodic authoritative state hash;
- replay run hashes;
- explicit divergence tick if any;
- whether engine physics participated in authoritative resolution.

Candidate spikes may emit the neutral JSON trace defined by `schemas/engine_evaluation_trace.schema.json`. Use `tools/Compare-EngineEvaluationDeterminismTrace.ps1` to compare baseline and replay traces and report the first authoritative-state divergence. The comparator is evidence tooling only; it does not make an engine decision.

### Pass

Same-platform replay produces no authoritative-state divergence for the tested scenario.

### Not proven by a pass

A pass does not establish cross-platform determinism, production-scale performance, networking correctness, or deterministic third-party physics.

---

## 4. Prototype 2 — Body Integrity Budget

**ADR target:** 32 entities × 8 simulated body regions with total authoritative simulation time no greater than 2 ms per tick for the defined benchmark.

### Required scenario

Each entity has eight regions containing at minimum:

- region identifier;
- local integrity value;
- connection/separation state.

Each tick performs one deterministic damage event per entity and evaluates the affected region's state transition.

### Required evidence

- hardware/OS metadata;
- build configuration;
- warm-up duration;
- measured sample count;
- per-tick timings;
- median;
- p95;
- maximum observed tick time;
- allocations per tick if the engine profiler exposes them;
- profiler capture or raw timing artifact.

For raw tick timing interchange, use a CSV with exactly these required columns:

```text
tick,duration_ms
```

`tools/Summarize-EngineEvaluationBodyIntegrityTiming.ps1` reports sample count, average, median, p95, maximum, and the number of ticks exceeding the declared threshold. The summarizer does not run the engine benchmark and does not substitute for profiler evidence.

### Pass

The benchmark satisfies the ADR's stated 2 ms/tick criterion under the declared test conditions. The repository summarizer treats the criterion as all recorded authoritative-simulation tick samples at or below 2.0 ms unless the ADR is explicitly revised.

### Not proven by a pass

A pass does not establish full combat performance, rendering performance, server capacity, or 64+ entity production limits.

---

## 5. Prototype 3 — Gummy Deformation Presentation

**ADR target:** one gummy character demonstrates runtime stretch/compress deformation, limb separation presentation, and IK/repositioning at 60 fps.

### Required scenario

- one skinned or otherwise articulated gummy character;
- runtime stretch/compress deformation;
- one detachable limb presentation;
- remaining character rig continues to animate after separation;
- at least one IK/procedural adjustment after separation.

### Required evidence

- capture of the visual result;
- average and p95 frame time for the test scene;
- CPU/GPU split if profiler supports it;
- deformation implementation approach;
- asset authoring steps required;
- iteration pain points and unsupported operations.

### Pass

The Design Authority accepts the minimum visual result and the test scene maintains the ADR's 60 fps criterion on the declared hardware.

### Human-review boundary

Visual quality is inherently a human review item. Performance measurements remain quantitative evidence.

Use [ENGINE_EVALUATION_VISUAL_REVIEW.md](ENGINE_EVALUATION_VISUAL_REVIEW.md) to record the required human presentation judgment against the same source SHA and retained capture used for the Prototype 3 performance evidence.

---

## 6. Prototype 4 — Server-Authoritative Networking

**ADR target:** minimal two-player session, authoritative server, local client prediction, server reconciliation, and 60 ms simulated latency.

### Required scenario

- dedicated/headless or server-oriented process where supported;
- two remote/local client instances;
- clients send inputs rather than authoritative outcome state;
- server advances authoritative simulation;
- state updates return to clients;
- one intentional client prediction mismatch exercises reconciliation.

### Required evidence

- server and client build versions;
- simulated latency configuration;
- ordered input log;
- authoritative state log;
- reconciliation event log;
- disconnect/desync errors;
- visual capture for reconciliation quality;
- measured correction distance/time where available.

### Pass

Inputs reliably reach the server, authoritative state returns to both clients, and the deliberate mismatch is reconciled without violating simulation authority.

The ADR's human-visible "without visible pop" criterion must be reviewed from the capture; it is not inferred from logs alone.

Use [ENGINE_EVALUATION_NETWORK_EVIDENCE.md](ENGINE_EVALUATION_NETWORK_EVIDENCE.md) to record server/client build identity, latency conditions, ordered inputs, authoritative state, reconciliation events, desync/errors, and the separate human visible-pop review.

---

## 7. Candidate Execution Rules

- Keep each candidate spike isolated from production architecture.
- Do not reuse an engine-specific implementation as evidence for another candidate.
- Do not change DEC-001 while a required prototype is missing.
- A failed prototype is evidence, not permission to hide or delete the result.
- If a test setup changes materially, rerun affected candidates or mark the comparison non-equivalent.
- Vendor documentation may establish capability availability, but only a GUMFALL prototype can establish project fit.

---

## 8. Review Matrix

For each candidate, the decision review must have evidence for:

| Area | Required evidence |
|---|---|
| Determinism | Prototype 1 result |
| Body Integrity performance | Prototype 2 result |
| Gummy deformation | Prototype 3 result + human visual review |
| Multiplayer authority | Prototype 4 result |
| Tooling/iteration | authoring notes from prototypes |
| Licensing | dated official license/terms evidence |
| Team skill requirements | measured implementation/authoring notes plus staffing analysis |
| Maintainability | dependency count, custom engine code, upgrade constraints, documented risks |

No overall score, recommendation, or winner is recorded until all required evidence intended for the decision has been reviewed by the decision owner.

---

## 9. Completion Gate

Issue #3 can be closed only when:

- [ ] required candidates have an explicit evaluation disposition;
- [ ] Prototypes 1–4 have recorded evidence for the candidates used in the decision;
- [ ] licensing evidence is dated and reviewed;
- [ ] major tooling/team/maintenance tradeoffs are documented;
- [ ] Design Authority records the accepted engine decision in DEC-001;
- [ ] downstream planning documents are updated to reflect the accepted decision.

Until then, engine selection remains OPEN and downstream runtime implementation remains gated.
