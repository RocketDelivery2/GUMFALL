# GUMFALL — Content Authoring

**Status:** DRAFT — Tooling not selected
**Label Policy:** VERIFIED | DERIVED | PROPOSED | ASSUMPTION | UNKNOWN | NOT PERFORMED
**Related:** [Architecture](ARCHITECTURE.md) · [Data Contracts](DATA_CONTRACTS.md) · [Index](../INDEX.md)

---

## 1. Authoring Pipeline Overview

No content authoring tool has been selected. VERIFIED. This document specifies the requirements and process the authoring pipeline must satisfy.

### 1.1 Pipeline Principle

All content must be authored, validated, and approved before it enters the game simulation. The pipeline enforces this flow:

```
Author → Draft → Schema Validation → Peer Review → Balance Review →
  Approved → Content Repository → Build Import → Simulation
```

Content that fails schema validation never reaches the simulation. VERIFIED design requirement.

### 1.2 Schema-First Authoring

Every content type has a canonical schema (see [Data Contracts](DATA_CONTRACTS.md)). The authoring pipeline enforces:

1. All required fields are present.
2. All referenced IDs resolve to existing records.
3. All enum values are valid.
4. All protected fields are absent from public content.
5. Versioning fields are correct.

Validation runs automatically on every content file before it can be submitted for review. VERIFIED design requirement.

### 1.3 Private vs. Public Pipeline

- Public pipeline: handles all content that may appear in public repository files.
- Private pipeline: handles secret areas, protected loot configurations, hidden progression thresholds, and anti-cheat data.
- Private pipeline output must never be committed to the public repository. VERIFIED.
- Private content is stored in `design-private/` which is git-ignored. VERIFIED.

---

## 2. Content Types and Authoring Requirements

### 2.1 Ability

- Authored as structured data (format: UNKNOWN until tooling selected; must serialize to canonical schema).
- All timing values (cooldown_ticks, commit_point_ticks) authored in ticks, not seconds.
- Effects reference other registered definitions — validator checks all references resolve.
- Presentation hints (anim_hint, audio_hint) are separate from gameplay data and may be added later.
- Review required: Class Lead + Balance Reviewer.

### 2.2 Monster

- Monster records require anatomy and AI profile references to exist before the monster can be approved.
- Loot source references must be established before monster enters vertical slice content.
- Monster knowledge rewards are authored separately and linked.
- Review required: Monster Lead + Narrative for lore fields.

### 2.3 Armor and Weapon

- Material reference must exist before armor/weapon can be authored.
- Protected loot configurations (drop weights, rate overrides) are authored in private pipeline only.
- Enchantment slots field determines maximum enchantments — this is a design-controlled value requiring balance review.
- Review required: Equipment Lead + Balance Reviewer.

### 2.4 Enchantments and Wards

- `overmatch_threshold` is a protected field — must not appear in public content files. VERIFIED.
- Malady type assignments require explicit sign-off from Design Authority. VERIFIED.
- Ward threshold values require balance review before approval.
- Review required: Systems Lead + Design Authority for Malady assignments.

### 2.5 Quest

- Quest objectives must reference existing encounter IDs or world object IDs.
- Reward references must resolve to valid item IDs or currency values.
- Branching conditions must be expressible in the quest condition language (UNKNOWN: tooling).
- Review required: Narrative Lead + Systems Lead (for reward balance).

### 2.6 Faction

- Faction relationships (allied, hostile) must be symmetric or intentionally asymmetric (requires note).
- Standing scales must define at least two ranks (min and max).
- Review required: Narrative Lead.

---

## 3. Balance Authoring

### 3.1 Balance Tuning Values

- All balance-affecting numeric fields are version-controlled as content data. VERIFIED design requirement.
- Balance changes follow the same review pipeline as content changes.
- No balance values are hardcoded in simulation logic — they flow from content data. VERIFIED design requirement.

### 3.2 Protected Balance Values

- Exact Overmatch thresholds. PRIVATE.
- Exact secret area drop rates. PRIVATE.
- Post-Level-100 scaling coefficients. PRIVATE.
- Anti-cheat detection thresholds. PRIVATE (not in content pipeline).

### 3.3 Balance History

All balance changes are tracked through version control with commit messages explaining the reason for the change. VERIFIED design requirement.

---

## 4. Localization Authoring

### 4.1 Principles

- All player-facing text is externalized from data records into localization tables. PROPOSED.
- Content records reference string keys; localization tables map keys to translated strings.
- Gameplay data never contains inline translated text (except English source strings for authoring reference). PROPOSED.

### 4.2 Localization Pipeline — PROPOSED

```
English Source → Localization Export → Translation → Import →
  Localization Validation → Review → Approved Strings
```

### 4.3 Localization Requirements

- All ability names, item names, monster names, class names, lineage names, and status conditions must be localizable. VERIFIED design requirement.
- Audio captions/subtitles must be localizable. VERIFIED accessibility requirement.
- Right-to-left language support: UNKNOWN — scope to be determined.

---

## 5. Audio Asset Authoring

### 5.1 Audio Asset Requirements

- All audio assets are referenced by content data (ability records, monster records, environment definitions) using asset IDs.
- Audio assets must not contain embedded localized speech — dialogue is separate from SFX/ambient. PROPOSED.
- Captions/subtitles for all voiced content are required. VERIFIED accessibility requirement.

### 5.2 Photosensitivity

- Audio events that accompany visual flashes must be tagged so the presentation layer can substitute or suppress the visual if photosensitivity mode is active. VERIFIED accessibility requirement.

### 5.3 Audio Authoring Format — UNKNOWN

Format and tooling for audio authoring: UNKNOWN until engine selected.

---

## 6. Secret-Area Authoring: Keeping Private Content Private

### 6.1 Pipeline Separation

Secret areas, Royal Dungeons, hidden post-Level-100 content, and protected encounter configurations are authored exclusively in the private pipeline. VERIFIED.

Content authored in the private pipeline:
- Is never committed to the public repository.
- Is stored in `design-private/` (git-ignored).
- Is validated with the same schemas as public content.
- Is imported into the game build separately from public content.

### 6.2 Public-Safe References

Public content may reference the existence of secret systems (e.g., an NPC hints at a Royal Dungeon) but must not provide:
- Exact entry conditions. VERIFIED.
- Maze solutions. VERIFIED.
- Hidden-level requirement thresholds. VERIFIED.
- Protected loot drop rates. VERIFIED.

See [PUBLIC_PRIVATE_BOUNDARIES](../governance/PUBLIC_PRIVATE_BOUNDARIES.md) for the full boundary specification.

### 6.3 Author Access Controls — PROPOSED

Access to private pipeline content is restricted to a defined list of contributors. PROPOSED. Access control technology: UNKNOWN.

---

## 7. Version Control for Content

### 7.1 All Content Is Version-Controlled

All public content files are version-controlled in the repository. VERIFIED.

### 7.2 Content Branching Strategy — PROPOSED

- Main content branch reflects approved, build-ready content.
- Content changes are proposed in branches, reviewed, and merged.
- Balance tuning changes are small, focused, and include rationale in the commit message.

### 7.3 Content Schema Versioning

When a schema changes (see [Data Contracts — Versioning Strategy](DATA_CONTRACTS.md)):
1. Schema version is bumped.
2. All existing content records must be migrated or validated against the new schema.
3. A migration script is authored and reviewed before the schema version is applied.

---

## 8. Review and Approval Process

### 8.1 Review Roles

| Role | Responsibilities |
|---|---|
| Content Author | Creates draft content record |
| Peer Reviewer | Reviews for correctness, completeness, naming conventions |
| Balance Reviewer | Reviews all numeric values for balance implications |
| Narrative Lead | Reviews lore, descriptions, faction relationships |
| Systems Lead | Reviews ability, monster, and encounter systemic interactions |
| Design Authority | Signs off on Malady assignments, protected field decisions |

### 8.2 Approval Gate

A content record is approved for build import when:
1. Schema validation passes. VERIFIED requirement.
2. Peer review approved.
3. Required specialist reviews approved (see 8.1).
4. No blocking comments remain.

### 8.3 Expedited Review

For vertical slice content only, expedited review (author + one reviewer) is allowed with explicit Design Authority acknowledgment. PROPOSED.

---

## 9. QA Integration

### 9.1 Content QA

All approved content is QA-validated before milestone release:
- Schema conformance re-validated in build environment.
- Reference resolution re-validated in build environment.
- Balance ranges spot-checked against design targets.
- Protected field audit: no protected values in public build content.

### 9.2 Regression Detection

When content changes, affected system tests are re-run. PROPOSED. See [QA_STRATEGY](../production/QA_STRATEGY.md) for full test approach.

### 9.3 Authoring Tool Validation

If/when authoring tools are selected: tool output must be validated against schemas as an automated step before any content produced by the tool enters the repository. VERIFIED design requirement.

---

## 10. Authoring Style Guide

### 10.1 Naming Conventions

All content identifiers (`id` fields) must follow kebab-case. VERIFIED design requirement.

- Good: `bearkin-edgebearer-slash`, `bronze-vambrace`, `sugar-wolf`
- Bad: `BearkinEdgebearerSlash`, `BRONZE_VAMBRACE`, `sugar wolf`

All display names (`name` fields) use title case with proper article style for the game's setting. PROPOSED.

### 10.2 Description Fields

Description fields are optional in schemas but are required by authoring convention for:
- All abilities (gameplay explanation for QA and balance review).
- All monsters (behavioral summary for AI implementers).
- All classes and lineages (identity summary for narrative and marketing use).

PROPOSED: description fields must be ≤ 200 characters for UI-facing content.

### 10.3 Lore Fields

Lore fields are optional and may be omitted from early drafts. Lore fields are narrative-reviewed separately from gameplay data. Lore in a content record must not reveal secret area solutions or protected progression information. VERIFIED.

### 10.4 Tag Taxonomy

Tags are used for balance tooling and content filtering. Approved tag prefixes:

- `class:` — class affiliation (e.g., `class:edgebearer`)
- `lineage:` — lineage affiliation (e.g., `lineage:bearkin`)
- `tier:` — material tier (e.g., `tier:bronze`)
- `region:` — world region (e.g., `region:fractured-flats`)
- `balance:` — balance group for analysis (e.g., `balance:melee-opener`)

Untagged content can be authored but will have reduced balance tooling support. PROPOSED.

---

## 11. Emergency Authoring Protocol

When urgent content changes are required (e.g., a live economy balance emergency):

1. The change must still pass schema validation. VERIFIED — no exceptions.
2. Design Authority grants expedited review bypass (peer review only, no specialist wait).
3. The change is flagged as `expedited` in the commit message.
4. A full review is completed within 48 hours of the expedited merge. PROPOSED.
5. If the expedited content fails the post-merge review: rollback within the same session if possible, or a corrective change is the next priority.

Balance changes that bypass schema validation are NEVER permitted under any circumstances. VERIFIED.

---

## 12. Content Localization Requirements (Extended)

### 12.1 String Key Format

All localizable strings use a namespaced key format: `{content_type}.{id}.{field}`.

Examples:
- `ability.bearkin-edgebearer-slash.name` → "Edgebearer Slash"
- `monster.sugar-wolf.description` → "A pack hunter with a sweet composition..."
- `class.edgebearer.lore` → "The Edgebearers..."

### 12.2 Localization Completeness Gate

Before a milestone release, all player-facing strings must have localization coverage in at least the primary launch language. PROPOSED: English as primary. Other languages: UNKNOWN — localization scope not yet defined.

### 12.3 Audio Caption Authoring

All voiced lines must have a corresponding caption string authored before recording. The caption is authored first and used as the recording script. This ensures captions are accurate (not transcribed after the fact). VERIFIED accessibility requirement.

---

## 13. Content Dependency Graph

When authoring new content, the author must verify all referenced IDs exist before the content can be approved. The dependency order for the vertical slice is:

```
Material (bronze)
  └─► Armor (bronze-vambrace, bronze-chestplate, etc.)
  └─► Weapon (bronze-shortsword, bronze-shortbow, etc.)

Anatomy (bearkin-player, sugar-wolf, sour-slime, bronze-paw-bipedal)
  └─► Monster (sugar-wolf, sour-slime, bronze-paw-grunt, etc.)
  └─► Lineage (bearkin)

Lineage (bearkin)
  └─► Class (edgebearer, pinshot) — class references lineage for synergy tags

Ability (all abilities)
  └─► Class (edgebearer, pinshot) — class references starting abilities

Attack (all attacks)
  └─► Ability (attack references parent ability)

LootSource (all enemy loot sources)
  └─► Monster (loot source references monster)
  └─► DropTable (private pipeline)

Encounter (all level 1-3 encounters)
  └─► Monster (encounter references monsters)
  └─► Arena (encounter references location)

LevelGate (levels 1, 2, 3)
  └─► Trial (gate references required trials — minimal for slice)
```

Content must be authored in dependency order. Attempting to validate a record with an unresolved ID reference will fail schema validation. VERIFIED.

---

## 14. Public Content Safety Checklist

Before submitting any content record for review, authors must verify:

- [ ] No `overmatch_threshold` value present.
- [ ] No `protected = true` drop table details included.
- [ ] No secret area entry conditions referenced.
- [ ] No post-Level-100 content or thresholds referenced.
- [ ] No anti-cheat data referenced.
- [ ] No credentials, API keys, or infrastructure identifiers present.
- [ ] All lore fields contain only public-safe narrative.
- [ ] All description fields contain only public-safe gameplay information.

This checklist is not a substitute for the automated private-field validation in the schema validation step, but it catches issues before they reach review. PROPOSED.

---

*Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853*
*See [Data Contracts](DATA_CONTRACTS.md) for schema definitions. See [QA_STRATEGY](../production/QA_STRATEGY.md) for test approach.*
