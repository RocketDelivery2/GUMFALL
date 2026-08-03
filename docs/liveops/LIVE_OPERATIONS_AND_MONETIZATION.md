# Live Operations and Monetization

> **Status:** PROPOSED — Live operations cadence and event structures are design targets.
> Monetization boundaries are VERIFIED per DEC-005.
> Last updated: 2026-08-03 | Authority: [DESIGN_AUTHORITY.md](../governance/DESIGN_AUTHORITY.md)

---

## Overview

This document describes GUMFALL's live operations (live service) model and the monetization
policy that governs it. The monetization policy is **VERIFIED** per
[DEC-005](../governance/DECISION_LOG.md): GUMFALL will never sell competitive advantage.
Permitted monetization is limited to cosmetics, expansions, and transparent supporter packs.

Live operations content — seasonal events, weekly challenges, rotating world activities — must
be designed so that all gameplay-relevant rewards are earnable through play, not purchase.

---

## 1. Monetization Policy (VERIFIED — DEC-005)

The following will **never** be sold:

- Experience points or experience multipliers
- Character levels or level advancement
- Legacy points
- Proof completion or bypass
- Trial completion or bypass
- Best-in-slot power items or stat advantages
- Malady enchantments
- Ranked PvP advantages of any kind
- Hidden level or post-cap content access
- Legacy Reroll charges (if Legacy Reroll is a time-limited mechanic — OPEN)

The following are **permitted**:

| Item Type | Notes |
|---|---|
| Cosmetic armor and weapon skins | Must not resemble misleading meta-critical items |
| Emotes and animations | Non-combat only |
| Housing cosmetics | Decorative only |
| Mount appearances | Visual only; no mounted-combat advantage |
| Non-competitive visual effects | Must not obscure gameplay-critical information |
| Content expansions | New zones, quests, story — all earn-able rewards included |
| Transparent supporter packs | Cosmetics only; clearly labeled as such |

**Design constraint:** Cosmetic items must be visually distinguishable from gameplay-critical
information. A cosmetic skin that obscures armor coverage or makes body regions harder to read
is not acceptable regardless of its price.

---

## 2. Live Operations Philosophy

**PROPOSED.** The live operations model is designed around two principles:

1. **Predictable cadence:** Players can plan their play around a known schedule.
2. **Catch-up access:** Players who miss a live event can earn a non-cosmetic equivalent
   through standard gameplay. Exclusive cosmetics from live events may remain exclusive
   (OPEN decision — Design Authority approval required).

Live operations content must not require real-money purchase to participate in or complete.
Event rewards may include cosmetics that can also be purchased in the shop, but the gameplay
path to earn them must be accessible to any player at the appropriate level range.

---

## 3. Event Cadence (PROPOSED)

| Cadence | Content Type | Duration |
|---|---|---|
| Weekly | Weekly Challenge Rotation | 7 days |
| Monthly | Featured Event (themed challenge series) | ~30 days |
| Seasonal | Seasonal Campaign (world-state changes, new content) | ~90 days |
| Annual | Anniversary Event | 2 weeks |

### 3.1 Weekly Challenges

Weekly challenges are short-form objectives designed to reward diverse play styles. See
[Weekly Events](../multiplayer/WEEKLY_EVENTS.md) for the full specification.

### 3.2 Monthly Featured Events

Monthly events introduce a themed narrative frame around a set of challenges. Rewards are
primarily cosmetic but may include consumable items or limited-use content access
(not permanent power advantage).

**Examples (PROPOSED, not content-final):**

- *The Caramel Run* — speed-challenge event series in Caravan Quarter
- *Amber Frost* — cold-type themed challenges in Sugarspire Mountains zone
- *Pack Hunt* — cooperative challenge series against Sugar Wolf packs

### 3.3 Seasonal Campaigns

Seasonal campaigns introduce meaningful world-state changes. For example:
- A faction gains or loses territory in a region
- A new monster variant appears for the season
- A seasonal crafting recipe becomes available

Seasonal campaigns have a narrative through-line. Rewards include themed cosmetics and
narrative-tied items. Content unlocked during a season rolls into the permanent content
pool with a delay (OPEN: exact delay TBD by Design Authority).

### 3.4 Annual Anniversary Event

The anniversary event acknowledges the game's launch date and provides a curated set of
challenges reviewing the year's content. Anniversary cosmetics are exclusive and clearly
marked as such. Anniversary challenges must be completable by players who started within
the prior 3 months.

---

## 4. Shop Design (PROPOSED)

### 4.1 Shop Structure

- **Rotating featured items:** 2–4 items rotate on a weekly cadence.
- **Permanent catalog:** Cosmetics from past seasons available for purchase permanently
  (no artificial scarcity on cosmetics — OPEN decision, requires Design Authority sign-off).
- **Expansion store:** Content expansions listed and purchasable directly.

### 4.2 Pricing Philosophy

**ASSUMPTION:** Cosmetic items will be priced at market-comparable rates for similar
action RPG titles. No specific prices are set in this document (UNKNOWN: final pricing
is a business decision requiring external market research — NOT PERFORMED).

### 4.3 Bundle Policy

Bundles are permitted if:
- The bundle value is clear and transparent
- No bundle includes gameplay-advantage items
- Bundles do not pressure players through artificial urgency (countdown timers on
  non-exclusive items are prohibited)

---

## 5. Seasonal Server Events (Shattercrown Integration)

During seasonal campaigns, Shattercrown may enter special event states:
- Modified faction balance
- Temporary special zone rules
- Seasonal boss in contested territory

These events are announced on the public roadmap with sufficient advance notice for players
to prepare. See [Shattercrown](../multiplayer/SHATTERCROWN.md) for Shattercrown-specific rules.

---

## 6. Content Sunset Policy (OPEN)

**UNKNOWN.** Whether seasonal content will be sunsetted (removed permanently) or archived
(accessible via permanent catalog) has not been decided. The Design Authority must make
this decision before live service begins. Options:

- Full archive: all seasonal content becomes permanently available after the season ends
- Exclusive cosmetics: cosmetics remain exclusive; gameplay content is archived
- Rotating vault: older content rotates back into availability periodically

**Constraint:** Any sunset policy must not remove earn-able gameplay-relevant rewards that
were promised as permanent unlocks.

---

## 7. Anti-Predatory-Design Commitments (VERIFIED — DEC-005 Extension)

The following mechanics are explicitly prohibited:

- Loot boxes or gacha mechanics of any kind
- Pay-to-win in any mode including PvE
- Subscription gating of core gameplay features
- Pay-walled competitive ranked access
- Psychological manipulation mechanics (artificial scarcity on power items, urgency
  timers designed to drive impulsive purchase)

These commitments are permanent and require Design Authority approval to revisit.

---

## Related Documents

- [DECISION_LOG.md](../governance/DECISION_LOG.md) — DEC-005 (monetization policy)
- [Weekly Events](../multiplayer/WEEKLY_EVENTS.md) — Weekly event rotation specification
- [Shattercrown](../multiplayer/SHATTERCROWN.md) — Shattercrown integration
- [ASSUMPTION_REGISTER.md](../governance/ASSUMPTION_REGISTER.md) — A-002 (player count), A-003 (session length)
- [AGENTS.md](../../AGENTS.md) — Authority labels and design rules
