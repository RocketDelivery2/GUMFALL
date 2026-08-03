# Legacy Reroll

> **Status:** PROPOSED — System design targets. Exact conditions, thresholds, and
> post-cap mechanics are design-private material per DEC-006.
> Last updated: 2026-08-03 | Authority: [DESIGN_AUTHORITY.md](../governance/DESIGN_AUTHORITY.md)

---

## Overview

The Legacy Reroll system is GUMFALL's post-Level-100 progression layer. It allows characters
who have reached the public level cap to reset portions of their progression in exchange for
Legacy points — a persistent currency that carries across resets and provides permanent
minor bonuses and cosmetic unlocks.

Legacy Reroll is designed to support Core Pillar 10 (competitive progression without
unlimited vertical power). Legacy points provide breadth and identity, not unbounded
power escalation.

**What is protected private material:**
- Exact Legacy point thresholds for each bonus tier
- Exact post-Level-100 unlock conditions (see DEC-006)
- Legacy Vault item configurations
- The First Unbinding mechanics

---

## 1. System Purpose

Players reach Level 100 with a full character — their specialty selected, their skills
developed, their equipment earned. Legacy Reroll answers the question: what comes next?

Legacy Reroll does not restart from zero. It resets **current-era growth** while preserving:
- Earned equipment (moved to Legacy Vault)
- Monster Knowledge
- Social relationships (guild, companion bonds)
- Cosmetic unlocks
- Legacy points themselves

The character re-enters the Foundation era (Levels 1–12) of their class as a modified
version of that class, shaped by Legacy effects. They are stronger in subtle ways — not
because Legacy inflates stats, but because Legacy unlocks techniques and adjustments that
were not available on a first playthrough.

---

## 2. What Resets (PROPOSED)

| Component | Reset Behavior |
|---|---|
| Current character level | Resets to Level 1 of current class |
| Level features | Resets; re-earned as character levels again |
| Specialty progression | Resets; specialty re-selected at Level 3 |
| Ordinary attribute growth | Resets; rebuilt through leveling |
| High-level mastery unlocks | Resets |
| Proficiency rank | Resets to entry level |
| PvP ladder position | Resets to placement bracket |

---

## 3. What Persists (PROPOSED)

| Component | Persistence Behavior |
|---|---|
| Legacy points | Accumulate permanently; never reset |
| Legacy Vault equipment | Stored; recoverable at appropriate level threshold |
| Monster Knowledge | Fully retained |
| Cosmetic unlocks | Fully retained |
| Guild and social data | Fully retained |
| Completed quest flags | Fully retained (quest re-entry rules: OPEN) |
| Achievement flags | Fully retained |

---

## 4. Legacy Points

Legacy points are earned through the Legacy Reroll process — at the moment of reset and
through certain Legacy-era milestones. They are never sold (DEC-005).

Legacy points unlock:
- **Legacy talents:** Minor permanent character modifications (breadth of knowledge,
  new utility options, cosmetic variations on existing abilities). NOT a vertical power
  increase; lateral character expression.
- **Legacy cosmetics:** Visual options available only to characters who have completed
  at least one Legacy Reroll.
- **Legacy Vault capacity:** Additional storage for equipment carried across rerolls.

**UNKNOWN:** Exact Legacy talent tree structure. The Design Authority must finalize the
Legacy talent categories before the Legacy system can be fully specified.

---

## 5. Legacy Era Progression

After a Legacy Reroll, the character progresses through the Foundation era again but with
Legacy-specific modifications:

- Enemies acknowledge the character's prior experience through adjusted dialogue and behavior
  (lore layer, not mechanical adjustment)
- Some NPCs have Legacy-specific interaction options available
- Certain secrets that were un-findable on a first playthrough become discoverable through
  Legacy-specific observation skills

This supports Core Pillar 9 (fair secrets with discoverable clues) — some secrets require
the perspective that only a Legacy character has earned.

---

## 6. Multiclass and Legacy Interaction (OPEN)

**UNKNOWN.** How Legacy Reroll interacts with multiclassing (available after Level 4) has
not been finalized. Options under consideration:

1. Legacy Reroll resets only the primary class; secondary class progress partially persists
2. Legacy Reroll resets all class progress including multiclass levels
3. Legacy Reroll has a mode selection: single-class reset or full reset with bonus Legacy points

Design Authority decision required before this can be specified.

---

## 7. PvP and Legacy (VERIFIED — DEC-005 Extension)

Legacy progression must not create a pay-to-win or grind-to-win condition in ranked PvP.
Ranked PvP normalization (see [PvP Foundations](../multiplayer/PVP_FOUNDATIONS.md)) equalizes
characters to a balanced baseline. Legacy talents are **disabled or normalized** in ranked play
— Legacy points do not create a ranked advantage.

---

## Related Documents

- [Progression](PROGRESSION.md) — Level structure, eras, and XP system
- [PvP Foundations](../multiplayer/PVP_FOUNDATIONS.md) — Ranked normalization rules
- [PUBLIC_PRIVATE_BOUNDARIES.md](../governance/PUBLIC_PRIVATE_BOUNDARIES.md) — What post-cap content is protected
- [DECISION_LOG.md](../governance/DECISION_LOG.md) — DEC-004 (Level 100 cap), DEC-005 (monetization), DEC-006 (post-cap concealment)
- [ASSUMPTION_REGISTER.md](../governance/ASSUMPTION_REGISTER.md) — A-009 (player data persistence)
- [AGENTS.md](../../AGENTS.md) — Authority labels
