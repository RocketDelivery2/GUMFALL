# GUMFALL — Technology-Neutral Data Contracts

**Status:** DRAFT
**Label Policy:** VERIFIED | DERIVED | PROPOSED | ASSUMPTION | UNKNOWN | NOT PERFORMED
**Related:** [Architecture](ARCHITECTURE.md) · [Content Authoring](CONTENT_AUTHORING.md) · [Glossary](../glossary/GLOSSARY.md) · [Index](../INDEX.md)

---

## Overview

This document defines the canonical fields, types, relationships, versioning strategy, and validation rules for all GUMFALL content types. These contracts are technology-neutral — they describe the data, not the serialization format or storage system.

All content must validate against these contracts before entering the game simulation. VERIFIED design requirement.

### Label Conventions

- **required** — must be present; validation fails without it.
- **optional** — may be absent; system uses defined default.
- **derived** — computed at load time from other fields; not authored directly.
- **private** — valid field but value must not appear in public data files.

---

## 1. Ability

**Purpose:** Defines a player or monster action that can be requested through the Ability Graph. Encodes timing, cost, effects, and sequencing rules.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier, kebab-case |
| `name` | string | Display name |
| `class_req` | string[] | Class IDs that may use this ability (empty = universal) |
| `lineage_req` | string[] | Lineage IDs required (empty = any) |
| `cost` | CostRecord | Resource cost to activate |
| `cooldown_ticks` | int ≥ 0 | Tick-count cooldown after use |
| `commit_point_ticks` | int ≥ 0 | Tick at which cancel is no longer possible |
| `effects` | EffectRef[] | Ordered list of effect references triggered on execution |
| `version` | semver string | Data contract version this record conforms to |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `preconditions` | Condition[] | [] | All must be satisfied for ability to be granted |
| `cancel_window_ticks` | int | 0 | Ticks after initiation during which cancel is allowed |
| `anim_hint` | string | null | Presentation hint for animation system (no gameplay effect) |
| `audio_hint` | string | null | Presentation hint for audio system |
| `tags` | string[] | [] | Taxonomy tags for filtering and balance tools |
| `description` | string | null | Human-readable description for UI and authoring tools |

**Relationships:**
- `class_req` → Class.id
- `lineage_req` → Lineage.id
- `effects[].effect_id` → Status/Enchantment definitions or Attack schemas

**Validation rules:**
- `commit_point_ticks` ≤ `cooldown_ticks`. VERIFIED.
- At least one entry in `effects` or this ability has no gameplay function (warning).
- `cancel_window_ticks` < `commit_point_ticks` if both > 0.

---

## 2. Attack

**Purpose:** Defines the physical parameters of a weapon strike or projectile: geometry, damage type, swing vector constraints, and pinning behavior.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `ability_id` | string | Ability that triggers this attack |
| `damage_type` | DamageType enum | Slice, Pierce, Crush, Heat, Cold, Sour, Sugar, Shock, Spirit |
| `base_damage` | int > 0 | Raw damage before armor/material resolution |
| `hitbox_ref` | string | Reference to server-side hitbox geometry definition |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `pin_capable` | bool | false | Whether attack can embed in target (Pinshot-class) |
| `pin_force` | int | 0 | Force applied to pinned entity per tick |
| `swing_arc_degrees` | float | 360 | Maximum arc of sweep test |
| `projectile_speed` | float | null | If set, attack is a ranged projectile |
| `piercing_count` | int | 1 | Number of targets a projectile may pass through |
| `tags` | string[] | [] | Balance taxonomy |

**Relationships:**
- `ability_id` → Ability.id
- `damage_type` → Material damage matrix (see Material)

**Validation rules:**
- If `pin_capable = true`, `damage_type` must be Pierce or Slice.
- `base_damage` must be positive integer.
- `hitbox_ref` must resolve to a registered server-side hitbox (authoring tool validates).

---

## 3. Anatomy

**Purpose:** Defines the body region configuration for an entity type (player lineage or monster). Maps the conceptual body plan to regions with connectivity rules.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `entity_type` | enum: player \| monster | Determines which systems consume this |
| `regions` | BodyRegion[] | All body regions in this anatomy |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `description` | string | null | Authoring notes |
| `reattach_compatible_types` | string[] | [] | Region types that may reattach across lineage mismatches |

**Relationships:**
- `regions[]` → BodyRegion definitions (see below)
- `entity_type=player` → Lineage.anatomy_id
- `entity_type=monster` → Monster.anatomy_id

---

## 4. Body Region

**Purpose:** Defines a single body region within an anatomy: its integrity parameters, separation behavior, and fallback consequences.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique within anatomy) | e.g., `LEFT_ARM`, `TORSO`, `HEAD` |
| `anatomy_id` | string | Parent anatomy this belongs to |
| `max_integrity` | int > 0 | Maximum integrity value |
| `separation_threshold` | int ≥ 0 | Integrity value at or below which separation triggers |
| `critical` | bool | If true, entity is defeated when this region is separated |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `connected_to` | string[] | [] | IDs of regions this is directly connected to (for propagation) |
| `fallback_ability_ids` | string[] | [] | Abilities that unlock when this region is separated |
| `reattach_capable` | bool | true | Whether this region can be reattached |
| `prosthetic_slot` | bool | false | Whether a prosthetic can occupy this region if original lost |
| `armor_slot` | string | null | Armor slot ID that covers this region |
| `damage_multiplier` | float | 1.0 | Incoming damage scalar for this region |

**Validation rules:**
- `separation_threshold` < `max_integrity`. VERIFIED.
- `critical = true` regions should be ≤ 1 per anatomy unless design explicitly allows multiple (warning).

---

## 5. Armor

**Purpose:** Defines an armor piece: material, coverage region, base protection values, and enchantment slots.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `material_id` | string | Material this armor is made from |
| `slot_id` | string | Body region slot this piece covers |
| `base_protection` | int > 0 | Base damage reduction before material matrix |
| `max_durability` | int > 0 | Maximum durability before degraded |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `enchantment_slots` | int | 0 | Number of enchantment slots |
| `ward_ids` | string[] | [] | Pre-applied Ward resistances |
| `coverage_fraction` | float 0–1 | 1.0 | Fraction of slot covered (for partial coverage rules) |
| `weight_class` | enum: light\|medium\|heavy | medium | Affects movement penalty |
| `set_id` | string | null | Armor set membership for set bonuses |
| `tags` | string[] | [] | Balance taxonomy |
| `description` | string | null | Lore/display description |

**Relationships:**
- `material_id` → Material.id
- `slot_id` → BodyRegion.armor_slot
- `enchantment_slots` → Enchantment schema

---

## 6. Weapon

**Purpose:** Defines a weapon: material, damage type, attack references, and enchantment capacity.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `material_id` | string | Primary material |
| `damage_type` | DamageType enum | Primary damage type |
| `attack_ids` | string[] | Attack definitions this weapon enables |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `enchantment_slots` | int | 0 | Number of enchantment slots |
| `reach` | float | 1.0 | Relative reach scalar (hitbox scale contribution) |
| `two_handed` | bool | false | Requires both hand slots |
| `ammo_type` | string | null | Required ammo (ranged weapons) |
| `weight_class` | enum: light\|medium\|heavy | medium | Affects swing speed |
| `tags` | string[] | [] | Balance taxonomy |
| `description` | string | null | Lore/display description |

---

## 7. Material

**Purpose:** Defines a physical material and its interaction modifiers with all damage types. The damage-type × material matrix is defined here.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `damage_modifiers` | DamageModifierMap | Per-damage-type modifier (float multiplier) |
| `tier` | int 1–N | Material progression tier |
| `version` | semver string | Data contract version |

**DamageModifierMap structure:**
```
{
  Slice: float,
  Pierce: float,
  Crush: float,
  Heat: float,
  Cold: float,
  Sour: float,
  Sugar: float,
  Shock: float,
  Spirit: float
}
```

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `harvest_source` | string[] | [] | Monster/world source for this material |
| `crafting_uses` | string[] | [] | What can be crafted from this material |
| `description` | string | null | Lore description |

---

## 8. Enchantment

**Purpose:** Defines a natural enchantment: its category, pressure type, application rules, and interactions with Wards.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `category` | EnchantmentCategory enum | Slayers, Injury, Elemental, Control, Sustain, Behavior |
| `pressure_type` | DamageType enum | Which damage type carries this enchantment's pressure |
| `magnitude` | int > 0 | Base pressure magnitude |
| `duration_ticks` | int > 0 | Duration before decay |
| `stack_behavior` | enum: replace\|stack\|refresh | How multiple applications interact |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `malady_type` | MaladyType enum | null | Omnislayer, Ruin, Affliction, Finality |
| `ward_interaction` | WardInteractionSpec | null | How this enchantment is modified by Ward resistance |
| `overmatch_threshold` | int | null | PRIVATE: threshold at which Overmatch triggers |
| `tags` | string[] | [] | Balance taxonomy |
| `description` | string | null | Display description |

**IMPORTANT:** `overmatch_threshold` values must not appear in public data files. VERIFIED.

**Relationships:**
- `category` → Enchantment category classification
- `pressure_type` → Material damage matrix
- `malady_type` → Malady resolution rules

---

## 9. Ward

**Purpose:** Defines a defensive Ward resistance: what pressure type it resists, at what threshold, and how it decays.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `resistance_type` | DamageType enum | Which pressure type this Ward resists |
| `threshold` | int > 0 | Pressure magnitude blocked before resistance breaks |
| `decay_rate_per_tick` | int ≥ 0 | How quickly resistance recovers per tick |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `max_stack` | int | 1 | Maximum concurrent Ward stacks |
| `break_penalty` | string | null | Status applied when Ward is broken |
| `description` | string | null | Display description |

---

## 10. Class

**Purpose:** Defines a player class: starting abilities, specialty access, and lineage compatibility.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `starting_ability_ids` | string[] | Abilities available at character creation |
| `specialty_ids` | string[] | Specialties this class can access |
| `version` | semver string | Data contract version |

All 12 classes: Edgebearer, Pinshot, Skewer, Crusher, Licorice Rogue, Gummy Brawler, Gelomancer, Flavorweaver, Confectioner, Candy Artificer, Syrupwarden, Candysinger. VERIFIED.

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `preferred_lineages` | string[] | [] | Lineages with mechanical synergy |
| `restricted_armor_types` | string[] | [] | Armor types this class cannot use |
| `description` | string | null | Class design description |
| `lore` | string | null | Narrative lore |

---

## 11. Specialty

**Purpose:** Defines a specialization within a class: its ability tree and unlock conditions.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `class_id` | string | Parent class |
| `ability_ids` | string[] | Abilities available through this specialty |
| `unlock_level` | int | Level at which this specialty becomes available |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `prerequisite_specialty_id` | string | null | Required specialty to unlock this one |
| `description` | string | null | Design description |

---

## 12. Lineage

**Purpose:** Defines a player lineage: its anatomy, composition traits, flavor affinities, and passive properties.

All 12 lineages: Bearkin, Wormkin, Ringborn, Gumdrop Folk, Jellybean Folk, Bottleborn, Sourlings, Licoricefolk, Marshfolk, Jawbreaker Kin, Drakegums, Swarmkin. VERIFIED.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `anatomy_id` | string | Anatomy definition for this lineage |
| `composition_id` | string | Composition type (affects material interactions) |
| `flavor_affinity_ids` | string[] | Flavor types with special interaction |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `passive_ability_ids` | string[] | [] | Abilities always active for this lineage |
| `preferred_class_ids` | string[] | [] | Classes with mechanical synergy |
| `description` | string | null | Lineage description |
| `lore` | string | null | Narrative lore |

---

## 13. Composition

**Purpose:** Defines the physical material composition of a lineage or monster: how it responds to damage types and environmental effects.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `base_modifiers` | DamageModifierMap | Per-damage-type interaction (see Material) |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `environmental_interactions` | EnvInteractionMap | {} | Reactions to world conditions (heat, cold zones) |
| `description` | string | null | Design description |

---

## 14. Flavor

**Purpose:** Defines a flavor affinity type: the gameplay interactions it enables or modifies.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `pressure_type` | DamageType enum | Associated damage/pressure type |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `affinity_bonuses` | AbilityModifierList | [] | Modifiers applied to abilities using this flavor |
| `description` | string | null | Design description |

---

## 15. Monster

**Purpose:** Defines a monster: its anatomy, AI configuration, encounter role, and base combat parameters.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `anatomy_id` | string | Anatomy (body region configuration) |
| `composition_id` | string | Composition (material interaction) |
| `ai_profile_id` | string | AI behavior profile |
| `rank` | MonsterRank enum | Common, Elite, Captain, Royal, Boss |
| `base_level` | int | Base encounter level |
| `loot_source_ids` | string[] | Loot sources this monster drops from |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `ability_ids` | string[] | [] | Abilities available to this monster |
| `faction_id` | string | null | Faction membership |
| `knowledge_reward` | MonsterKnowledgeSpec | null | What is revealed when player studies this monster |
| `surrender_capable` | bool | false | Whether AI may trigger surrender |
| `description` | string | null | Authoring description |
| `lore` | string | null | Narrative lore |

---

## 16. Encounter

**Purpose:** Defines a scripted or procedural encounter: participant configuration, spawn conditions, and victory criteria.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `monster_group` | MonsterGroupSpec[] | Monsters, roles, and spawn configuration |
| `arena_ref` | string | Reference to location/arena |
| `victory_condition` | VictoryConditionSpec | What constitutes winning this encounter |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `level_range` | int[] | null | [min, max] recommended player level |
| `faction_id` | string | null | Faction context |
| `xp_award_base` | int | derived | Base XP before scaling |
| `loot_source_override` | string[] | null | Overrides monster default loot sources |
| `description` | string | null | Authoring notes |

---

## 17. Loot Source

**Purpose:** Maps a monster or world source to a drop table, with provenance tracking requirements.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `source_type` | enum: monster\|chest\|world\|quest\|trial | Origin type |
| `source_id` | string | ID of the source entity |
| `drop_table_ref` | string | Reference to drop table definition |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `seed_contribution` | string | null | How this source contributes to the world seed chain |
| `protected` | bool | false | PRIVATE: if true, drop table details not in public files |
| `description` | string | null | Authoring notes |

**IMPORTANT:** If `protected = true`, the drop table details must not be in any public data file. VERIFIED.

---

## 18. Provenance

**Purpose:** Records the complete origin chain of an item instance: where it came from, when, and under what seed.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `item_instance_id` | string (unique) | Unique identifier for this item instance |
| `source_type` | enum | monster\|chest\|world\|quest\|trial\|crafted\|purchased |
| `source_id` | string | ID of the originating source |
| `tick` | int | Simulation tick of generation |
| `world_seed_snapshot` | string | Seed state at time of generation |
| `integrity_hash` | string | Hash over all provenance fields |
| `version` | semver string | Data contract version |

**Derived fields:**
- `integrity_hash` is computed at record creation and must not be authored directly.

---

## 19. Level Gate

**Purpose:** Defines the prerequisites a character must satisfy before advancing through a level gate.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `level` | int | Level that requires this gate |
| `required_trials` | string[] | Trial IDs that must be completed |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `required_lineage_milestones` | string[] | [] | Lineage milestone IDs required |
| `required_faction_standing` | FactionRequirementSpec[] | [] | Faction standing requirements |
| `description` | string | null | Player-facing description |

---

## 20. Trial

**Purpose:** Defines a formal challenge used as a level gate or ranked event.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `trial_type` | enum: combat\|endurance\|puzzle\|team | Trial category |
| `encounter_ids` | string[] | Encounters that constitute this trial |
| `success_criteria` | SuccessCriteriaSpec | What constitutes completing this trial |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `level_gate_id` | string | null | Level gate this trial satisfies |
| `ranked_eligible` | bool | false | Whether this trial awards ranked points |
| `description` | string | null | Player-facing description |

---

## 21. Arena

**Purpose:** Defines a PvP or PvE arena: its geometry reference, ruleset, and tournament eligibility.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `geometry_ref` | string | Reference to arena geometry/layout |
| `ruleset_id` | string | PvP or PvE ruleset applied |
| `player_capacity` | CapacitySpec | Min/max player counts |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `tournament_eligible` | bool | false | Whether this arena can host tournament matches |
| `ranked_eligible` | bool | false | Whether ranked matches occur here |
| `faction_id` | string | null | Controlling faction |
| `description` | string | null | Lore/display description |

---

## 22. Tournament

**Purpose:** Defines a tournament event: format, seeding, participants, and progression.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `format` | enum: single_elim\|double_elim\|round_robin\|monster_ascension | Tournament format |
| `arena_id` | string | Arena used |
| `seed` | string | Deterministic seed for bracket generation |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `player_capacity` | CapacitySpec | null | Min/max participants |
| `ranked_division_req` | string | null | Division required to enter |
| `description` | string | null | Display description |

**Determinism note:** Given identical `seed` and identical participant list, bracket order must be reproducible. VERIFIED.

---

## 23. Quest

**Purpose:** Defines a quest: its objectives, faction context, rewards, and branching conditions.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `objectives` | QuestObjective[] | Ordered or unordered objectives |
| `rewards` | RewardSpec[] | Rewards on completion |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `faction_id` | string | null | Issuing faction |
| `prerequisite_quest_ids` | string[] | [] | Quests that must be completed first |
| `level_req` | int | 0 | Minimum level to accept |
| `description` | string | null | Player-facing description |
| `lore` | string | null | Narrative context |

---

## 24. Faction

**Purpose:** Defines a faction: its standing scale, relationships, and NPC configuration.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `standing_scale` | StandingScaleSpec | Min/max standing, rank names |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `allied_faction_ids` | string[] | [] | Factions with positive standing relationship |
| `hostile_faction_ids` | string[] | [] | Factions with hostile relationship |
| `description` | string | null | Lore description |

---

## 25. Companion

**Purpose:** Defines a companion NPC: its anatomy, abilities, and relationship mechanics.

**Required fields:**

| Field | Type | Description |
|---|---|---|
| `id` | string (unique) | Canonical identifier |
| `name` | string | Display name |
| `anatomy_id` | string | Anatomy (for body integrity tracking) |
| `ai_profile_id` | string | AI behavior profile |
| `version` | semver string | Data contract version |

**Optional fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `ability_ids` | string[] | [] | Abilities available to this companion |
| `faction_id` | string | null | Faction affiliation |
| `relationship_scale` | RelationshipScaleSpec | null | Friendship/trust scale |
| `description` | string | null | Design description |
| `lore` | string | null | Narrative lore |

---

## Versioning Strategy

### Contract Versioning — PROPOSED

All data contracts use semantic versioning (`MAJOR.MINOR.PATCH`):

- **MAJOR** bump: breaking change — a field is removed, renamed, or type is changed. Existing records must be migrated.
- **MINOR** bump: additive change — a new optional field is added. Existing records remain valid.
- **PATCH** bump: documentation or validation rule correction — no field changes.

Every data record includes a `version` field indicating which contract version it was authored against.

### Record Versioning

Individual content records carry:
- `version`: contract version at authoring time.
- `updated_at`: authoring timestamp (ISO 8601).
- `author`: authoring identity (not a credentials field).

### Migration Policy — PROPOSED

- All migrations are forward-only. PROPOSED.
- A migration function transforms a record from version N to version N+1.
- Migration functions are authored, reviewed, and tested before any MAJOR version is deployed.
- Save records include the contract versions of all embedded schemas and migrate on load if needed.
- Backwards compatibility window: UNKNOWN — to be defined before live operation.

---

## Authoring Validation Rules

VERIFIED design requirements:

1. All required fields must be present and non-null.
2. All enum fields must contain a valid enum value.
3. All ID references must resolve to existing records of the correct type.
4. All `version` fields must be valid semver strings.
5. Protected fields (`protected = true`, `overmatch_threshold`, etc.) must not have values in public data files.
6. Content with `private` label must not appear in public repository content directories.
7. All `integrity_hash` values on Provenance records must be valid (authoring tools compute, do not author directly).
8. Lineage anatomy must include at least one `critical = true` region.
9. Ability `commit_point_ticks` must not exceed `cooldown_ticks`.
10. Enchantment `malady_type` field — values Omnislayer, Ruin, Affliction, Finality — must reference a valid Malady resolution rule.

---

*Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853*
*See [ARCHITECTURE](ARCHITECTURE.md) for system context. See [CONTENT_AUTHORING](CONTENT_AUTHORING.md) for pipeline.*
