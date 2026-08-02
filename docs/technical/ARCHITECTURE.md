# Technical Architecture

## Status

The implementation engine and networking technology have not been selected.

## Required Architectural Boundaries

The eventual implementation should separate:

1. Authoritative combat simulation
2. Character movement
3. Ability definitions
4. Hit and armor resolution
5. Body-integrity state
6. Monster AI
7. Progression
8. Inventory and economy
9. Loot generation
10. Presentation and procedural deformation
11. Multiplayer replication
12. Audit and anti-cheat systems

## Determinism

Authoritative systems must use deterministic, server-validated rules.

Presentation physics must not determine:

- Whether an attack hit
- Damage dealt
- Limb separation
- Item drops
- XP
- PvP results

## Prototype Scope

The first vertical slice should prove:

- Edgebearer sword combat
- Pinshot projectile pinning
- Bearkin anatomy
- Bronze armor
- Limb separation and reattachment
- Three ordinary monsters
- One elite enemy
- Levels 1–3
- One compact arena
