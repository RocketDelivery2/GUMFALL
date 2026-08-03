# GUMFALL — Networking, Replication, and Audit

**Status:** DRAFT — Platform not selected
**Label Policy:** VERIFIED | DERIVED | PROPOSED | ASSUMPTION | UNKNOWN | NOT PERFORMED
**Related:** [Architecture](ARCHITECTURE.md) · [Data Contracts](DATA_CONTRACTS.md) · [Index](../INDEX.md)

---

## 1. Network Model Overview

No networking platform or transport technology has been selected. VERIFIED.

This document specifies the requirements that any networking solution must satisfy. Requirements are stated as behavioral contracts, not implementation choices.

### 1.1 Core Requirements

| Requirement | Rationale |
|---|---|
| Server-authoritative simulation | Prevents client-side cheating; ensures identical outcomes |
| Deterministic tick-based model | Enables replay, audit, and anti-cheat comparison |
| Client prediction with server reconciliation | Provides responsive feel under normal latency |
| Ordered, reliable delivery for authoritative events | Simulation events must not be applied out of order |
| Best-effort unreliable delivery for position updates | Reduces latency for cosmetic updates |
| Replay data capture | Required for audit, anti-cheat, and player review |

### 1.2 Connection Model — PROPOSED

- Dedicated server model for all ranked PvP and tournament play. PROPOSED.
- Listen-server or peer-to-peer model for non-ranked co-op: UNKNOWN — depends on engine and cost structure.
- All authoritative simulation runs on server regardless of hosting model. VERIFIED design requirement.

### 1.3 Tick Rate — PROPOSED

- Authoritative simulation tick: 60 Hz. PROPOSED.
- Network state broadcast: 20 Hz. PROPOSED.
- Client interpolation window: ~3 network frames (150ms at 20 Hz). PROPOSED.
- Client input buffer: PROPOSED to handle up to 200ms one-way latency gracefully.

---

## 2. Server Authority Model

The server owns all authoritative outcomes. The client may predict local results but must reconcile when the server disagrees. VERIFIED.

### 2.1 Domain Ownership

| Domain | Server Owns | Client Predicts | Notes |
|---|---|---|---|
| Character position | Final validated position | Local movement | Reconciled on mismatch |
| Attack hit registration | All contact resolution | Visual attack animation | Client sees result after server confirms |
| Damage values | All damage numbers | None | UI reflects server value |
| Body region integrity | All region states | Cosmetic deformation only | Separation only triggers on server event |
| Loot drops | All item generation | None | Client receives grant notification |
| XP awards | All XP and level changes | None | UI reflects server state |
| Enchantment / Ward resolution | All status applications | None | |
| PvP match outcomes | All results | None | |
| Tournament brackets | All draw orders | None | Seed is server-managed |
| Economy transactions | All item and currency changes | None | |
| Ranked division changes | All ranking adjustments | None | |

### 2.2 Movement Validation — PROPOSED

The server validates movement by checking:
1. Speed does not exceed class/status-permitted maximum.
2. Traversal path does not cross impossible geometry (wall clips, floor falls).
3. Dodge distances match ability parameters.
4. Positional delta per tick is within physics-plausible bounds.

Rejected movement: server snaps entity to last valid position and notifies client. PROPOSED.

### 2.3 Attack Timing Validation

The server accepts attack inputs within a tolerance window around the claimed commit tick. PROPOSED. Outside the window: input rejected. Client re-predicts from current authoritative state.

---

## 3. Client Prediction Scope and Boundaries

### 3.1 What Clients May Predict

- Local character position and velocity (Motor state).
- Animation state derived from input (cosmetic only).
- UI feedback for input acknowledgment (button press responses).
- Projectile visual trajectory (cosmetic — server determines hit).

### 3.2 What Clients Must NOT Predict

- Whether an attack hit. VERIFIED.
- Damage values. VERIFIED.
- Body region separation. VERIFIED.
- Loot drops. VERIFIED.
- XP or level changes. VERIFIED.
- Enchantment or Ward resolution outcomes. VERIFIED.
- PvP match results. VERIFIED.

### 3.3 Reconciliation Protocol — PROPOSED

1. Client maintains a rolling buffer of unacknowledged inputs with timestamps.
2. Server sends authoritative state updates tagged with the last processed client tick.
3. Client compares predicted state vs. authoritative state.
4. If delta exceeds reconciliation threshold: client re-simulates from last authoritative state, replaying buffered inputs.
5. Presentation layer smooths the correction over N frames (cosmetic only). PROPOSED.

---

## 4. Latency Compensation — PROPOSED

All latency compensation approaches are PROPOSED — not validated, not implemented (NOT PERFORMED).

### 4.1 Entity Interpolation

- All non-player entities rendered using interpolation between two known server states.
- Interpolation delay: ~100ms behind server state. PROPOSED.
- Player's own character: predicted ahead, reconciled.

### 4.2 Attack Compensation

- When a player initiates an attack at server-received tick T:
  - Hit resolver evaluates target positions as they were at tick T (compensating for the player's latency).
  - Maximum compensation window: PROPOSED — to be determined by playtest. ASSUMPTION: 200ms upper bound is a common industry practice.
- Compensation must not grant advantage exceeding the attacker's actual latency. PROPOSED.
- UNKNOWN: exact algorithm until engine and measurement system selected.

### 4.3 Parry and Dodge Windows

- Parry/dodge windows defined in server ticks, not wall-clock milliseconds.
- All players at different latencies compete on tick-count windows.
- RISK: High-latency players have disadvantaged perception of parry timing. Mitigated by accessibility options (extended parry window assist). See [QA_STRATEGY](../production/QA_STRATEGY.md).

---

## 5. Replication Priorities

Not all state is equally important to replicate accurately. PROPOSED priority classification:

| Priority Class | Examples | Delivery Mode | Update Rate |
|---|---|---|---|
| Critical (always accurate) | Body integrity state, limb separation, health, death | Reliable ordered | Per event |
| High (near-accurate) | Player position, enemy position, active ability states | Reliable ordered | 20 Hz |
| Medium (approximate ok) | Distant entity positions, environmental states | Unreliable | 10 Hz |
| Low (cosmetic) | Particle positions, ragdoll pose, cloth simulation | Unreliable | Best effort |
| Never replicated | Anti-cheat thresholds, protected loot config, simulation seed internals | — | Never |

### 5.1 Body Integrity Replication — VERIFIED requirement

Body integrity events (separation, reattachment, prosthetic attachment) must be delivered reliably and applied in order. Out-of-order application could produce incorrect visual state and confuse players. VERIFIED.

---

## 6. Replay System Requirements

A replay system is required for: audit, anti-cheat investigation, player-requested match review. VERIFIED design requirement.

### 6.1 What Replays Must Capture

- All server-authoritative inputs by tick. VERIFIED.
- All RNG draws from the seeded chain. VERIFIED.
- World seed snapshot at match start. VERIFIED.
- All entity state snapshots at configurable intervals. PROPOSED: every 300 ticks (~5 seconds at 60 Hz).
- All loot generation events with provenance. VERIFIED.
- All match outcome events. VERIFIED.

### 6.2 What Replays Must NOT Capture

- Anti-cheat detection logic or signatures. VERIFIED.
- Protected loot configuration details. VERIFIED.

### 6.3 Replay Determinism

Given identical replay data on a compliant server host, the replay must reproduce identical simulation outcomes. VERIFIED design requirement.

### 6.4 Replay Retention — PROPOSED

- Competitive match replays: retained for investigation window (UNKNOWN: duration, must be determined by policy).
- Casual session replays: retained briefly (UNKNOWN: duration).
- User-requested replay exports: PROPOSED user right.

---

## 7. Audit Trail Design

All authoritative simulation events generate an audit record. VERIFIED.

### 7.1 Audit Event Schema

```
AuditEvent {
  event_id:       string (unique, ordered within session)
  session_id:     string
  tick:           int
  event_type:     AuditEventType enum
  entity_ids:     string[]
  outcome_hash:   string (hash of outcome data)
  sequence_num:   int (monotonically increasing within session)
}
```

### 7.2 Required Audit Event Types

| Event Type | Triggered By |
|---|---|
| `attack_resolved` | Hit Resolver |
| `armor_resolved` | Armor Resolver |
| `body_integrity_changed` | Body Integrity |
| `separation_triggered` | Body Integrity |
| `reattachment_resolved` | Body Integrity |
| `status_applied` | Status/Enchantment Resolver |
| `ability_granted` | Ability Graph |
| `ability_denied` | Ability Graph |
| `loot_generated` | Loot Generation |
| `xp_awarded` | Progression |
| `level_changed` | Progression |
| `economy_transacted` | Inventory/Economy |
| `match_formed` | Matchmaking |
| `match_outcome` | Matchmaking |
| `input_rejected` | Server validation |
| `exploit_flagged` | Anti-cheat |

### 7.3 Audit Integrity Chain

Audit records include a chained hash: each record's hash includes the previous record's hash. PROPOSED. This detects tampering with the audit log.

### 7.4 Audit Storage — PROPOSED

- Audit logs are append-only. PROPOSED.
- Distributed storage with redundancy. PROPOSED.
- Specific technology: UNKNOWN — selected with infrastructure.

---

## 8. Anti-Cheat Boundaries

Anti-cheat detection signatures, exact thresholds, and quarantine trigger conditions are NOT documented in public files. VERIFIED.

### 8.1 What Anti-Cheat Monitors — High Level Only

- Movement speed anomalies.
- Attack rate anomalies (inputs faster than physically possible).
- Damage value anomalies (client-reported vs. server-computed divergence).
- Economy accumulation anomalies.
- Replay divergence (submitted replay does not match authoritative log).

### 8.2 Anti-Cheat Response Levels — PROPOSED

| Level | Condition | Response |
|---|---|---|
| Monitor | Anomaly within tolerance | Record, continue monitoring |
| Flag | Anomaly exceeds soft threshold | Flag entity, increase audit depth |
| Quarantine | Anomaly exceeds hard threshold | Pause progression, quarantine item gains |
| Escalate | Pattern confirmed | Human review triggered |

Exact thresholds: NOT in this document. VERIFIED.

---

## 9. Exploit Quarantine System — PROPOSED

When an entity is flagged for anomalous behavior, the quarantine system:

1. Pauses all progression gains (XP, item drops) for the flagged entity. PROPOSED.
2. Preserves all evidence (replay, audit log snapshot) for review. PROPOSED.
3. Does not immediately ban — initial response is silent quarantine. PROPOSED.
4. Generates an internal review ticket. PROPOSED.
5. On review: ban, restore, or expand monitoring. PROPOSED.

The quarantine system must not be apparent to cheaters during the monitoring window. PROPOSED.

Privacy note: quarantined entities retain the right to contest findings through user support. PROPOSED.

---

## 10. Save System: Provenance Tracking and Cloud Sync

### 10.1 Save Design Principles

- All save writes are server-authoritative. VERIFIED.
- Client never writes save data directly; all changes flow through the authoritative simulation. VERIFIED.
- Each save record includes a provenance chain covering all significant state changes. VERIFIED design requirement.

### 10.2 Save Record Structure — PROPOSED

```
SaveRecord {
  entity_id:          string
  schema_version:     semver string
  tick_at_save:       int
  state_snapshot:     EntityState
  provenance_chain:   ProvenanceEntry[]
  contract_versions:  { schema_id: version }
  integrity_hash:     string
  saved_at:           ISO 8601 timestamp
}
```

### 10.3 Cloud Sync Requirements — PROPOSED

- Cloud sync uses last-write-wins with conflict detection on tick counter.
- If a conflict is detected, the higher tick value wins.
- Both conflicting states are retained for a recovery window. PROPOSED.
- Sync must be fully encrypted in transit. PROPOSED.
- Sync infrastructure details: UNKNOWN — not selected.

### 10.4 Offline Play — ASSUMPTION

- Limited offline play may be supported for solo content. ASSUMPTION: offline progression may be capped or restricted. Decision pending.
- Offline save records are reconciled with server on reconnect. PROPOSED.
- Server may reject offline progression that cannot be validated. PROPOSED.

### 10.5 Save Migration

On load, if `schema_version` does not match current version:
1. Migration pipeline applies forward migrations in order.
2. Each migration function is tested against reference save fixtures before deployment.
3. After migration, `integrity_hash` is recomputed.
4. Migration errors are logged and surfaced to support (not shown to player as error). PROPOSED.

---

## 11. Privacy: Audit Data Retention and User Rights

### 11.1 What Is Retained

| Data | Retention | Purpose |
|---|---|---|
| Authoritative simulation events | Investigation window (UNKNOWN: duration) | Anti-cheat, dispute resolution |
| Match outcome records | Long-term | Leaderboard integrity, ranked history |
| Economy transaction log | Long-term | Fraud investigation |
| Exploit flagging records | Long-term | Ban history, appeals |
| Chat or communication content | NOT retained in gameplay audit | Privacy |
| Exact movement traces | NOT retained long-term | Privacy — only aggregate signals |

### 11.2 User Rights — PROPOSED

- Users may request a summary of audit events associated with their account. PROPOSED.
- Users may request deletion of non-essential audit data (subject to fraud/ban exception). PROPOSED.
- Users may contest quarantine or ban decisions through a support channel. PROPOSED.
- Data export format and process: UNKNOWN — must be defined before live operation.

### 11.3 Legal Compliance

- Compliance with applicable data protection law: UNKNOWN — jurisdiction and legal review required before live operation. ASSUMPTION: GDPR-style rights as baseline.
- Retention periods must be established by legal review. UNKNOWN.

---

## 12. Glossary of Networking Terms

**Authoritative Server** — The server instance that runs the simulation and makes all gameplay-relevant decisions. VERIFIED design requirement.

**Client Prediction** — The client's local simulation of its own character state before server confirmation arrives.

**Dedicated Server** — A server instance with no player participant. Runs simulation only. PROPOSED for ranked/tournament play.

**Entity Interpolation** — Rendering entity positions between two known server states to produce smooth visual movement. Introduces a small (~100ms) delay.

**Jitter** — Variance in packet arrival timing. High jitter destabilizes interpolation buffers.

**Latency Compensation** — The server-side technique of evaluating hit contacts at the position the attacker saw them, not the position they were in when the server processed the packet.

**Listen Server** — A server instance hosted by one of the players. Lower cost; higher latency for non-host players.

**Packet Loss** — A packet that was sent but never received. Unreliable delivery mode accepts packet loss; reliable delivery retransmits.

**Reconciliation** — The client process of correcting its predicted state to match the authoritative server state after divergence.

**Reliable Ordered Delivery** — A transmission mode where packets are guaranteed to arrive and in the correct order. Higher overhead than unreliable.

**Replication** — The process of broadcasting server state changes to clients.

**Tick** — One discrete time step of the authoritative simulation. PROPOSED: 60 Hz.

**Tick Rate** — How many simulation ticks occur per second. Higher tick rate = more responsive feel; higher server cost.

**Unreliable Delivery** — A transmission mode where packets may be dropped. Lower overhead; appropriate for cosmetic state updates.

---

## 13. Anti-Cheat Philosophy

The anti-cheat system's effectiveness depends on players not knowing exactly where its boundaries are. This section discusses the philosophy without exposing those boundaries. VERIFIED.

### 13.1 Defense in Depth

Anti-cheat uses multiple independent detection layers:
- **Structural validation:** movement speed, attack rate, economy accumulation — these have upper bounds that cannot be exceeded legitimately.
- **Behavioral analysis:** patterns of optimal decision-making that exceed human reaction capacity.
- **Replay divergence:** if a submitted replay does not match the authoritative log, the session is suspect.
- **Statistical outlier detection:** outcomes that exceed N standard deviations from the population distribution for that account's history.

No single layer is sufficient. All layers are required.

### 13.2 Why Thresholds Are Private

If exact thresholds are known, a cheater operating at threshold − 1 gains permanent advantage without detection. Thresholds must be private to be effective. VERIFIED design principle.

### 13.3 Human Review Is Required

Automated systems produce flags; humans make ban decisions. PROPOSED. This prevents false positives from damaging legitimate accounts and ensures that contested flags can be reviewed with full context.

---

## 14. Network Quality Requirements for Ranked Play

Ranked PvP places higher demands on network quality than casual play. The following minimum network quality requirements are PROPOSED for ranked match entry:

| Requirement | PROPOSED Minimum |
|---|---|
| Round-trip latency to server | ≤ 150ms |
| Packet loss rate | ≤ 2% over 60 seconds |
| Jitter (variance in latency) | ≤ 40ms standard deviation |

Players outside these thresholds during a ranked match: PROPOSED — match may pause briefly to reconnect; if threshold is persistently exceeded, match continues but a network-quality indicator appears in UI.

These thresholds are PROPOSED and require playtest validation. NOT PERFORMED.

---

## 15. Replication Bandwidth Estimates — PROPOSED, NOT PERFORMED

At PROPOSED 20 Hz broadcast rate and estimated average packet sizes:

| Content | Estimated Size | Frequency | Bandwidth (per client) |
|---|---|---|---|
| Player position update | ~20 bytes | 20 Hz | ~400 bytes/s |
| Enemy position updates (8 entities) | ~160 bytes | 20 Hz | ~3,200 bytes/s |
| Body Integrity state deltas (on event) | ~50 bytes | Per event | Variable |
| Ability state updates | ~10 bytes | Per event | Variable |
| Total estimated | — | — | ~4–10 KB/s |

These estimates are DERIVED from assumed packet sizes and event rates. NOT VALIDATED. Actual measurement required once a prototype exists. NOT PERFORMED.

---

*Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853*
*See [ARCHITECTURE](ARCHITECTURE.md) for system boundaries. See [QA_STRATEGY](../production/QA_STRATEGY.md) for network fault testing.*
