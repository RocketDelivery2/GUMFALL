---
mode: agent
description: >
  Reusable prompt for expanding GUMFALL design documentation. Use this template
  when asking an agent to write or extend any design, system, world, class, or
  monster document in this repository.
---

# GUMFALL Design Documentation Expansion — Agent Prompt Template

## Instructions for the Agent

You are expanding design documentation for **GUMFALL**, a third-person physical action RPG set in
a living candy world. Before writing anything, complete the following steps:

### Step 1 — Read Repository Governance

1. Read `AGENTS.md` at the repository root. This is your primary reference for canonical design
   information, authority labels, do/don't rules, and file organization.
2. Read `docs/governance/DECISION_LOG.md` to understand what has been accepted, what is open,
   and what must not be pre-decided.
3. Read `docs/governance/ASSUMPTION_REGISTER.md` to avoid restating known assumptions.
4. Read `docs/governance/PUBLIC_PRIVATE_BOUNDARIES.md` to understand what must not appear in
   tracked files.

### Step 2 — Identify the Target Document

The document or section to expand is:

> **[REPLACE THIS LINE with the target document path or topic description]**

Before writing, read the existing file if it exists. Do not duplicate content already present.

### Step 3 — Authoring Rules

Follow all rules from `AGENTS.md`. Key requirements:

- **Label every design claim** with: `VERIFIED`, `DERIVED`, `PROPOSED`, `ASSUMPTION`, `UNKNOWN`,
  or `NOT PERFORMED`. Never present PROPOSED or ASSUMPTION content as VERIFIED.
- **Use canonical terminology only.** Do not invent mechanic names, class names, lineage names,
  or stat names without a corresponding DECISION_LOG entry.
- **Cross-link documents.** Use relative Markdown links for all internal references.
- **Do not expose private material.** No maze solutions, hidden level thresholds, anti-cheat
  signatures, protected drop rates, or credentials.
- **Do not select engine, language, or platform** — no architecture decision has been made.
- **Do not fabricate test or implementation results.** If something has not been done, say
  `NOT PERFORMED`.
- **Preserve the body-integrity / GelFlow distinction** — gameplay is deterministic; visual
  effects never determine gameplay outcomes.

### Step 4 — Structure Requirements

The document should:

- Open with a YAML-style or inline **Status** block listing the document's authority label and
  last-updated date.
- Use `#` for the document title, `##` for major sections, `###` for subsections.
- Include a **Related Documents** section at the bottom with relative links.
- Be substantive — major design documents should have a minimum of 200 lines.
- Schemas and small reference files require at least 50 lines.

### Step 5 — Validation

After writing, run:

```powershell
pwsh tools/Validate-Docs.ps1
```

Do not consider the task complete until validation exits with code `0`.

---

## Topic-Specific Context (Fill This In)

> Replace the sections below with specifics for your expansion task.

**Topic:** *(e.g., "Gelomancer class specification")*

**Relevant VERIFIED facts from AGENTS.md:**
- *(List the canonical data points relevant to this topic)*

**Known open decisions (from DECISION_LOG):**
- *(List any OPEN decisions that affect this topic)*

**Known assumptions (from ASSUMPTION_REGISTER):**
- *(List relevant assumptions by ID)*

**Do not include:**
- *(List any specific content that must be excluded, e.g., "exact Folded Court solution")*

**Cross-links to include:**
- *(List documents this new content should link to)*

---

## Output Format

Produce the complete file content, ready to be written to the target path. Include:

- The full Markdown text.
- All authority labels.
- All cross-links as relative Markdown links.
- A **Related Documents** section at the end.

Do not include code fences around the Markdown itself — return the raw Markdown text.
