# GUMFALL — Master Document Index

**Status:** DRAFT — Updated 2026-08-02
**Branch:** design/full-game-bible-20260802-223853
**Related:** [README](../README.md) · [Game Design Bible](GAME_DESIGN_BIBLE.md) · [Glossary](glossary/GLOSSARY.md)

---

## Welcome

This index is the canonical navigation map for all GUMFALL documentation. Every file in the `docs/` directory is listed here with its status and a brief description.

GUMFALL is currently in **preproduction**. No engine has been selected. All documentation is design-intent and design-specification, not implementation. VERIFIED.

### Status Labels Used in This Index

| Label | Meaning |
|---|---|
| VERIFIED | Confirmed design decision, not subject to revision without Design Authority sign-off |
| PROPOSED | Design intent, open to revision during development |
| DRAFT | Document is in progress, content may be incomplete |
| STUB | Placeholder — document has not been authored yet |
| OPEN | Decision not made |

---

## Quick-Start Guide

### For a New Contributor
1. Read [AGENTS.md](../AGENTS.md) — rules, authority labels, do/don't list.
2. Read [Game Design Bible](GAME_DESIGN_BIBLE.md) — what GUMFALL is.
3. Read [Governance — Design Authority](governance/DESIGN_AUTHORITY.md) — who decides what.
4. Read [Glossary](glossary/GLOSSARY.md) — vocabulary you will need.
5. Read [CONTRIBUTING.md](../CONTRIBUTING.md) — how to contribute.

### For a System Designer
1. [Combat System](systems/COMBAT_SYSTEM.md)
2. [GelFlow Combat](systems/GELFLOW_COMBAT.md)
3. [Body Integrity](systems/BODY_INTEGRITY.md)
4. [Classes and Lineages](game-design/CLASSES_AND_LINEAGES.md)
5. [Progression](systems/PROGRESSION.md)
6. [Architecture](technical/ARCHITECTURE.md) — understand system boundaries
7. [Data Contracts](technical/DATA_CONTRACTS.md) — content schemas

### For a Narrative Writer
1. [Premise and Tone](narrative/PREMISE_AND_TONE.md)
2. [World and Royal Dungeons](world/WORLD_AND_DUNGEONS.md)
3. [World Regions](world/WORLD_REGIONS.md)
4. [Quests, Factions, Companions](narrative/QUESTS_FACTIONS_COMPANIONS.md)
5. [Public/Private Boundaries](governance/PUBLIC_PRIVATE_BOUNDARIES.md) — what can be written publicly
6. [Glossary](glossary/GLOSSARY.md)

### For a Technical Implementer
1. [Architecture](technical/ARCHITECTURE.md) — all 21 system boundaries
2. [Data Contracts](technical/DATA_CONTRACTS.md) — canonical schemas
3. [Networking, Replication, and Audit](technical/NETWORKING_REPLICATION_AND_AUDIT.md)
4. [Content Authoring](technical/CONTENT_AUTHORING.md)
5. [Performance Budgets](technical/PERFORMANCE_BUDGETS.md)
6. [Engine Evaluation ADR](production/ENGINE_EVALUATION_ADR.md)
7. [Vertical Slice](production/VERTICAL_SLICE.md)

---

## Section 1: Governance

| Document | Status | Description |
|---|---|---|
| [Design Authority](governance/DESIGN_AUTHORITY.md) | VERIFIED | Who owns which design decisions |
| [Decision Log](governance/DECISION_LOG.md) | VERIFIED | Accepted and open design decisions |
| [Assumption Register](governance/ASSUMPTION_REGISTER.md) | VERIFIED structure | Tracked assumptions with review dates |
| [Public/Private Boundaries](governance/PUBLIC_PRIVATE_BOUNDARIES.md) | VERIFIED | What may and may not be in public files |

---

## Section 2: Narrative

| Document | Status | Description |
|---|---|---|
| [Premise and Tone](narrative/PREMISE_AND_TONE.md) | DRAFT | World premise, tone, thematic anchors |
| [Intro Cinematic](narrative/INTRO_CINEMATIC.md) | DRAFT | Opening cinematic description |
| [Quests, Factions, Companions](narrative/QUESTS_FACTIONS_COMPANIONS.md) | DRAFT | Quest structure, factions, companion design |

---

## Section 3: Character Design

| Document | Status | Description |
|---|---|---|
| [Classes and Lineages](game-design/CLASSES_AND_LINEAGES.md) | DRAFT | All 12 classes and 12 lineages overview |
| [Classes and Specialties](game-design/CLASSES_AND_SPECIALTIES.md) | DRAFT | Specialty trees within each class |
| [Lineages, Compositions, Flavors](game-design/LINEAGES_COMPOSITIONS_FLAVORS.md) | DRAFT | Lineage compositions and flavor affinities |
| [Attributes and Stats](game-design/ATTRIBUTES_AND_STATS.md) | DRAFT | Character attribute definitions |
| [Character Creation](game-design/CHARACTER_CREATION.md) | DRAFT | Character creation flow |

---

## Section 4: Systems

| Document | Status | Description |
|---|---|---|
| [Combat System](systems/COMBAT_SYSTEM.md) | DRAFT | GelFlow combat overview, directional combat |
| [GelFlow Combat](systems/GELFLOW_COMBAT.md) | DRAFT | GelFlow combat detailed specification |
| [Body Integrity](systems/BODY_INTEGRITY.md) | DRAFT | Per-region body state, separation, reattachment |
| [Damage, Status, and Armor](systems/DAMAGE_STATUS_AND_ARMOR.md) | DRAFT | Damage channels, status effects, armor interactions |
| [Enchantments and Wards](systems/ENCHANTMENTS_AND_WARDS.md) | DRAFT | Natural enchantment probabilities, Malady types, Ward categories |
| [Weapons, Mastery, and Equipment](systems/WEAPONS_MASTERY_AND_EQUIPMENT.md) | DRAFT | Weapon families, mastery system, craftsmanship, binding |
| [Crafting, Economy, and Loot](systems/CRAFTING_ECONOMY_AND_LOOT.md) | DRAFT | Crafting disciplines, currencies, loot provenance, economic controls |
| [Equipment and Economy](systems/EQUIPMENT_AND_ECONOMY.md) | DRAFT | Armor, weapons, materials, currency |
| [Monster System](systems/MONSTER_SYSTEM.md) | DRAFT | Monster anatomy, AI, ranks, ecology |
| [Progression](systems/PROGRESSION.md) | DRAFT | Levels, XP, eras, gates, Legacy Reroll |
| [Legacy Reroll](systems/LEGACY_REROLL.md) | PROPOSED | Post-Level-100 Legacy Reroll system; reset/persist tables, Legacy points, Legacy era |

---

## Section 5: World

| Document | Status | Description |
|---|---|---|
| [World and Royal Dungeons](world/WORLD_AND_DUNGEONS.md) | DRAFT | World overview, Royal Dungeons |
| [World Regions](world/WORLD_REGIONS.md) | DRAFT | All PROPOSED world regions |
| [Secret Areas and Royal Dungeons](world/SECRET_AREAS_AND_ROYAL_DUNGEONS.md) | DRAFT | Secret area framework (public-safe) |
| [Royal Courts Public Catalog](world/ROYAL_COURTS_PUBLIC_CATALOG.md) | PROPOSED | Monster royalty public-facing catalog (four Royal Courts; no protected material) |

---

## Section 6: Multiplayer

| Document | Status | Description |
|---|---|---|
| [PvP and Arenas](multiplayer/PVP_AND_ARENAS.md) | DRAFT | PvP systems, arena types, rulesets |
| [PvP Foundations](multiplayer/PVP_FOUNDATIONS.md) | DRAFT | PvP normalization, ranked design |
| [Arenas and Matchmaking](multiplayer/ARENAS_AND_MATCHMAKING.md) | DRAFT | Arena configuration, matchmaking rules |
| [Shattercrown](multiplayer/SHATTERCROWN.md) | DRAFT | Open-PvP city design |
| [Weekly Events](multiplayer/WEEKLY_EVENTS.md) | PROPOSED | Weekly event rotation: three challenge tracks, rewards, PvP events |

---

## Section 7: UX

| Document | Status | Description |
|---|---|---|
| [UI, UX, and Accessibility](ux/UI_UX_AND_ACCESSIBILITY.md) | PROPOSED | HUD design, body integrity display, accessibility requirements (A-007) |

---

## Section 8: Audio

| Document | Status | Description |
|---|---|---|
| [Audio and Music](audio/AUDIO_AND_MUSIC.md) | PROPOSED | Audio design philosophy, GelFlow combat audio, adaptive music system |

---

## Section 9: Live Operations

| Document | Status | Description |
|---|---|---|
| [Live Operations and Monetization](liveops/LIVE_OPERATIONS_AND_MONETIZATION.md) | PROPOSED (monetization boundaries VERIFIED) | Live service design, monetization boundaries (DEC-005) |

---

## Section 10: Technical

| Document | Status | Description |
|---|---|---|
| [Architecture](technical/ARCHITECTURE.md) | DRAFT | All 21 system boundaries, data flow, authority model |
| [Data Contracts](technical/DATA_CONTRACTS.md) | DRAFT | Canonical schemas for all content types |
| [Networking, Replication, and Audit](technical/NETWORKING_REPLICATION_AND_AUDIT.md) | DRAFT | Network model, replication, audit, anti-cheat |
| [Content Authoring](technical/CONTENT_AUTHORING.md) | DRAFT | Authoring pipeline, schema-first approach |
| [Performance Budgets](technical/PERFORMANCE_BUDGETS.md) | DRAFT | Frame time budgets, hardware tiers (NOT PERFORMED) |

---

## Section 11: Production

| Document | Status | Description |
|---|---|---|
| [Vertical Slice](production/VERTICAL_SLICE.md) | DRAFT | Vertical slice spec, success criteria, system deps |
| [QA Strategy](production/QA_STRATEGY.md) | DRAFT | All test types, coverage targets, bug severity |
| [Risk Register](production/RISK_REGISTER.md) | DRAFT | 21 tracked risks with mitigations |
| [Engine Evaluation ADR](production/ENGINE_EVALUATION_ADR.md) | OPEN | Engine criteria, candidates, methodology |

---

## Root-Level Files

| File | Status | Description |
|---|---|---|
| [README.md](../README.md) | DRAFT | Project overview, navigation, spoiler policy |
| [ROADMAP.md](../ROADMAP.md) | DRAFT | Phase-by-phase development roadmap |
| [CHANGELOG.md](../CHANGELOG.md) | DRAFT | Keep-a-Changelog format change history |
| [CONTRIBUTING.md](../CONTRIBUTING.md) | DRAFT | Contribution guidelines |
| [AGENTS.md](../AGENTS.md) | DRAFT | AI coding agent guidelines |
| [SECURITY.md](../SECURITY.md) | DRAFT | Security disclosure policy |

---

## Glossary and Reference

| Document | Status | Description |
|---|---|---|
| [Glossary](glossary/GLOSSARY.md) | DRAFT | All GUMFALL terms, alphabetically organized |
| [Game Design Bible](GAME_DESIGN_BIBLE.md) | DRAFT | High-level authoritative design overview |

---

## Document Status Legend

| Status | Definition |
|---|---|
| VERIFIED | Confirmed design decision, protected by Design Authority |
| PROPOSED | Design intent, revisable during development |
| DRAFT | Document in active authoring — content may be incomplete |
| STUB | Placeholder — document has not been written yet |
| OPEN | A decision or record that is not yet resolved |

---

## Content Not Yet Documented (Known Gaps)

The following topics are known to need documentation but do not yet have documents:

- Detailed tutorial design.
- Shattercrown faction mechanics.
- Monster Knowledge system full specification.
- Full companion relationship system.
- Royal Court public catalog (partial — [Royal Courts Public Catalog](world/ROYAL_COURTS_PUBLIC_CATALOG.md)).
- Full audio mix and music system design.
- Full accessibility implementation specification (partial — [UI UX and Accessibility](ux/UI_UX_AND_ACCESSIBILITY.md)).

---

## Change Tracking

This index is maintained manually. When a new document is created:
1. Add it to the correct section with status and one-line description.
2. Update the "Content Not Yet Documented" section if the new document addresses a known gap.
3. Update the Quick-Start Guide if the new document is relevant to any of the four reader types.

---

*Last updated: 2026-08-03 | Branch: design/full-game-bible-20260802-223853*
