# Weekly Events

> **Status:** PROPOSED — Weekly event rotation design targets. Individual event reward values
> and scheduling details are not finalized.
> Last updated: 2026-08-03 | Authority: [DESIGN_AUTHORITY.md](../governance/DESIGN_AUTHORITY.md)

---

## Overview

Weekly events are the primary short-cadence live-operations content in GUMFALL. They run
on a 7-day cycle and provide:
- Structured objectives that reward diverse play styles
- Earn-able rewards accessible to all players without purchase
- A reason to return across the week rather than requiring a single long session

All weekly event rewards are earnable through gameplay. Cosmetic rewards from events may
also be available through the shop, but the earn path must always be accessible.

See [Live Operations and Monetization](../liveops/LIVE_OPERATIONS_AND_MONETIZATION.md)
for the full live-ops cadence (weekly, monthly, seasonal, annual).

---

## 1. Weekly Event Structure

### 1.1 Challenge Rotation

Each week offers **three concurrent challenge tracks** (PROPOSED):

| Track | Focus | Target Audience |
|---|---|---|
| **Combat Track** | GelFlow combat objectives | Players who prioritize combat engagement |
| **Exploration Track** | World traversal, discovery, and environmental objectives | Players who prefer exploration-paced play |
| **Crafting and Economy Track** | Crafting, trading, and economy objectives | Players engaged with the economy system |

Players may complete any, some, or all tracks in a week. Each track has 3 challenges of
graduated difficulty (entry, intermediate, advanced). Completing more challenges in a track
earns more rewards within that track's reward pool.

### 1.2 Challenge Refresh

All weekly challenges refresh at the same time each week (server-local fixed time, announced
on the public roadmap). Challenges not completed in the current week do not carry over —
they are replaced by the next rotation.

**Partial completions do not persist** (PROPOSED; OPEN for Design Authority review: whether
partial progress on a challenge persists or resets at refresh is not finalized).

### 1.3 Catch-Up Access

If a player misses a week, they receive no retroactive access to that week's challenges.
However, gameplay-relevant rewards from weekly events (consumables, crafting materials,
minor cosmetic rewards) are available through permanent gameplay paths at a slower rate.
Exclusive cosmetics from special-event weeks may remain exclusive (OPEN).

---

## 2. Combat Track Challenges (PROPOSED Examples)

**Entry-level examples:**
- Complete 5 encounters in a specified zone
- Land 10 successful parries against humanoid enemies
- Defeat 3 enemies using only a specific damage type

**Intermediate examples:**
- Complete an encounter without any body region reaching warning state
- Defeat a Standard-rank monster with a specific specialty-active technique
- Win a PvP skirmish against another player (Shattercrown or training arena)

**Advanced examples:**
- Complete a Royal Court outer zone encounter without using a camp
- Defeat an Elite-rank enemy captain within a time window
- Complete an encounter while a body region is separated

---

## 3. Exploration Track Challenges (PROPOSED Examples)

**Entry-level examples:**
- Visit 3 named locations within a region
- Interact with 5 environmental objects (Sugar Wells, merchant stalls, notice boards)
- Collect materials from 2 different biomes

**Intermediate examples:**
- Find and enter a secret area (any discoverable secret area qualifies)
- Complete a traversal route from one named location to another within a time limit
- Identify and follow a trail to a monster lair

**Advanced examples:**
- Discover a named hidden chamber (any qualifying hidden chamber — does not reveal specific locations)
- Complete a full zone circuit without returning to camp
- Obtain a material from a high-risk environmental zone

---

## 4. Crafting and Economy Track Challenges (PROPOSED Examples)

**Entry-level examples:**
- Craft an item of any type using the crafting system
- Visit a specific merchant faction location
- Sell or trade items through the economy system

**Intermediate examples:**
- Craft an item at Tempered craftsmanship or above
- Apply an enchantment to a weapon or armor piece
- Complete a recipe that requires components from at least 2 different sources

**Advanced examples:**
- Craft a Masterwork-tier item
- Obtain a rare material through a crafting discipline (not just found as a drop)
- Produce a batch of consumables sufficient for a Royal Court attempt

---

## 5. Weekly Event Rewards

**PROPOSED reward structure:**

| Completion Level | Reward Type |
|---|---|
| Any single challenge (entry) | Small consumable pack, minor crafting material |
| Full track (3 challenges) | Track-specific material bundle, cosmetic point award |
| Two full tracks | Additional material bundle, minor cosmetic unlock |
| All three tracks | Full weekly cosmetic reward (cosmetic item or cosmetic point award), title candidate |
| Advanced challenge (any track) | Bonus material drop, small Proof fragment (PROPOSED; not finalized) |

All rewards are tradeable or account-bound depending on type. Power-relevant rewards
(Proof fragments, crafting materials) are account-bound. Cosmetics are account-bound.

**No weekly challenge reward may be a direct stat increase, level gain, or Legacy point award.**
This is required by DEC-005.

---

## 6. Special Weekly Events

Approximately once per month, a **Featured Weekly Event** replaces or supplements the
standard rotation. Featured events:
- Have a narrative frame tied to the current monthly event
- Offer a featured cosmetic reward unique to the event week
- Use the same challenge structure but with thematically appropriate objectives

Featured events are announced in advance on the public roadmap.

---

## 7. PvP Weekly Events

Some weeks include PvP-specific challenges as part of the Combat Track or as a featured event:

- Ranked match completion (any result counts for challenge entry progress)
- Shattercrown objective participation
- Training arena challenge (structured duel objective)

**PvP weekly events must not require wins to complete entry-level challenges.** Entry and
intermediate PvP challenges progress through participation, not victory, to avoid creating
a barrier for new or developing PvP players.

Advanced PvP challenges may require wins or specific performance thresholds.

---

## Related Documents

- [Live Operations and Monetization](../liveops/LIVE_OPERATIONS_AND_MONETIZATION.md) — Full live-ops cadence and monetization policy
- [PvP and Arenas](PVP_AND_ARENAS.md) — PvP systems referenced by Combat Track
- [Shattercrown](SHATTERCROWN.md) — Shattercrown event integration
- [Crafting, Economy, and Loot](../systems/CRAFTING_ECONOMY_AND_LOOT.md) — Crafting system for Crafting Track
- [DECISION_LOG.md](../governance/DECISION_LOG.md) — DEC-005 (monetization policy)
- [AGENTS.md](../../AGENTS.md) — Authority labels
