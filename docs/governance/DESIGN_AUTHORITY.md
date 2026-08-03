# Design Authority

> **Status:** VERIFIED — This document defines the design authority structure for GUMFALL.
> All design claims must be traceable to this hierarchy.
> Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853

---

## Overview

GUMFALL is a creative work with a single design authority owner. All canonical design decisions
originate from or are approved by that authority. This document defines who can make design
decisions, how those decisions are documented, how conflicts are resolved, and how the document
hierarchy is structured.

---

## Design Authority Owner

| Role | Identity | GitHub Handle |
|---|---|---|
| **Design Authority / Creative Director** | Christopher Peterson | @RocketDelivery2 |

The Design Authority owner has final say on all creative, mechanical, and systemic decisions.
No design decision is VERIFIED without explicit approval from this role.

AI coding agents, contributors, and collaborators may:
- Propose design content (PROPOSED label)
- Document assumptions (ASSUMPTION label)
- Record open questions (UNKNOWN label)
- Expand and elaborate VERIFIED content without altering it

AI coding agents and contributors may **not**:
- Mark content VERIFIED without Design Authority approval
- Override or reinterpret VERIFIED decisions
- Make architecture decisions (engine, language, platform) without an explicit accepted entry in
  [DECISION_LOG.md](DECISION_LOG.md)

---

## Authority Labels

Every design claim in every document in this repository must carry one of the following labels.
This is enforced by contributor guidelines and validated by `tools/Validate-Docs.ps1` (which
checks for empty files and broken links, not semantic labels — semantic label review is a human
responsibility).

| Label | Meaning | Who Can Assign |
|---|---|---|
| **VERIFIED** | Confirmed by the Design Authority. Final unless explicitly revised. | Design Authority only |
| **DERIVED** | Calculated or logically inferred from VERIFIED values. Show the formula. | Any contributor; must cite source |
| **PROPOSED** | Under consideration. Not accepted. Do not implement. | Any contributor |
| **ASSUMPTION** | Believed true but not confirmed. Must be logged in ASSUMPTION_REGISTER. | Any contributor |
| **UNKNOWN** | Explicitly not yet decided. Do not guess. | Any contributor |
| **NOT PERFORMED** | Describes testing, measurement, or validation that has not been done. | Any contributor |

### Label Usage Examples

**Correct:**

> The class spine contains 12 classes. **VERIFIED.**

> At Level 50, approximately 80% of direct power is earned. **VERIFIED.**

> Estimated concurrent player count during launch: 1,000–5,000. **ASSUMPTION.** See
> [ASSUMPTION_REGISTER.md](ASSUMPTION_REGISTER.md) entry A-002.

> Input buffer for light attack: 150ms. **VERIFIED** (design value). Latency tolerance testing:
> **NOT PERFORMED.**

**Incorrect:**

> The engine will be Unreal Engine 5. *(Presents an UNKNOWN as decided.)*

> Drop rate for Mythic items is 0.0001%. *(Presents protected UNKNOWN data as public VERIFIED.)*

---

## Document Hierarchy

Documents in this repository are organized by authority level:

### Tier 1 — Governance (Highest Authority)

These documents define how all other documents are written and maintained.

| Document | Purpose |
|---|---|
| [AGENTS.md](../../AGENTS.md) | AI agent guidelines, canonical design summary, do/don't rules |
| [DESIGN_AUTHORITY.md](DESIGN_AUTHORITY.md) | This document — authority structure |
| [DECISION_LOG.md](DECISION_LOG.md) | Accepted and open design decisions |
| [ASSUMPTION_REGISTER.md](ASSUMPTION_REGISTER.md) | Tracked assumptions |
| [PUBLIC_PRIVATE_BOUNDARIES.md](PUBLIC_PRIVATE_BOUNDARIES.md) | What is public vs. private |

### Tier 2 — Core Design Specifications (VERIFIED Content)

System-level specifications that describe how GUMFALL works. Content here must be VERIFIED or
clearly labeled with appropriate lower-authority labels.

| Document (planned) | Purpose |
|---|---|
| `docs/design/CORE_PILLARS.md` | 12 core design pillars |
| `docs/systems/GELFLOW_COMBAT.md` | GelFlow combat simulation specification |
| `docs/systems/BODY_INTEGRITY.md` | Per-region body integrity system |
| `docs/systems/PROGRESSION.md` | XP formulas, era structure, Legacy Reroll |
| `docs/systems/ENCHANTMENTS.md` | Enchantment, ward, Malady, Overmatch system |
| `docs/systems/LOOT.md` | Loot generation and source-grounding |
| `docs/systems/PVP.md` | PvP rulesets, arenas, ranked divisions |
| `docs/world/SHATTERCROWN.md` | Shattercrown district and systems |
| `docs/design/MONETIZATION.md` | Monetization policy |

### Tier 3 — Reference Material (VERIFIED + DERIVED)

Class, lineage, monster, and equipment reference documents. Must cite Tier 1/2 sources.

| Document type (planned) | Location |
|---|---|
| Class specifications | `docs/classes/<class-name>.md` |
| Lineage specifications | `docs/design/LINEAGES.md` |
| Monster references | `docs/monsters/<monster-family>.md` |
| Equipment references | `docs/design/EQUIPMENT.md` |
| Glossary | `docs/glossary/GLOSSARY.md` |

### Tier 4 — Schemas and Content Examples

Technology-neutral JSON Schemas and validated example content.

| Location | Purpose |
|---|---|
| `schemas/*.schema.json` | JSON Schemas for all content types |
| `content/examples/*.json` | Example content instances for validation and reference |

### Tier 5 — Private Design Material (Not Tracked)

Stored in `design-private/` which is git-ignored and never tracked. Contains exact maze
solutions, hidden threshold values, anti-cheat signatures, and protected drop configurations.
See [PUBLIC_PRIVATE_BOUNDARIES.md](PUBLIC_PRIVATE_BOUNDARIES.md) for the full boundary.

---

## Review Process

### Design Document Additions

1. Author creates or modifies a document on a feature branch (naming convention: `design/<topic>`
   or `docs/<topic>`).
2. Author runs `tools/Validate-Docs.ps1` and confirms it passes.
3. Author opens a Pull Request using the
   [PR template](../../.github/PULL_REQUEST_TEMPLATE.md).
4. Design Authority (@RocketDelivery2) reviews and approves or requests changes.
5. PR is merged only after Design Authority approval.

### Design Decision Escalation

1. Open a GitHub Issue using the
   [Design Question template](../../.github/ISSUE_TEMPLATE/design-question.md).
2. Include all relevant options and their tradeoffs.
3. The Design Authority resolves the issue and the decision is recorded in
   [DECISION_LOG.md](DECISION_LOG.md).
4. Relevant documents are updated to reflect the accepted decision.
5. Issue is closed with a reference to the DECISION_LOG entry.

### Conflict Resolution

If there is a discrepancy between two documents:

1. Higher-tier documents (Tier 1 > Tier 2 > Tier 3 > Tier 4) take precedence.
2. VERIFIED content takes precedence over DERIVED over PROPOSED over ASSUMPTION.
3. If the conflict is unresolved by these rules, the Design Authority makes a final ruling.
4. The ruling is recorded in DECISION_LOG.md and the conflicting documents are updated.

---

## Version Policy

This repository does not yet use semantic versioning. Version tags will be introduced when
a releasable vertical-slice milestone is reached. See
[DECISION_LOG.md](DECISION_LOG.md) entry DEC-001 for the open engine/platform decision that
must be resolved before a versioning policy can be fully established.

Until versioning is introduced:
- All changes are tracked in [CHANGELOG.md](../../CHANGELOG.md).
- Branch names include date stamps for temporal ordering.
- The `main` branch always represents the latest approved documentation state.

---

## Related Documents

- [AGENTS.md](../../AGENTS.md) — Agent guidelines and canonical design summary
- [DECISION_LOG.md](DECISION_LOG.md) — All accepted and open decisions
- [ASSUMPTION_REGISTER.md](ASSUMPTION_REGISTER.md) — Tracked assumptions
- [PUBLIC_PRIVATE_BOUNDARIES.md](PUBLIC_PRIVATE_BOUNDARIES.md) — Public/private content boundary
- [CHANGELOG.md](../../CHANGELOG.md) — Change history
- [PULL_REQUEST_TEMPLATE.md](../../.github/PULL_REQUEST_TEMPLATE.md) — PR checklist
