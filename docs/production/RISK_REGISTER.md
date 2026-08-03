# GUMFALL — Risk Register

**Status:** DRAFT — Updated 2026-08-02
**Label Policy:** VERIFIED | DERIVED | PROPOSED | ASSUMPTION | UNKNOWN | NOT PERFORMED
**Related:** [Architecture](../technical/ARCHITECTURE.md) · [QA Strategy](QA_STRATEGY.md) · [Engine Evaluation ADR](ENGINE_EVALUATION_ADR.md) · [Index](../INDEX.md)

---

## How to Read This Register

- **Likelihood:** 1 (rare) to 5 (near-certain)
- **Impact:** 1 (negligible) to 5 (project-threatening)
- **Severity:** Likelihood × Impact (1–25)
- **Status:** Open | Mitigated | Resolved | Accepted | Monitoring

All risk assessments are PROPOSED — no empirical data exists yet (NOT PERFORMED).

---

## Risk Table

| ID | Category | Description | Likelihood | Impact | Severity | Mitigation | Owner | Status |
|---|---|---|---|---|---|---|---|---|
| R-001 | Technical | **Determinism breaks under floating-point differences across platforms.** If the chosen engine or language does not support strict IEEE 754 enforcement, simulation outcomes may diverge between server and client platforms, breaking replay, audit, and anti-cheat systems. | 4 | 5 | 20 | Evaluate fixed-point arithmetic alternatives during engine selection. Require determinism proof-of-concept before committing to engine. Document in ENGINE_EVALUATION_ADR. | Architecture Lead | Open |
| R-002 | Schedule | **Engine selection delay blocking prototype.** Every prototype and vertical slice phase depends on engine selection. Extended evaluation delays cascade through all subsequent phases. | 3 | 5 | 15 | Set a hard deadline for ENGINE_EVALUATION_ADR resolution. Define a fallback: begin simulation logic in a platform-neutral layer that can be ported. | Design Authority | Open |
| R-003 | Technical | **Body Integrity complexity exceeding frame budget.** Per-region state tracking for 64+ concurrent entities may exceed the ~2ms simulation budget, causing tick delays. | 3 | 4 | 12 | Profile Body Integrity in isolation during Phase 1 prototype. Define entity count limits per zone. Implement LOD for distant entities (reduce region count). | Systems Lead | Open |
| R-004 | Art/Technical | **Limb animation rig complexity.** Procedural mesh separation for each body region on each anatomy variant is a significant art and technical investment. If rig complexity is underestimated, presentation quality or schedule suffers. | 3 | 3 | 9 | Use placeholder visuals for vertical slice. Commit to full rig complexity only after prototype validates the approach. Define acceptable minimum-fidelity fallback. | Art Lead | Open |
| R-005 | Balance | **Overmatch balance: enchantments too powerful in PvP.** If Overmatch thresholds are tuned too low, enchantment stacking becomes the dominant PvP strategy, reducing build diversity. | 3 | 4 | 12 | Overmatch thresholds in private pipeline only (cannot be min-maxed by public analysis). PvP normalization limits enchantment magnitude scaling. Require balance sign-off before PvP launch. | Balance Lead | Open |
| R-006 | Design | **Secret area discovery pace too fast.** Players discover secret areas significantly faster than intended through datamining or community deduction, reducing long-term engagement. | 3 | 3 | 9 | Secret area data in private pipeline only. Public files hint but do not document solutions. Monitor community discovery pace; have content ready for faster-than-expected discovery. | Design Authority | Open |
| R-007 | Design | **Secret area discovery pace too slow.** Players do not discover secret areas at all, leading to content that has no audience and wasted investment. | 2 | 3 | 6 | Design hint density into the world — discoverable clues, not arbitrary gates. Community tools (not walkthroughs) should make discovery achievable by motivated players. | Design Authority | Open |
| R-008 | Economy | **Economy inflation.** Player currency accumulates faster than designed due to farming loops, depreciating all economy tiers and making late-game items trivially affordable. | 3 | 4 | 12 | Server-side economy transaction audit detects accumulation anomalies. Exploit quarantine on confirmed farming exploits. Currency sinks designed into mid-game. | Systems Lead | Open |
| R-009 | Economy | **Economy deflation.** Currency is too scarce; players cannot afford progression materials, creating a frustrating plateau. | 2 | 3 | 6 | Monitor currency flow in internal playtests. Design multiple currency-earning paths (combat, quests, factions). Tunable drop rates in private pipeline. | Balance Lead | Open |
| R-010 | Balance | **Progression curve too steep at high levels.** XP required in Legendary (71–80), Mythic (81–90), and Apex (91–99) eras increases steeply. Players may experience these as walls rather than milestones. | 3 | 3 | 9 | XP formulas are VERIFIED but gameplay feel is NOT PERFORMED. Schedule explicit player testing of high-level progression pacing. Make era-transition content compelling, not just a grind gate. | Design Authority | Open |
| R-011 | Community | **Post-Level-100 discovery causing controversy.** Players who discover concealed post-Level-100 progression may feel deceived if the public documentation never acknowledged the possibility. | 2 | 4 | 8 | Public documentation confirms that Level 100 is the official cap AND acknowledges that dedicated players may find something more. Architecture reserves expansion. Do not document exact conditions. VERIFIED boundary. | Design Authority | Open |
| R-012 | Security | **Anti-cheat evasion.** Sophisticated cheaters identify the detection boundaries (speed, damage, rate) and operate just below them, gaining advantage without triggering automated detection. | 3 | 4 | 12 | Anti-cheat thresholds not in public documentation. VERIFIED. Layered detection (automated + human review). Exploit quarantine provides a monitoring window. Regular threshold review. | Anti-Cheat Lead | Open |
| R-013 | Gameplay | **Network latency making parry/dodge windows unfair.** High-latency players cannot reliably execute parry/dodge during the designed tick window, making PvP feel unfair. | 3 | 4 | 12 | Latency compensation design (see Networking doc). Accessibility option: extended timing window. Ranked matchmaking factor in latency when possible. Minimum latency standard for ranked. PROPOSED. | Systems Lead | Open |
| R-014 | Production | **Content authoring pipeline not established before team needs it.** If content authoring tooling and process are not defined, content authors cannot work productively, creating a bottleneck. | 3 | 4 | 12 | Content Authoring document defines requirements now. Schema-first approach allows manual authoring before dedicated tooling exists. Tooling selection prioritized in Phase 1. | Production Lead | Open |
| R-015 | Accessibility | **Accessibility features deprioritized.** In a complex production, accessibility options are deferred until late in development, causing rushed implementation and inadequate testing. | 3 | 3 | 9 | Accessibility requirements documented as VERIFIED requirements, not optional features. Accessibility tests are in QA Strategy. Include accessibility review in every milestone gate. | QA Lead | Open |
| R-016 | Business | **Monetization perception risk.** Players or press perceive monetization as pay-to-win despite design boundaries. | 2 | 4 | 8 | Monetization scope is clearly documented: cosmetics, emotes, housing cosmetics, mount appearances, expansions, supporter packs. No combat stat purchases. Publish monetization policy before launch. | Design Authority | Open |
| R-017 | Business | **Competitor release timing.** A major competitor releases a similar physical action RPG before or during GUMFALL's launch window, reducing market impact. | 2 | 3 | 6 | GUMFALL's design identity (gummy anatomy, localized body integrity, Bearkin lineages) is distinctive. Accelerate vertical slice milestone to generate community interest early. | Design Authority | Open |
| R-018 | Technical | **Save data corruption during migration.** A schema migration with a bug corrupts existing save records, causing data loss for players. | 2 | 5 | 10 | Migration functions are tested against reference save fixtures before deployment. Both sides of conflicts retained during sync window. Support-accessible recovery process. PROPOSED. | Engineering Lead | Open |
| R-019 | Technical | **Replication divergence in 8-player arena.** At maximum arena player count, replication overhead causes authoritative state to lag significantly behind client prediction, creating visible desync. | 3 | 3 | 9 | Replication priority system (see Networking doc). Body Integrity events are always reliable/ordered. Cosmetic state is lower priority. Load test arena at 8 players during prototype. | Engineering Lead | Open |
| R-020 | Design | **Class identity collapse.** Multiple classes converge on similar playstyles due to overlapping ability access, reducing the perceived distinctiveness of the 12-class roster. | 2 | 3 | 6 | Class specialties are gated; cross-class ability access is designed, not accidental. Balance review gate for all new abilities. Maintain a per-class identity summary document. | Design Authority | Open |
| R-021 | Production | **Vertical slice scope creep.** Features not listed in VERTICAL_SLICE.md are added during slice development, delaying the milestone and obscuring what the slice was meant to prove. | 3 | 4 | 12 | VERTICAL_SLICE.md maintains an explicit out-of-scope list. All scope changes require Design Authority approval. | Production Lead | Open |
| R-022 | Technical | **Fixed-point arithmetic performance cost.** If determinism requires software fixed-point arithmetic, the simulation tick cost may increase 3–5× over native float, pushing the simulation over its 2ms budget on minimum-tier hardware. | 3 | 4 | 12 | Evaluate fixed-point performance in the determinism prototype before engine commitment. Budget target may require adjustment if fixed-point is required. | Architecture Lead | Open |
| R-023 | Design | **Lineage anatomy complexity disparity.** Some lineages (Wormkin, Swarmkin, Ringborn) have fundamentally different anatomy models that may require significantly more engineering than standard bipedal anatomies. | 2 | 3 | 6 | Wormkin, Swarmkin, and Ringborn are out of scope for the vertical slice. Schedule anatomy complexity evaluation as part of Phase 4 (RPG Systems). | Systems Lead | Open |
| R-024 | Production | **Glossary and documentation drift.** As design evolves, documentation may drift — terms change meaning, systems are renamed, but older documents are not updated. | 2 | 2 | 4 | All documentation changes must update the Glossary if a term is added, removed, or renamed. The Glossary is a governance document, not just a reference. | Documentation Lead | Open |

---

## Risk Severity Summary

| Severity Range | Count | Priority |
|---|---|---|
| 15–25 (High) | 3 (R-001, R-002, R-005) | Address before Phase 1 begins |
| 10–14 (Medium-High) | 9 (R-003, R-008, R-012, R-013, R-014, R-018, R-021, R-022, extended) | Address before vertical slice complete |
| 5–9 (Medium) | 13 (R-004, R-006, R-007, R-009, R-010, R-011, R-015, R-016, R-017, R-019, R-020, R-023, R-024) | Monitor and mitigate during development |

---

## Risk Review Schedule — PROPOSED

- **Monthly:** Review all Open risks with Severity ≥ 10.
- **Per Milestone:** Review all Open risks; update status.
- **On Engine Selection:** Re-evaluate R-001, R-002, R-003, R-013, R-019.

---

## Detailed Risk Narratives

### R-001: Determinism and Floating-Point

Determinism is a hard requirement for GUMFALL's replay, anti-cheat, and tournament systems. The specific risk is that floating-point arithmetic on different hardware or compiler configurations can produce different rounding results, causing the authoritative server and a replaying client to diverge after any floating-point computation. This is not hypothetical — it has broken competitive game systems before.

The mitigation path requires prototyping in the candidate engines before engine selection. The determinism proof-of-concept prototype (see [ENGINE_EVALUATION_ADR](ENGINE_EVALUATION_ADR.md)) directly addresses this. If no engine can provide sufficient determinism guarantees, a software fixed-point arithmetic layer may be required. This adds engineering complexity and performance cost, making it a risk multiplier on other risks (R-003).

Known approaches in the industry:
- Use of fixed-point integer arithmetic for all simulation math (removes floating-point entirely).
- Strict IEEE 754 double precision mode with platform-specific compiler flags (fragile across GPU vendors).
- Lockstep simulation (both parties run identical simulation, compare hash — high bandwidth cost, unworkable for internet play).
- Software-emulated float layer (correctness guaranteed, significant performance cost).

The correct approach depends on the engine. NOT PERFORMED.

### R-002: Engine Selection Delay

Engine selection is the single critical path dependency for all engineering work. Design documentation can proceed in parallel (and has), but no prototype can be built until the engine is selected. The current phase has no hard deadline for this decision, which is itself a risk.

Mitigation: the ENGINE_EVALUATION_ADR must have a decision date assigned by the Design Authority. Every week of delay is a week of engineering schedule lost.

The decision is gated by the four prototype evaluations defined in [ENGINE_EVALUATION_ADR](ENGINE_EVALUATION_ADR.md). Each prototype may take 1–4 weeks depending on engineer availability. With 3 candidate engines and 4 prototypes each, the evaluation alone is a significant time investment. Planning for this time investment must happen immediately.

### R-003: Body Integrity Frame Budget

The Body Integrity system tracks per-region state for every entity in a zone. At 64 entities with 20 regions each, this is 1,280 region-state evaluations per tick. At 60 Hz, this is 76,800 evaluations per second — before any AI, physics, or rendering. If each evaluation takes more than ~0.026ms on average, the simulation budget is exceeded.

Mitigation strategies include:
- Capping the maximum concurrent tracked entities per zone.
- Level-of-detail system reducing region count for distant or non-combat entities.
- Batching region updates for non-active entities.
- Event-driven updates (only re-evaluate regions that received a damage event this tick).

None of these have been prototyped. NOT PERFORMED. The Body Integrity simulation budget test in the engine evaluation prototypes (Prototype 2) is specifically designed to measure this before engine commitment.

### R-005: Enchantment Overmatch in PvP

Overmatch is designed as a high-risk, high-reward combat mechanic. In PvP, if the threshold for triggering Overmatch is accessible by common equipment combinations, it can become the dominant strategy — building toward a single Overmatch trigger rather than engaging in directional combat. This reduces the depth of PvP to an enchantment stacking race.

Mitigation: Overmatch thresholds are in the private pipeline and cannot be datamined from public files. PvP normalization limits enchantment magnitude. Ranked balance reviews must evaluate Overmatch trigger rates across divisions. The Balance Lead owns ongoing monitoring of this risk after launch.

### R-012: Anti-Cheat Evasion

A sophisticated cheater who knows that speed, damage rate, and economy accumulation are monitored can operate just below detection thresholds indefinitely. The exploit quarantine (see [NETWORKING_REPLICATION_AND_AUDIT](../technical/NETWORKING_REPLICATION_AND_AUDIT.md)) addresses this by creating a monitoring window rather than relying only on automated bans — but it requires human review capacity at scale.

Additional mitigation: behavioral analysis across sessions (not just single sessions) can detect threshold-skimming more reliably than per-session monitoring alone.

### R-013: Network Latency and PvP Fairness

Parry and dodge windows are defined in ticks. At 60 Hz, one tick is ~16.7ms. A player with 100ms round-trip latency is effectively seeing the game ~50ms behind the authoritative state. In a parry window of 3 ticks (~50ms), this player has no reliable window at all.

Latency compensation (see [NETWORKING_REPLICATION_AND_AUDIT](../technical/NETWORKING_REPLICATION_AND_AUDIT.md) §4) addresses part of this, but compensation is imperfect and has a maximum window. The accessibility option for extended timing windows provides a player-controlled mitigation. Ranked matchmaking that factors in latency would reduce the frequency of cross-latency matches.

### R-014: Content Authoring Pipeline

The content authoring pipeline is currently a specification (see [CONTENT_AUTHORING](../technical/CONTENT_AUTHORING.md)) but not an implemented system. Content authors cannot produce validated content without tooling. If tooling is not established before the RPG systems expansion phase, content production will become the critical path bottleneck.

Mitigation: schema-first authoring allows JSON/text authoring manually in the interim. The schemas exist. The validation scripts exist. Manual authoring is slower than dedicated tooling but is not impossible. This is the planned approach for vertical slice content.

### R-015: Accessibility Deprioritization

Accessibility features are commonly the last thing implemented in complex productions because they do not gate core gameplay functionality. However, for GUMFALL, accessibility options are VERIFIED requirements — they are part of the design specification, not an afterthought. If they are deferred to the end of production, they will be under-tested and potentially under-implemented.

The mitigation is structural: accessibility requirements appear in the QA strategy with explicit test cases, in the milestone gate criteria, and in this risk register. Any contributor can point to this document when accessibility is deprioritized in a planning discussion.

### R-018: Save Data Corruption

A save migration bug that corrupts player data is among the most damaging incidents a live game can experience. Players can lose characters they have invested hundreds of hours in. Even if data is recoverable through support intervention, the damage to trust is significant.

Mitigation: every migration function is tested against reference save fixtures before deployment. Save records are versioned. Both sides of sync conflicts are retained. Support tooling for recovery must be built before live operation. These mitigations are PROPOSED — not yet implemented. NOT PERFORMED.

### R-021: Vertical Slice Scope Creep

The vertical slice has an explicit out-of-scope list in §3 of [VERTICAL_SLICE](VERTICAL_SLICE.md). Experience from other projects shows that scope creep in prototype phases is the most common cause of delayed milestones. The mitigation — maintaining and enforcing the out-of-scope list — requires discipline from all contributors.

Any feature not in VERTICAL_SLICE.md §2 must be explicitly approved by Design Authority before implementation begins. "It will only take a day" is the origin of most scope creep. Typical scope creep patterns to watch for:
- Adding lineages beyond Bearkin "since the system is already there."
- Adding enchantments "to test the enchantment resolver."
- Expanding the arena format "to test replication at scale."

None of these are wrong ideas. All are wrong for the vertical slice milestone.

---

## Adding New Risks

When adding a new risk to this register:

1. Assign the next sequential ID (R-025, R-026, etc.).
2. Assess Likelihood and Impact independently before computing Severity.
3. Define a concrete mitigation — "monitor the situation" is not a mitigation.
4. Assign an owner (role, not person name, since team is not yet formed). ASSUMPTION.
5. Add a brief narrative in the Detailed Risk Narratives section if Severity ≥ 10.
6. Review the risk at the next monthly review.

---

## Risk Tracking Policy

### Escalation

A risk is escalated to Design Authority when:
- Its severity increases by 6 or more points from its initial assessment.
- The owner determines that the defined mitigation is no longer sufficient.
- A risk becomes a confirmed issue (it is no longer speculative — the problem has occurred).

When a risk becomes a confirmed issue, it transitions from a Risk to an Incident. An Incident requires an immediate mitigation action and a post-mortem after resolution.

### Closure

A risk is marked Resolved when the mitigation has been fully implemented and evidence confirms the risk is no longer active. A risk may also be marked Accepted when the Design Authority explicitly accepts the residual risk as unavoidable given the project constraints.

Resolved risks are retained in the register (not deleted) for historical record. The date of resolution and the confirming evidence are noted in the Status field. Resolved risks inform future risk identification by providing a pattern library of what went wrong and what worked.

### Risk Inheritance

Some risks inherit into related systems. For example:
- R-001 (Determinism) inherits into R-003 (Body Integrity budget) because fixed-point arithmetic affects both.
- R-002 (Engine delay) inherits into R-014 (Authoring pipeline) because tooling cannot be selected until the engine is selected.
- R-013 (Network latency PvP) inherits into R-015 (Accessibility) because the timing assist option must compensate for network-induced timing disadvantage.

Inherited risk relationships should be noted when updating risk assessments.

---

*Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853*
*All risk assessments are PROPOSED — no empirical data has been collected (NOT PERFORMED).*
