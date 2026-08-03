# GUMFALL Game Design Bible

**Status:** DRAFT — Authoritative design overview. Detailed specifications are in linked documents.
**Navigation:** See [docs/INDEX.md](INDEX.md) for the full document tree.
**Related:** [Glossary](glossary/GLOSSARY.md) · [Architecture](technical/ARCHITECTURE.md) · [README](../README.md)

---

## Vision Statement

GUMFALL is a third-person physical action RPG in which combatants are living gummy creatures. Characters stretch, deform, crystallize, melt, become pinned, lose limbs, and continue fighting through class-specific fallback systems. The combat result is determined by an authoritative gameplay simulation. Visual deformation and procedural presentation represent that result — they do not decide it.

GUMFALL offers competitive progression through Level 100 and a concealed world of discovery beyond it, discoverable through play, not documentation.

---

## Product Identity

GUMFALL is the game where your arm falls off and you keep swinging. Where a pinned Bearkin archer fires from their knees. Where a Sour Slime engulfs a prone opponent while the Bronze Paw Captain rallies its crumbling unit. Every encounter is anatomically readable: you can see who is winning, where they are hurt, and why. The combat is physical, directional, and fair — determined by server-authoritative rules that the presentation communicates and the player can understand.

---

## 12 Core Design Pillars

| # | Pillar | Summary |
|---|---|---|
| 1 | **Immediate and responsive controls** | Every input has a defined response. Ability commit points are authored in ticks. The character does what the player commanded, or tells them why it cannot. |
| 2 | **Directional, physically readable combat** | Attack direction, weapon angle, and swing arc matter. Players and observers can read combat from body language and weapon position alone. |
| 3 | **Localized body and armor damage** | Damage is tracked per body region, per armor piece. Losing an arm changes the character. Losing armor coverage changes the risk. |
| 4 | **Anatomy-driven monster encounters** | Monsters have distinct body plans, compositions, and behavioral patterns. The optimal approach to a Sugar Wolf pack differs from a Bronze Paw unit and both differ from a Sour Slime. |
| 5 | **Source-grounded equipment and loot** | Every item traces to its origin. Materials come from specific monsters. Weapons are made of those materials. Loot drops have Provenance records. Nothing appears from nowhere. |
| 6 | **Strong class and lineage identities** | A Bearkin Edgebearer plays differently from a Sourling Gelomancer. Class defines the toolkit. Lineage defines the body. Composition and flavor define the interactions. |
| 7 | **Discoverable secrets without arbitrary guessing** | Secret areas, royal mazes, and hidden progression exist in the world with real clues. Motivated players can discover them. Walkthroughs cannot spoil what the public documentation does not contain. |
| 8 | **Competitive progression with bounded combat power** | Level 100 is the competitive cap. PvP normalization ensures bracket fairness. Enchantments and Ward interactions add depth without allowing power gaps that nullify skill. |
| 9 | **Fair structured PvP and dangerous opt-in open PvP** | Structured arenas use normalization and ranked brackets. Shattercrown is open-world danger that players enter knowing the risk. Both are intentional, neither is forced. |
| 10 | **Long-term expansion through hidden world systems** | GUMFALL has layers beyond Level 100. Architecture reserves expansion without promising it publicly. What the world conceals, persistent players can find. |
| 11 | **Accessible without compromising depth** | Full input remapping, timing assists, color-independent status display, scalable UI, photosensitivity controls, and reduced presentation complexity options are VERIFIED requirements — not afterthoughts. |
| 12 | **No pay-to-win, ever** | Cosmetics, emotes, housing cosmetics, mount appearances, expansions, and supporter packs are the permitted monetization scope. Combat effectiveness is never purchasable. VERIFIED. |

---

## Major Systems Overview

### GelFlow Combat
GUMFALL's core combat framework. Directional weapon swings, armor coverage checks, body-region damage application, and ability sequencing all resolve through the authoritative GelFlow simulation. The name reflects the physical properties of the gummy combatants: force flows through them, deforms them, and can separate them. See [GelFlow Combat](systems/GELFLOW_COMBAT.md).

### Gummy Body Integrity
Every entity in GUMFALL has a body integrity state: a set of regions, each with current integrity, armor, and separation threshold. Damage applies to a region. If that region's integrity falls below threshold, it separates. Separation changes what abilities are available, what fallbacks activate, and how the entity fights. Reattachment restores the region. Prosthetics replace it. See [Body Integrity](systems/BODY_INTEGRITY.md).

### Armor Coverage and Weapon Materials
Armor pieces cover specific body regions. Each piece has a material with a damage-type modifier map. The Armor Resolver applies the correct modifier for each attack's damage type and the target's armor material. A Bronze shield responds differently to Slice vs. Crush. An unarmored region has no modifier — what lands, lands. See [Equipment and Economy](systems/EQUIPMENT_AND_ECONOMY.md).

### Natural Enchantments and Defensive Wards
Weapons carry natural enchantments (Slayers, Injury, Elemental, Control, Sustain, Behavior categories). Armor and innate physiology carry Ward resistances. Pressure from enchantments is checked against Ward thresholds. Overmatch conditions trigger when pressure overwhelms resistance. Malady types (Omnislayer, Ruin, Affliction, Finality) represent the most severe enchantment interactions. See [Combat System](systems/COMBAT_SYSTEM.md).

### Character Classes and Specialties
Twelve classes, each with a distinct combat role, ability set, and specialty trees. Classes are selected at character creation and determine the character's primary toolkit. Specialties deepen that toolkit. All 12 classes: Edgebearer, Pinshot, Skewer, Crusher, Licorice Rogue, Gummy Brawler, Gelomancer, Flavorweaver, Confectioner, Candy Artificer, Syrupwarden, Candysinger. See [Classes and Lineages](game-design/CLASSES_AND_LINEAGES.md).

### Gummy Lineages, Compositions, and Flavor Affinities
Twelve lineages define the player character's body plan, composition, and flavor affinities. Bearkin have a familiar bipedal anatomy. Wormkin have no arms — their fallback system is entirely different. Sourlings take reduced Sour pressure and deal increased Sour damage. Composition type affects how damage types interact with the character's body. All 12 lineages: Bearkin, Wormkin, Ringborn, Gumdrop Folk, Jellybean Folk, Bottleborn, Sourlings, Licoricefolk, Marshfolk, Jawbreaker Kin, Drakegums, Swarmkin. See [Lineages, Compositions, Flavors](game-design/LINEAGES_COMPOSITIONS_FLAVORS.md).

### Monster Anatomy, Ecology, Roles, and Ranks
Monsters are not stat blocks with health bars. They have anatomies, compositions, behavioral patterns, and morale systems. A Sugar Wolf fights differently when its pack is broken. A Sour Slime attempts engulf when a target is pinned. Monster ranks (Common, Elite, Captain, Royal, Boss) reflect complexity of behavior, not just power scaling. Monster Knowledge rewards studying enemies. See [Monster System](systems/MONSTER_SYSTEM.md).

### Competitive Level 1–100 Progression
Nine eras of character progression: Foundation (1–12), Adventurer (13–30), Veteran (31–50), Heroic (51–70), Legendary (71–80), Mythic (81–90), Apex (91–99), Transcendent (100). XP formulas are VERIFIED and published (see [Progression](systems/PROGRESSION.md)). Level gates require trial completion and lineage milestones. Ranked PvP divisions mirror the progression eras. Level 100 is the official competitive cap.

### Legacy Reroll Progression
After reaching Level 100, players may undergo Legacy Reroll — a voluntary reset with permanent legacy bonuses. Each reroll is a strategic choice, not a required grind. See [Legacy Reroll](systems/LEGACY_REROLL.md).

### Secret Post-Level-100 Progression
Public documentation confirms that Level 100 is the official cap and that dedicated players may find something beyond it. Exact conditions, thresholds, and content are not in public files. VERIFIED public boundary.

### Secret Areas and Royal Mazes
The Shattered Sweetlands contain concealed passages, Royal Dungeons, and monster royalty courts. These are discoverable through gameplay observation and community engagement — not through reading documentation. Public files describe the existence of the system, not its solutions. See [Secret Areas](world/SECRET_AREAS_AND_ROYAL_DUNGEONS.md).

### Structured Arenas and Tournament Events
Normalized ranked arenas (1v1, 2v2, team formats), Monster Ascension tournament system, and weekly community events. Tournament brackets are seeded deterministically. See [Arenas and Matchmaking](multiplayer/ARENAS_AND_MATCHMAKING.md).

### Shattercrown Open-PvP City
A player-controlled city in contested territory. Visiting is voluntary and dangerous. Control shifts with faction and player effort. The economy of Shattercrown ties to the broader world economy. See [Shattercrown](multiplayer/SHATTERCROWN.md).

---

## Document Hierarchy and Navigation Guide

The GUMFALL documentation is organized into layers:

```
Game Design Bible (this document) — High-level authoritative overview
  │
  ├── Governance (who decides, what's public, what's decided)
  ├── Narrative (world, story, quests)
  ├── Character Design (classes, lineages, attributes)
  ├── Systems (combat, body integrity, progression, economy, monsters)
  ├── World (regions, dungeons, secret areas)
  ├── Multiplayer (PvP, arenas, Shattercrown)
  ├── UX (UI, accessibility)
  ├── Audio (music, sound design)
  ├── Live Operations (events, monetization)
  ├── Technical (architecture, data contracts, networking, authoring, performance)
  └── Production (vertical slice, QA, risks, engine decision)
```

**For the full document tree:** See [docs/INDEX.md](INDEX.md).

**For terminology:** See [docs/glossary/GLOSSARY.md](glossary/GLOSSARY.md).

---

## Design Authority Reference

All design decisions flow through the Design Authority structure. See [DESIGN_AUTHORITY](governance/DESIGN_AUTHORITY.md) for the full hierarchy.

**Rules that cannot change without Design Authority sign-off:**
- No pay-to-win monetization. VERIFIED.
- Server-authoritative simulation determines all gameplay outcomes. VERIFIED.
- Presentation never decides hits, damage, limb loss, loot, XP, or PvP results. VERIFIED.
- Exact secret area conditions, maze solutions, hidden thresholds are never in public files. VERIFIED.
- Anti-cheat signatures are never in public files. VERIFIED.

---

## Status of Preproduction

As of 2026-08-02:

- **Engine:** Not selected. ENGINE_EVALUATION_ADR is OPEN.
- **Prototype:** Not started. NOT PERFORMED.
- **Vertical Slice:** Specified. Not begun. See [VERTICAL_SLICE](production/VERTICAL_SLICE.md).
- **Documentation:** In active production on branch `design/full-game-bible-20260802-223853`.
- **Schemas:** Defined in [DATA_CONTRACTS](technical/DATA_CONTRACTS.md); example JSON schemas in `schemas/`.
- **Example content:** See `content/examples/` for reference content files.

The near-term priority is completing reviewable design documentation before beginning production implementation. VERIFIED.

---

## Preproduction Governance Summary

The following design decisions are VERIFIED and govern all documentation and future implementation:

### What Is Fixed (Cannot Change Without Design Authority Sign-Off)
- No pay-to-win monetization. VERIFIED.
- Server-authoritative simulation determines all gameplay outcomes. VERIFIED.
- Presentation physics (ragdoll, deformation, particles) never decide hits, damage, limb loss, loot, XP, or PvP results. VERIFIED.
- Exact secret area conditions, maze solutions, and hidden progression thresholds are never committed to public repositories. VERIFIED.
- Anti-cheat signatures are never committed to public repositories. VERIFIED.
- All content must pass schema validation before entering the game. VERIFIED.
- Body Integrity is tracked per region, per entity, on the authoritative server. VERIFIED.
- Accessibility options (all 11 documented) are requirements, not features. VERIFIED.
- All loot drops must produce a Provenance record. VERIFIED.

### What Is Proposed (Open to Revision)
- Tick rate (60 Hz authoritative, 20 Hz broadcast). PROPOSED.
- Entity count per zone. PROPOSED.
- Hardware tier targets. PROPOSED.
- PvP normalization scalar formulas. PROPOSED.
- Cloud sync conflict resolution strategy. PROPOSED.

### What Is Unknown (Must Be Resolved)
- Engine selection. OPEN.
- Target platforms. UNKNOWN.
- Network technology. UNKNOWN.
- Content authoring tooling. UNKNOWN.
- Legal/compliance jurisdiction. UNKNOWN.
- Retention periods for audit data. UNKNOWN.

---

## Linked Detailed Systems

For each major system listed in this bible, the detailed specification is in the linked document:

| System | Detailed Document |
|---|---|
| GelFlow Combat | [systems/GELFLOW_COMBAT.md](systems/GELFLOW_COMBAT.md) |
| Body Integrity | [systems/BODY_INTEGRITY.md](systems/BODY_INTEGRITY.md) |
| Equipment and Economy | [systems/EQUIPMENT_AND_ECONOMY.md](systems/EQUIPMENT_AND_ECONOMY.md) |
| Monster System | [systems/MONSTER_SYSTEM.md](systems/MONSTER_SYSTEM.md) |
| Progression | [systems/PROGRESSION.md](systems/PROGRESSION.md) |
| Legacy Reroll | [systems/LEGACY_REROLL.md](systems/LEGACY_REROLL.md) |
| Classes and Specialties | [game-design/CLASSES_AND_LINEAGES.md](game-design/CLASSES_AND_LINEAGES.md) |
| Lineages and Compositions | [game-design/LINEAGES_COMPOSITIONS_FLAVORS.md](game-design/LINEAGES_COMPOSITIONS_FLAVORS.md) |
| PvP and Arenas | [multiplayer/PVP_AND_ARENAS.md](multiplayer/PVP_AND_ARENAS.md) |
| Shattercrown | [multiplayer/SHATTERCROWN.md](multiplayer/SHATTERCROWN.md) |
| Arenas and Matchmaking | [multiplayer/ARENAS_AND_MATCHMAKING.md](multiplayer/ARENAS_AND_MATCHMAKING.md) |
| Secret Areas | [world/SECRET_AREAS_AND_ROYAL_DUNGEONS.md](world/SECRET_AREAS_AND_ROYAL_DUNGEONS.md) |
| World and Dungeons | [world/WORLD_AND_DUNGEONS.md](world/WORLD_AND_DUNGEONS.md) |
| World Regions | [world/WORLD_REGIONS.md](world/WORLD_REGIONS.md) |
| Narrative and Quests | [narrative/QUESTS_FACTIONS_COMPANIONS.md](narrative/QUESTS_FACTIONS_COMPANIONS.md) |
| Premise and Tone | [narrative/PREMISE_AND_TONE.md](narrative/PREMISE_AND_TONE.md) |
| UI and Accessibility | [ux/UI_UX_AND_ACCESSIBILITY.md](ux/UI_UX_AND_ACCESSIBILITY.md) |
| Audio and Music | [audio/AUDIO_AND_MUSIC.md](audio/AUDIO_AND_MUSIC.md) |
| Live Operations | [liveops/LIVE_OPERATIONS_AND_MONETIZATION.md](liveops/LIVE_OPERATIONS_AND_MONETIZATION.md) |
| Architecture | [technical/ARCHITECTURE.md](technical/ARCHITECTURE.md) |
| Data Contracts | [technical/DATA_CONTRACTS.md](technical/DATA_CONTRACTS.md) |
| Networking and Audit | [technical/NETWORKING_REPLICATION_AND_AUDIT.md](technical/NETWORKING_REPLICATION_AND_AUDIT.md) |
| Content Authoring | [technical/CONTENT_AUTHORING.md](technical/CONTENT_AUTHORING.md) |
| Performance Budgets | [technical/PERFORMANCE_BUDGETS.md](technical/PERFORMANCE_BUDGETS.md) |
| Vertical Slice | [production/VERTICAL_SLICE.md](production/VERTICAL_SLICE.md) |
| QA Strategy | [production/QA_STRATEGY.md](production/QA_STRATEGY.md) |
| Risk Register | [production/RISK_REGISTER.md](production/RISK_REGISTER.md) |
| Engine Evaluation ADR | [production/ENGINE_EVALUATION_ADR.md](production/ENGINE_EVALUATION_ADR.md) |

---

*Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853*
*See [docs/INDEX.md](INDEX.md) for full navigation.*
