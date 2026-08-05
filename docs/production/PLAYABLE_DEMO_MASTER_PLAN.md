# GUMFALL Playable Demo Master Plan

**Status:** PROPOSED production baseline  
**Owner and final merge authority:** Christopher Peterson

## Product order

1. Native Windows combat lab
2. Windows vertical slice
3. Closed PC technical alpha
4. PC production release
5. Android/iOS adaptation
6. MMO-scale expansion after operations are proven

The first product is an online action RPG with a shared hub and named/instanced zones. It is designed to grow toward an MMO without requiring the first demo to solve every MMO problem.

## Combat-lab scope

- movement, camera, and authored acceleration;
- dodge and input buffering;
- one Edgebearer light attack;
- regional Body Integrity damage;
- valid gummy-arm severing;
- Veilknife Assassin cloak, rear-arc backstab, conditional assassination, second-strike window, and NPC pickpocket;
- one eligible training enemy and one protected royal/boss-class target;
- deterministic rules and tests;
- local performance and input-to-action telemetry;
- packaged Windows build.

## Engine position

Unity 6.3 LTS with URP is the provisional primary spike because GUMFALL needs rapid C# iteration and PC/mobile quality tiers. Unity is not the final engine decision until real PC/mobile frame-time, memory, loading, build, test, networking, and workflow evidence is recorded.

## Safety and repository policy

- isolated branches and worktrees;
- draft pull requests;
- required checks;
- squash merge only;
- no agent approves or merges its own PR;
- no automatic semantic conflict resolution;
- no private legal, patent, credential, or minor-contributor records in this public repository;
- protected approval before Production deployment.

## First sprint sequence

### Sprint 0 — Foundation

- verify Unity version/modules;
- create project and primitive scene;
- add requirements/test traceability;
- add GitHub static/web/security workflows;
- run first build and tests.

### Sprint 1 — Smooth combat

- movement and camera;
- dodge;
- buffered attack;
- hit confirmation;
- frame-time and input-latency measurement.

### Sprint 2 — Gummy physicality

- Body Integrity;
- named regions;
- severing;
- detached-part identity;
- repair/reconnect regression tests.

### Sprint 3 — Assassin

- cloak/detection;
- backstab;
- conditional assassination;
- near-success follow-up;
- failed-assassination aggro;
- pickpocket and exploit tests.

## Release truthfulness

No number of tests proves there are no bugs. Promotion requires passing required tests, no unresolved P0/P1 defect, security and recovery review, telemetry, rollback, support readiness, and an explicit go/no-go decision.
