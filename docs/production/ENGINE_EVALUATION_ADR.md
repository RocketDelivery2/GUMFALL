# GUMFALL — Engine Evaluation Architectural Decision Record

**Status:** OPEN — No engine has been selected. VERIFIED.
**Label Policy:** VERIFIED | DERIVED | PROPOSED | ASSUMPTION | UNKNOWN | NOT PERFORMED
**Related:** [Architecture](../technical/ARCHITECTURE.md) · [Risk Register](RISK_REGISTER.md) · [Index](../INDEX.md)

---

## ADR Summary

| Field | Value |
|---|---|
| Decision | Select the game engine for GUMFALL |
| Status | **OPEN** — not decided |
| Owner | Design Authority (must assign to Architecture Lead) |
| Decision Deadline | UNKNOWN — owner must set |
| Blocking | All prototype phases, vertical slice, and all technical implementation |

---

## 1. Context

GUMFALL is a third-person physical action RPG with a set of requirements that are unusually demanding compared to conventional action games:

1. **Deterministic authoritative simulation.** The GelFlow combat system, Body Integrity, loot generation, and tournament seeding must all be reproducible bit-for-bit from identical inputs. This is a strict requirement (see [ARCHITECTURE](../technical/ARCHITECTURE.md) §6), and it constrains engine choice significantly.

2. **Per-region body state simulation.** Each entity in the game world has a distinct set of body regions (6–20 per entity) with individual integrity states. The engine must support efficient per-entity per-region data tracking without making this presentation-layer behavior.

3. **Procedural mesh deformation (presentation layer).** Visual gummy deformation, stretching, separation, and reattachment require either built-in procedural mesh support or a feasible custom solution in the chosen engine.

4. **Server-authoritative architecture.** All authoritative decisions must run on a dedicated (or listen) server. The engine must support or not prevent a clean server/client separation.

5. **Content-driven design.** All abilities, items, monsters, and progression gates are defined in data, not code. The engine must support data-driven content at scale without requiring engine source modification.

No engine has been evaluated yet. NOT PERFORMED.

---

## 2. Decision Criteria (Ranked)

The following criteria are ranked from most critical to least critical for GUMFALL's requirements:

### Criterion 1 — Deterministic Simulation Support (CRITICAL)

The engine must either:
- Natively support a deterministic fixed-tick simulation loop with fixed-point or strictly-controlled float arithmetic, OR
- Not prevent implementing such a simulation layer on top of the engine.

**Why critical:** If determinism cannot be achieved, the replay system, anti-cheat, and tournament integrity all fail. This is the hardest constraint to retrofit. See Risk R-001.

### Criterion 2 — Physics Simulation Quality and Control (HIGH)

The engine's physics system must be separable from the presentation physics. The game requires:
- Server-side physics validation (movement bounds, projectile trajectories).
- Client-side presentation physics (ragdoll, deformation, particle) that do not affect outcomes.

An engine that ties physics to the render loop makes this separation difficult.

### Criterion 3 — Procedural Mesh Deformation Capability (HIGH)

Visual gummy deformation is central to GUMFALL's aesthetic. The engine must support:
- Runtime mesh modification (vertex-level or blend shape).
- Skinned mesh manipulation for limb separation visuals.
- Custom material shaders for gummy appearance (translucency, subsurface).

### Criterion 4 — Animation System Flexibility (HIGH)

The engine must support:
- Inverse kinematics (IK) for limb repositioning after separation.
- Animation blending for fallback-ability transitions after limb loss.
- Ragdoll physics layered on top of animation state.
- Per-bone control for procedural animation.

### Criterion 5 — Networking: Server-Authoritative Support (HIGH)

The engine must have a viable path to server-authoritative networking:
- Dedicated server build target.
- Client-server input model.
- State replication with priority classification.
- OR: the networking layer is replaceable without deep engine coupling.

### Criterion 6 — Scripting / Data-Driven Content Support (MEDIUM-HIGH)

The engine must support content authoring at scale:
- Schema-validated data loading (JSON, custom format).
- Hot-reloading or fast iteration for content changes.
- Scripting layer accessible to non-engineers for quest, faction, and dialogue authoring.

### Criterion 7 — Platform Target Coverage (MEDIUM)

GUMFALL's target platforms are UNKNOWN. The engine should support at minimum PC (Windows, Linux) and have a realistic path to console and/or other platforms.

### Criterion 8 — Team Expertise and Hiring Market (MEDIUM)

The engine choice affects hiring. A niche engine reduces the talent pool. A mainstream engine may have more community resources but also more competition for senior engineers.

### Criterion 9 — Licensing and Costs (MEDIUM)

Engine licensing must be viable for an independent production. Revenue-share models, seat licenses, and source-access requirements all affect feasibility.

### Criterion 10 — Tooling Ecosystem for Content Authoring (MEDIUM)

The engine's editor and tooling ecosystem determines how efficiently the content authoring pipeline can be established. See [CONTENT_AUTHORING](../technical/CONTENT_AUTHORING.md).

### Criterion 11 — Modding and Hosting Future Potential (LOW for initial release)

Long-term, GUMFALL may benefit from player-hosted servers or modding support. This is a low-priority criterion for initial release but should not be actively blocked by the engine choice.

---

## 3. Candidate Engines — INFORMATIONAL, NOT RECOMMENDED

The following engines are known candidates for evaluation. No recommendation is made. No benchmarking has been performed. NOT PERFORMED.

### Candidate A: Unreal Engine (Epic Games)

**Known strengths relevant to GUMFALL:**
- Mature networking framework with server-authoritative support.
- Chaos Physics system with ragdoll and procedural animation capabilities.
- Material system capable of translucent/subsurface gummy appearance.
- Large hiring market.
- Dedicated server build support.

**Known trade-offs relevant to GUMFALL:**
- Determinism of the physics simulation: UNKNOWN — requires prototype evaluation. Chaos Physics has had determinism challenges in competitive contexts.
- Large engine footprint; steep learning curve for custom simulation layers.
- Revenue share model at certain revenue thresholds.
- C++ primary; Blueprint scripting for content authoring may not scale to all content types.

### Candidate B: Unity (Unity Technologies)

**Known strengths relevant to GUMFALL:**
- Large scripting ecosystem; C# accessible to generalist engineers.
- ECS/DOTS architecture may support deterministic simulation — requires evaluation.
- Large asset marketplace and hiring market.

**Known trade-offs relevant to GUMFALL:**
- Deterministic physics: Unity Physics (DOTS) has determinism potential but requires careful setup. Classic PhysX does not. Evaluation required.
- Procedural mesh deformation: possible via Unity Mesh API; less mature than Unreal's animation stack.
- Licensing changes (2023 runtime fee controversy): long-term cost model is less predictable.
- Networking: requires third-party solution (Netcode for GameObjects, Mirror, etc.) or custom.

### Candidate C: Godot (MIT License)

**Known strengths relevant to GUMFALL:**
- MIT licensed — no revenue share, no seat fees.
- Open source: engine can be modified if needed for simulation layer.
- Growing hiring market.

**Known trade-offs relevant to GUMFALL:**
- 3D capabilities and performance at GUMFALL's visual target: UNKNOWN — requires prototype.
- Procedural mesh deformation and advanced animation: less mature than Unreal/Unity.
- Dedicated server support: present but less battle-tested at scale.
- Deterministic simulation: would likely require custom implementation.

### Candidate D: Custom / Bespoke Engine

**Known strengths relevant to GUMFALL:**
- Full control over determinism, simulation architecture, and data-driven design.
- No licensing constraints.

**Known trade-offs relevant to GUMFALL:**
- Extreme engineering investment before any gameplay prototype is possible.
- Hiring challenge: requires engine generalists in addition to game engineers.
- Tooling must be built from scratch (content authoring pipeline, editors).
- High risk. Likely only viable with a very experienced core team.

### Candidate E: O3DE (Open 3D Engine, Apache 2.0 License)

**Known strengths relevant to GUMFALL:**
- Apache 2.0 license — no revenue share.
- Designed for server-authoritative multiplayer (networking gem system).
- C++ primary with Lua scripting.

**Known trade-offs relevant to GUMFALL:**
- Small hiring market and limited community resources.
- Documentation and tooling maturity: lower than Unreal/Unity.
- Procedural mesh and advanced animation: requires evaluation.
- Determinism: UNKNOWN — requires prototype.

---

## 4. Evaluation Methodology

Before the decision is made, the following prototype investigations must be completed. NOT PERFORMED.

### Prototype 1 — Determinism Proof of Concept

Build a minimal simulation loop in each candidate engine:
- Fixed-tick loop at 60 Hz.
- Two entities with position, velocity, and collision.
- Fixed random number sequence.
- Record all outputs for N ticks.
- Replay the same inputs. Verify bit-identical output.

**Pass criterion:** Bit-identical output on the same platform.
**Stretch criterion:** Bit-identical output across platforms (Windows and Linux minimum).

### Prototype 2 — Body Integrity Simulation Budget

Build a scene with 32 entities, each with 8 simulated body regions:
- Each region tracks an integer integrity value.
- Per-tick: apply one damage event to a random region for each entity.
- Measure: simulation tick time in ms.

**Pass criterion:** Total simulation time ≤ 2ms per tick.

### Prototype 3 — Procedural Mesh Deformation

Build a single gummy character model:
- Apply runtime vertex deformation (stretch, compress).
- Trigger a limb separation: detach one mesh segment.
- Apply IK to remaining skeleton.

**Pass criterion:** Visual quality meets minimum acceptable standard. Deformation operates at 60 fps.

### Prototype 4 — Server-Authoritative Networking

Build a minimal 2-player session:
- Server runs authoritative simulation.
- Client sends input, receives state update.
- Client predicts movement locally.
- Server reconciles on mismatch.

**Pass criterion:** Inputs reliably reach server; reconciliation occurs without visible pop at 60ms simulated latency.

---

## 5. Decision Timeline

The decision deadline is UNKNOWN. The owner must establish:

1. A deadline for completing Prototypes 1–4.
2. A decision review meeting with Design Authority, Architecture Lead, and Production Lead.
3. A ratification step: decision recorded in this document and in [DECISION_LOG](../governance/DECISION_LOG.md).

**Risk:** Every week without an engine decision delays the prototype phases. See Risk R-002.

---

## 6. Consequences of Each Direction

| Direction | Enables | Risks |
|---|---|---|
| Major commercial engine (Unreal/Unity) | Larger talent pool, more tooling, faster initial prototype | Determinism not guaranteed; licensing cost; less control |
| Open-source engine (Godot/O3DE) | Full source control, no licensing cost | Smaller talent pool, potentially more custom work |
| Custom engine | Maximum control, perfect fit for requirements | Extreme cost and schedule risk |

---

## 7. What This Decision Gates

The engine decision is a hard prerequisite for:

- Vertical Slice Phase 0 (project scaffold).
- Character Motor implementation.
- Body Integrity prototype.
- Networking replication prototype.
- Content authoring tooling selection.
- Performance budget validation.
- All hiring decisions for engineers.

Until this decision is made, all downstream work is design-only. VERIFIED.

---

*Last updated: 2026-08-02 | Branch: design/full-game-bible-20260802-223853*
*Owner must set decision deadline. See [DECISION_LOG](../governance/DECISION_LOG.md) for tracking.*
