# Decision Log

> **Status:** VERIFIED structure | Individual decision statuses as marked per entry.
> Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853

This log records all significant design and architecture decisions for GUMFALL. Every accepted
or open decision that affects how the game is built, documented, or shipped must have an entry
here. Contributors and AI agents must check this log before making assumptions about undecided
topics.

---

## How to Read This Log

| Column | Description |
|---|---|
| **ID** | Unique decision identifier (DEC-NNN) |
| **Date** | Date the decision was recorded (ISO 8601) |
| **Status** | OPEN / ACCEPTED / REJECTED / SUPERSEDED |
| **Decision** | What was decided (or what is being considered) |
| **Rationale** | Why this decision was made (or why it is still open) |
| **Owner** | Who has authority to resolve this decision |
| **Related Documents** | Links to relevant specifications or issues |

---

## Status Definitions

| Status | Meaning |
|---|---|
| **OPEN** | Under consideration. No decision has been made. Do not implement. |
| **ACCEPTED** | Decision is final. Treat as VERIFIED. |
| **REJECTED** | Explicitly decided against. Do not revisit without new evidence. |
| **SUPERSEDED** | Replaced by a newer decision (link to replacement entry). |

---

## Decision Table

| ID | Date | Status | Decision | Rationale | Owner | Related Documents |
|---|---|---|---|---|---|---|
| DEC-001 | 2026-08-02 | OPEN | No game engine, networking stack, programming language, persistence system, or deployment platform selected. | Preproduction. Selecting an engine or platform before the vertical-slice specification is complete would constrain design unnecessarily. Decision deferred until architecture requirements are fully specified. | @RocketDelivery2 | [ASSUMPTION_REGISTER.md](ASSUMPTION_REGISTER.md) A-001 |
| DEC-002 | 2026-08-02 | ACCEPTED | GelFlow deterministic simulation must remain strictly separated from visual presentation. | Core Pillar 4 (Physical consequences) requires that gameplay outcomes are deterministic and never influenced by visual effects. Simulation-presentation separation is required to support multiplayer replication, replay, anti-cheat, and fair competition. | @RocketDelivery2 | [AGENTS.md](../../AGENTS.md), [PUBLIC_PRIVATE_BOUNDARIES.md](PUBLIC_PRIVATE_BOUNDARIES.md) |
| DEC-003 | 2026-08-02 | ACCEPTED | The class spine is fixed at 12 classes: Edgebearer, Pinshot, Skewer, Crusher, Licorice Rogue, Gummy Brawler, Gelomancer, Flavorweaver, Confectioner, Candy Artificer, Syrupwarden, Candysinger. | 12 classes provides sufficient expression range (Core Pillar 5) while remaining specifiable and balanceable for a vertical-slice-first approach. Each class has a distinct resource and identity to avoid mechanical overlap. | @RocketDelivery2 | [AGENTS.md](../../AGENTS.md), [schemas/class.schema.json](../../schemas/class.schema.json) |
| DEC-004 | 2026-08-02 | ACCEPTED | Level 100 is the official public cap. Architecture reserves future progression. Exact post-Level-100 conditions are concealed. | Supporting Core Pillar 10 (competitive progression without unlimited vertical power). A public cap prevents indefinite power escalation. Post-cap content exists as discoverable design for players who reach the cap, but must not be documented in public files. | @RocketDelivery2 | [PUBLIC_PRIVATE_BOUNDARIES.md](PUBLIC_PRIVATE_BOUNDARIES.md), [AGENTS.md](../../AGENTS.md) |
| DEC-005 | 2026-08-02 | ACCEPTED | GUMFALL will not sell XP, levels, Legacy points, Proofs, trial completion, best-in-slot power, Malady enchantments, ranked advantages, or hidden-level access. | Core Pillar 10 (competitive progression without unlimited vertical power) and Core Pillar 11 (skill-first structured PvP) require that no monetary payment provides competitive advantage. Permitted monetization: cosmetics, emotes, housing cosmetics, mount appearances, noncompetitive visual effects, expansions, transparent supporter packs. | @RocketDelivery2 | [AGENTS.md](../../AGENTS.md) |
| DEC-006 | 2026-08-02 | ACCEPTED | Exact post-Level-100 / First Unbinding conditions remain concealed in design-private/. Public documentation may acknowledge the cap and hint at more, but must not document exact solutions or thresholds. | Core Pillar 9 (fair secrets with discoverable clues) — the secret must be discoverable through gameplay, not through reading public documentation. Protecting the secret preserves the intended discovery experience. | @RocketDelivery2 | [PUBLIC_PRIVATE_BOUNDARIES.md](PUBLIC_PRIVATE_BOUNDARIES.md) |
| DEC-007 | 2026-08-03 | ACCEPTED | `AGENTS.md` and `docs/governance/DESIGN_AUTHORITY.md` together define the authoritative agent and contributor operating model for this repository (repository governance bootstrap). All AI agents and human contributors must read both documents before making any changes. | Formalises the governance infrastructure established during preproduction so that future contributors have a single unambiguous entry point. Prevents governance drift as the contributor base grows. | @RocketDelivery2 | [AGENTS.md](../../AGENTS.md), [DESIGN_AUTHORITY.md](DESIGN_AUTHORITY.md) |

---

## Extended Decision Detail

### DEC-001 — No Engine or Platform Selected (OPEN)

**Full context:**

The repository is in preproduction. The vertical-slice specification must be completed before an
engine selection can be responsibly made, because:

1. The GelFlow deterministic simulation (DEC-002) has unusual requirements that may constrain
   engine choices (deterministic physics tick, body-integrity per-region simulation, multiplayer
   replication of simulation state).
2. The body-integrity system requires per-region mesh deformation and object embedding, which
   varies significantly in capability and cost across engines.
3. Multiplayer requirements (PvP, invasions, Shattercrown, guild wars) have not been
   fully specified.

**What agents must do:** Label any engine-specific or platform-specific assumption as ASSUMPTION
and log it in [ASSUMPTION_REGISTER.md](ASSUMPTION_REGISTER.md). Do not write engine-specific
code or configurations.

---

### DEC-002 — Simulation/Presentation Separation (ACCEPTED)

**Full context:**

The GelFlow simulation pipeline is ordered:
Input intent → Action validation → Character movement → Contact detection → Defense resolution
→ Attack energy → Armor resolution → Body-region resolution → Threshold and status resolution
→ Reaction selection → Presentation

**Presentation** is the final step. Everything before it is simulation. This means:

- Visual deformation is driven by simulation state; it does not drive simulation state.
- A limb that appears to be separating is not "separated" until the simulation computes that the
  connection strength threshold has been breached.
- Network replication sends simulation state, not visual state.
- Replays and anti-cheat audits operate on simulation state.

**What agents must do:** In any system specification, clearly distinguish simulation inputs,
simulation outputs, and presentation outputs. Never write specifications where a visual event
determines a gameplay outcome.

---

### DEC-003 — 12-Class Spine (ACCEPTED)

**Full context:**

The 12 classes are organized by their primary resource and identity:

| Class | Resource | Identity |
|---|---|---|
| Edgebearer | Edge Alignment | Precision blade combat, directional cuts |
| Pinshot | Focus Marks | Ranged precision, projectile pinning |
| Skewer | Leverage | Polearm control, area denial |
| Crusher | Momentum | Heavy impact, knockback, destabilization |
| Licorice Rogue | Advantage | Positioning, deception, opportunism |
| Gummy Brawler | Bounce | Elastic unarmed combat, resilience |
| Gelomancer | Gel Reserve | Body manipulation, healing, reconstruction |
| Flavorweaver | Flavor Charges | Elemental flavor magic |
| Confectioner | Ingredients | Battlefield alchemy, consumable crafting |
| Candy Artificer | Capacity | Devices, turrets, constructs |
| Syrupwarden | Conviction | Oath-bound protection and retribution |
| Candysinger | Tempo | Performance-based buffs and battlefield rhythm |

Specialty paths (selected at Level 3) further differentiate playstyle within each class.

---

### DEC-005 — Monetization Policy (ACCEPTED)

**Full context:**

The complete list of what will never be sold:
- XP or experience multipliers
- Character levels or level advancement
- Legacy points
- Proof completion or bypass
- Trial completion or bypass
- Best-in-slot power items
- Malady enchantments
- Ranked PvP advantages of any kind
- Hidden level or post-cap content access

The complete list of what is permitted:
- Cosmetic appearances (armor skins, weapon skins)
- Emotes and animations
- Housing cosmetics
- Mount appearances
- Noncompetitive visual effects
- Content expansions (new zones, quests, story)
- Transparent supporter packs (cosmetics only, clearly labeled)

---

## Adding New Decisions

To add a new decision:

1. Open a GitHub Issue using the
   [Design Question template](../../.github/ISSUE_TEMPLATE/design-question.md).
2. Once resolved, add an entry to this table with the next DEC-NNN id.
3. Mark status ACCEPTED, REJECTED, or leave OPEN with a note.
4. Update any related documents to reflect the decision.
5. Reference the DEC-NNN id in related documents where appropriate.

---

## Related Documents

- [AGENTS.md](../../AGENTS.md) — Canonical design summary and agent rules
- [DESIGN_AUTHORITY.md](DESIGN_AUTHORITY.md) — Authority structure and review process
- [ASSUMPTION_REGISTER.md](ASSUMPTION_REGISTER.md) — Tracked assumptions
- [PUBLIC_PRIVATE_BOUNDARIES.md](PUBLIC_PRIVATE_BOUNDARIES.md) — Public/private content boundary
- [CHANGELOG.md](../../CHANGELOG.md) — Change history
