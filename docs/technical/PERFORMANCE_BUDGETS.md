# GUMFALL — Performance Budgets

**Status:** DRAFT — All budgets are DESIGN TARGETS. No performance testing has been performed (NOT PERFORMED).
**Label Policy:** VERIFIED | DERIVED | PROPOSED | ASSUMPTION | UNKNOWN | NOT PERFORMED
**Related:** [Architecture](ARCHITECTURE.md) · [QA Strategy](../production/QA_STRATEGY.md) · [Index](../INDEX.md)

> **Important:** All frame time budgets, hardware tier targets, and throughput figures in this document are design targets used to guide architecture decisions. No validation, benchmarking, or profiling has been performed. NOT PERFORMED. Values will require empirical measurement once a prototype exists.

---

## 1. Performance Philosophy

> **Fun is the priority. Performance enables fun.**

GUMFALL's performance targets are derived from the player experience they must support:

- GelFlow combat must feel immediate and responsive. Simulation latency must be imperceptible.
- Body Integrity events (limb separation, reattachment) must occur without frame-rate disruption.
- Presentation physics (gummy deformation, ragdoll) may be reduced gracefully under load — they must never block simulation outcomes.
- Multiplayer sessions must remain stable under network variance.

### 1.1 Inviolable Performance Rules

The following may never be traded for frame rate:

1. **Deterministic simulation tick must complete before the next tick begins.** VERIFIED design requirement.
2. **Server authoritative outcomes must not be deferred to presentation frames.** VERIFIED.
3. **Body Integrity state changes are applied server-side immediately, not interpolated.** VERIFIED.
4. **Audit logging must not block the simulation tick.** PROPOSED: async log queue.

---

## 2. Target Hardware Tiers — PROPOSED, NOT PERFORMED

These tiers are design targets to guide architecture and asset budgets. They have not been validated against actual hardware. NOT PERFORMED.

### 2.1 Minimum Tier — PROPOSED

Intended to make GUMFALL playable at reduced visual quality.

| Component | PROPOSED Target |
|---|---|
| CPU | Quad-core, ~2.5 GHz |
| RAM | 8 GB system |
| GPU | Integrated / Entry discrete (circa 2018 equivalent) |
| Storage | HDD acceptable; ~30 GB install ASSUMPTION |
| Network | 10 Mbps reliable; 100ms ping |
| Target frame rate | 30 fps at reduced settings |

### 2.2 Recommended Tier — PROPOSED

Intended for full visual experience and comfortable PvP play.

| Component | PROPOSED Target |
|---|---|
| CPU | 6-core, ~3.5 GHz |
| RAM | 16 GB system |
| GPU | Mid-range discrete (circa 2020 equivalent) |
| Storage | SSD preferred; ~30 GB install ASSUMPTION |
| Network | 25 Mbps reliable; 60ms ping |
| Target frame rate | 60 fps at standard settings |

### 2.3 High-End Tier — PROPOSED

Intended for maximum visual fidelity and tournament-level play.

| Component | PROPOSED Target |
|---|---|
| CPU | 8-core, ~4.0 GHz |
| RAM | 32 GB system |
| GPU | High-end discrete (current generation equivalent) |
| Storage | NVMe SSD; ~30 GB install ASSUMPTION |
| Network | 50+ Mbps reliable; <30ms ping |
| Target frame rate | 60–120 fps at maximum settings |

Exact platform targets (console generations, mobile, etc.): UNKNOWN.

---

## 3. Frame Time Budgets by System — DESIGN TARGETS, NOT PERFORMED

At 60 fps, total frame budget is ~16.7ms.
At 30 fps, total frame budget is ~33.3ms.

The following allocation is a design target for 60 fps on the Recommended Tier. NOT PERFORMED — no profiling has occurred.

| System | PROPOSED Budget | Notes |
|---|---|---|
| Simulation Core (tick) | ≤ 2.0ms | Must complete every server tick |
| Hit Resolver | ≤ 0.5ms | Per-tick, all active attacks |
| Armor + Body Integrity | ≤ 0.5ms | Per-tick, all active contacts |
| Monster AI | ≤ 1.5ms | Per-tick, all active AI agents |
| Status / Enchantment | ≤ 0.3ms | Per-tick decay and application |
| Presentation Physics | ≤ 3.0ms | GPU-assisted where possible |
| Rendering | ≤ 6.0ms | Depends heavily on scene complexity |
| Audio | ≤ 0.5ms | Mix and dispatch |
| UI | ≤ 0.5ms | Layout and draw |
| Network (receive + dispatch) | ≤ 0.5ms | I/O budget |
| Headroom / OS | ≤ 1.4ms | OS scheduling tolerance |
| **Total** | **≤ 16.7ms** | **60 fps target** |

These are rough allocation targets to prevent any single system from consuming the full budget. All values require profiling validation. NOT PERFORMED.

---

## 4. Simulation Performance Rules

### 4.1 Determinism Is Not Traded for Performance

The simulation tick must complete before advancing to the next tick. VERIFIED. If a tick exceeds its budget:
- On server: the simulation slows down (tick delay). Client presents with buffered interpolation.
- On client: prediction desync may occur; reconciliation handles correction.
- The tick must NOT be skipped, and outcomes must NOT be approximated for speed.

### 4.2 Simulation Thread Isolation — PROPOSED

The simulation core should run on a dedicated thread (or process) isolated from rendering and audio. PROPOSED. This prevents rendering hitches from interrupting simulation ticks.

### 4.3 Fixed-Point Arithmetic Performance — UNKNOWN

If the engine requires software fixed-point arithmetic for determinism, the performance cost must be measured. NOT PERFORMED. This is a known risk (see [RISK_REGISTER](../production/RISK_REGISTER.md)).

---

## 5. Body Integrity Simulation Budget — PROPOSED

Body Integrity is the most expensive per-entity simulation system due to per-region state tracking.

| Metric | PROPOSED Target | Notes |
|---|---|---|
| Max concurrent tracked entities | 64 per zone | ASSUMPTION — requires profiling |
| Regions per entity | 8–20 ASSUMPTION | Varies by lineage/monster anatomy |
| State evaluation per entity per tick | ≤ 0.03ms | PROPOSED per-entity budget |
| Separation event processing | ≤ 0.1ms per event | Includes fallback activation |
| Reattachment proximity check | ≤ 0.05ms | Server-validated |

At 64 entities with 20 regions each = 1,280 region states per tick. This is a known scalability concern. ASSUMPTION: within budget at recommended tier. NOT PERFORMED.

---

## 6. AI Group Coordination Budget — PROPOSED

| Metric | PROPOSED Target | Notes |
|---|---|---|
| Max active AI agents per zone | 32 ASSUMPTION | Requires profiling |
| AI evaluation per agent per tick | ≤ 0.05ms | Simple FSM target |
| Group coordination evaluation | ≤ 0.2ms per group | Morale, target sharing |
| Surrender evaluation | ≤ 0.02ms per agent | On trigger events only |

Anti-repetition logic (consecutive identical decisions require varied timing) adds overhead. ASSUMPTION: negligible at reasonable agent counts.

---

## 7. Asset Streaming Budget — PROPOSED

| Metric | PROPOSED Target | Notes |
|---|---|---|
| Zone load time | ≤ 5 seconds PROPOSED | From transition trigger to playable |
| Zone streaming during play | ≤ 0.5ms/frame PROPOSED | Background streaming |
| Texture streaming pool | UNKNOWN | Depends on engine |
| Audio streaming pool | UNKNOWN | Depends on engine |
| Maximum single asset size | UNKNOWN | Depends on content pipeline |

---

## 8. Network Performance Budget — PROPOSED

| Metric | PROPOSED Target | Notes |
|---|---|---|
| Client input upload | ≤ 2 KB/s per client PROPOSED | At 60 Hz input rate |
| Server state broadcast | ≤ 10 KB/s per client PROPOSED | At 20 Hz broadcast rate |
| Maximum simultaneous clients per server | UNKNOWN | Scale testing not performed |
| Packet loss tolerance | Up to 5% without gameplay degradation PROPOSED | |
| Reconnection window | ≤ 10 seconds PROPOSED | Before session is abandoned |

---

## 9. Performance Testing Methodology Requirements — NOT PERFORMED

No performance testing has been conducted. NOT PERFORMED. The following defines what must be established when testing becomes possible.

### 9.1 Required Test Environments

- Minimum-tier hardware environment simulating minimum spec. PROPOSED.
- Recommended-tier hardware environment. PROPOSED.
- Network emulation environment capable of introducing latency, jitter, and packet loss. PROPOSED.

### 9.2 Required Benchmark Scenarios

- Solo play: Bearkin Edgebearer in Bronze Paw encounter (from vertical slice). PROPOSED.
- Maximum entity density: 32+ monsters simultaneously active. PROPOSED.
- Body Integrity stress test: 32 entities all undergoing simultaneous limb separation. PROPOSED.
- PvP arena: 8-player arena match under 60ms simulated latency. PROPOSED.
- Shattercrown stress: 32-player zone under 100ms simulated latency. PROPOSED.

### 9.3 Performance Regression Detection — PROPOSED

- Automated benchmark suite runs on each build. PROPOSED.
- Regression alert if any system exceeds its budget by >20%. PROPOSED.
- Profiling data retained per build for trend analysis. PROPOSED.

---

## 10. Accessibility Performance Considerations

Accessibility modes must not significantly reduce performance for players who need them. VERIFIED design requirement.

- Reduced body-separation presentation mode: presentation physics are simplified, which REDUCES load, not increases. VERIFIED.
- Reduced camera motion mode: eliminates camera shake calculations. Performance-neutral or better. VERIFIED.
- Photosensitivity mode: suppresses flash-triggering particle effects. PROPOSED: reduces GPU load.

---

## 11. Multi-Player Performance Considerations — PROPOSED, NOT PERFORMED

### 11.1 Co-op Performance (2 Players)

Co-op play adds a second Character Motor, second Ability Graph, and doubles the simulation event volume per tick. PROPOSED budget impact: +15–20% simulation cost. ASSUMPTION.

### 11.2 Arena Performance (8 Players)

8-player arenas are the maximum structured PvP format. At 8 players plus any NPC participants:
- Body Integrity tracking: 8 × 6 regions = 48 player regions minimum.
- Character Motor: 8 simultaneously tracked positions.
- Replication: 8 clients receive state updates at 20 Hz.

This is a known performance stress point. Load testing is required before arena format is locked. NOT PERFORMED.

### 11.3 Shattercrown Performance (32+ Players)

Shattercrown open-PvP may have 32+ players in a zone simultaneously. This exceeds the 8-player arena design by 4×. PROPOSED mitigation: reduce AI agent density in Shattercrown zones to compensate for player entity overhead. ASSUMPTION.

Entity count cap per Shattercrown zone: UNKNOWN — requires load testing. NOT PERFORMED.

---

## 12. Platform-Specific Performance Considerations

Target platforms: UNKNOWN. No platform has been selected. VERIFIED.

When platforms are selected, the following must be evaluated:

- Console platforms may have fixed memory and CPU budgets below the PC minimum tier.
- Mobile platforms (if targeted) require a separate tier assessment — current minimum tier PROPOSED targets are not mobile-appropriate. ASSUMPTION.
- Platform-native fixed-point support varies. This affects the determinism approach and simulation performance.

All platform performance targets will require re-specification when platforms are chosen. This document will be updated at that time.

---

## 13. Performance Monitoring During Development — PROPOSED

### 13.1 Performance Budget Tracking

Each system's frame time contribution should be tracked during development, not just at milestones. PROPOSED: integrate a lightweight profiling overlay in development builds that displays per-system tick time.

### 13.2 Early Warning System

A build is flagged for performance review when any single system exceeds its PROPOSED budget by more than 30% on the Recommended Tier hardware. This prevents gradual degradation that only becomes visible at milestone.

### 13.3 Performance Regression in Content Changes

Content changes (adding monsters, increasing region count) can introduce performance regressions without code changes. Content review must include an estimate of simulation cost impact for any content that increases:
- Entity count per zone.
- Region count per anatomy.
- Active AI agent count per encounter.

PROPOSED: balance review includes a simulation cost checkmark for content that exceeds defined thresholds.

---

## 14. Performance Budget Summary Table

All values PROPOSED — NOT PERFORMED.

| System | 60 fps Budget | 30 fps Budget | Priority |
|---|---|---|---|
| Simulation Core | ≤ 2.0ms | ≤ 4.0ms | INVIOLABLE |
| Hit Resolver | ≤ 0.5ms | ≤ 1.0ms | Critical |
| Armor + Body Integrity | ≤ 0.5ms | ≤ 1.0ms | Critical |
| Monster AI | ≤ 1.5ms | ≤ 3.0ms | High |
| Status/Enchantment | ≤ 0.3ms | ≤ 0.6ms | High |
| Presentation Physics | ≤ 3.0ms | ≤ 6.0ms | Medium (reducible) |
| Rendering | ≤ 6.0ms | ≤ 12.0ms | Medium (settings-controlled) |
| Audio | ≤ 0.5ms | ≤ 1.0ms | High |
| UI | ≤ 0.5ms | ≤ 1.0ms | High |
| Network | ≤ 0.5ms | ≤ 0.5ms | High |
| Headroom | ≤ 1.4ms | ≤ 4.2ms | OS/scheduler |
| **Total** | **≤ 16.7ms** | **≤ 33.3ms** | |

Presentation Physics is the only system whose budget can be reduced by player settings (graphics quality) or accessibility options (reduced body-separation mode). All other systems run at full budget regardless of settings. VERIFIED design principle.

---

## 15. Performance Degradation Policy

When a build exceeds performance targets on the Recommended Tier:

1. The excess is documented in the build report.
2. If the excess is ≤ 20% over budget in any single system: monitor next build.
3. If the excess is > 20% over budget in any single system: performance investigation required before next milestone.
4. If the simulation core exceeds its budget at all: IMMEDIATE investigation regardless of magnitude.

The simulation core is the only inviolable budget. Presentation, rendering, and audio budgets are guidelines that may flex with content settings. VERIFIED.

---

*Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853*
*All budgets are design targets only. No profiling has been performed (NOT PERFORMED).*
*See [QA_STRATEGY](../production/QA_STRATEGY.md) for performance test approach.*
