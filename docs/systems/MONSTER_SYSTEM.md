# Monster System

**Status:** VERIFIED framework / PROPOSED balance values
**Label Policy:** VERIFIED | DERIVED | PROPOSED | ASSUMPTION | UNKNOWN | NOT PERFORMED
**Related:** [Data Contracts](../technical/DATA_CONTRACTS.md) · [Content Authoring](../technical/CONTENT_AUTHORING.md) · [Monster Schema](../../schemas/monster.schema.json)

## Authoring Framework

Every authored monster is defined through the technology-neutral monster contract. Runtime implementation remains gated by DEC-001.

Required authoring dimensions are:

- creature family;
- anatomy regions and their Body Integrity properties;
- composition;
- flavor affinity;
- one or more combat roles;
- intelligence tier;
- temperament;
- rank;
- level band;
- loot-source references that establish loot ecology;
- AI profile.

Faction membership is optional because not every creature belongs to an organized faction. When present, `faction_id` records the canonical faction reference.

## Anatomy

Monster anatomy is gameplay authority, not presentation metadata.

Each authored body region may define:

- Local Structure;
- Elasticity;
- Temperature;
- Stickiness;
- Crystallization;
- Connection Strength;
- natural armor coverage;
- damage vulnerabilities and resistances.

Major breakable anatomy must change monster behavior where the design calls for it. A severed or disabled region cannot be treated as a cosmetic-only result.

## Behavior

The authoring contract separates broad behavioral identity from engine implementation:

- `roles` describe encounter function;
- `intelligence` describes behavioral capability;
- `temperament` describes the default non-combat stance;
- `ai_profile` describes target priorities, behavior archetype, escape behavior, and design notes.

No behavior tree technology, scripting language, engine AI package, or networking implementation is selected by this document.

## Rank

Canonical monster ranks are:

- Minion
- Standard
- Veteran
- Elite
- Champion
- Boss
- Mythic

Rank affects encounter expectations and other systems such as enchantment-roll multipliers where separately specified. Rank is not a substitute for authored anatomy or behavior.

Boss durability should come from anatomy, armor layers, movement, regeneration organs, encounter behavior, and phase mechanics rather than one oversized health pool.

## Factions

`faction_id` is optional.

Use it when a monster has organized allegiance or faction context, such as Bronze Paw. Wild creatures can remain unaffiliated.

Faction-specific standing, diplomacy, quest state, and territory rules belong to the faction/quest systems rather than being duplicated inside the monster record.

## Loot Ecology

Monster records reference `loot_sources`; they do not embed protected drop weights.

A loot source ties drops back to the creature, body harvest, faction equipment, ecology, or other source-grounded origin. Exact protected drop configurations remain outside public content when required by the public/private boundary policy.

## Validation Boundary

A monster is ready for content review when:

- required monster-schema fields are present;
- anatomy contains at least one authored region;
- combat roles are non-empty;
- intelligence, temperament, and rank use canonical values;
- referenced loot-source identifiers use canonical IDs;
- faction membership, when present, uses a canonical ID;
- public content contains no protected loot weights or private anti-cheat data;
- repository schema/document validation passes.

Implementation, AI tuning, encounter balance, and performance validation remain NOT PERFORMED until the relevant production phase.
