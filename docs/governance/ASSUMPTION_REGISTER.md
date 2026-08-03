# Assumption Register

> **Status:** ASSUMPTION for all entries unless marked otherwise. See
> [DESIGN_AUTHORITY.md](DESIGN_AUTHORITY.md) for label definitions.
> Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853

This register tracks assumptions that are believed to be true but have not been confirmed by the
Design Authority or by concrete measurement. Every assumption here must be reviewed before the
vertical-slice milestone and resolved before production implementation begins.

Contributors and AI agents: **do not treat assumptions as VERIFIED**. If you discover an
assumption is wrong, update its status and notify the Design Authority.

---

## How to Read This Register

| Column | Description |
|---|---|
| **ID** | Unique assumption identifier (A-NNN) |
| **Status** | OPEN / CONFIRMED / INVALIDATED / SUPERSEDED |
| **Assumption** | What is assumed to be true |
| **Impact if Wrong** | What breaks or must change if this assumption is false |
| **Owner** | Who is responsible for validating this assumption |
| **Review Date** | Target date to confirm or invalidate this assumption |

---

## Status Definitions

| Status | Meaning |
|---|---|
| **OPEN** | Assumption has not been validated or invalidated. |
| **CONFIRMED** | Assumption has been validated. May be elevated to VERIFIED via a DECISION_LOG entry. |
| **INVALIDATED** | Assumption was wrong. Impact has been assessed and documents updated. |
| **SUPERSEDED** | Replaced by a newer assumption or decision. |

---

## Assumption Table

| ID | Status | Assumption | Impact if Wrong | Owner | Review Date |
|---|---|---|---|---|---|
| A-001 | OPEN | A major commercial game engine will be selected for production. The engine will support deterministic simulation ticking, per-region mesh deformation, and multiplayer state replication sufficient for GelFlow. | If no suitable engine exists, a custom simulation layer or substantial engine modification would be required, increasing development cost and timeline significantly. | @RocketDelivery2 | Before vertical-slice implementation begins |
| A-002 | OPEN | Concurrent player count at launch will be in the range of 1,000–10,000 players globally. | If player count is higher, networking architecture (matchmaking, replication, Shattercrown instances) must scale to handle load. If lower, monetization viability assumptions change. Infrastructure cost estimates are invalid. | @RocketDelivery2 | Before networking architecture design begins |
| A-003 | OPEN | Typical player session length is 45–90 minutes for PvE content and 20–40 minutes for PvP matches. | If sessions are significantly shorter, content pacing, progression gating, and stamina/focus resource recovery must be redesigned. Arena and Shattercrown mode lengths may need adjustment. | @RocketDelivery2 | Before encounter and pacing design is finalized |
| A-004 | OPEN | The game will use a client-server network model with authoritative server simulation for PvP and co-op content. Solo play may use local-authoritative simulation. | If a peer-to-peer model is used instead, anti-cheat architecture and GelFlow replication requirements change substantially. Deterministic simulation becomes more critical as the sole anti-cheat mechanism. | @RocketDelivery2 | Before multiplayer architecture design begins (DEC-001 must be resolved first) |
| A-005 | OPEN | The content authoring pipeline will use human-readable JSON content files (validated against schemas in `schemas/`) as the source of truth for game content. A separate tool or import step will convert JSON to engine-native formats. | If the engine requires a proprietary content format as the source of truth, the JSON schema approach must be adapted or abandoned. All content examples and validation tooling would need revision. | @RocketDelivery2 | When DEC-001 is resolved (engine selection) |
| A-006 | OPEN | The validation script `tools/Validate-Docs.ps1` and the `.gitignore` entry for `design-private/` are sufficient to prevent accidental publication of private material, without additional pre-commit hooks or CI gate enforcement beyond the GitHub Actions workflow. | If private material is accidentally committed (e.g., via force-push bypassing Actions), the enforcement is insufficient. A pre-commit hook or branch protection rule requiring CI passage would be needed. | @RocketDelivery2 | Before any external contributors join the repository |
| A-007 | OPEN | Accessibility requirements will include at minimum: colorblind support for damage-type and status-effect indicators, configurable input remapping for all actions, and subtitle/caption support for all voiced content. | If more extensive accessibility requirements apply (e.g., motor-accessibility for combat timing, screen reader support for UI), additional design work is required across GelFlow input buffers, UI architecture, and presentation systems. | @RocketDelivery2 | Before UI and presentation design begins |
| A-008 | OPEN | The vertical-slice implementation will be built by a team of 1–5 people (solo founder or very small team). | If the team size is larger, documentation conventions, review processes, and tooling must scale accordingly. If solo, some review steps must be adapted. | @RocketDelivery2 | Before production planning begins |
| A-009 | OPEN | Player progression data (level, Legacy points, Proofs, equipment) will be stored server-side for all networked modes. Local-only save data may be used for solo offline play if a solo-offline mode is supported. | If all play is online-required, local save data is unnecessary. If offline play is supported, save data portability, anti-cheat, and data integrity across save files become significant design concerns. | @RocketDelivery2 | Before save/provenance architecture design begins |
| A-010 | OPEN | The GelFlow deterministic simulation can be implemented at sufficient performance to support real-time gameplay (targeting 60+ Hz simulation tick) on mid-range consumer hardware. Per-region body-integrity calculations for up to 8 simultaneous entities are feasible within frame budget. | If per-region simulation is too expensive, approximations or level-of-detail reductions in body integrity must be designed. The physics fidelity of limb detachment and reattachment may need to be reduced. | @RocketDelivery2 | NOT PERFORMED — requires prototype benchmark |

---

## Extended Assumption Detail

### A-001 — Engine Target Platform

**Reasoning behind assumption:** Most commercial 3D action RPGs are built on commercial engines.
The required capabilities (deterministic physics, mesh deformation, multiplayer replication) are
present in at least some major engines, though the combination is unusual.

**What to investigate:**
- Does the target engine support deterministic simulation ticking (fixed timestep)?
- Can per-region body deformation be driven from simulation state (not visual physics)?
- What is the replication model for custom simulation state?
- Does the engine's physics engine introduce non-determinism?

**Dependency:** DEC-001 (engine selection) must be resolved before this assumption can be confirmed.

---

### A-002 — Player Count Estimate

**Reasoning behind assumption:** No market research has been performed. The 1,000–10,000 range
is a conservative estimate for a niche physical action RPG with a strong design vision. Actual
player count depends on marketing, platform, and genre reception.

**What to investigate:**
- Comparable action RPG launch player counts.
- Platform (PC-only, console, cross-platform) — each affects player count range significantly.
- Marketing and publishing strategy.

**Note:** This assumption has significant infrastructure cost implications. **NOT PERFORMED:**
any player count projection, market research, or comparable title analysis.

---

### A-003 — Session Length

**Reasoning behind assumption:** 45–90 minutes for PvE is consistent with many action RPG sessions.
PvP match length of 20–40 minutes is consistent with arena combat games. These are design targets
that inform stamina/focus recovery rates, respawn rules, and content pacing.

**What to investigate:**
- Playtest data from comparable games.
- Player behavior research for physical action games.
- Impact of body-integrity mechanics on combat duration (limb loss extends encounters).

**Note:** This assumption directly affects GelFlow encounter pacing and resource recovery design.
**NOT PERFORMED:** any playtesting or session length measurement.

---

### A-004 — Network Model

**Reasoning behind assumption:** Client-server is the industry standard for competitive
multiplayer. GelFlow's deterministic simulation is a good fit for server-authoritative
verification. However, the cost of running authoritative servers at scale must be evaluated
against alternative models.

**Dependency:** DEC-001 (engine selection) constrains which network models are practical.

---

### A-010 — Simulation Performance

**Reasoning behind assumption:** Body-integrity simulation with 8 regions per entity and 8
simultaneous entities = 64 region checks per frame minimum. With 6 per-region fields and
threshold calculations, this is computationally plausible on modern CPUs but untested.

**What to investigate:**
- Profile a prototype simulation with 8 entities, 8 regions each.
- Measure per-frame budget on mid-range hardware (e.g., Intel Core i5-12th gen, Ryzen 5 5000).
- Evaluate LOD strategies for large encounter areas.

**NOT PERFORMED:** Any performance profiling or benchmark.

---

## Adding New Assumptions

To add a new assumption:

1. Assign the next A-NNN id.
2. Add an entry to the table above.
3. If the assumption is significant, add an extended detail section below the table.
4. Reference the assumption id in the relevant document (e.g., "ASSUMPTION: see A-005").
5. Set a realistic review date based on when the assumption can be validated.

To resolve an assumption:
1. Change status to CONFIRMED or INVALIDATED.
2. If CONFIRMED and significant, create a DECISION_LOG entry.
3. If INVALIDATED, update all documents that depended on the assumption.
4. Record the resolution in the extended detail section.

---

## Related Documents

- [AGENTS.md](../../AGENTS.md) — Agent guidelines and authority labels
- [DESIGN_AUTHORITY.md](DESIGN_AUTHORITY.md) — Authority structure and review process
- [DECISION_LOG.md](DECISION_LOG.md) — Accepted decisions (assumptions that were confirmed become decisions)
- [PUBLIC_PRIVATE_BOUNDARIES.md](PUBLIC_PRIVATE_BOUNDARIES.md) — Public/private boundary
- [CHANGELOG.md](../../CHANGELOG.md) — Change history
