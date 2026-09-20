# Engine Evaluation — Server Authority Evidence Record

**Status:** EVIDENCE TEMPLATE — no candidate result recorded
**Parent:** Issue #30 / Issue #3 / DEC-001
**Runbook:** [ENGINE_EVALUATION_RUNBOOK.md](ENGINE_EVALUATION_RUNBOOK.md)

This record captures Prototype 4 server-authority and reconciliation evidence. It does not run a network test and does not select or rank an engine.

## Candidate Execution

| Field | Value |
|---|---|
| Candidate | UNKNOWN |
| Engine/version | UNKNOWN |
| Source SHA | UNKNOWN |
| Server build | NOT PERFORMED |
| Client build | NOT PERFORMED |
| Execution date | NOT PERFORMED |

## Network Conditions

- Client count: NOT PERFORMED
- Simulated one-way/round-trip latency configuration: NOT PERFORMED
- ADR target condition: 60 ms simulated latency
- Packet loss/jitter configuration: NOT PERFORMED
- Server process type: NOT PERFORMED

## Authority Checks

- [ ] Clients send inputs rather than authoritative combat outcomes.
- [ ] Server advances authoritative simulation state.
- [ ] Authoritative state is returned to both clients.
- [ ] A deliberate client prediction mismatch is injected.
- [ ] The mismatch produces a reconciliation event.
- [ ] Reconciliation does not transfer outcome authority to the client.
- [ ] Disconnect/desync errors are recorded rather than hidden.

## Required Logs

### Ordered input log

**Artifact:** NOT PERFORMED

The retained log must identify ordered client inputs sufficiently to correlate them with authoritative server processing.

### Authoritative state log

**Artifact:** NOT PERFORMED

The retained log must identify the server-produced state used for reconciliation.

### Reconciliation event log

**Artifact:** NOT PERFORMED

Record at minimum:

- event/tick identifier;
- client identifier or role without private account data;
- predicted value/state reference;
- authoritative value/state reference;
- correction magnitude or equivalent measurable delta where available;
- correction completion time where available.

### Errors / desyncs

**Artifact:** NOT PERFORMED

Record disconnects, rejected inputs, desync detection, unhandled exceptions, and test-harness failures.

## Human Visible-Pop Review

**Capture artifact:** NOT PERFORMED

**Result:** NOT PERFORMED

Allowed values after review:

- ACCEPTABLE FOR ENGINE EVALUATION;
- NOT ACCEPTABLE FOR ENGINE EVALUATION;
- BLOCKED — capture/test insufficient for judgment.

The visible-pop judgment is human review and cannot be inferred from logs alone.

## Prototype 4 Result

**Result:** NOT PERFORMED

Allowed result states:

- PASS;
- FAIL;
- BLOCKED;
- NOT PERFORMED.

A PASS requires evidence that inputs reached the authoritative server, authoritative state returned to both clients, the deliberate mismatch reconciled without violating server authority, and the human visible-pop criterion was reviewed.

## Governance

- [ ] No production credential, token, private endpoint, IP address, hostname, account identifier, or anti-cheat secret is included.
- [ ] No PASS/FAIL result is inferred from vendor documentation.
- [ ] The result references the exact source SHA used for the server/client builds.
- [ ] DEC-001 remains unchanged by this result alone.
