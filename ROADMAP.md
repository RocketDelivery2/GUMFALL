# GUMFALL Roadmap

**Status:** DRAFT — All phase estimates are design targets. No implementation has begun. NOT PERFORMED.
**Related:** [Vertical Slice](docs/production/VERTICAL_SLICE.md) · [Risk Register](docs/production/RISK_REGISTER.md) · [Engine Evaluation ADR](docs/production/ENGINE_EVALUATION_ADR.md)

---

## Phase 0 — Repository and Design Governance (Current)

**Objective:** Establish the design documentation foundation before any implementation begins.

**Deliverables:**
- [x] Game Design Bible (comprehensive)
- [x] Technical Architecture (all 21 system boundaries)
- [x] Data Contracts (all content type schemas)
- [x] Networking, Replication, and Audit specification
- [x] Content Authoring pipeline specification
- [x] Performance Budgets (design targets)
- [x] Vertical Slice specification
- [x] QA Strategy
- [x] Risk Register
- [x] Engine Evaluation ADR (OPEN — evaluation pending)
- [x] Master Index
- [x] Comprehensive Glossary
- [x] JSON schemas for core content types
- [x] Example content files
- [x] Governance documents (Design Authority, Decision Log, Assumption Register, Public/Private Boundaries)
- [ ] Engine Evaluation ADR resolved (blocked on evaluation)

**Success criteria:** A new contributor can read the documentation and understand the system design well enough to implement a specific boundary.

**Dependencies:** None — this is the foundation.

---

## Phase 1 — Engine Evaluation and Technical Prototype

**Objective:** Select the engine and prove the four non-negotiable technical requirements.

**Deliverables:**
- [ ] Engine Evaluation ADR resolved (engine selected)
- [ ] Determinism proof of concept: fixed-tick loop produces bit-identical output
- [ ] Body Integrity simulation budget test: 32 entities × 8 regions within 2ms/tick
- [ ] Procedural mesh deformation prototype: single gummy character with limb separation
- [ ] Server-authoritative networking prototype: 2-player input/state model at 60ms latency
- [ ] Content authoring tooling selected (or manual authoring process established)

**Success criteria:** Engine is selected. All four prototype success criteria pass (see [ENGINE_EVALUATION_ADR](docs/production/ENGINE_EVALUATION_ADR.md)).

**Dependencies:** Phase 0 complete (design documentation gives prototypes clear targets).

---

## Phase 2 — Combat Prototype (Character Motor, GelFlow, Body Integrity)

**Objective:** Playable Edgebearer combat with Body Integrity in a test environment.

**Deliverables:**
- [ ] Character Motor: full movement, dodge, guard
- [ ] Ability Graph: Edgebearer directional slash and parry
- [ ] Hit Resolver: server-authoritative contact resolution
- [ ] Armor Resolver: Bronze material matrix (9 damage types)
- [ ] Body Integrity: Bearkin anatomy (6 regions), separation, reattachment
- [ ] Reaction System: flinch, stagger, limb-loss stagger
- [ ] Basic simulation audit log
- [ ] Pinshot ability set: standard shot and pinning shot
- [ ] Arrow pinning status: embed, movement restriction, removal

**Success criteria:** Edgebearer can fight in a test scene. Arm separates when integrity drops to threshold. Reattachment restores the region. Pinshot arrow visibly embeds and restricts enemy movement.

**Dependencies:** Phase 1 complete (engine selected, determinism proven).

---

## Phase 3 — Vertical Slice

**Objective:** Deliver the complete vertical slice per the [Vertical Slice specification](docs/production/VERTICAL_SLICE.md).

**Deliverables:**
- [ ] All Phase 2 deliverables integrated
- [ ] Monster AI: Sugar Wolf, Sour Slime, Bronze Paw Grunt, Shieldbearer, Archer, Captain
- [ ] Level 1–3 encounters: camp area, Sugar Well
- [ ] Basic loot table with Provenance records
- [ ] Bronze Paw Orchard Ring arena: 1v1 match completes with outcome
- [ ] 2-player replication: co-op or 1v1 duel
- [ ] All slice content passes schema validation
- [ ] All 12 vertical slice success criteria verified by QA

**Success criteria:** All 12 success criteria in [VERTICAL_SLICE.md](docs/production/VERTICAL_SLICE.md) verified by a tester.

**Dependencies:** Phase 2 complete.

---

## Phase 4 — RPG Systems (Full Class/Lineage/Progression)

**Objective:** Implement the full RPG layer beyond the vertical slice.

**Deliverables:**
- [ ] All 12 classes: abilities, specialties, fallback systems
- [ ] All 12 lineages: anatomies, compositions, flavor affinities
- [ ] Full equipment material roster
- [ ] Crafting system
- [ ] Monster Knowledge system
- [ ] Quest progression framework
- [ ] Companion system
- [ ] Full faction system with standing scales
- [ ] Level 1–50 content: trials, gates, encounters
- [ ] Status/Enchantment full implementation (all 6 categories, all 4 Malady types)
- [ ] Ward system full implementation

**Success criteria:** A character can progress from Level 1 through Level 50 across all class/lineage combinations.

**Dependencies:** Phase 3 complete.

---

## Phase 5 — Content Foundation (Regions, Monsters, Loot Ecology)

**Objective:** Populate the game world with its first major content set.

**Deliverables:**
- [ ] Fractured Flats region: full encounter set, loot ecology
- [ ] Sourswamp Delta region: Sour-composition enemy types
- [ ] Crystalline Highlands region: Crystal-composition enemy types
- [ ] Monster roster expansion: 20+ species covering all composition types
- [ ] Full economy tuning across Levels 1–50
- [ ] Currency sink system
- [ ] Progression to Level 70

**Success criteria:** A player can reach Level 70 through world content without grinding a single encounter type.

**Dependencies:** Phase 4 complete.

---

## Phase 6 — Multiplayer Foundation

**Objective:** Deliver full server-authoritative multiplayer with ranked PvP.

**Deliverables:**
- [ ] Full server-authoritative combat under real network conditions
- [ ] 2v2 and 4-player arena formats
- [ ] Ranked matchmaking (Copper through Heroic divisions)
- [ ] PvP normalization system (full scalar application)
- [ ] Tournament system (single elimination)
- [ ] Anti-cheat system (full implementation, thresholds in private pipeline)
- [ ] Exploit quarantine system
- [ ] Progression audit system

**Success criteria:** A ranked match completes with a verified server-authoritative outcome. Audit log captures all events.

**Dependencies:** Phase 3 complete (2-player baseline); Phase 4 (progression for ranked brackets).

---

## Phase 7 — Secret Areas and Royal Dungeons

**Objective:** Implement the discoverable secret layer of the world.

**Deliverables:**
- [ ] Secret area framework: discoverable entry conditions (private pipeline)
- [ ] Royal Dungeon navigation: Royal Mazes (solutions in private pipeline)
- [ ] Royal Court encounters: Royal and Boss rank monsters
- [ ] Monster Ascension tournament system
- [ ] Level 71–100 progression content

**Success criteria:** A Royal Dungeon can be discovered by a player using in-world clues. A Royal Court encounter can be completed. No secret entry conditions appear in public files. VERIFIED.

**Dependencies:** Phase 5 (world content foundation), Phase 6 (multiplayer for Monster Ascension).

---

## Phase 8 — Full-Progression PvP and Shattercrown

**Objective:** Deliver complete competitive PvP ecosystem.

**Deliverables:**
- [ ] Full ranked brackets: Copper through Apex (Level 10–100)
- [ ] Legendary, Mythic, Apex division-specific tournament formats
- [ ] Shattercrown open-PvP city implementation
- [ ] Weekly event rotation system
- [ ] Leaderboard system
- [ ] Legacy Reroll system
- [ ] Protected post-Level-100 framework (architecture, not content — content in private pipeline)

**Success criteria:** A Level 100 character can participate in ranked Apex division. Shattercrown is contestable. Weekly events run on schedule.

**Dependencies:** Phase 6 (multiplayer), Phase 7 (Level 100 content).

---

## Phase 9 — Accessibility and QA Pass

**Objective:** Ensure all accessibility requirements are implemented and all QA targets are met.

**Deliverables:**
- [ ] Full input remapping
- [ ] Hold/toggle for all held inputs
- [ ] Timing assists (extended parry/dodge window options)
- [ ] Reduced camera motion mode
- [ ] Color-independent status display for all conditions
- [ ] Scalable UI at min and max settings
- [ ] Full subtitle/caption coverage for all voiced content
- [ ] Aim assist system
- [ ] Reduced body-separation presentation mode
- [ ] Photosensitivity controls
- [ ] Cognitive-load reduction option
- [ ] All QA strategy test types executed (see [QA_STRATEGY](docs/production/QA_STRATEGY.md))
- [ ] All Critical and High severity defects resolved

**Success criteria:** All 11 accessibility options produce verifiable behavioral differences. All QA strategy test categories pass. No Critical defects open at milestone.

**Dependencies:** Phase 8 (all gameplay systems implemented).

---

## Phase 10 — Live Operations Infrastructure

**Objective:** Establish the live service foundation for post-launch operation.

**Deliverables:**
- [ ] Live event tooling (schedule, activate, deactivate events without build deployment)
- [ ] Monetization integration: cosmetics, emotes, supporter packs (no combat stats)
- [ ] Analytics pipeline (privacy-compliant, aggregated only)
- [ ] Cloud save sync and migration system
- [ ] User rights implementation: request, export, delete
- [ ] Leaderboard and ranking history archive
- [ ] Support tooling for anti-cheat appeals
- [ ] Legal compliance review completed

**Success criteria:** A live event can be scheduled and activated without a code deployment. User data rights requests can be fulfilled.

**Dependencies:** Phase 9 complete.

---

## Status Summary

| Phase | Status | Dependency |
|---|---|---|
| Phase 0 — Governance | **In Progress** | None |
| Phase 1 — Engine Prototype | Not started | Phase 0 |
| Phase 2 — Combat Prototype | Not started | Phase 1 |
| Phase 3 — Vertical Slice | Not started | Phase 2 |
| Phase 4 — RPG Systems | Not started | Phase 3 |
| Phase 5 — Content Foundation | Not started | Phase 4 |
| Phase 6 — Multiplayer Foundation | Not started | Phase 3 |
| Phase 7 — Secret Areas | Not started | Phase 5, 6 |
| Phase 8 — Full PvP | Not started | Phase 6, 7 |
| Phase 9 — Accessibility and QA | Not started | Phase 8 |
| Phase 10 — Live Operations | Not started | Phase 9 |

---

*All timelines are NOT PERFORMED — no schedule has been established. Phase order is a design target, not a committed plan.*
*See [RISK_REGISTER](docs/production/RISK_REGISTER.md) for risks affecting this roadmap.*
