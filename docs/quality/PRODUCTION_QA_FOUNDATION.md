# Production QA Foundation

**Status:** PROPOSED

The downloadable production package contains a traceability workbook with 140 requirements and 572 mapped test cases. Those cases are a plan, not evidence that 572 tests are implemented or passing.

## Test layers

- pure C# unit tests for combat, Body Integrity, input buffer, Assassin, inventory, idempotency, and priority rules;
- Unity EditMode tests for deterministic rules, content identifiers, serialization, and build configuration;
- Unity PlayMode tests for movement, dodge, attacks, enemies, zone loading, UI, and performance probes;
- API unit/integration tests for status, security headers, telemetry validation, rate limiting, and authentication policy;
- end-to-end tests for account, character, zone, combat, reward, repair, reconnect, support, and deployment;
- load, spike/pump, stress, soak, recovery, security, and exploit-regression tests;
- human combat/playability tests after automated entry gates pass.

## Release blockers

A build cannot advance when:

- compilation or required tests fail;
- an unresolved P0/P1 remains;
- state corruption is unexplained;
- security gates fail;
- performance SLOs fail without an explicit accepted exception;
- rollback/recovery is unavailable;
- telemetry is missing;
- the artifact cannot be traced to source and tests.

## Regression policy

For each accepted defect:

1. link requirement and defect;
2. preserve exact reproduction;
3. create a failing test first when practical;
4. implement the fix;
5. run targeted and relevant broad suites;
6. store evidence;
7. add the case permanently.

AI may draft a test, but a human verifies that it fails before the fix and passes for the intended reason.

## Performance and pump testing

Profiles include:

- login burst;
- sudden zone population;
- combat-event throughput;
- inventory mutation burst;
- event reward payout;
- disconnect/reconnect wave;
- telemetry backlog;
- deployment restart;
- regional failure;
- 8-hour and 24-hour soak.

Do not load-test Production without an approved plan.

## Playtest gates

1. Local combat lab — developer and 3–8 trusted adults; parent-supervised child feedback.
2. Friends/family technical test — 10–20 invitees.
3. Closed technical alpha — 50–100 invited PC testers.
4. Closed alpha — 250–500 players in waves, subject to actual capacity.
5. PC beta — larger opt-in population after operational gates.
6. Mobile device lab — after PC combat/backend rules are proven.

## Honest quality goal

Testing cannot promise a bug-free game. It reduces risk, limits blast radius, detects failure quickly, preserves evidence, and makes recovery possible.
