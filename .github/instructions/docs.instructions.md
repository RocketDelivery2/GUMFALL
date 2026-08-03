---
applyTo: "docs/**,schemas/**,content/**"
---

# GUMFALL Documentation Authoring Instructions

These instructions apply to GitHub Copilot when working on any file under `docs/`, `schemas/`,
or `content/` in the GUMFALL repository.

## First Steps

Before writing or editing any documentation:

1. Read [`AGENTS.md`](../../AGENTS.md) at the repository root. It contains the full canonical
   design summary, authority labels, do/don't rules, and file organization.
2. Check [`docs/governance/DECISION_LOG.md`](../../docs/governance/DECISION_LOG.md) for any open or
   accepted decisions relevant to your topic.
3. Check [`docs/governance/ASSUMPTION_REGISTER.md`](../../docs/governance/ASSUMPTION_REGISTER.md) for
   existing assumptions you should reference rather than re-state.

## Terminology

- Use **only** terminology defined in the canonical design or in the glossary
  (`docs/glossary/GLOSSARY.md` — planned, not yet created).
- Canonical class names: Edgebearer, Pinshot, Skewer, Crusher, Licorice Rogue, Gummy Brawler,
  Gelomancer, Flavorweaver, Confectioner, Candy Artificer, Syrupwarden, Candysinger.
- Canonical lineage names: Bearkin, Wormkin, Ringborn, Gumdrop Folk, Jellybean Folk, Bottleborn,
  Sourlings, Licoricefolk, Marshfolk, Jawbreaker Kin, Drakegums, Swarmkin.
- Canonical attributes: Might, Agility, Fortitude, Technique, Intellect, Spirit.
- Canonical derived stats: Vitality, Structure, Stamina, Focus, Adhesion, Stability.
- The combat simulation is called **GelFlow**.
- The body integrity system tracks per-region state, not a global health bar.
- Do not invent new mechanic names without a corresponding DECISION_LOG entry.

## Authority Labels

Every design claim must carry a status label. Place labels inline in prose or in a dedicated
**Status** field in structured documents.

| Label | When to use |
|---|---|
| `VERIFIED` | Confirmed by the design authority. Do not alter without authority approval. |
| `DERIVED` | Calculated from VERIFIED values. Include the formula or reasoning. |
| `PROPOSED` | Under consideration. Do not implement or treat as final. |
| `ASSUMPTION` | Believed but not confirmed. Add to ASSUMPTION_REGISTER. |
| `UNKNOWN` | Not yet decided. Do not guess or fill in a placeholder value. |
| `NOT PERFORMED` | Describes testing or measurement that has not been done. |

## Cross-Linking

- When referencing another document, always use a relative Markdown link.
- Link to the most specific relevant section using anchors where possible.
- Example patterns (use actual paths relative to the file being written):
  - From `docs/systems/` to `docs/governance/`: `../governance/DECISION_LOG.md`
  - From `docs/classes/` to `docs/systems/`: `../systems/GELFLOW_COMBAT.md`
  - With anchor: `../governance/DECISION_LOG.md#dec-003`
- Do not use absolute URLs for internal documents.

## Secrets and Private Material

**Never include any of the following in tracked files:**

- Exact Royal Court maze solutions or step-by-step traversal sequences.
- Hidden post-Level-100 / First Unbinding conditions or thresholds.
- Anti-cheat signatures, detection heuristics, or audit keys.
- Exact protected drop rate configurations (weights, seed values).
- Credentials, tokens, or API keys of any kind.

If a topic requires private detail, write a public-facing summary that acknowledges the feature
exists without revealing the solution, then note that full details are in `design-private/`.

## Schema Usage

- Content JSON files must validate against the relevant schema in `schemas/`.
- Do not add fields to JSON content that are not present in the schema.
- If a new field is needed, update the schema first and document the change.

## Validation

After making changes, run:

```powershell
pwsh tools/Validate-Docs.ps1
```

Do not consider a task complete until validation passes.
