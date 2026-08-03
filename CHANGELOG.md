# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

This project does not yet use semantic versioning. Version tags will be introduced when
a releasable vertical-slice milestone is reached. See
[DECISION_LOG.md](docs/governance/DECISION_LOG.md) for versioning decisions.

---

## [Unreleased]

### Added

- Repository preproduction documentation expansion.
  - `AGENTS.md` — AI coding agent guidelines, authority labels, do/don't rules, file organization.
  - `CHANGELOG.md` — This file. Keep-a-Changelog format.
  - `.editorconfig` — Encoding, line ending, indent, and line-length conventions.
  - `.gitattributes` — Line ending normalization and export-ignore rules for private material.
  - `.github/instructions/docs.instructions.md` — Copilot coding instructions for documentation.
  - `.github/prompts/expand-gumfall-design.prompt.md` — Reusable agent prompt template.
  - `.github/PULL_REQUEST_TEMPLATE.md` — Pull request template with checklist.
  - `.github/ISSUE_TEMPLATE/design-question.md` — Issue template for design questions.
  - `.github/ISSUE_TEMPLATE/implementation-task.md` — Issue template for implementation tasks.
  - `.github/workflows/docs-validation.yml` — GitHub Actions docs validation workflow.
  - `tools/Validate-Docs.ps1` — PowerShell validation script (no external dependencies).
  - `schemas/ability.schema.json` — JSON Schema for Ability definitions.
  - `schemas/weapon.schema.json` — JSON Schema for Weapon definitions.
  - `schemas/armor.schema.json` — JSON Schema for Armor piece definitions.
  - `schemas/monster.schema.json` — JSON Schema for Monster definitions.
  - `schemas/enchantment.schema.json` — JSON Schema for Enchantment definitions.
  - `schemas/lineage.schema.json` — JSON Schema for Lineage definitions.
  - `schemas/class.schema.json` — JSON Schema for Class definitions.
  - `schemas/quest.schema.json` — JSON Schema for Quest definitions.
  - `schemas/loot_source.schema.json` — JSON Schema for LootSource definitions.
  - `content/examples/bearkin-edgebearer-duelist.example.json` — Example character.
  - `content/examples/sugar-wolf.example.json` — Example monster (Sugar Wolf).
  - `content/examples/bronze-shortsword.example.json` — Example weapon.
  - `docs/governance/DESIGN_AUTHORITY.md` — Design authority structure and hierarchy.
  - `docs/governance/PUBLIC_PRIVATE_BOUNDARIES.md` — Public/private content boundary specification.
  - `docs/governance/DECISION_LOG.md` — Accepted and open design decisions.
  - `docs/governance/ASSUMPTION_REGISTER.md` — Tracked assumptions with review dates.
- Full game bible documentation pass (branch `design/full-game-bible-20260802-223853`):
  - `docs/technical/ARCHITECTURE.md` — Comprehensive architecture document; all 21 system boundaries, dependency diagram, data flow, server authority model, determinism requirements, security boundaries, privacy-aware analytics design.
  - `docs/technical/DATA_CONTRACTS.md` — Technology-neutral data contracts for all 25 content types (Ability through Companion); versioning strategy, migration policy, authoring validation rules.
  - `docs/technical/NETWORKING_REPLICATION_AND_AUDIT.md` — Network model requirements, server authority model, client prediction scope, latency compensation, replication priorities, replay system, audit trail design, anti-cheat boundaries, exploit quarantine, save/provenance, privacy.
  - `docs/technical/CONTENT_AUTHORING.md` — Authoring pipeline overview, schema-first approach, per-content-type authoring requirements, balance authoring, localization, audio, secret-area pipeline separation, version control, review process, QA integration.
  - `docs/technical/PERFORMANCE_BUDGETS.md` — Performance philosophy, hardware tier targets (PROPOSED/NOT PERFORMED), frame time budgets by system, simulation rules, Body Integrity budget, AI budget, asset streaming, network budget, testing methodology requirements.
  - `docs/production/VERTICAL_SLICE.md` — Full vertical slice specification: all in-scope content, success criteria, system dependencies, content authoring checklist, QA tests, risks, schedule phases.
  - `docs/production/QA_STRATEGY.md` — Comprehensive QA strategy: all 14 test types with targets, test environment requirements, regression policy, bug severity matrix, coverage targets.
  - `docs/production/RISK_REGISTER.md` — 21 tracked risks with Likelihood, Impact, Severity, Mitigation, Owner, Status.
  - `docs/production/ENGINE_EVALUATION_ADR.md` — Engine evaluation ADR: decision criteria (11, ranked), 5 candidate engine profiles with trade-offs, evaluation methodology (4 prototypes), decision timeline, consequences, gates.
  - `docs/INDEX.md` — Master document index: all docs organized by section, status column, quick-start guides for 4 reader types.
  - `docs/GAME_DESIGN_BIBLE.md` — Replaced stub with comprehensive bible: vision statement, product identity, 12 pillars with descriptions, all major systems with one-paragraph descriptions, document hierarchy, design authority reference, preproduction status.
  - `docs/glossary/GLOSSARY.md` — Comprehensive glossary: documentation labels, all system names, all 12 classes, all 12 lineages, compositions, flavor affinities, all 9 damage types, armor categories, all 9 currencies, enchantment categories, all 4 Malady types, Ward types, monster ranks, all 8 progression eras, PvP divisions, secret area terms, technical terms, narrative terms, world regions, attribute names.
  - `docs/systems/DAMAGE_STATUS_AND_ARMOR.md` — Damage channels, all status effects, armor interaction rules, armor categories, Ward interaction, overmatch formula.
  - `docs/systems/ENCHANTMENTS_AND_WARDS.md` — Natural enchantment probability table, rank multipliers, enchantment categories, all 4 Malady types, Ward categories, overmatch formula, PvP budget rules, tournament normalization.
  - `docs/systems/WEAPONS_MASTERY_AND_EQUIPMENT.md` — All 11 weapon families, weapon statistics, 10 material bands, weapon mastery system, craftsmanship tiers, condition system, binding, provenance, lineage-specific accommodations.
  - `docs/systems/CRAFTING_ECONOMY_AND_LOOT.md` — Six crafting disciplines, recipe structure, enchantment crafting limits, Ward application, repair, recasting, salvage, 9-denomination currency system, 5 special currencies, economic faucets and sinks, loot generation rules, item provenance, trading, binding, Legacy Vault, Shattercrown risk pouch, inflation controls, fraud response, ethical monetization boundary.
  - `README.md` — Replaced brief README with comprehensive project overview: elevator pitch, phase statement, full feature list, all 12 design pillars, organized documentation navigation, contributing section, spoiler policy, status indicators.
  - `ROADMAP.md` — Replaced 5-phase stub with 10-phase detailed roadmap: Phase 0 (governance) through Phase 10 (live operations); each phase has objectives, deliverables checklist, success criteria, and dependencies.

### Changed

- `docs/technical/ARCHITECTURE.md` — Replaced 50-line stub with 400+ line comprehensive architecture document.
- `docs/production/RISK_REGISTER.md` — Replaced stub with full risk register (21 risks).
- `docs/production/ENGINE_EVALUATION_ADR.md` — Replaced stub with full ADR.
- `docs/INDEX.md` — Replaced stub with complete master index; added entries for four new system documents (DAMAGE_STATUS_AND_ARMOR, ENCHANTMENTS_AND_WARDS, WEAPONS_MASTERY_AND_EQUIPMENT, CRAFTING_ECONOMY_AND_LOOT); removed crafting from known-gaps list.
- `docs/glossary/GLOSSARY.md` — Replaced stub with comprehensive glossary.
- `README.md` — Replaced brief readme with comprehensive project readme; fixed trailing whitespace.
- `ROADMAP.md` — Replaced 5-phase stub with 10-phase detailed roadmap; fixed trailing whitespace.
- `docs/GAME_DESIGN_BIBLE.md` — Replaced original minimal bible with comprehensive authoritative overview; fixed trailing whitespace.
- `docs/technical/ARCHITECTURE.md` — Fixed trailing whitespace in header lines.

### Deprecated

- Nothing deprecated.

### Removed

- Nothing removed.

### Fixed

- Nothing fixed.

### Security

- `.gitattributes` marks `design-private/**` as `export-ignore` to prevent accidental publication.
- `tools/Validate-Docs.ps1` fails if any files under `design-private/` are tracked by git.
- All new documents explicitly state that anti-cheat signatures, exact Overmatch thresholds, protected drop configurations, and exact secret area conditions must not appear in public files. VERIFIED.

---

## [Pre-production — Design Bible Branch]

*Branch: `design/full-game-bible-20260802-223853`*
*Date: 2026-08-02*

Initial repository establishment. No prior changelog entries exist.

---

[Unreleased]: https://github.com/RocketDelivery2/GUMFALL/compare/HEAD...HEAD
