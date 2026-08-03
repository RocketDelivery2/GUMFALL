# GUMFALL — QA Strategy

**Status:** DRAFT — No testing has been performed (NOT PERFORMED)
**Label Policy:** VERIFIED | DERIVED | PROPOSED | ASSUMPTION | UNKNOWN | NOT PERFORMED
**Related:** [Architecture](../technical/ARCHITECTURE.md) · [Vertical Slice](VERTICAL_SLICE.md) · [Risk Register](RISK_REGISTER.md) · [Index](../INDEX.md)

---

## 1. QA Philosophy

> **Test the simulation. Trust the presentation.**

GUMFALL's QA strategy prioritizes the authoritative simulation layer. Because presentation physics are explicitly NOT authoritative (they communicate outcomes, they do not determine them), simulation correctness is the primary quality gate.

### 1.1 Core QA Principles

1. **Determinism first.** Any simulation test that produces a different result on re-run with the same inputs is a critical failure, not a flake.
2. **Server authority is always correct.** If the client disagrees with the server, the client is wrong. Tests that verify client state must verify that it matches server-authoritative state.
3. **Body Integrity correctness is required for every release.** Regional damage, separation, and reattachment are core to GUMFALL's identity — they must work correctly.
4. **Accessibility options must change behavior.** Accessibility features that are cosmetic-only without affecting gameplay behavior are considered defects.
5. **No fabricated test results.** Coverage metrics, pass/fail counts, and performance numbers are never estimated — they are either measured or marked NOT PERFORMED.

---

## 2. Test Types and Their Targets

### 2.1 Deterministic Simulation Tests

**Target:** Same input → same output, always.

**What is tested:**
- Full encounter replay: given a fixed seed, initial state, and recorded input sequence, the simulation produces identical outcomes (damage values, body integrity states, loot generation) on every run.
- XP formula correctness: for each level 1–99, computed XP matches the VERIFIED formulas.
- RNG seed chain: given a starting seed, the Nth draw in a sequence is always identical.
- Loot generation: given identical LootSource and seed, generated items are identical.
- Tournament bracket: given identical seed and participant list, bracket order is identical.

**Pass criteria:** Zero divergence across N runs on the same platform. PROPOSED: N = 100 minimum.

**Failure classification:** Any divergence in a deterministic simulation test is a **Critical** defect.

**Coverage target:** 100% of simulation code paths that affect gameplay outcomes must have a deterministic test. NOT PERFORMED — target requires implementation.

---

### 2.2 Body-Region Tests

**Target:** All body regions track damage and state transitions correctly.

**What is tested:**
- Each body region on each anatomy (player lineages and all monsters) receives correct damage from all damage types.
- Separation triggers at the correct threshold. VERIFIED: threshold is compared by the simulation, not presentation.
- Separation does not trigger below threshold.
- Critical regions (TORSO, HEAD on Bearkin) trigger entity defeat on separation.
- Non-critical regions trigger fallback abilities when applicable.
- Reattachment succeeds when proximity and region type conditions are met.
- Reattachment fails when region type does not match.
- Prosthetic slot activation (when implemented).
- Armor slot coverage: damage to a covered region passes through Armor Resolver before Body Integrity.

**Coverage target:** All anatomy types × all regions × all damage types. NOT PERFORMED — matrix size depends on final content scope.

**Pass criteria:** Every combination produces the expected integrity delta and state transition.

---

### 2.3 Material Matrix Tests

**Target:** All damage type × armor material combinations produce correct modifiers.

**What is tested:**
- For each combination of DamageType (9) × Material (N materials), the Armor Resolver applies the correct modifier from the Material's DamageModifierMap.
- Bronze armor vs. all 9 damage types. VERIFIED requirement for vertical slice.
- Protection reduction on durability change: a degraded armor piece applies reduced protection at the correct degraded value.
- Unarmored region: damage passes through without armor modifier.

**Coverage target:** All 9 damage types × all authored materials. Computed: 9 × N (N=UNKNOWN until content locked).

**Pass criteria:** Armor Resolver output matches design-table expected values for all combinations.

---

### 2.4 Enchantment / Ward Matrix Tests

**Target:** All enchantment pressure × Ward resistance combinations resolve correctly.

**What is tested:**
- For each Enchantment × Ward pair: pressure applied, Ward threshold checked, resistance confirmed or broken.
- Stack behavior (replace, stack, refresh) behaves as authored.
- Decay per tick matches authored decay rate.
- Malady types (Omnislayer, Ruin, Affliction, Finality) resolve with correct escalation behavior.
- Overmatch trigger: VERIFIED design requirement that Overmatch triggers at the authored threshold. Exact threshold: PRIVATE — test uses authored value from private pipeline.

**Coverage target:** All Enchantment categories × all Ward types. NOT PERFORMED — size depends on authored content.

---

### 2.5 Anatomy Tests

**Target:** All lineage body configurations are correctly defined and functional.

**What is tested:**
- All 12 player lineage anatomies define at least one critical region.
- All monster anatomy definitions have correct connectivity (no orphaned regions).
- All region separation thresholds are below max_integrity (validation rule).
- Reattach_compatible_types: cross-lineage reattachment works when authored to be compatible.
- All fallback abilities referenced in anatomy definitions exist in the Ability registry.

**Coverage target:** All 12 player lineages + all authored monster anatomies. NOT PERFORMED.

---

### 2.6 AI Tests

**Target:** Monster AI exhibits designed behaviors without prohibited patterns.

**What is tested:**
- **Anti-repetition:** no AI agent makes the same decision consecutively more than authored maximum times without variation. VERIFIED design requirement.
- **Morale triggers:** morale breaks at the correct integrity/group-state thresholds.
- **Surrender conditions:** eligible monsters (Bronze Paw Grunt, Captain) enter surrender state at correct conditions.
- **Pack behavior:** Sugar Wolf switches targets correctly in pack context.
- **Elite behavior:** Bronze Paw Captain applies command aura effect to nearby grunts.
- **Sour Slime special:** engulf attempt occurs correctly when target is pinned.

**Pass criteria:** Each authored behavior triggers in its designed context across N encounter repetitions. PROPOSED: N = 50.

---

### 2.7 PvP Normalization Tests

**Target:** PvP scalar application is correct and consistent.

**What is tested:**
- When a player at level X enters a normalized match, all relevant combat stats are scaled to the normalized values defined for that ruleset.
- Normalization is applied server-side before match start. VERIFIED.
- Two players with identical classes and lineages but different equipment have identical stats in a fully normalized match.
- Partial normalization (open-progression PvP): stats scale per authored rules, not capped to identical.
- Ranked division gate enforcement: players outside the correct division cannot enter restricted matches.

**Pass criteria:** All normalization calculations match authored scalar values.

---

### 2.8 Tournament Seed Reproducibility Tests

**Target:** A deterministic seed produces the same bracket order, every time.

**What is tested:**
- Given seed S and participant list P (in canonical order), bracket generation produces bracket B.
- Repeating with identical S and P always produces identical B.
- Re-seeding with a different S produces a statistically different B (not identical — this would indicate a seeding bug).

**Pass criteria:** 100% reproducibility for identical inputs. VERIFIED design requirement.

---

### 2.9 Save Migration Tests

**Target:** Older save records load correctly after schema migration.

**What is tested:**
- A save record created with schema version N migrates to version N+1 correctly.
- All required fields in the new version are populated after migration.
- Integrity hash is correctly recomputed after migration.
- Save records that fail migration produce a clear error (no silent data loss).
- Migration is forward-only: no attempt to migrate from version N+1 to N.

**Coverage target:** One test per major schema version boundary. NOT PERFORMED — no versions exist yet.

---

### 2.10 Progression Audit Tests

**Target:** XP calculations and level gate enforcement are correct.

**What is tested:**
- XP awarded from each combat source type matches the Progression system's formula application.
- VERIFIED formulas:
  - L1–50: `round(300 × L^1.8)` — test all values L=1 to L=50.
  - L51–70: `XP(50) × 1.18^(L-50)` — test L=51 to L=70.
  - L71–80: `XP(70) × 1.35^(L-70)` — test L=71 to L=80.
  - L81–90: `XP(80) × 1.65^(L-80)` — test L=81 to L=90.
  - L91–99: `XP(90) × 2.20^(L-90)` — test L=91 to L=99.
- Level gate enforcement: a player who has not completed required trials cannot advance past a gated level.
- Level gate bypass: no gap in gate logic allows skipping a required gate.
- Era transitions: player transitions from Foundation to Adventurer at Level 13, Adventurer to Veteran at Level 31, etc. VERIFIED.

**Pass criteria:** All 99 level thresholds produce expected XP values. All gates enforce correctly.

---

### 2.11 Accessibility Testing

**Target:** Each accessibility option changes behavior correctly.

**What is tested:**

| Option | Test |
|---|---|
| Full input remapping | Every action can be bound to a different input; remapping persists |
| Hold/toggle for held inputs | Toggle mode: one press activates, next press deactivates (no hold required) |
| Timing assist (parry/dodge window) | Extended window is demonstrably larger in ticks when option is active |
| Reduced camera motion | Camera shake is absent when option is active |
| Color-independent status indicators | Status conditions are distinguishable without color (shape/symbol check) |
| Scalable UI | All UI elements scale correctly at min and max settings |
| Subtitles | All voiced/audio-cued content has subtitle coverage |
| Aim assist | Aim assist demonstrably adjusts target acquisition |
| Reduced body-separation presentation | Limb separation occurs (server-authoritative) but reduced visual plays instead |
| Photosensitivity control | Flash-triggering effects are suppressed; subtitles for audio cues remain |
| Cognitive-load option | UI complexity reduces to designed minimum-complexity state |

**Pass criteria:** Each option produces a verifiable behavioral difference when toggled.

---

### 2.12 Network Fault Tests

**Target:** System degrades gracefully under network fault conditions.

**Test scenarios — PROPOSED:**
- **Disconnect:** client disconnects mid-match; session is preserved for reconnect window; on reconnect, client receives reconciliation state correctly.
- **Latency spike (200ms sudden):** simulation continues; client receives corrected state; no desyncs observed.
- **Latency spike (500ms sudden):** simulation continues; client prediction error visible; reconciliation corrects within N frames. PROPOSED: N = 10.
- **Packet loss (5%):** session remains functional; no progression loss from dropped non-critical packets.
- **Packet loss (15%):** session degrades visually but does not corrupt authoritative state.
- **Server drop mid-match:** match outcome recorded if sufficient ticks logged; partial outcome handled gracefully.

**Pass criteria:** No authoritative state corruption under any tested network condition. PROPOSED.

---

### 2.13 Performance Tier Tests

**Target:** Simulation meets minimum spec targets. NOT PERFORMED — requires prototype.

See [PERFORMANCE_BUDGETS](../technical/PERFORMANCE_BUDGETS.md) for target budgets.

**Test scenarios (PROPOSED, NOT PERFORMED):**
- Minimum-tier hardware: solo encounter with 8 enemies active — measure simulation tick time.
- Recommended-tier hardware: Sugar Well encounter (all enemy types) — measure frame time by system.
- Body Integrity stress: 32 simultaneous separations — measure Body Integrity budget overrun (if any).
- 8-player arena: full arena match — measure replication overhead.

**Pass criteria:** Simulation tick completes within budget on minimum tier. NOT PERFORMED — criteria require baselines.

---

### 2.14 Abuse Tests

**Target:** Known abuse vectors do not succeed.

**Economy abuse scenarios:**
- Duplication exploit: attempt to duplicate items through rapid inventory transactions.
- Currency inflation: test known economy loops for infinite currency generation.
- Loot manipulation: attempt to influence loot seed by client-controlled inputs.

**PvP griefing scenarios:**
- Arena abandonment: leaving an arena match mid-fight; verify outcome is recorded correctly for remaining player.
- Spawn harassment: spawning in a zone and immediately targeting a new player.
- PvP normalization bypass: equipping items after normalization snapshot is taken.

**Pass criteria:** All tested scenarios are either blocked by server validation or produce a recorded audit event for review.

---

## 3. Test Environment Requirements

### 3.1 Environments — PROPOSED

| Environment | Purpose |
|---|---|
| Local simulation harness | Deterministic, no network; for simulation unit tests |
| Integration server | Full server + 1–2 clients; for integration and replication tests |
| Network emulation environment | Controlled latency, jitter, and packet loss injection |
| Minimum-spec hardware environment | Performance tests on minimum hardware target |
| Accessibility evaluation environment | Combination of hardware and software assistive technology |

### 3.2 Test Data Management

- All test scenarios use authored content that passes schema validation. VERIFIED.
- Test seeds and input sequences are version-controlled. VERIFIED design requirement.
- Private-content test data is in the private pipeline; test results do not expose private values. VERIFIED.

---

## 4. Regression Policy

- Any defect that caused a previously-passing test to fail is a regression. VERIFIED.
- Regressions block the build from milestone release. PROPOSED.
- Regression root cause must be documented before fix is merged. PROPOSED.
- Deterministic simulation regressions are always **Critical** priority. VERIFIED.

---

## 5. Bug Severity Matrix

| Severity | Definition | Examples |
|---|---|---|
| **Critical** | Simulation is non-deterministic; authoritative state corrupted; data loss; security vulnerability | Determinism failure, save corruption, exploit enabling item duplication |
| **High** | Feature non-functional; gameplay loop broken; accessibility option not working | Limb separation not triggering, PvP normalization wrong, accessibility option does nothing |
| **Medium** | Feature degraded but playable; incorrect values; minor progression error | XP formula off by 1 at specific level, wrong material modifier on edge case |
| **Low** | Cosmetic issue; presentation mismatch; text error; non-critical accessibility concern | Wrong animation hint, subtitle typo, UI scaling off by a few pixels |
| **Design Note** | Not a bug — but a design question that testing surfaced | Balance value feels wrong, behavior is correct per spec but spec may be wrong |

---

## 6. Coverage Targets

All coverage targets are ASPIRATIONAL — NOT PERFORMED. Actual coverage is 0% as no implementation exists.

| Test Category | Coverage Target |
|---|---|
| Deterministic simulation | 100% of simulation outcome paths |
| Body-region × damage type | 100% of authored combinations |
| Material matrix | 100% of all authored damage type × material combinations |
| Enchantment × Ward matrix | 100% of authored combinations |
| XP formula | 100% of levels 1–99 |
| Level gate enforcement | 100% of authored gates |
| Accessibility options | 100% of all 11 documented options |
| Save migration | 100% of major schema version boundaries |
| Network fault scenarios | All 6 documented scenarios |
| Abuse scenarios | All documented economy and PvP griefing scenarios |

---

## 7. QA Governance

### 7.1 Defect Triage Process — PROPOSED

All defects found during testing are logged with:
- Reproduction steps (minimum: input, expected output, actual output).
- Severity classification per the matrix in §5.
- Affected system(s) from the 21 architectural boundaries.
- Whether the defect is a regression (a previously-passing test now fails).

Defects are triaged in priority order:
1. Critical (simulation non-determinism, data loss, security) — block milestone immediately.
2. High (feature non-functional, accessibility option broken) — must be resolved before milestone.
3. Medium — must be resolved before release, may be deferred from milestone.
4. Low — tracked, resolved before release at lowest priority.

### 7.2 QA Milestone Gates

Each production milestone (Phase 1 through Phase 10, see [ROADMAP](../../ROADMAP.md)) requires a QA gate. For the vertical slice milestone:

- All 12 success criteria from [VERTICAL_SLICE](VERTICAL_SLICE.md) must be verified.
- No Critical defects open.
- No High defects open (or explicit Design Authority deferral with rationale).
- All slice content files pass automated schema validation.
- Audit log captures all simulation events for a test encounter.

For later milestones: QA gate criteria are defined per-milestone by the QA Lead with Design Authority approval. PROPOSED.

### 7.3 Regression Management

When a new defect is discovered that breaks a previously-passing behavior:

1. A regression test is authored that reproduces the failure deterministically.
2. The regression test is added to the permanent test suite.
3. The fix is not considered complete until the regression test passes.
4. The regression test must continue to pass in all future builds (CI enforcement). PROPOSED.

### 7.4 Test Ownership

Each test category has a primary owner:

| Test Category | Primary Owner |
|---|---|
| Deterministic simulation | Engineering Lead |
| Body-region tests | Systems Lead |
| Material matrix | Balance Lead |
| Enchantment/Ward matrix | Systems Lead + Balance Lead |
| Anatomy tests | Systems Lead |
| AI tests | Monster Lead |
| PvP normalization | Balance Lead |
| Tournament seed | Engineering Lead |
| Save migration | Engineering Lead |
| Progression audit | Systems Lead + Engineering Lead |
| Accessibility | QA Lead + Accessibility Reviewer |
| Network fault | Engineering Lead |
| Performance tier | Engineering Lead |
| Abuse scenarios | QA Lead |

---

## 8. Test Data and Seed Management

### 8.1 Deterministic Test Seeds

All deterministic simulation tests use documented seeds with version-controlled input sequences. VERIFIED design requirement.

Seeds for test scenarios are documented in a test-seeds registry (PROPOSED: stored alongside test code). If a seed is changed, the reason must be documented in the commit message.

### 8.2 Private Content in Tests

Tests that involve private content (Overmatch thresholds, protected drop rates, secret area conditions) must not expose those values in public test files. VERIFIED.

Private-content test cases are authored in the private pipeline and run in the private test environment. Public test results indicate pass/fail only — not the private values being tested.

### 8.3 Content Validation Tests

Every schema-validated content file is a test artifact. The automated build must run schema validation on all content files as a mandatory step. A build that fails schema validation is rejected at the build step, not the QA step. VERIFIED design requirement.

### 8.4 Test Documentation Standards

Every test case must document:
- **ID:** unique identifier (e.g., `SIM-001`, `BI-003`).
- **Name:** short descriptive name.
- **Preconditions:** system state required before test runs.
- **Inputs:** exactly what inputs are provided.
- **Expected output:** exactly what the system should produce.
- **Actual output:** what the system produced (filled in after execution).
- **Status:** Pass, Fail, Blocked.
- **Notes:** any observations, edge cases, or follow-up items.

This documentation standard applies to all test types. PROPOSED.

### 8.5 Automated vs. Manual Tests

| Test Category | Automation Potential |
|---|---|
| Deterministic simulation | High — can be fully automated |
| Body-region tests | High — can be fully automated |
| Material matrix | High — can be fully automated |
| Enchantment/Ward matrix | High — can be fully automated |
| Anatomy tests | Medium — structure validation automated; connectivity logic manual |
| AI tests | Medium — trigger conditions automated; behavior observation manual |
| PvP normalization | High — can be fully automated |
| Tournament seed | High — can be fully automated |
| Save migration | High — can be fully automated |
| Progression audit | High — XP formula automated; gate enforcement manual |
| Accessibility | Low — requires human or assistive technology verification |
| Network fault | Medium — fault injection automated; observation manual |
| Performance tier | Medium — measurement automated; pass/fail threshold manual |
| Abuse scenarios | Low — requires scenario setup and human judgment |

---

*Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853*
*All targets are design goals. No testing has been performed (NOT PERFORMED).*
