# GUMFALL — Vertical Slice Specification

**Status:** DRAFT — Schedule estimates NOT PERFORMED. No implementation has begun.
**Label Policy:** VERIFIED | DERIVED | PROPOSED | ASSUMPTION | UNKNOWN | NOT PERFORMED
**Related:** [Architecture](../technical/ARCHITECTURE.md) · [QA Strategy](QA_STRATEGY.md) · [Risk Register](RISK_REGISTER.md) · [Index](../INDEX.md)

---

## 1. Purpose of the Vertical Slice

The vertical slice is a bounded, internally complete playable build that:

1. **Proves the core systems work together.** GelFlow combat, Body Integrity, and the Ability Graph must function as an integrated unit — not in isolation.
2. **Validates the design loop.** Players pick up and fight in a way that feels intentional and responsive.
3. **Establishes the authoring pipeline baseline.** All content in the slice passes through schema validation and authoring review.
4. **Generates evidence for engine and platform decisions.** Observed performance, authoring effort, and system complexity inform the [Engine Evaluation ADR](ENGINE_EVALUATION_ADR.md).

The vertical slice is not a demo. It is a development tool. Its purpose is to discover problems early. VERIFIED design philosophy.

---

## 2. In-Scope Content

### 2.1 Player Characters

**Bearkin Edgebearer** — Primary player character for the slice.
- Lineage: Bearkin. VERIFIED.
- Class: Edgebearer. VERIFIED.
- Starting equipment: Bronze Shortsword, Bronze Vambrace (left arm), Bronze Chestplate. VERIFIED.
- Starting level: 1. VERIFIED.
- Max level in slice: 3. VERIFIED.
- Abilities in scope:
  - Basic directional slash (Slice damage type).
  - Directional guard/parry.
  - One fallback ability that activates on arm separation (Bearkin-specific). VERIFIED design requirement.

**Bearkin Pinshot** — Secondary player character (solo or co-op second slot).
- Lineage: Bearkin. VERIFIED.
- Class: Pinshot. VERIFIED.
- Starting equipment: Bronze Shortbow, Bronze Arrow (ammo), Bronze Gorget. VERIFIED.
- Starting level: 1. VERIFIED.
- Abilities in scope:
  - Standard arrow shot (Pierce damage type).
  - Pinning shot: on hit, embeds arrow in target body region, restricting movement. VERIFIED.
  - Arrow retrieval from pinned region (requires close approach). VERIFIED design requirement.

### 2.2 Armor System (Slice Scope)

- **Bronze Armor** family: Bronze Vambrace, Bronze Chestplate, Bronze Gorget, Bronze Greaves. VERIFIED.
- Material matrix required for slice: Slice × Bronze, Pierce × Bronze, Crush × Bronze. DERIVED from enemy types.
- Armor durability and degradation: in scope. VERIFIED.
- Armor enchantments: out of scope for slice. PROPOSED.

### 2.3 Body Integrity (Slice Scope)

- Bearkin anatomy: HEAD, TORSO, LEFT_ARM, RIGHT_ARM, LEFT_LEG, RIGHT_LEG. VERIFIED.
- Separation triggers for all 6 regions. VERIFIED.
- Limb reattachment mechanic: player or companion re-applies separated limb in proximity. VERIFIED.
- Prosthetic slot: in scope as a future hook, not playable in slice. PROPOSED.
- Fallback ability activation on LEFT_ARM and RIGHT_ARM separation. VERIFIED.
- TORSO and HEAD are critical regions (entity defeat on separation). VERIFIED.

**Pinshot arrow pinning:**
- Arrow embeds in target body region (Pierce, pin_capable=true). VERIFIED.
- Pinned region has restricted mobility for `pin_force × tick_count` ticks. VERIFIED.
- Arrow can be removed by attacker proximity action or by the pinned entity spending ability. VERIFIED design requirement.
- Multiple arrows can pin separate regions simultaneously. VERIFIED.

### 2.4 Enemy Roster

#### Sugar Wolf (Common rank)
- Anatomy: quadruped (HEAD, TORSO, FORE_LEFT, FORE_RIGHT, HIND_LEFT, HIND_RIGHT). DERIVED.
- Composition: Sugar-based. VERIFIED.
- Behaviors: pack hunt, target switching, whine on limb loss. VERIFIED.
- AI: 3 distinct behaviors (patrol, hunt, retreat on morale break). VERIFIED.
- Loot: Sugar Crystal fragments, Wolf Claw. PROPOSED.

#### Sour Slime (Common rank)
- Anatomy: amorphous (CORE, PSEUDOPOD_LEFT, PSEUDOPOD_RIGHT, BASE). DERIVED.
- Composition: Sour-based. VERIFIED.
- Behaviors: split attempt on CORE damage, engulf attempt if player pinned. VERIFIED.
- AI: 3 distinct behaviors (approach, engulf attempt, retreat on low integrity). VERIFIED.
- Loot: Sour Residue, Slime Core fragment. PROPOSED.
- Special: Sour Slime deals Sour damage type. Players with Sourlings lineage take reduced Sour pressure. VERIFIED.

#### Bronze Paw Grunt (Common rank, Bronze Paw faction)
- Anatomy: bipedal gummy (HEAD, TORSO, LEFT_ARM, RIGHT_ARM, LEFT_LEG, RIGHT_LEG). VERIFIED.
- Composition: Mixed Gummy (neutral). PROPOSED.
- Equipment: Bronze Cudgel (Crush damage). VERIFIED.
- Behaviors: guard stance, bash attack, surrender on body integrity below threshold. VERIFIED.
- AI: 3 distinct behaviors (guard, attack, surrender evaluation). VERIFIED.
- Loot: Bronze Fragment, Tin Bit (currency). PROPOSED.

#### Bronze Paw Shieldbearer (Common rank variant, Bronze Paw faction)
- Same anatomy as Grunt. VERIFIED.
- Equipment: Bronze Shield (blocks Pierce and Slash from front arc), Bronze Spear (Pierce). PROPOSED.
- Behaviors: defensive posture, flank-seeking. PROPOSED.

#### Bronze Paw Archer (Common rank variant, Bronze Paw faction)
- Same anatomy as Grunt. VERIFIED.
- Equipment: Bronze Shortbow, Bronze Arrow. PROPOSED.
- Behaviors: maintain range, retreat on close approach. PROPOSED.

#### Bronze Paw Captain (Elite rank, Bronze Paw faction)
- Same anatomy as Grunt + reinforced. PROPOSED.
- Equipment: Bronze Longsword, Bronze Pauldron (additional armor region). PROPOSED.
- Behaviors: command aura (buffs nearby grunts), challenge behavior, target prioritization. VERIFIED design requirement.
- Special: surrender evaluation requires morale check across the full group. VERIFIED.
- Loot: Bronze Mark (currency), Bronze Captain's Insignia, chance at Bronze Pauldron drop. PROPOSED.

### 2.5 Levels 1–3 Content

- Level 1: Tutorial-scale encounter in camp vicinity. Sugar Wolf patrol + 2 Bronze Paw Grunts. PROPOSED.
- Level 2: Camp defense encounter. Bronze Paw patrol group (3 Grunts + 1 Shieldbearer). PROPOSED.
- Level 3: Advance to Sugar Well. Sugar Wolf pack (3) + Sour Slime + Bronze Paw Archer. PROPOSED.
- XP awards calibrated to VERIFIED XP formulas. DERIVED.

### 2.6 Camp Area

- Camp is the player's base of operations in the slice. VERIFIED.
- Features: Recasting station (swap between Edgebearer and Pinshot, or adjust spec), basic merchant, companion-hinting NPC. VERIFIED design requirement.
- Recasting in camp: VERIFIED scope for slice.
- Camp is a safe zone — enemies do not spawn inside camp. PROPOSED.

### 2.7 Sugar Well

- A world location southeast of camp (or nearest cardinal direction per map). ASSUMPTION.
- Contested by Bronze Paw enemies. VERIFIED.
- Contains a Sour Slime spawn. VERIFIED.
- Completing the Sugar Well encounter awards Level 3 XP milestone. PROPOSED.
- A Sugar Well Recasting Charm (cosmetic) drops from the Captain. PROPOSED.

### 2.8 Basic Loot Table

| Source | Drop | Type | Rate |
|---|---|---|---|
| Sugar Wolf | Sugar Crystal | Material | PROPOSED |
| Sugar Wolf | Wolf Claw | Material | PROPOSED |
| Sour Slime | Sour Residue | Material | PROPOSED |
| Bronze Paw Grunt | Bronze Fragment | Material | PROPOSED |
| Bronze Paw Grunt | Tin Bit | Currency | PROPOSED |
| Bronze Paw Captain | Bronze Mark | Currency | PROPOSED |
| Bronze Paw Captain | Bronze Captain's Insignia | Item | PROPOSED |
| Sugar Well chest | Bronze Arrow × 10 | Ammo | PROPOSED |

Exact drop rates: PRIVATE (not in public data files). VERIFIED.

### 2.9 Bronze Paw Orchard Ring — Compact Arena

- Arena name: Bronze Paw Orchard Ring. VERIFIED.
- Format: 1v1 duel, first to defeat the other's character. PROPOSED.
- Player capacity: 2. PROPOSED.
- PvP normalization: not in scope for slice (both players are Level 1–3 matching naturally). PROPOSED.
- Arena layout: compact ring with 2–3 terrain features (breakable cover). PROPOSED.
- Arena must complete a match: players can enter, fight, and receive an outcome. VERIFIED success criterion.

---

## 3. Out of Scope for Slice

The following are explicitly excluded from the vertical slice. Including them risks scope creep and delays. VERIFIED design boundary.

- Lineages beyond Bearkin.
- Classes beyond Edgebearer and Pinshot.
- Armor materials beyond Bronze.
- Enchantments (weapons or armor). PROPOSED exclusion.
- Ward system. PROPOSED exclusion.
- Malady types. PROPOSED exclusion.
- Multiplayer beyond 2-player (co-op or 1v1 duel). PROPOSED exclusion.
- Ranked PvP divisions and matchmaking. PROPOSED exclusion.
- Monster Knowledge system. PROPOSED exclusion.
- Factions beyond Bronze Paw (for combat encounters). PROPOSED exclusion.
- Companions (hinted, not playable). PROPOSED exclusion.
- Post-Level-3 progression. VERIFIED exclusion.
- Royal Dungeons. VERIFIED exclusion.
- Secret areas. VERIFIED exclusion.
- Tournament system. PROPOSED exclusion.
- Shattercrown. VERIFIED exclusion.

---

## 4. Success Criteria

The vertical slice is complete and successful when ALL of the following are verifiable by a tester:

| # | Criterion | Verification Method |
|---|---|---|
| 1 | Limb separation triggers: LEFT_ARM separates from Bearkin when LEFT_ARM integrity drops to or below threshold | QA test: apply damage to LEFT_ARM, observe separation |
| 2 | Limb reattachment works: separated LEFT_ARM can be reattached in proximity | QA test: separate arm, approach arm, use reattach action |
| 3 | Arrow pinning is visible: Pinshot arrow embeds in enemy body region, restricts their movement | QA test: fire pinning shot, observe embed, confirm movement restriction |
| 4 | 3 monsters have distinct AI: Sugar Wolf, Sour Slime, and Bronze Paw Grunt each exhibit 3 unique behaviors | QA observation: play through Sugar Well encounter |
| 5 | Arena completes a match: two players enter Bronze Paw Orchard Ring, fight, and receive a win/loss outcome | QA test: run full arena match |
| 6 | Level 1–3 XP awards are correct: XP gain matches VERIFIED formula output for levels 1–3 | QA automated test: compare awarded XP to formula |
| 7 | Armor degradation functions: Bronze Vambrace durability decreases on hit | QA test: absorb damage, verify durability decrease |
| 8 | Fallback ability activates on separation: Bearkin arm-loss ability becomes available after arm separates | QA test: separate arm, verify ability unlock in Ability Graph |
| 9 | Body Integrity is server-authoritative: client presentation does not trigger separation; only server event does | QA test: review audit log for separation events vs. client frames |
| 10 | Loot drops with provenance: at least one item drop from Bronze Paw Captain has a valid Provenance record | QA test: defeat Captain, inspect loot provenance record |
| 11 | Camp and Sugar Well are accessible: player can navigate from camp to Sugar Well without soft-lock | QA exploration test |
| 12 | Content passes schema validation: all slice content files pass automated schema validation | Automated CI/build step |

---

## 5. System Dependencies

The following of the 21 architectural systems must be at least partially functional for the vertical slice:

| System | Required Level |
|---|---|
| Simulation Core | Full tick loop operational |
| Character Motor | Full movement, dodge, block |
| Ability Graph | Edgebearer and Pinshot ability sets |
| Hit Resolver | Full contact resolution |
| Armor Resolver | Bronze material matrix |
| Body Integrity | All Bearkin and enemy regions |
| Status/Enchantment Resolver | Minimal: pin status only |
| Reaction System | Flinch, stagger, limb-loss stagger |
| Monster AI | Sugar Wolf, Sour Slime, Bronze Paw variants, Captain |
| Progression | Levels 1–3, XP awards |
| Inventory/Economy | Bronze equipment, basic currency, loot grants |
| Loot Generation | Basic drop tables, Provenance records |
| Content Authoring | All slice content validated |
| Save/Provenance | Session save, Provenance records |
| Multiplayer Replication | 2-player co-op or 1v1 arena (minimum) |
| Audit/Anti-cheat | Basic audit event logging |
| Presentation Physics | Limb separation visuals, arrow embed visuals |
| Camera | Third-person tracking |
| UI | Body region indicator, XP bar, ability cooldowns |

**NOT required for slice:** Matchmaking, Privacy Analytics (beyond opt-in telemetry if implemented).

---

## 6. Content Authoring Needed for Slice

All the following must pass schema validation and authoring review before slice content lock:

- [ ] Ability records: Bearkin Edgebearer slash, parry, fallback arm ability
- [ ] Ability records: Bearkin Pinshot standard shot, pinning shot, arrow retrieval
- [ ] Attack records: Bronze Shortsword slash, Bronze Arrow shot, Pinning Arrow shot
- [ ] Anatomy records: Bearkin player anatomy, Sugar Wolf anatomy, Sour Slime anatomy, Bronze Paw bipedal anatomy
- [ ] Armor records: Bronze Vambrace, Bronze Chestplate, Bronze Gorget, Bronze Greaves
- [ ] Weapon records: Bronze Shortsword, Bronze Shortbow, Bronze Cudgel, Bronze Spear, Bronze Shield
- [ ] Material record: Bronze (damage modifier map all 9 damage types)
- [ ] Monster records: Sugar Wolf, Sour Slime, Bronze Paw Grunt, Bronze Paw Shieldbearer, Bronze Paw Archer, Bronze Paw Captain
- [ ] Encounter records: Level 1–3 encounters, Sugar Well encounter
- [ ] Loot source records: All 6 enemy types (rates in private pipeline)
- [ ] Arena record: Bronze Paw Orchard Ring
- [ ] Level gate records: Level 1, 2, 3 gates (minimal for slice)
- [ ] Faction record: Bronze Paw

---

## 7. QA Tests for Slice

See [QA_STRATEGY](QA_STRATEGY.md) for full strategy. Slice-specific test requirements:

- Deterministic simulation test: full Bearkin vs. Bronze Paw Grunt encounter from fixed seed produces identical outcome on re-run.
- Body-region tests: all Bearkin regions (6) track damage and separation correctly.
- Material matrix test: Bronze armor vs. all damage types from slice enemies.
- AI behavior test: each of 4 enemy types exhibits all 3 designed behaviors.
- Arrow pin test: pinning shot embeds in each targetable body region.
- Reattachment test: separated arm reattaches from correct proximity.
- Audit log test: all slice success-criterion events appear in audit log.
- Loot provenance test: Bronze Paw Captain drop generates valid Provenance record.

---

## 8. Risk Items in Slice

| Risk | Mitigation |
|---|---|
| Body Integrity complexity exceeds frame budget | Monitor per-tick simulation time during slice; reduce simultaneous entities if needed |
| Arrow pin visual not matching server state | Implement server-to-client pin event notification before presentation assignment |
| Limb separation animation rig complexity | Defer rig complexity; use placeholder at slice milestone |
| AI anti-repetition adds unexpected cost | Profile AI budget early; simplify if over budget |
| Schema validation tooling not ready | Use manual validation scripts as fallback |
| 2-player replication not stable | Reduce to solo-only slice as fallback; document as unresolved |

See [RISK_REGISTER](RISK_REGISTER.md) for full risk tracking.

---

## 9. Slice Schedule Phases — DESIGN ESTIMATE, NOT PERFORMED

These phases are design-estimate targets. No scheduling has been performed. NOT PERFORMED. Actual durations depend on engine selection and team composition.

| Phase | Focus | Dependencies |
|---|---|---|
| Slice Phase 0 | Engine selected, basic project scaffold | ENGINE_EVALUATION_ADR resolved |
| Slice Phase 1 | Character Motor + Simulation Core tick loop | Engine selection |
| Slice Phase 2 | Ability Graph + basic Edgebearer abilities | Phase 1 |
| Slice Phase 3 | Hit Resolver + Armor Resolver (Bronze matrix) | Phase 2 |
| Slice Phase 4 | Body Integrity (Bearkin anatomy, separation, reattachment) | Phase 3 |
| Slice Phase 5 | Pinshot ability set + arrow pinning | Phase 4 |
| Slice Phase 6 | Monster AI (Sugar Wolf, Sour Slime, Bronze Paw trio, Captain) | Phase 4 |
| Slice Phase 7 | Level 1–3 encounters + Camp + Sugar Well | Phase 6 |
| Slice Phase 8 | Loot generation + Provenance records | Phase 7 |
| Slice Phase 9 | 2-player replication + Bronze Paw Orchard Ring arena | Phase 6 |
| Slice Phase 10 | Schema validation + content authoring lock | All phases |
| Slice Phase 11 | QA pass against success criteria | Phase 10 |

---

## 10. Slice Content Authoring Checklist Details

### Ability Records — Full List

The following ability records must be authored and validated for the slice:

**Edgebearer Abilities:**
- `bearkin-edgebearer-slash-high` — Upward diagonal slash. Slice damage. Targets HEAD and TORSO regions preferentially.
- `bearkin-edgebearer-slash-mid` — Horizontal slash. Slice damage. Targets TORSO and ARM regions.
- `bearkin-edgebearer-slash-low` — Downward slash. Slice damage. Targets LEG regions.
- `bearkin-edgebearer-parry` — Guard stance. Reduces incoming damage from front arc for duration.
- `bearkin-edgebearer-arm-fallback` — Unlocks on arm separation. One-armed fighting stance with modified ability set.

**Pinshot Abilities:**
- `bearkin-pinshot-standard-shot` — Ranged arrow shot. Pierce damage. Non-pinning.
- `bearkin-pinshot-pinning-shot` — Ranged arrow shot. Pierce damage. pin_capable=true. Embeds in target region.
- `bearkin-pinshot-arrow-retrieval` — Close proximity action. Removes embedded arrow from pinned region.

### Monster AI Profiles — Required

Three AI profiles needed for slice:
- `ai-pack-hunt` — Used by Sugar Wolf. Shared target, morale group.
- `ai-amorphous-stalk` — Used by Sour Slime. Engulf attempt on pinned target.
- `ai-military-unit` — Used by Bronze Paw variants and Captain. Formation guard, command hierarchy.

---

## 11. Slice Acceptance Criteria — Full Detail

Each of the 12 success criteria is expanded here for the QA tester:

**Criterion 1 — Limb Separation:**
1. Equip a Bronze Vambrace on LEFT_ARM.
2. Receive Slice damage to LEFT_ARM until integrity reaches separation_threshold.
3. Observe: LEFT_ARM separates visually (presentation layer fires separation hint).
4. Verify in audit log: `separation_triggered` event recorded for entity_id, region=LEFT_ARM.
5. Verify: server-authoritative state shows LEFT_ARM as separated (not just visual).

**Criterion 2 — Limb Reattachment:**
1. Separate LEFT_ARM per Criterion 1.
2. Navigate the player character to within proximity of the separated arm.
3. Use the reattach action.
4. Observe: LEFT_ARM reattaches (presentation layer fires reattach hint).
5. Verify: server-authoritative state shows LEFT_ARM as reattached.
6. Verify: character can use LEFT_ARM abilities again.

**Criterion 3 — Arrow Pinning:**
1. Fire a pinning shot at a Bronze Paw Grunt's RIGHT_ARM.
2. Observe: arrow visually embeds in RIGHT_ARM.
3. Verify: Grunt's RIGHT_ARM movement penalty is active (reduced movement from that arm).
4. Verify audit log: `status_applied` event with status=PIN, region=RIGHT_ARM.

**Criterion 9 — Server Authority for Separation:**
1. Record a session with limb separation occurring.
2. Compare: the frame at which the presentation layer plays the separation animation.
3. Compare: the tick at which the `separation_triggered` audit event was logged.
4. Verify: the audit event tick precedes or is concurrent with the presentation frame. The presentation never triggers before the server event.

---

*Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853*
*Schedule estimates are NOT PERFORMED — design targets only.*
