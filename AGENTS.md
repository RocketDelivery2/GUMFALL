# AGENTS.md — AI Coding Agent Guidelines for GUMFALL

> **Status:** VERIFIED — This file is the authoritative onboarding reference for all AI agents
> working in this repository. Read this file before taking any action.

---

## Repository Purpose

GUMFALL is a third-person physical action RPG set in a living candy world. The repository is in
**preproduction**. Its primary outputs are design specifications, governance documents, content
schemas, and tooling to support a future vertical-slice implementation.

No game engine has been selected. No networking stack, programming language, persistence system,
or deployment platform has been committed to. Do not select or implement any of these without an
explicit accepted architecture decision recorded in
[DECISION_LOG.md](docs/governance/DECISION_LOG.md).

---

## Branch Conventions

| Pattern | Purpose |
|---|---|
| `main` | Protected. Stable reviewed documentation only. |
| `design/<topic>-<date>` | Active design work branches. |
| `docs/<topic>` | Documentation-only changes. |
| `schema/<topic>` | JSON schema additions or revisions. |
| `tools/<topic>` | Tooling and validation script changes. |
| `governance/<topic>` | Governance document changes. |

- Branch names use lowercase kebab-case.
- Date suffix format: `YYYYMMDD` or `YYYYMMDD-HHmmss`.
- Do not commit directly to `main`.

---

## File Organization

```
GUMFALL/
├── AGENTS.md                        ← You are here
├── CHANGELOG.md                     ← Keep-a-Changelog format
├── README.md                        ← Project overview (if present)
├── .editorconfig
├── .gitattributes
├── .gitignore
├── .github/
│   ├── instructions/                ← GitHub Copilot coding instructions
│   ├── prompts/                     ← Reusable agent prompt templates
│   ├── workflows/                   ← GitHub Actions CI
│   ├── ISSUE_TEMPLATE/              ← Issue templates
│   └── PULL_REQUEST_TEMPLATE.md
├── docs/
│   ├── governance/                  ← Authority, decisions, assumptions
│   ├── design/                      ← Core design documents
│   ├── systems/                     ← System-level specifications
│   ├── world/                       ← World-building documents
│   ├── classes/                     ← Per-class documentation
│   ├── monsters/                    ← Monster documentation
│   └── glossary/                    ← Canonical terminology
├── schemas/                         ← JSON Schemas (technology-neutral)
├── content/
│   └── examples/                   ← Validated example JSON content
├── tools/                           ← Validation and authoring scripts
└── design-private/                  ← PRIVATE. Git-ignored. Not tracked.
```

### Protected / Private Material

The `design-private/` directory is listed in `.gitignore` and must **never** be tracked by git.
Running `tools/Validate-Docs.ps1` will fail if any files under `design-private/` are tracked.

Private material includes (but is not limited to):
- Exact maze solutions and step-by-step Royal Court traversals
- Exact post-Level-100 / First Unbinding unlock conditions and hidden thresholds
- Anti-cheat signatures, detection heuristics, and audit keys
- Protected loot drop rate configurations
- Credentials and secrets of any kind

See [PUBLIC_PRIVATE_BOUNDARIES.md](docs/governance/PUBLIC_PRIVATE_BOUNDARIES.md) for the full
boundary specification.

---

## Authority Labels

Every design claim in this repository must carry one of the following status labels. Use them
in prose documents as inline prefixes or in a dedicated **Status** field.

| Label | Meaning |
|---|---|
| **VERIFIED** | Confirmed by the design authority. Treat as final unless explicitly revised. |
| **DERIVED** | Calculated or logically inferred from VERIFIED values. Show your work. |
| **PROPOSED** | Under consideration. Not yet accepted. Do not implement. |
| **ASSUMPTION** | Believed to be true but not yet confirmed. Flag for review. |
| **UNKNOWN** | Explicitly not yet decided. Do not guess or fill in. |
| **NOT PERFORMED** | Describes testing, validation, or measurement that has not been done. |

Never present PROPOSED, ASSUMPTION, or UNKNOWN content as if it were VERIFIED.

---

## Do Rules (Things Agents Should Do)

- **Read first.** Before creating or modifying any file, read the relevant existing documents and
  the [DECISION_LOG.md](docs/governance/DECISION_LOG.md).
- **Use canonical terminology.** Refer to the glossary (`docs/glossary/GLOSSARY.md` — planned,
  not yet created) and the canonical design in `AGENTS.md`
  itself for all system, class, lineage, and mechanic names.
- **Cross-link documents.** When referencing another document, use a relative Markdown link.
- **Label all design claims** with the appropriate authority label.
- **Make small, reviewable changes.** Prefer surgical edits over large rewrites.
- **Record assumptions.** Add any new assumption to
  [ASSUMPTION_REGISTER.md](docs/governance/ASSUMPTION_REGISTER.md).
- **Record decisions.** Add any new accepted decision to
  [DECISION_LOG.md](docs/governance/DECISION_LOG.md).
- **Validate before finishing.** Run `tools/Validate-Docs.ps1` (PowerShell, no external
  dependencies) to confirm all checks pass before considering a task complete.
- **Use schema files** in `schemas/` as the authoritative structure for all content JSON.
- **Preserve deterministic gameplay behavior.** Simulation and presentation must remain separated.

---

## Don't Rules (Things Agents Must Not Do)

- **Do not select an engine, language, or platform** without an accepted architecture decision.
- **Do not expose private material** in any tracked file. This includes exact maze solutions,
  hidden level thresholds, anti-cheat heuristics, exact protected drop rates, and credentials.
- **Do not fabricate test, build, performance, or implementation results.** If something has not
  been performed, label it NOT PERFORMED.
- **Do not replace physical body-integrity mechanics** with generic health-bar abstractions.
- **Do not add dependencies** without documenting the reason and tradeoffs in the relevant
  document and the DECISION_LOG.
- **Do not commit to `main` directly.**
- **Do not commit anything to `design-private/`** — that directory is git-ignored by design.
- **Do not generate copyrighted content.**
- **Do not modify protected private-design files** if they exist locally.
- **Do not present PROPOSED content as VERIFIED.**
- **Do not use `design-private/` paths in public Markdown links.**

---

## File Types and Conventions

| Extension | Convention |
|---|---|
| `*.md` | UTF-8, LF line endings, no trailing whitespace, final newline. |
| `*.json` | UTF-8, LF, 2-space indent, valid against relevant schema. |
| `*.schema.json` | JSON Schema draft-07. Technology-neutral. |
| `*.ps1` | UTF-8, LF, 4-space indent. No external module dependencies. |
| `*.yml` | UTF-8, LF, 2-space indent. |

All files follow `.editorconfig` rules.

---

## Validation Command

```powershell
pwsh tools/Validate-Docs.ps1
```

This script (no external dependencies) checks:
1. All `*.json` files parse without error.
2. Required canonical Markdown documents exist.
3. Relative Markdown links resolve to real files.
4. No Markdown files are empty or whitespace-only.
5. No files under `design-private/` are tracked by git.
6. No merge conflict markers are present (seven `<`, seven `=`, seven `>`).

Exit code `0` = all checks pass. Exit code `1` = one or more failures.

---

## Canonical Design Summary (Quick Reference)

> The full design authority information is maintained in this file's parent task context and in
> the documents below. This section provides quick navigation.

| Topic | Document |
|---|---|
| Design authority and hierarchy | [DESIGN_AUTHORITY.md](docs/governance/DESIGN_AUTHORITY.md) |
| Public vs. private boundaries | [PUBLIC_PRIVATE_BOUNDARIES.md](docs/governance/PUBLIC_PRIVATE_BOUNDARIES.md) |
| Decision log | [DECISION_LOG.md](docs/governance/DECISION_LOG.md) |
| Assumption register | [ASSUMPTION_REGISTER.md](docs/governance/ASSUMPTION_REGISTER.md) |
| PR template | [PULL_REQUEST_TEMPLATE.md](.github/PULL_REQUEST_TEMPLATE.md) |
| Docs CI workflow | [docs-validation.yml](.github/workflows/docs-validation.yml) |

### Core Pillars (VERIFIED)

1. Immediate controls
2. Continuous combat flow
3. Readable impacts
4. Physical consequences
5. Player expression
6. Shared player/enemy rules
7. Anatomy-driven encounters
8. Source-grounded loot
9. Fair secrets with discoverable clues
10. Competitive progression without unlimited vertical power
11. Skill-first structured PvP
12. Expandable long-term world design

### Classes (VERIFIED spine)

Edgebearer, Pinshot, Skewer, Crusher, Licorice Rogue, Gummy Brawler, Gelomancer, Flavorweaver,
Confectioner, Candy Artificer, Syrupwarden, Candysinger

### Lineages (VERIFIED)

Bearkin, Wormkin, Ringborn, Gumdrop Folk, Jellybean Folk, Bottleborn, Sourlings, Licoricefolk,
Marshfolk, Jawbreaker Kin, Drakegums, Swarmkin

### Vertical Slice Target (VERIFIED)

Bearkin Edgebearer, Pinshot projectile pinning, bronze armor, limb separation/reattachment,
three ordinary monsters (Sugar Wolf, Sour Slime, Bronze Paw enemies), one elite captain,
Levels 1–3, camp, Sugar Well, basic loot, compact arena.

---

*Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853*
