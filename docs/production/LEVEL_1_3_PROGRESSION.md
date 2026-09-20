# Level 1–3 Progression Specification

**Status:** VERIFIED where inherited from accepted design / PROPOSED where this document defines the first playable progression flow.
**Label Policy:** VERIFIED | DERIVED | PROPOSED | ASSUMPTION | UNKNOWN | NOT PERFORMED
**Issue:** #5 — Specify Level 1–3 progression
**Related:** [Vertical Slice](VERTICAL_SLICE.md) · [Progression](../systems/PROGRESSION.md) · [Weapons, Mastery, and Equipment](../systems/WEAPONS_MASTERY_AND_EQUIPMENT.md) · [Crafting, Economy, and Loot](../systems/CRAFTING_ECONOMY_AND_LOOT.md)

---

## 1. Scope

[VERIFIED] The first playable progression segment begins at Level 1 and is capped at Level 3 for the vertical slice.

[VERIFIED] The playable slice classes are Bearkin Edgebearer and Bearkin Pinshot.

[VERIFIED] Post-Level-3 progression is outside the vertical-slice scope.

This document defines the progression contract for Levels 1–3 without selecting an engine, programming language, persistence system, or UI implementation.

---

## 2. Level Flow

### Level 1 — Foundation Entry

[VERIFIED]

- Character starts at Level 1.
- Edgebearer starts with Bronze Shortsword and its basic directional combat kit.
- Pinshot starts with Bronze Shortbow/Bronze Arrow equipment and its standard/pinning-shot kit.
- The first encounter is tutorial-scale in the camp vicinity.
- Camp is the safe-zone base of operations.

[PROPOSED]

- Level 1 teaches only the starter weapon family and the class's slice-scope actions before additional progression decisions are presented.
- No advanced mastery discipline or full Monster Knowledge reward tree is exposed at Level 1.

### Level 2 — Reinforcement

[VERIFIED/DERIVED]

- Level 2 progression remains within the Foundation era.
- The Level 2 encounter target is the camp-defense Bronze Paw patrol already defined by the vertical-slice specification.
- XP awards must use the authoritative progression formula rather than ad hoc values.

[PROPOSED]

- Level 2 confirms continued proficiency with the starting weapon family and introduces a second bounded combat challenge without requiring an advanced class specialization.
- No permanent off-class equipment entitlement is granted merely by reaching Level 2.

### Level 3 — First Build Decision

[VERIFIED]

- Level 3 is the maximum level in the vertical slice.
- DEC-003 establishes specialty paths as a Level 3 progression concept.
- Recasting/configuration is available at camp in the vertical-slice scope.

[PROPOSED]

- Reaching Level 3 unlocks the first specialty-selection decision for the active class.
- Exact specialty choices exposed in the slice remain separately authored; this specification does not invent a final Level 3 specialty list.
- A Level 3 player may use the camp Recasting flow to revise the active class/specialty configuration allowed by slice content.

---

## 3. XP Contract

[VERIFIED] Progression is server-authoritative.

[VERIFIED] The Level 1–50 XP formula is:

`round(300 × L^1.8)`

[DERIVED] Levels 1–3 use that same formula; no separate tutorial-only XP curve is authorized by this document.

[PROPOSED]

- Encounter, objective, and milestone awards are authored so that the player can move through Levels 1–3 without repeated farming of one encounter.
- Exact per-enemy and per-objective XP awards remain balance values and are not invented here.
- XP may accrue during encounters, but the level-transition application follows the camp/safe-point rule below.

---

## 4. Camp Leveling

[VERIFIED] Camp is the early-game safe-zone base of operations and contains a Recasting station.

[PROPOSED] For the Level 1–3 slice, XP can accrue immediately, but a Level 2 or Level 3 transition is committed at an approved safe progression point: camp or a Sugar Well/restoration point.

This rule is intended to:

- prevent a build configuration from changing in the middle of an authoritative combat sequence;
- give the player a clear moment to review class/specialty changes;
- keep progression, Recasting, and body restoration in a controlled state transition.

[UNKNOWN] Final UI flow, animation, timing, and whether a later full-game ruleset permits immediate field leveling.

---

## 5. Equipment Proficiency

[VERIFIED] Weapon Mastery is tracked per weapon family and is distinct from the character's level.

[PROPOSED] The Level 1–3 slice uses a bounded equipment-proficiency rule:

- Edgebearer is progression-eligible with the starter Swords family equipment used by the slice.
- Pinshot is progression-eligible with the starter Bows family equipment used by the slice.
- Bronze slice armor/equipment remains usable when its existing class/body requirements are satisfied.
- Level alone does not grant proficiency with every weapon family.
- Equipment above the slice's authored progression band is not introduced as a Level 1–3 reward.

[UNKNOWN]

- exact off-family penalties;
- exact Mastery XP gains at Levels 1–3;
- exact Mastery thresholds for Familiar/Practiced/etc.;
- whether any non-primary weapon family is intentionally available before Level 4.

These values require balance/design authority and must not be fabricated as implementation constants.

---

## 6. Monster Knowledge — Slice Hook

[VERIFIED] Monster Knowledge is a broader progression system concept, but the full Monster Knowledge system is not part of the vertical slice.

[PROPOSED] The Level 1–3 slice includes only a minimal progression hook:

- encountering an authored slice monster may create or update a basic knowledge entry;
- defeating or observing an authored behavior may mark a bounded knowledge fact as discovered;
- the hook must be able to distinguish Sugar Wolf, Sour Slime, and Bronze Paw enemy knowledge;
- no hidden Royal/secret content, protected drop weights, or anti-cheat information may be revealed through this hook;
- no permanent combat bonus from Monster Knowledge is required for the Level 1–3 acceptance target.

[UNKNOWN]

- knowledge-point currency, if any;
- UI presentation;
- full reveal taxonomy;
- long-term bonuses;
- exact unlock thresholds.

The full Monster Knowledge specification remains a later design task.

---

## 7. Recasting

Existing documentation uses Recasting for both character configuration and body restoration. This specification preserves both source meanings and scopes them explicitly rather than silently collapsing them.

### 7.1 Configuration Recasting

[VERIFIED] The vertical slice camp includes a Recasting station that can swap between Edgebearer and Pinshot or adjust the allowed build/spec configuration.

[PROPOSED]

- configuration Recasting is performed at camp or another approved Recasting point;
- it cannot occur during active combat;
- switching configuration does not duplicate equipment, XP, currency, items, or detached body parts;
- Level 3 specialty selection can be revised only within the slice's authored options.

### 7.2 Restoration Recasting

[VERIFIED] Existing crafting/body documentation describes Recasting/restoration as restoring essential body state at a Sugar Well or approved restoration point.

[VERIFIED] Restoration can restore lost/damaged body regions and eligible embedded-object state, but does not automatically repair all equipment or duplicate inventory.

[PROPOSED] The UI and implementation should present configuration changes and body restoration as distinct actions even when both are available at the same station.

---

## 8. Level 1–3 Acceptance Criteria

The progression specification is ready for implementation planning when all of the following are true:

- [ ] Level 1 start state is defined for Edgebearer and Pinshot.
- [ ] XP uses the authoritative progression formula.
- [ ] Level 2 and Level 3 transition only through the accepted safe-point progression rule for the slice.
- [ ] Level 3 exposes the first specialty-selection decision without inventing unsupported specialty content.
- [ ] Starter equipment proficiency is bounded by class/weapon-family rules rather than level granting universal proficiency.
- [ ] The minimal Monster Knowledge hook does not expose protected content.
- [ ] Configuration Recasting cannot duplicate inventory or alter authoritative combat state mid-encounter.
- [ ] Restoration Recasting preserves the existing no-duplication and equipment-repair boundaries.
- [ ] No engine, language, persistence, networking, or UI technology is selected.
- [ ] Repository validation passes.

---

## 9. Implementation Status

[NOT PERFORMED]

This specification does not claim that Level 1–3 progression code, XP award tables, proficiency runtime logic, Monster Knowledge UI, Recasting UI, save migration, or level-transition tests exist.

Runtime implementation remains gated by DEC-001 and the production roadmap.
