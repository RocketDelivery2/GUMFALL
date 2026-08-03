# Public/Private Content Boundaries

> **Status:** VERIFIED structure | VERIFIED boundary categories | ASSUMPTION: enforcement tooling
> is sufficient without additional pre-commit hooks (see ASSUMPTION_REGISTER.md A-006).
> Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853

---

## Overview

GUMFALL is a game designed with deliberate secrets. Some design content is meant to be public
(discoverable by players through fair means), and some is meant to remain private (protected from
accidental or intentional disclosure). This document defines the precise boundary between public
and private material, where each type is stored, how the boundary is enforced, and provides
concrete examples of public vs. private treatment.

The core principle is: **players should be able to discover all secrets through fair gameplay
means**. Documentation must support that principle by providing public-facing information that
confirms something exists without revealing the solution.

---

## What Is Public

The following categories of content may appear in tracked repository files, public documentation,
and anywhere accessible to contributors and the public.

### Core Game Systems and Mechanics

- All 12 design pillars and their full descriptions.
- The GelFlow combat pipeline and its ordered simulation steps.
- Attack Energy formula: `Attack Energy = Base Force × Motion × Attribute × Ability Modifier`.
- All phase names and sequence (Preparation, Startup, Active, Recovery).
- All cancel categories (Movement, Attack, Defensive, Weapon, Ability, Emergency).
- All targeting modes (Free aim, Soft target, Hard target, Body-region lock point).
- Input buffer design values (Light attack 150ms, Heavy 180ms, Dodge 180ms, Parry 120ms,
  Weapon switch 200ms, Interaction 250ms). These are design targets, NOT PERFORMED validation.
- All damage channels and damage types.
- Body integrity per-region fields (Local Structure, Elasticity, Temperature, Stickiness,
  Crystallization, Embedded objects, Deformation, Connection strength, Armor coverage, Wards).
- The principle that gameplay is deterministic and visual effects never determine outcomes.

### Character Construction

- All 6 primary attributes (Might, Agility, Fortitude, Technique, Intellect, Spirit).
- All 6 derived statistics (Vitality, Structure, Stamina, Focus, Adhesion, Stability).
- All 12 lineages and their public descriptions.
- All 6 compositions and their public descriptions.
- All 9 flavor affinities and their public descriptions.
- All 10 backgrounds and their public descriptions.

### Classes and Specialties

- All 12 class names, identities, resources, and specialty path names.
- Class level structure (base 1-12, specialty from 3, advancement at 4 and 8,
  signature technique at 10, capstone at 12).
- All specialty names for each class.
- General descriptions of what each class does and how it plays.

### Equipment and Materials

- Full material band table (level 1-100 material tiers).
- All craftsmanship tiers.
- All armor slots, categories, and stat fields.
- All weapon families.
- All currency types (Tin Bit through Aetherium Prism, special currencies).

### Enchantments and Wards

- Natural weapon enchantment probabilities (0.7500% one, 0.0550% two, 0.0045% three,
  0.0005% Malady). These are VERIFIED design values.
- All rank multipliers (Standard ×1, Veteran ×1.5, Elite ×3, Champion ×6, Boss ×12, Mythic ×25).
- The four Malady types (Omnislayer, Ruin, Affliction, Finality) and their restrictions.
- The Overmatch formula and all buildup reduction bands.

### Monsters

- All monster families, roles, ranks, and intelligence tiers.
- Level band descriptions.
- General ecology and behavior descriptions.
- The principle that loot sources are grounded in monster biology and faction equipment.

### Progression

- Full XP formula for all level ranges (1-50, 51-70, 71-80, 81-90, 91-99).
- All era names and level ranges.
- The Level 50 practical build completion statement.
- The ~80% power by Level 50 statement.
- Legacy Reroll formula and XP reclaim multipliers.
- The fact that gates, proofs, and trials are required.
- The fact that repeat farming diminishes.
- The policy that no XP or levels may be purchased.

### Secret Areas — Public Treatment

- The existence of all secret tiers (Hidden Rooms, Deep Secrets, Royal Mazes, Mythic Sanctums,
  Unbound Secrets).
- The fact that major secrets require at least 3 independent clue paths.
- Crown Depth tier names (Surface, Deep, Crown, Forbidden).
- Royal Court names, their faction affiliations, and their ruler names.
- The principle of fair secrets with discoverable clues (Core Pillar 9).

### PvP

- All PvP rulesets and mode names.
- PROPOSED PvP baseline scalars (marked PROPOSED).
- All ranked division names and level ranges.

### Shattercrown and Arenas

- District names, system names, and mode names.
- Arena names and mode names.
- Monster Ascension Tournament Crown Score formula and ranking criteria.

### Post-Level-100 — Public Treatment

- The statement that Level 100 is the official public cap.
- The statement that some clues suggest more exists.
- The statement that the architecture reserves future progression.

### Monetization

- Full monetization policy (what is and is not sold).
- The confirmed no-pay-to-win commitment.

---

## What Is Private

The following categories of content must **never** appear in tracked repository files, public
documentation, issue comments, PR descriptions, or any publicly accessible location.

### Exact Secret Solutions

- Step-by-step traversal sequences for any Royal Court or Royal Maze.
- Exact activation sequences, item combinations, or NPC dialogue choices that unlock secret areas.
- Exact puzzle solutions for Deep Secrets or Mythic Sanctums.
- Exact solutions for Unbound Secrets.

### Hidden Level Thresholds and Post-Cap Conditions

- Exact conditions for the First Unbinding or any post-Level-100 content unlock.
- Exact XP thresholds, item requirements, or behavioral triggers for hidden progression.
- Any specific numeric gate values for content that is publicly acknowledged to exist but
  deliberately concealed.

### Anti-Cheat and Audit Material

- Detection heuristics and behavioral signatures used in the audit/anti-cheat system.
- Audit event schemas that reveal detection logic.
- Any information that would allow a bad actor to evade detection.

### Protected Loot Configurations

- Exact drop weight values for items in protected loot tables.
- Seed values, RNG configurations, or table structure for protected drops.
- Exact probability values for Mythic, Legendary, or unique item drops where the exact numbers
  are a deliberate design secret.

### Credentials and Secrets

- API keys, tokens, passwords, connection strings, or any credential.
- Signing keys, certificate material, or encryption keys.
- Internal service URLs or endpoint configurations.

---

## Where Private Material Lives

Private material is stored exclusively in `design-private/` at the repository root.

```
design-private/       ← Git-ignored. Never tracked. Never linked from public docs.
├── mazes/            ← Exact Royal Maze solutions and traversal maps
├── thresholds/       ← Hidden level and unlock threshold values
├── anticheat/        ← Anti-cheat signatures and detection logic
├── loot-configs/     ← Protected drop rate configurations
└── credentials/      ← Credentials (should also use a secrets manager)
```

**`design-private/` is listed in `.gitignore`** and must never be committed or tracked.

**`.gitattributes`** marks `design-private/**` as `export-ignore` as a second layer of
protection against accidental archival.

---

## Enforcement

### Automated (tools/Validate-Docs.ps1)

The validation script checks:
- No files under `design-private/` are tracked by git (`git ls-files design-private/`).
- No tracked Markdown files link to paths under `design-private/`.
- All tracked JSON files parse without error.
- No merge conflict markers are present.
- Required canonical documents exist.
- No empty or whitespace-only Markdown files.

Running `pwsh tools/Validate-Docs.ps1` is required before any PR is merged. The GitHub Actions
workflow [docs-validation.yml](../../.github/workflows/docs-validation.yml) runs this check
automatically on push and PR events.

### Human Review

The [PR checklist](../../.github/PULL_REQUEST_TEMPLATE.md) includes explicit items:
- Confirm no exact maze solutions are present.
- Confirm no hidden post-Level-100 conditions are present.
- Confirm no anti-cheat signatures are present.
- Confirm no protected drop rate configurations are present.
- Confirm no credentials are present.

The Design Authority (@RocketDelivery2) reviews all PRs before merge.

---

## Examples of Public vs. Private Treatment

### Secret Areas

| Topic | Public Treatment (OK) | Private Treatment (Required) |
|---|---|---|
| Cindercoil Warrens entrance | "The Cindercoil Warrens are home to the kobold court of King Skritch VII. Clues to its entrance are hidden across three independent paths in the surrounding zones." | "Turn left at the third stalagmite, use the Ember Key on the north wall, wait for the second bell toll." |
| Royal Maze navigation | "Royal Mazes are the most complex secret structures in the game. Discovery requires patience and multiple clue sources." | Exact map, step sequence, trap locations. |

### Post-Level-100

| Topic | Public Treatment (OK) | Private Treatment (Required) |
|---|---|---|
| Cap and beyond | "Level 100 is the official public cap. Some evidence suggests the architecture supports further progression. Details, if any, are discoverable in-game." | "To unlock the First Unbinding, reach Level 100 and [exact conditions]." |

### Loot Drop Rates

| Topic | Public Treatment (OK) | Private Treatment (Required) |
|---|---|---|
| Enchantment probabilities | "Natural weapon enchantment probability: 0.7500% for one enchantment. Rank multipliers apply." (VERIFIED) | Internal table seed values, exact Mythic drop weight for protected items. |
| Monster loot | "Sugar Wolves drop wolf-material crafting components and occasionally Sugar Guard loot based on their ecology." | Exact numeric weights in the protected loot table. |

### Anti-Cheat

| Topic | Public Treatment (OK) | Private Treatment (Required) |
|---|---|---|
| Existence of anti-cheat | "GUMFALL includes an audit and anti-cheat system as a required technical architecture boundary." | Detection heuristics, behavioral signatures, flagging thresholds. |

---

## Related Documents

- [AGENTS.md](../../AGENTS.md) — Agent guidelines and do/don't rules
- [DESIGN_AUTHORITY.md](DESIGN_AUTHORITY.md) — Authority structure and hierarchy
- [DECISION_LOG.md](DECISION_LOG.md) — Accepted decisions including post-Level-100 concealment
- [ASSUMPTION_REGISTER.md](ASSUMPTION_REGISTER.md) — Enforcement assumptions
- [tools/Validate-Docs.ps1](../../tools/Validate-Docs.ps1) — Automated enforcement script
- [.github/workflows/docs-validation.yml](../../.github/workflows/docs-validation.yml) — CI check
