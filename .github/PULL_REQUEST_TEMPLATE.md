## Description

<!-- Describe what this PR changes and why. Be specific about the design area or system affected. -->

## Type of Change

Select all that apply:

- [ ] **Design document** — New or updated narrative/specification content under `docs/`
- [ ] **System specification** — Detailed system mechanics or simulation rules
- [ ] **Schema** — New or updated JSON Schema under `schemas/`
- [ ] **Content example** — New or updated example JSON under `content/examples/`
- [ ] **Governance** — Decision log, assumption register, authority, or boundary documents
- [ ] **Tooling** — Scripts under `tools/` or workflow changes under `.github/workflows/`
- [ ] **Infrastructure** — Root-level config files (`.editorconfig`, `.gitattributes`, etc.)
- [ ] **Bug fix** — Corrects an error in existing documentation or schemas

## Related Issues / Decisions

<!-- Link to any related GitHub Issues or DECISION_LOG entries. -->
<!-- Example: Closes #42 | Related: docs/governance/DECISION_LOG.md#dec-003 -->

## Checklist

### Content Quality

- [ ] All design claims carry an authority label: `VERIFIED`, `DERIVED`, `PROPOSED`,
      `ASSUMPTION`, `UNKNOWN`, or `NOT PERFORMED`.
- [ ] No PROPOSED or ASSUMPTION content is presented as VERIFIED.
- [ ] Only canonical terminology is used (class names, lineage names, stat names, mechanic names
      from `AGENTS.md`).
- [ ] New mechanic names or terms have a corresponding DECISION_LOG entry.

### Links and References

- [ ] All relative Markdown links in modified files resolve to real files.
- [ ] No absolute URLs are used for internal document references.
- [ ] New documents include a **Related Documents** section with cross-links.

### Secrets and Privacy

- [ ] No exact maze solutions or Royal Court traversal sequences are present.
- [ ] No hidden post-Level-100 / First Unbinding conditions or thresholds are present.
- [ ] No anti-cheat signatures, detection heuristics, or audit keys are present.
- [ ] No exact protected drop rate configurations (weights, seed values) are present.
- [ ] No credentials, tokens, or API keys are present.
- [ ] `design-private/` is not referenced in any tracked file as a link destination.

### Validation

- [ ] `tools/Validate-Docs.ps1` exits with code `0` on the PR branch.
- [ ] Any new JSON files parse without errors.
- [ ] Any new JSON content files validate against the appropriate schema in `schemas/`.

### Governance

- [ ] New accepted decisions are recorded in `docs/governance/DECISION_LOG.md`.
- [ ] New assumptions are recorded in `docs/governance/ASSUMPTION_REGISTER.md`.
- [ ] `CHANGELOG.md` Unreleased section is updated if this is a notable addition.

## Screenshots / Examples

<!-- If applicable, paste example JSON, a rendered table, or other evidence of correctness. -->
