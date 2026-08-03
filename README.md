# GUMFALL: The Shattered Sweetlands

**A third-person physical action RPG where living gummy creatures fight, lose limbs, reattach them, and keep fighting.**

---

## Elevator Pitch

GUMFALL is a physical action RPG in which every combatant is a living gummy creature with a distinct body plan, composition, and set of regional integrity states. Attacks land on specific body regions. Armor covers specific regions. Losing an arm changes your available abilities — not your hit points. The simulation is authoritative. The presentation communicates the result. The gameplay is the physics.

---

## Current Phase

**Preproduction — Documentation First.**

No engine has been selected. No implementation has begun. The current priority is producing a reviewable vertical-slice specification and comprehensive design documentation before beginning production implementation.

See [ROADMAP.md](ROADMAP.md) for phase-by-phase planning.
See [docs/production/VERTICAL_SLICE.md](docs/production/VERTICAL_SLICE.md) for the vertical slice specification.
See [docs/production/ENGINE_EVALUATION_ADR.md](docs/production/ENGINE_EVALUATION_ADR.md) for the engine decision record (currently OPEN).

---

## What GUMFALL Is

- **Directional sword combat and weapon alignment** — attack angle, weapon material, and swing arc matter.
- **Localized gummy-body integrity and limb separation** — damage is tracked per body region, per armor piece.
- **Limb reattachment, regeneration, and prosthetics** — separated limbs can be retrieved and reattached mid-combat.
- **Arrow pinning (Pinshot class)** — projectiles embed in target body regions, restricting their movement.
- **Playable gummy lineages and specialized classes** — 12 lineages × 12 classes with composition and flavor affinity interactions.
- **Anatomy-driven monsters** — Sugar Wolves fight differently at broken-pack morale. Bronze Paw Captains command their units.
- **Material-based armor and weapon progression** — Bronze, then what comes after.
- **Natural enchantments and defensive Wards** — Overmatch, Malady types, Ward thresholds.
- **Competitive progression through Level 100** — Nine progression eras, ranked divisions mirroring them.
- **Concealed progression beyond Level 100** — architecture reserves it; exact conditions are never documented publicly.
- **Normalized and open-progression PvP** — structured arenas with full normalization, open arenas with scalar limits.
- **Secret areas, Royal Dungeons, and Royal Mazes** — discoverable through play, not documentation.
- **Weekly events and Monster Ascension tournaments** — community competition in an ongoing live environment.
- **Shattercrown open-PvP city** — opt-in open world danger with faction control.

---

## Design Pillars (Brief)

1. Immediate and responsive controls
2. Directional, physically readable combat
3. Localized body and armor damage
4. Anatomy-driven monster encounters
5. Source-grounded equipment and loot
6. Strong class and lineage identities
7. Discoverable secrets without arbitrary guessing
8. Competitive progression with bounded combat power
9. Fair structured PvP and dangerous opt-in open PvP
10. Long-term expansion through hidden world systems
11. Accessible without compromising depth
12. No pay-to-win, ever

---

## Documentation Navigation

### Start Here
- [Game Design Bible](docs/GAME_DESIGN_BIBLE.md) — authoritative design overview
- [docs/INDEX.md](docs/INDEX.md) — full organized document tree
- [Glossary](docs/glossary/GLOSSARY.md) — all GUMFALL terms

### Governance
- [Design Authority](docs/governance/DESIGN_AUTHORITY.md)
- [Decision Log](docs/governance/DECISION_LOG.md)
- [Public/Private Boundaries](docs/governance/PUBLIC_PRIVATE_BOUNDARIES.md)

### Systems
- [GelFlow Combat](docs/systems/GELFLOW_COMBAT.md)
- [Body Integrity](docs/systems/BODY_INTEGRITY.md)
- [Classes and Lineages](docs/game-design/CLASSES_AND_LINEAGES.md)
- [Progression](docs/systems/PROGRESSION.md)
- [Equipment and Economy](docs/systems/EQUIPMENT_AND_ECONOMY.md)
- [Monster System](docs/systems/MONSTER_SYSTEM.md)

### World
- [World and Royal Dungeons](docs/world/WORLD_AND_DUNGEONS.md)
- [World Regions](docs/world/WORLD_REGIONS.md)
- [Secret Areas](docs/world/SECRET_AREAS_AND_ROYAL_DUNGEONS.md)

### Multiplayer
- [PvP and Arenas](docs/multiplayer/PVP_AND_ARENAS.md)
- [Shattercrown](docs/multiplayer/SHATTERCROWN.md)
- [Arenas and Matchmaking](docs/multiplayer/ARENAS_AND_MATCHMAKING.md)

### Technical
- [Architecture](docs/technical/ARCHITECTURE.md) — all 21 system boundaries
- [Data Contracts](docs/technical/DATA_CONTRACTS.md) — canonical content schemas
- [Networking, Replication, and Audit](docs/technical/NETWORKING_REPLICATION_AND_AUDIT.md)
- [Content Authoring](docs/technical/CONTENT_AUTHORING.md)
- [Performance Budgets](docs/technical/PERFORMANCE_BUDGETS.md)

### Production
- [Vertical Slice Specification](docs/production/VERTICAL_SLICE.md)
- [QA Strategy](docs/production/QA_STRATEGY.md)
- [Risk Register](docs/production/RISK_REGISTER.md)
- [Engine Evaluation ADR](docs/production/ENGINE_EVALUATION_ADR.md)

### Project
- [ROADMAP.md](ROADMAP.md) — development phases
- [CHANGELOG.md](CHANGELOG.md) — change history
- [CONTRIBUTING.md](CONTRIBUTING.md) — contribution guidelines
- [AGENTS.md](AGENTS.md) — AI coding agent guidelines

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines.
See [AGENTS.md](AGENTS.md) for AI coding agent rules, authority labels, and do/don't list.

All contributors must read the [Public/Private Boundaries](docs/governance/PUBLIC_PRIVATE_BOUNDARIES.md) document before authoring content.

---

## Spoiler Policy

The following must **never** be committed to this public repository:

- Exact secret area entry conditions or maze solutions.
- Hidden level requirement thresholds or post-Level-100 exact conditions.
- Protected loot configurations or drop rate tables.
- Anti-cheat detection signatures or thresholds.
- Credentials, API keys, or private infrastructure details.
- Unreleased expansion content not yet publicly announced.

Private design material belongs in `design-private/` (git-ignored). See [Public/Private Boundaries](docs/governance/PUBLIC_PRIVATE_BOUNDARIES.md).

---

## Status Indicators (Conceptual — CI not live)

> CI/CD pipeline not yet established. NOT PERFORMED. The following are placeholders for when CI is active.

- Docs validation: planned
- Schema validation: planned
- Build: not started

---

## License

Copyright retained by Christopher Peterson. See [LICENSE](LICENSE).

---

*GUMFALL is currently in preproduction. No engine is selected. No gameplay has been implemented. All documentation reflects design intent.*
