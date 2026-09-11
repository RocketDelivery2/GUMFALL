# Unity and Azure Production Foundation

**Status:** PROPOSED and evidence-gated — all Unity, Azure, .NET, and PlayFab references are candidate options only. No engine, language, persistence system, or deployment platform is selected while [DEC-001](../governance/DECISION_LOG.md#dec-001) remains OPEN.

## Unity client

- Unity 6.3 LTS provisional spike;
- native Windows first;
- Android/iOS adaptation second;
- URP quality tiers after the primitive combat lab passes;
- named additive zones and asynchronous content;
- client prediction with server reconciliation;
- no embedded cloud secrets.

Unity reads/writes the local project directory. It does not require repository administrator access or permanent GitHub credentials.

## Authority boundary

The server owns:

- damage and Body Integrity;
- assassination eligibility;
- pickpocket outcome;
- inventory and currency;
- loot and progression;
- quest completion;
- sanctions and exploit rollback.

The client presents, predicts, and sends sequence-validated commands.

## Web and services

- ASP.NET Core on .NET 10;
- public website, status, download, support, and legal pages;
- authenticated player portal;
- separate role-protected GM/admin surface;
- telemetry gateway;
- health/readiness endpoints;
- relational authoritative state and auditable mutation ledger.

## Azure

Environments:

- Local
- Dev
- QA
- Staging
- Production

Initial services:

- App Service or evaluated Container Apps;
- Application Insights / Log Analytics;
- Key Vault;
- federated GitHub Actions identity through OIDC;
- protected GitHub environments;
- Bicep infrastructure as code.

Production requires a protected-environment review. Long-lived service-principal passwords are not stored in the repository.

## Account protection

Evaluate Entra External ID or another validated game identity provider for:

- MFA;
- passkeys;
- Google;
- Apple;
- Steam;
- Microsoft;
- explicit account linking;
- session rotation/revocation;
- auditable recovery.

Developer and GM identities remain separate from player identities.

## Telemetry

The distributed Unity client does not receive the Application Insights connection string. It sends bounded allowlisted events through an authenticated/rate-limited gateway or selected game telemetry service.

Backend services use OpenTelemetry/Application Insights for logs, metrics, traces, exceptions, dependencies, and custom meters/activities.

## Exploit remediation

Every valuable mutation records transaction ID, account/character, source, build, server, time, correlation, prior/new state, and provenance.

Confirmed exploit remediation identifies affected mutations, quarantines uncertainty, reverses invalid gains, restores legitimate state where possible, records evidence, supports appeal, and adds regression coverage.

## PlayFab

PlayFab may be spiked for authentication/provider linking, player data, telemetry, and multiplayer server allocation. Game rules remain behind provider-neutral interfaces until cost, portability, data export, account linking, regional availability, and operations are measured.
