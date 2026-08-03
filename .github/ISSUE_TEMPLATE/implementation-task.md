---
name: Implementation Task
about: Track a concrete implementation task for a system, schema, document, or tool.
title: "[TASK] "
labels: implementation, task
assignees: RocketDelivery2
---

## Task Description

<!-- Describe the implementation task clearly. What needs to be built, written, or changed? -->

## Motivation

<!-- Why is this task needed? What problem does it solve or what requirement does it fulfill? -->
<!-- Link to the relevant design document, decision, or system spec. -->

## Acceptance Criteria

<!-- List the specific, verifiable conditions that define "done" for this task. -->
<!-- Each criterion should be independently testable or reviewable. -->

- [ ]
- [ ]
- [ ]

## Scope

### In Scope

<!-- Explicitly list what IS included in this task. -->

-

### Out of Scope

<!-- Explicitly list what is NOT included. This prevents scope creep. -->

-

## Pre-requisites

<!-- List any tasks, decisions, or documents that must be complete before this task starts. -->
<!-- Link to relevant DECISION_LOG entries or other GitHub issues. -->

- [ ] Decision: *(link to DECISION_LOG entry or issue)*
- [ ] Document: *(link to prerequisite spec)*

## Implementation Notes

<!-- Relevant implementation guidance, constraints, or considerations. -->

### Architecture Constraints

<!-- Must not violate these boundaries (from AGENTS.md): -->
<!-- - No engine, language, or platform selected without an accepted decision. -->
<!-- - Simulation and presentation must remain separated. -->
<!-- - Gameplay must be deterministic. Visual effects must not determine gameplay outcomes. -->
<!-- - Body-integrity mechanics must not be replaced with health-bar abstractions. -->

### Files Affected

<!-- List the files that will be created or modified by this task. -->

| File | Change Type | Notes |
|---|---|---|
| | Create / Modify / Delete | |

### Schema Validation

<!-- If this task involves JSON content, which schema does it validate against? -->

- Schema: `schemas/[schema-name].schema.json`
- Validation command: `pwsh tools/Validate-Docs.ps1`

## Authority Label for Outputs

<!-- What authority label should the outputs of this task carry? -->

- [ ] **VERIFIED** — Confirmed by design authority before implementation begins.
- [ ] **DERIVED** — Calculated from verified values (include formula/reasoning in the output).
- [ ] **PROPOSED** — Speculative; not yet accepted.

## Testing / Validation

<!-- How will you verify this task is complete? -->

- [ ] `tools/Validate-Docs.ps1` passes (exit code 0).
- [ ] All new JSON files parse without errors.
- [ ] All new JSON content validates against the relevant schema.
- [ ] All relative Markdown links resolve.
- [ ] No private material is present in tracked files.
- [ ] PR checklist items in [PULL_REQUEST_TEMPLATE.md](../PULL_REQUEST_TEMPLATE.md) satisfied.

## Related Documents

<!-- Link to relevant documents. -->

- [AGENTS.md](../../AGENTS.md)
- [DECISION_LOG.md](../../docs/governance/DECISION_LOG.md)
- [ASSUMPTION_REGISTER.md](../../docs/governance/ASSUMPTION_REGISTER.md)
- [PUBLIC_PRIVATE_BOUNDARIES.md](../../docs/governance/PUBLIC_PRIVATE_BOUNDARIES.md)

## Estimated Complexity

- [ ] Small (single file, straightforward change)
- [ ] Medium (multiple files, cross-document coordination)
- [ ] Large (new system specification, schema design, significant new content)
- [ ] Unknown — needs scoping

## Notes

<!-- Any additional context, questions, or notes for the implementer. -->
