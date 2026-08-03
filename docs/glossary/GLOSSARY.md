# GUMFALL — Comprehensive Glossary

**Status:** DRAFT — Updated 2026-08-02
**Organization:** Alphabetical within sections. Cross-references in parentheses.
**Related:** [Game Design Bible](../GAME_DESIGN_BIBLE.md) · [Architecture](../technical/ARCHITECTURE.md) · [Index](../INDEX.md)

---

## How to Use This Glossary

Terms are organized by category for easier navigation:
- [A — Documentation Labels](#documentation-labels)
- [B — System Names](#system-names)
- [C — Classes](#classes)
- [D — Lineages](#lineages)
- [E — Compositions and Flavor Affinities](#compositions-and-flavor-affinities)
- [F — Damage Types](#damage-types)
- [G — Armor Categories](#armor-categories)
- [H — Currency](#currency)
- [I — Enchantment Categories and Malady Types](#enchantment-categories-and-malady-types)
- [J — Ward Types](#ward-types)
- [K — Monster Ranks and Intelligence Types](#monster-ranks-and-intelligence-types)
- [L — Progression Eras](#progression-eras)
- [M — PvP Rulesets and Divisions](#pvp-rulesets-and-divisions)
- [N — Secret Area Tiers and Crown Depth](#secret-area-tiers-and-crown-depth)
- [O — Technical Terms](#technical-terms)
- [P — Narrative and World Terms](#narrative-and-world-terms)
- [Q — World Regions](#world-regions)
- [R — Attribute Names](#attribute-names)

---

## Documentation Labels

These labels appear throughout all GUMFALL documentation to mark the epistemic status of claims.

**ASSUMPTION** — A decision made without confirming data, noted so it can be revisited. Assumptions have review dates.

**DERIVED** — A value or rule computed from other VERIFIED values (e.g., XP at level 51 is derived from the XP formula).

**NOT PERFORMED** — A test, measurement, or validation that has not yet been done. Common in performance budgets and QA documents.

**OPEN** — A decision that has not yet been made (e.g., engine selection).

**PROPOSED** — Design intent that is open to revision during development. Proposed content may change without Design Authority escalation.

**UNKNOWN** — Something that is not yet determined and cannot be derived from existing decisions.

**VERIFIED** — A confirmed design decision, not subject to revision without Design Authority sign-off.

---

## System Names

**Ability Graph** — The system boundary responsible for defining, validating, and sequencing player and monster abilities. Enforces timing (in ticks), cooldowns, costs, and preconditions. Server-authoritative. See [Architecture §Boundary 3](../technical/ARCHITECTURE.md).

**Armor Resolver** — The system boundary that computes damage reduction, penetration, and armor durability degradation given a hit result and the target's armor configuration. Applies the material damage modifier matrix. Server-authoritative.

**Audit/Anti-Cheat** — System boundary 17. Records all authoritative events for integrity verification, detects anomalous patterns, and enforces exploit quarantine. Anti-cheat signatures are never in public documentation. VERIFIED.

**Body Integrity** — The system tracking per-region health, separation state, reattachment state, and fallback behaviors for every entity. Server-authoritative. Core to GUMFALL's identity. See [Body Integrity](../systems/BODY_INTEGRITY.md).

**Camera** — Client-only presentation system boundary. Third-person tracking, combat framing. Never affects hit detection or ability targeting.

**Character Motor** — System boundary 2. Player character movement, locomotion state machine, dodge, block pose, and physical positioning. Client-predicted, server-reconciled.

**Content Authoring** — Production system boundary 13. Pipeline and validation layer ensuring all content conforms to schemas before entering the game. Not a runtime system.

**GelFlow Combat** — GUMFALL's core combat framework. Named for the physical properties of gummy combatants: force flows through them, deforms them, can separate them. Encompasses directional attacks, armor resolution, and body integrity interaction. VERIFIED name.

**Hit Resolver** — System boundary 4. Determines whether an attack connects with a target body region, accounting for weapon geometry, attacker and target position, and armor coverage. All contact geometry evaluated server-side. VERIFIED.

**Inventory/Economy** — System boundary 11. Tracks owned items, equipped items, currency, and crafting state. All transactions are server-authoritative.

**Loot Generation** — System boundary 12. Generates item drops with deterministic seeding, ensures source traceability, and enforces protected drop configurations. All drops produce Provenance records.

**Matchmaking** — System boundary 16. Forms matches, assigns arenas, seeds tournaments, and enforces ranked division brackets.

**Monster AI** — System boundary 9. Drives monster decision-making: target selection, attack sequencing, morale, group coordination, surrender evaluation, and awareness. Server-authoritative.

**Multiplayer Replication** — System boundary 15. Propagates authoritative state changes from server to clients at appropriate priorities and delivers client inputs to server.

**Overmatch** — A combat state triggered when enchantment pressure overwhelms a target's Ward resistance threshold. The exact threshold is PRIVATE. Overmatch produces pronounced combat effects specific to the enchantment category.

**Presentation Physics** — System boundary 18. Drives visual-only physical behavior: mesh deformation, gummy stretch, ragdoll, particle effects. Never decides gameplay outcomes. Client-only.

**Privacy-Aware Analytics** — System boundary 21. Collects aggregated behavioral signals to inform design decisions. Never collects exact movement paths, session content, or personally identifying signals. VERIFIED.

**Progression** — System boundary 10. Tracks XP, level, era, ability unlock state, and level-gate enforcement. All progression is server-authoritative.

**Reaction System** — System boundary 8. Triggers and sequences entity reactions: flinch, stagger, knockback, ragdoll cue, surrender, morale break.

**Save/Provenance** — System boundary 14. Serializes and deserializes authoritative game state with full provenance chain. Manages cloud sync, migration, and integrity verification.

**Simulation Core** — System boundary 1. Tick-based deterministic simulation loop. Advances game state by consuming validated inputs. Produces outcome events consumed by all other systems.

**Status/Enchantment Resolver** — System boundary 7. Applies, stacks, decays, and resolves status effects and enchantment interactions. Manages Ward resistance checks.

**UI** — System boundary 20. Displays game state communicated from server. Color-independent status indicators. Scalable layout. Never makes gameplay decisions.

---

## Classes

All 12 classes. VERIFIED.

**Candy Artificer** — Engineering and trap-focused class. Constructs candy-based mechanical devices and automated systems.

**Candysinger** — Musical combat class. Abilities are triggered through rhythm and sequence.

**Confectioner** — Crafting and support class. Creates consumable confections with gameplay effects.

**Crusher** — Heavy melee class. Specializes in Crush damage type, armor destruction, and knockback.

**Edgebearer** — Directional sword combat class. Specializes in Slice damage, parrying, and directional guard. Primary class for the vertical slice.

**Flavorweaver** — Hybrid class that exploits flavor affinity interactions between lineages and compositions.

**Gelomancer** — Magic combat class. Manipulates gummy material, composition, and elemental enchantments.

**Gummy Brawler** — Unarmed and body-slam focused class. Uses anatomy directly as a weapon.

**Licorice Rogue** — Stealth and precision class. Licoricefolk lineage synergy. Uses poison and Affliction enchantments.

**Pinshot** — Ranged class specializing in arrow pinning: embedding projectiles in target body regions to restrict movement. Primary class for the vertical slice alongside Edgebearer.

**Skewer** — Pierce-focused melee class. Specializes in penetrating armor regions and inflicting Injury enchantments.

**Syrupwarden** — Defensive aura class. Projects Ward fields and sustain abilities to protect allies.

---

## Lineages

All 12 lineages. VERIFIED.

**Bearkin** — Bipedal bear-shaped gummy. Familiar anatomy (HEAD, TORSO, 2 arms, 2 legs). Strong Crush resistance. Primary lineage for the vertical slice.

**Bottleborn** — Gummies with crystalline, bottle-shaped bodies. High Cold resistance, brittle under Crush.

**Drakegums** — Draconic-shaped gummies. Wings (presentation only in base form), tail region, fire-adjacent composition.

**Gumdrop Folk** — Round, compact bipedals. Dense composition, high base Crush resistance.

**Jawbreaker Kin** — Hard outer layer composition. Extremely high defense but limited flexibility of body regions.

**Jellybean Folk** — Smooth-bodied bipedals with distinct flavor-region interactions. Flavor affinity is the core of their identity.

**Licoricefolk** — Dark, flexible, rope-like anatomy. Multiple limb configuration possible. Strong Affliction affinity.

**Marshfolk** — Amorphous semi-solid composition. Sour affinity. Limited limb definition; different anatomy structure.

**Ringborn** — Ring-segment anatomy. Multiple SEGMENT regions, no single critical region model (custom critical logic). PROPOSED.

**Sourlings** — Sour-composition bipedals. Take reduced Sour pressure, deal increased Sour damage.

**Swarmkin** — Colony entity. Multiple small bodies functioning as one. Unique anatomy model. PROPOSED.

**Wormkin** — Elongated, no-arm anatomy. Entirely different fallback system. Movement-centric combat.

---

## Compositions and Flavor Affinities

**Composition** — The physical material makeup of a lineage or monster body. Determines how damage types interact with the entity's body regions via a modifier map.

**Flavor Affinity** — A lineage's special relationship with a specific flavor/pressure type. Affinities grant bonuses to abilities, resistances, or interactions with Enchantments sharing that pressure type.

**Composition types (PROPOSED, not exhaustive):**
- **Gummy Standard** — Baseline gummy composition. Neutral modifiers.
- **Sugar-Based** — High Sugar pressure susceptibility, reduced Cold.
- **Sour-Based** — Sour affinity; takes reduced Sour, increased Sugar vulnerability.
- **Crystal** — High Cold resistance, Crush vulnerability.
- **Licorice** — Flexible, high Shock resistance, Sour vulnerability.
- **Marshmallow** — High Spirit resistance, Heat vulnerability.
- **Hard Candy** — Extreme Crush resistance, Slice vulnerability.
- **Amorphous** — Reduced effectiveness of Separation on some regions (PROPOSED).

---

## Damage Types

All 9 damage types. VERIFIED.

**Cold** — Temperature-based damage. Interacts with Crystal and Marshmallow compositions. Associated with slowing and freeze status.

**Crush** — Blunt impact damage. Degrades armor durability quickly. Triggers stagger. Associated with Crusher class.

**Heat** — Temperature-based damage. Interacts with Sugar-Based and Licorice compositions. Associated with melt and burn status.

**Pierce** — Penetrating damage. May pass through multiple armor layers at reduced effectiveness. Pin-capable attacks use Pierce. Associated with Pinshot and Skewer classes.

**Shock** — Electrical discharge damage. Interacts with water-adjacent compositions. Associated with stun.

**Slice** — Cutting damage. Primary damage type of Edgebearer class. Associated with Injury enchantments and limb separation.

**Sour** — Acid/sour chemical damage. Sourlings lineage has natural affinity. Associated with Affliction enchantments.

**Spirit** — Metaphysical damage. Interacts with Ward systems directly. Associated with Finality Malady type.

**Sugar** — Crystallizing-sweet damage. Associated with Control enchantments (hardening, slowing).

---

## Armor Categories

**Heavy Armor** — Maximum protection, movement penalty. Associated with Crusher and Syrupwarden classes.

**Light Armor** — Minimal protection, no movement penalty. Associated with Licorice Rogue and Pinshot classes.

**Medium Armor** — Balanced protection and mobility. Default for most classes.

**Armor Degradation** — Durability loss from absorbed damage. A degraded armor piece applies reduced protection.

**Armor Slot** — The body region a piece of armor covers (e.g., LEFT_ARM, TORSO). Each region has one armor slot; multiple pieces may not share a slot.

**Coverage Fraction** — The proportion of an armor slot covered by a piece. Values less than 1.0 allow partial-coverage rules.

---

## Currency

Currency hierarchy from lowest to highest denomination. VERIFIED.

1. **Tin Bit** — Common combat drop. Daily transactions.
2. **Copper Link** — Moderate value. Camp merchant range.
3. **Bronze Mark** — Significant item pricing.
4. **Silver Shield** — Equipment and faction standing purchases.
5. **Electrum Sun** — High-tier materials and specialized equipment.
6. **Gold Crown** — Luxury, rare equipment, premium economy tier.
7. **Platinum Seal** — Near-top tier. Reserved for high-end crafted items.
8. **Iridium Star** — Highest accessible economy tier.
9. **Aetherium Prism** — Maximum tier currency. Rarest transactions.

---

## Enchantment Categories and Malady Types

### Enchantment Categories (VERIFIED)

**Behavior** — Enchantments that modify monster AI responses or player behavior states.

**Control** — Enchantments that restrict movement, slow, freeze, or harden targets.

**Elemental** — Enchantments that add elemental damage pressure (Heat, Cold, Shock, etc.) to attacks.

**Injury** — Enchantments that specifically target body region integrity, increasing separation risk.

**Slayers** — Enchantments that deal bonus damage against specific monster types or compositions.

**Sustain** — Enchantments that restore integrity, reduce decay, or apply regenerative effects.

### Malady Types (VERIFIED)

The four extreme enchantment interaction categories. Exact trigger conditions: PRIVATE.

**Affliction** — A degenerative state that worsens over time. Associated with Sour pressure and Licorice Rogue class.

**Finality** — The most severe Malady. Spirit pressure. Associated with irreversible state changes.

**Omnislayer** — Malady that treats the target as a member of every monster category simultaneously, maximizing Slayer enchantment interaction.

**Ruin** — Structural breakdown Malady. Targets armor and body region integrity simultaneously.

---

## Ward Types

**Ward** — A defensive resistance field that blocks enchantment pressure up to its threshold. When pressure exceeds threshold, the Ward breaks and a penalty may apply.

**Ward Decay Rate** — How many pressure points of resistance recover per tick.

**Ward Stack** — Some Ward types may apply multiple times. Maximum stacks are authored per Ward.

Ward types are named by their resistance type (e.g., Sour Ward, Heat Ward, Slice Ward). Specific authored Wards are defined in content data. PROPOSED.

---

## Monster Ranks and Intelligence Types

### Monster Ranks (VERIFIED)

**Boss** — Unique, encounter-defining entities. Elaborate anatomy, multiple phases, full behavioral complexity.

**Captain** — Elite group leaders. Command aura effects, morale leadership, target prioritization.

**Common** — Standard encounter monsters. 3+ distinct behaviors per design requirement. The base of the encounter ecosystem.

**Elite** — Stronger individuals. Enhanced behaviors, more body regions, greater morale stability.

**Royal** — Monster royalty. Found in Royal Courts and secret areas. Not documented in public detail.

### Monster Intelligence Types (PROPOSED)

**Pack Intelligence** — Shared target awareness and morale pooled across a group (e.g., Sugar Wolf pack).

**Singular Intelligence** — Independent decision-making. No group morale (e.g., Sour Slime).

**Command Intelligence** — Hierarchical group control. Captain-led units with command aura (e.g., Bronze Paw Captain).

**Amorphous Intelligence** — Special AI for entities with non-standard anatomy (e.g., Sour Slime engulf logic).

---

## Progression Eras

Eras are named bands of the progression curve. VERIFIED.

| Era | Level Range |
|---|---|
| Foundation | 1–12 |
| Adventurer | 13–30 |
| Veteran | 31–50 |
| Heroic | 51–70 |
| Legendary | 71–80 |
| Mythic | 81–90 |
| Apex | 91–99 |
| Transcendent | 100 |

Post-Level-100: Architecture reserves expansion. Exact conditions: PRIVATE. VERIFIED public boundary.

---

## PvP Rulesets and Divisions

### Ranked Divisions (VERIFIED)

| Division | Level Range |
|---|---|
| Copper | 10–19 |
| Bronze | 20–29 |
| Iron | 30–39 |
| Steel | 40–49 |
| Heroic | 50–59 |
| Mithril | 60–69 |
| Legendary | 70–80 |
| Mythic | 81–90 |
| Apex | 91–100 |
| Unbound | Reserved — future expansion |

### PvP Rulesets

**Full Normalization** — All participants scaled to identical combat parameters regardless of equipment or progression. Skill only.

**Open Progression** — Progression-informed PvP with scalar application. Not capped to identical. Used in non-ranked arenas.

**Tournament Seeded** — Deterministic bracket from a server-managed seed. Reproducible. VERIFIED.

---

## Secret Area Tiers and Crown Depth

**Crown Depth** — The measurement system for how deep within Royal Court territory a secret area is. Specific tiers: PRIVATE. VERIFIED public boundary.

**Crown Tier** — A world region associated with the highest Crown Depth content. Existence is public; details are PRIVATE.

**Royal Court** — The domain of monster royalty within Royal Dungeons. Public catalog in [Royal Courts Public Catalog](../world/ROYAL_COURTS_PUBLIC_CATALOG.md).

**Royal Dungeon** — A hidden dungeon accessible through discoverable means in the world. Contains Royal Court encounters and secret content. See [Secret Areas](../world/SECRET_AREAS_AND_ROYAL_DUNGEONS.md).

**Royal Maze** — Navigational challenge within a Royal Dungeon. Solutions are PRIVATE. VERIFIED.

**Secret Area** — A location in the world not marked on any public map or documented in any public file. Discoverable through gameplay.

---

## Technical Terms

**Anatomy** — The body region configuration of an entity type. Defines which regions exist, their connectivity, integrity parameters, and critical status.

**Anti-Repetition** — AI rule requiring that an AI agent cannot make the same decision consecutively more than the authored maximum number of times without variation.

**Audit Trail** — The append-only log of all authoritative simulation events, used for anti-cheat verification and dispute resolution.

**Body Region** — A discrete segment of an entity's anatomy tracked independently by the Body Integrity system (e.g., LEFT_ARM, TORSO, HEAD).

**Client Prediction** — The client-side simulation of local character state before server confirmation arrives. Reconciled when server state differs.

**Commit Point** — The tick within an ability's execution at which the ability can no longer be cancelled.

**Content Pipeline** — The full process from content authoring through schema validation, review, and import into the game build.

**Data Contract** — A canonical specification of required fields, types, and relationships for a content type. All content must conform. See [Data Contracts](../technical/DATA_CONTRACTS.md).

**Deterministic Simulation** — A simulation that produces bit-identical output for identical inputs on any compliant host.

**Drop Table** — The data structure defining what items a loot source can generate and with what weights. Protected drop tables are in the private pipeline only. VERIFIED.

**Exploit Quarantine** — The anti-cheat response that pauses progression gains for a flagged entity pending human review.

**Fallback Ability** — An ability that unlocks when a body region is separated. Allows the entity to continue fighting in a changed state.

**Fixed-Tick Loop** — A simulation model where game state advances by discrete, equal-duration time steps (ticks), not by wall-clock time.

**Hitbox** — The server-side geometry used to evaluate whether an attack makes contact with a body region. Distinct from the visual mesh.

**Level Gate** — A requirement (trial completion, lineage milestone) that must be satisfied before a character can advance past a specific level.

**Malady** — One of the four extreme enchantment interaction states: Omnislayer, Ruin, Affliction, Finality.

**Material Matrix** — The table of DamageType × Material modifiers that the Armor Resolver applies when computing damage reduction.

**Morale** — An AI state value that affects decision-making. Low morale enables retreat or surrender evaluations.

**Overmatch** — The combat state triggered when enchantment pressure overcomes a Ward threshold. Exact threshold: PRIVATE.

**Pin** — A status applied by Pierce-type pin_capable attacks. Pins embed in a body region and restrict mobility for a duration.

**Presentation Layer** — The collection of client-side systems (Presentation Physics, Camera, UI) that communicate authoritative outcomes without deciding them.

**Provenance** — The origin record of an item instance: source, tick, world seed snapshot, and integrity hash. Required for all drops. See [Data Contracts — Provenance](../technical/DATA_CONTRACTS.md).

**Reconciliation** — The process by which a client corrects its predicted state to match the authoritative server state after a divergence is detected.

**Replication Priority** — The classification of state changes by how critically they must be delivered accurately (Critical, High, Medium, Low, Never).

**Schema Validation** — Automated verification that a content file conforms to the canonical data contract for its type. Required before any content enters the game. VERIFIED.

**Server-Authoritative** — A system architecture where the server makes all gameplay-relevant decisions. Clients receive and display the result. VERIFIED design principle.

**Tick** — A single discrete time step in the simulation. PROPOSED: 60 Hz (one tick per ~16.7ms).

**Ward** — A defensive resistance field. Blocks enchantment pressure up to a threshold.

---

## Narrative and World Terms

**Bronze Paw** — A faction of gummy soldiers associated with bronze-material equipment. Primary enemy faction in the vertical slice.

**Bronze Paw Orchard Ring** — The compact arena used in the vertical slice. A Bronze Paw–controlled arena in the Fractured Flats region. VERIFIED name.

**Camp** — The player's base of operations in early game. Contains Recasting station and basic merchant. Safe zone.

**First Unbinding** — The colloquial term for the transition beyond Level 100. Exact conditions: PRIVATE. VERIFIED.

**Fractured Flats** — A PROPOSED world region. Likely starting area. See [World Regions](../world/WORLD_REGIONS.md).

**Legacy Reroll** — A voluntary post-Level-100 character reset with permanent legacy bonuses.

**Monster Ascension** — A tournament format in which monsters, not players, compete. Players may participate as sponsors or participants in certain formats.

**Recasting** — The process of changing a character's class or specialty configuration. Available at Recasting stations. In-camp activity for the vertical slice.

**Royal Court** — The domain and court of a specific monster royalty entity.

**Shattercrown** — An open-PvP city. Player-controlled, dangerous, voluntarily entered.

**Shattered Sweetlands** — The world of GUMFALL. A land of living gummy creatures, fractured geography, and concealed Royal Courts.

**Sugar Lattice** — The underlying crystalline-sugar structure of the Shattered Sweetlands. PROPOSED: narrative element explaining world geography.

**Sugar Well** — A world location in the vertical slice. Contested by Bronze Paw enemies. Contains a Sour Slime spawn.

**Tin Bit** — The lowest denomination currency. Common drop from Basic enemies.

---

## World Regions

All PROPOSED — not verified. PROPOSED.

**Crystalline Highlands** — Elevated region. Crystal composition enemies likely.

**Crown Tier** — Highest-level world region. Associated with the deepest Royal Court content.

**Fractured Flats** — Starting region. Likely location of camp, Sugar Well, and Bronze Paw Orchard Ring.

**Molten Underpan** — Volcanic/heat-adjacent region. Heat damage composition enemies.

**Sourswamp Delta** — Wetlands. Sour composition enemies and Marshfolk presence.

**Staleborn Cryptlands** — Region associated with petrification and aged gummy composition.

**Sugar Coast** — Coastal region. Sugar-based composition enemies.

**Wrapper Fold Zones** — Unusual topology regions. PROPOSED: wrapper-based navigation challenges.

---

## Attribute Names

Attribute definitions are in [Attributes and Stats](../game-design/ATTRIBUTES_AND_STATS.md). Terms noted here for glossary cross-reference.

**Body Integrity (attribute)** — The aggregate integrity state of an entity. Derived from all regional integrity values.

**Composition Modifier** — The per-damage-type modifier applied to damage targeting this entity's body, based on their composition.

**Cooldown** — Time (in ticks) before an ability can be used again.

**Coverage** — The fraction of a body region's armor slot that is protected.

**Durability** — The remaining structural integrity of an armor or weapon piece.

**Enchantment Pressure** — The magnitude of an applied enchantment. Compared against Ward resistance thresholds.

**Integrity** — The current value of a body region's health. At or below separation threshold: region separates.

**Morale** — AI agent state reflecting willingness to fight. See Monster Ranks.

**Reach** — A weapon's relative hitbox scale factor.

**Separation Threshold** — The integrity value at or below which a body region separates.

**Ward Threshold** — The maximum enchantment pressure a Ward resists before breaking.

---

## Appendix: Term Cross-Reference by System Boundary

Quick reference mapping technical terms to their system boundary number from [ARCHITECTURE](../technical/ARCHITECTURE.md):

| System Boundary | Key Terms |
|---|---|
| 1 — Simulation Core | Tick, Deterministic Simulation, Fixed-Tick Loop, Seeded RNG |
| 2 — Character Motor | Client Prediction, Reconciliation, MotorCommand, MotorState |
| 3 — Ability Graph | Ability, Cooldown, Commit Point, Cancel Window, Precondition |
| 4 — Hit Resolver | Hitbox, AttackContext, HitResult, Contact Geometry |
| 5 — Armor Resolver | Armor, Material Matrix, Coverage, Durability, ArmorResolution |
| 6 — Body Integrity | Body Region, Separation Threshold, Integrity, Fallback Ability, Reattachment |
| 7 — Status/Enchantment Resolver | Enchantment, Ward, Overmatch, Malady, StatusApplication |
| 8 — Reaction System | Flinch, Stagger, Knockback, Morale Break, Surrender |
| 9 — Monster AI | Pack Intelligence, Command Intelligence, Anti-Repetition, Morale |
| 10 — Progression | XP Formula, Level Gate, Era, Transcendent, Legacy Reroll |
| 11 — Inventory/Economy | Currency, Transaction, Loadout, Economy Inflation |
| 12 — Loot Generation | Drop Table, LootSource, Provenance, Protected Content |
| 13 — Content Authoring | Schema Validation, Content Pipeline, Review Gate |
| 14 — Save/Provenance | SaveRecord, Migration, Integrity Hash, Provenance Chain |
| 15 — Multiplayer Replication | ReplicationPacket, Replication Priority, Entity Interpolation |
| 16 — Matchmaking | Ranked Division, Tournament Seed, PvP Normalization |
| 17 — Audit/Anti-Cheat | AuditEvent, Exploit Quarantine, Anti-Cheat, Replay |
| 18 — Presentation Physics | PresentationHint, Ragdoll, Gummy Deformation |
| 19 — Camera | Third-Person Camera, Reduced Camera Motion |
| 20 — UI | Color-Independent Status, Scalable UI, Screen-Reader |
| 21 — Analytics | Aggregated Signals, Privacy, Session Content (never collected) |

---

*Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853*
