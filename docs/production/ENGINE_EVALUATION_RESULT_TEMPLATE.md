# Engine Evaluation Result Template

**Status:** EVIDENCE TEMPLATE — blank until a prototype is actually executed
**Parent:** Issue #3 / DEC-001
**Runbook:** [ENGINE_EVALUATION_RUNBOOK.md](ENGINE_EVALUATION_RUNBOOK.md)

> Copy this template for each candidate/prototype execution. Never mark a result PASS unless the named test was actually executed and the evidence is retained.

## Identification

| Field | Value |
|---|---|
| Candidate | UNKNOWN |
| Prototype | UNKNOWN |
| Engine/version | UNKNOWN |
| Modules/packages | UNKNOWN |
| Repository branch | UNKNOWN |
| Commit SHA | UNKNOWN |
| Operator | UNKNOWN |
| Execution date | UNKNOWN |
| Result | NOT PERFORMED |

## Environment

| Field | Value |
|---|---|
| OS/build | UNKNOWN |
| CPU | UNKNOWN |
| RAM | UNKNOWN |
| GPU | UNKNOWN / N/A |
| GPU driver | UNKNOWN / N/A |
| Build configuration | UNKNOWN |
| Additional runtime dependencies | UNKNOWN |

## Inputs

- Scenario identifier: UNKNOWN
- Seed/input identifier: UNKNOWN
- Input artifact/hash: UNKNOWN
- Declared test duration/tick count/sample count: UNKNOWN
- Material deviations from the runbook: NONE / UNKNOWN

## Measurements

Record only measurements produced by the executed prototype.

### Prototype 1 — Determinism

- Initial-state hash: NOT PERFORMED
- Input-sequence hash: NOT PERFORMED
- Final-state hash: NOT PERFORMED
- Replay final-state hash: NOT PERFORMED
- First divergence tick: NOT PERFORMED
- Engine physics in authoritative resolution: UNKNOWN

### Prototype 2 — Body Integrity Budget

- Entity count: NOT PERFORMED
- Regions/entity: NOT PERFORMED
- Warm-up duration: NOT PERFORMED
- Sample count: NOT PERFORMED
- Median tick time: NOT PERFORMED
- p95 tick time: NOT PERFORMED
- Maximum tick time: NOT PERFORMED
- Allocations/tick: NOT PERFORMED

### Prototype 3 — Gummy Deformation

- Average frame time: NOT PERFORMED
- p95 frame time: NOT PERFORMED
- Average FPS: NOT PERFORMED
- CPU/GPU split: NOT PERFORMED
- Stretch/compress demonstrated: NOT PERFORMED
- Limb separation presentation demonstrated: NOT PERFORMED
- Post-separation animation demonstrated: NOT PERFORMED
- IK/procedural adjustment demonstrated: NOT PERFORMED
- Human visual review: NOT PERFORMED

### Prototype 4 — Networking

- Client count: NOT PERFORMED
- Simulated latency: NOT PERFORMED
- Inputs reached authoritative server: NOT PERFORMED
- State returned to both clients: NOT PERFORMED
- Deliberate prediction mismatch injected: NOT PERFORMED
- Reconciliation observed: NOT PERFORMED
- Correction distance/time: NOT PERFORMED
- Desync/error count: NOT PERFORMED
- Human visible-pop review: NOT PERFORMED

## Evidence Artifacts

List durable artifacts and their paths/identifiers.

- Raw log: NOT PERFORMED
- Machine-readable result: NOT PERFORMED
- Profiler capture: NOT PERFORMED
- Visual capture: NOT PERFORMED
- State/input hashes: NOT PERFORMED
- Other: NOT PERFORMED

## Pass/Fail Evaluation

**Result:** NOT PERFORMED

**Applicable ADR pass criterion:** UNKNOWN

**Observed evidence:** NOT PERFORMED

**Reasoning:** NOT PERFORMED

A result may be:

- PASS — executed evidence satisfies the prototype's stated pass boundary;
- FAIL — executed evidence does not satisfy that boundary;
- BLOCKED — the test could not be completed and the blocker is recorded;
- NOT PERFORMED — no valid execution evidence exists.

## Limitations

- UNKNOWN

## Follow-up

- UNKNOWN

## Governance Check

- [ ] No result was inferred from vendor documentation alone.
- [ ] No private credential, patent/legal record, protected drop configuration, or anti-cheat signature is included.
- [ ] Result status matches actual execution evidence.
- [ ] DEC-001 was not changed by this result alone.
- [ ] Any human-review criterion is explicitly recorded as performed or not performed.
