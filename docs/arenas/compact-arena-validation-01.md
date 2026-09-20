# Compact Arena — Validation 01

**Status:** PROPOSED — technology-neutral validation specification for Issue #7.
**Authority labels:** VERIFIED | DERIVED | PROPOSED | ASSUMPTION | UNKNOWN | NOT PERFORMED
**Issue:** #7 — Compact Arena production specification to validate the GelFlow combat slice
**Architecture gate:** DEC-001 remains OPEN. This document does not select an engine, programming language, networking stack, persistence system, deployment platform, or presentation technology.

---

## 1. Purpose

[DERIVED] Compact Arena — Validation 01 is a technology-neutral GelFlow validation harness for deterministic combat-system testing.

[VERIFIED] The vertical slice must prove that GelFlow combat, Body Integrity, armor, abilities, enemies, content validation, and related systems function together.

[DERIVED] This validation harness is distinct from the Bronze Paw Orchard Ring. The Bronze Paw Orchard Ring is a proposed structured arena / vertical-slice match environment, while this document defines a controlled development environment for repeatable simulation and acceptance evidence.

[NOT PERFORMED] No runtime arena, engine scene, test harness, replay system, or acceptance implementation is authorized or claimed by this document.

---

## 2. Governance Boundary

[VERIFIED] DEC-001 remains OPEN.

Therefore this specification must remain independent of:

- engine choice;
- programming language;
- rendering framework;
- physics implementation;
- networking implementation;
- hosting or cloud provider;
- persistence technology;
- engine-specific coordinate or asset formats.

[DERIVED] Authoritative acceptance evidence must be based on simulation state, deterministic inputs, state transitions, events, or trace output rather than screenshots, animation timing, camera output, or presentation-only physics.

---

## 3. Relationship to the Bronze Paw Orchard Ring

[VERIFIED] The vertical-slice specification identifies the Bronze Paw Orchard Ring as a compact arena whose success criterion includes completing a two-player match.

[PROPOSED] Compact Arena — Validation 01 is not the Bronze Paw Orchard Ring.

[DERIVED] The two environments may later share concepts or test scenarios, but their purposes are different:

- Compact Arena — Validation 01: deterministic development and acceptance harness.
- Bronze Paw Orchard Ring: playable structured-combat arena.

[UNKNOWN] Whether a future implementation should reuse geometry, data, assets, or configuration between the two environments.

---

## 4. Validation Scope

The harness is intended to exercise the following repository-supported systems.

### 4.1 Player Combat

[VERIFIED]

- Bearkin Edgebearer directional combat.
- Bearkin Pinshot projectile behavior.
- Body-region-specific combat consequences.
- Bronze equipment interaction.

[UNKNOWN]

- Exact timing values.
- Exact movement values.
- Exact damage values unless already defined by accepted authority.
- Input-buffer durations.
- Collision tolerances.

### 4.2 Body Integrity

[VERIFIED]

The vertical slice requires body-region integrity, limb separation, and limb reattachment behavior.

The harness must be capable of expressing acceptance scenarios involving:

- body-region damage;
- separation events;
- critical-region outcomes;
- reattachment;
- state restoration where applicable;
- fallback behavior activated by separation where required by accepted design authority.

[UNKNOWN] Numeric thresholds not already defined in accepted repository authority.

### 4.3 Armor

[VERIFIED]

Bronze armor and armor degradation are within vertical-slice scope.

[DERIVED] Acceptance scenarios should observe authoritative armor state before and after resolved hits.

[UNKNOWN] Any numerical armor thresholds not already established by accepted authority.

### 4.4 Pinshot

[VERIFIED]

Pinshot arrows may embed in target body regions and produce restricted movement behavior.

[DERIVED] Acceptance evidence should include authoritative pin state, affected body region, state transitions, and removal/recovery behavior.

[PROPOSED] Environmental pinning against arena geometry may be evaluated as a separate candidate scenario.

[UNKNOWN] Whether environmental geometry is an accepted Pinshot target.

### 4.5 Enemy Behavior

[VERIFIED] Relevant vertical-slice enemies include Sugar Wolf, Sour Slime, and Bronze Paw enemies.

[DERIVED] The harness should allow bounded scenarios that isolate enemy behavior independently of full encounter pacing.

[UNKNOWN] Final subset of Bronze Paw variants required specifically for this validation harness.

---

## 5. Logical Arena Topology

The following topology is intentionally technology-neutral.

[PROPOSED]

- one bounded combat surface;
- two or more logical spawn markers;
- a resettable encounter state;
- optional central obstruction used only for scenarios requiring obstruction testing;
- no mandatory slopes for the initial validation pass;
- presentation kept intentionally minimal.

[PROPOSED] Issue #7 suggests an approximately 20 × 20 logical footprint and a central pillar.

[ASSUMPTION] A stable game-space unit convention does not yet have accepted authority.

Therefore:

[UNKNOWN]

- final dimensions;
- coordinate scale;
- spawn coordinates;
- obstruction dimensions;
- collision tolerances;
- camera placement;
- camera framing.

No engine units are established by this document.

---

## 6. Spawn and Reset Contract

[DERIVED] Every acceptance scenario should define explicit preconditions sufficient to reproduce the starting simulation state.

A scenario should identify, as applicable:

- participant types;
- body-region state;
- armor state;
- equipment;
- ability state;
- logical spawn relationship;
- deterministic seed or equivalent deterministic initialization input;
- initial AI state;
- initial projectile state;
- relevant environment-state assumptions.

[DERIVED] Reset must restore all authoritative state required for the next run.

[UNKNOWN] Exact serialization or reset implementation.

---

## 7. Deterministic Input Contract

[DERIVED] Acceptance scenarios must define ordered logical inputs rather than engine-specific device events.

Examples may include:

- move in a declared logical direction;
- begin directional attack;
- release or resolve attack;
- fire Pinshot;
- perform reattachment action;
- trigger controlled damage input;
- reset scenario.

[UNKNOWN]

- tick rate;
- input encoding;
- replay file format;
- deterministic seed registry;
- time representation.

These remain implementation decisions gated by architecture.

---

## 8. Evidence and Trace Contract

[DERIVED] Acceptance evidence should capture authoritative simulation events and state transitions needed to determine whether a scenario passed.

Candidate trace fields include:

- scenario identifier;
- deterministic run identifier;
- input sequence identifier;
- entity identifier;
- body-region identifier;
- hit-resolution event;
- armor state transition;
- Body Integrity state transition;
- limb separation event;
- limb reattachment event;
- Pinshot embed/pin event;
- AI state transition;
- final scenario outcome.

[PROPOSED] Trace comparisons should detect divergence between repeated executions of identical deterministic scenarios.

[UNKNOWN]

- trace serialization format;
- event identifier format;
- comparison algorithm;
- canonical ordering rules;
- required number of repeated runs.

Issue #7 proposes five identical runs, but this remains PROPOSED rather than accepted authority.

---

## 9. Candidate Acceptance Scenarios

### 9.1 Directional Attack

[DERIVED]

Given a deterministic starting state, perform a directional Edgebearer attack and verify that authoritative hit resolution identifies the intended target/body region and corresponding state change.

### 9.2 Pinshot — Body Region

[DERIVED]

Fire a Pinshot projectile at an eligible target body region and verify authoritative embed/pin state and the corresponding movement restriction or other accepted Pinshot consequence.

### 9.3 Environmental Pinning

[PROPOSED]

Evaluate Pinshot interaction with an environmental obstruction.

[UNKNOWN] Environmental pinning is not yet confirmed as accepted Pinshot behavior and must not be treated as VERIFIED.

### 9.4 Bronze Armor Resolution

[DERIVED]

Apply a controlled valid hit to a target equipped with applicable Bronze armor and verify the authoritative armor and damage-resolution state transitions.

### 9.5 Limb Separation

[DERIVED]

Drive a designated body region through an accepted separation condition and verify the authoritative separation event and resulting body state.

### 9.6 Limb Reattachment

[DERIVED]

Starting from a valid separated-limb state, perform the accepted reattachment interaction and verify the resulting authoritative state restoration.

### 9.7 Body Integrity Regression

[DERIVED]

Run a bounded sequence of controlled state transitions and verify that Body Integrity state evolves according to accepted rules without substituting a generic health-only model.

### 9.8 Enemy Behavior

[DERIVED]

Use bounded Sugar Wolf, Sour Slime, and relevant Bronze Paw scenarios to verify the accepted behavior/state transitions required by the vertical slice.

[UNKNOWN] Exact Bronze Paw subset required by this harness.

---

## 10. Determinism Acceptance

[DERIVED] Repeated executions using identical accepted deterministic inputs must not diverge in authoritative GelFlow outcomes.

[PROPOSED] Issue #7 proposes requiring identical relevant traces across five consecutive CI executions.

[UNKNOWN]

- accepted run count;
- comparison tolerance, if any;
- CI execution environment;
- cross-platform equivalence requirements.

No numerical performance target is established here.

---

## 11. Presentation Boundary

[DERIVED] Presentation is not simulation authority.

The following may assist humans but must not define deterministic pass/fail by themselves:

- camera framing;
- animation timing;
- particles;
- screen shake;
- visual physics;
- lighting;
- cosmetic effects.

[PROPOSED] A stable camera configuration may be useful for recorded evidence.

[UNKNOWN] Final camera behavior.

---

## 12. Content and Schema Boundary

[VERIFIED] Existing vertical-slice authored content must pass repository schema validation where schemas apply.

[DERIVED] Existing schemas for characters, monsters, weapons, armor, abilities, and related content should be reused where applicable.

[UNKNOWN] No accepted arena schema currently defines this harness.

[PROPOSED] Do not introduce a new arena schema as part of this specification PR. Schema ownership and required fields should be handled separately if needed.

---

## 13. Acceptance Checklist for This Specification

This documentation specification is ready for review when:

- [ ] The harness is explicitly distinct from Bronze Paw Orchard Ring.
- [ ] DEC-001 remains OPEN.
- [ ] No engine, language, networking, persistence, hosting, or deployment technology is selected.
- [ ] Simulation authority is separated from presentation.
- [ ] Body Integrity remains body-region-specific.
- [ ] Limb separation and reattachment are represented.
- [ ] Bronze armor behavior is represented.
- [ ] Pinshot body-region behavior is represented.
- [ ] Environmental Pinshot behavior remains PROPOSED or UNKNOWN unless separately accepted.
- [ ] Sugar Wolf, Sour Slime, and Bronze Paw scope are explicitly acknowledged.
- [ ] Spawn/reset/input/evidence contracts remain technology-neutral.
- [ ] Unsupported numerical thresholds are not invented.
- [ ] Proposed dimensions remain marked PROPOSED.
- [ ] Deterministic repeated-run count remains PROPOSED unless accepted.
- [ ] No runtime implementation, assets, or engine project changes are included.
- [ ] Repository documentation validation passes.
- [ ] Production foundation validation passes.
- [ ] `git diff --check` passes.

---

## 14. References

Authoritative and supporting repository material includes:

- `AGENTS.md`
- `CONTRIBUTING.md`
- `ROADMAP.md`
- `README.md`
- `docs/governance/DESIGN_AUTHORITY.md`
- `docs/governance/DECISION_LOG.md`
- `docs/governance/ASSUMPTION_REGISTER.md`
- `docs/governance/PUBLIC_PRIVATE_BOUNDARIES.md`
- `docs/production/VERTICAL_SLICE.md`
- `docs/production/QA_STRATEGY.md`
- `docs/production/ENGINE_EVALUATION_ADR.md`
- `docs/systems/GELFLOW_COMBAT.md`
- `docs/systems/BODY_INTEGRITY.md`
- `docs/systems/DAMAGE_STATUS_AND_ARMOR.md`
- `docs/systems/MONSTER_SYSTEM.md`
- `docs/technical/ARCHITECTURE.md`
- `docs/technical/DATA_CONTRACTS.md`
- `docs/technical/NETWORKING_REPLICATION_AND_AUDIT.md`
- `docs/multiplayer/ARENAS_AND_MATCHMAKING.md`
- `schemas/ability.schema.json`
- `schemas/armor.schema.json`
- `schemas/character.schema.json`
- `schemas/monster.schema.json`
- `schemas/weapon.schema.json`

---

## 15. Implementation Status

[NOT PERFORMED]

This specification does not claim that any of the following exist:

- arena implementation;
- scene or level asset;
- deterministic replay framework;
- runtime trace collector;
- acceptance-test executable;
- CI arena test;
- validated arena dimensions;
- measured performance;
- engine-specific integration.

Implementation work requires separate authorization and must continue to respect DEC-001.
