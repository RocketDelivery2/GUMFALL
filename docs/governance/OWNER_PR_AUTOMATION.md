# Owner PR Automation

**Status:** VERIFIED for automatic merge / EXTERNAL AUTOMATION for PR creation.

GUMFALL automatically validates and squash-merges eligible owner-authored pull requests after the owner gate succeeds.

## Automatic merge

The repository-native owner merge workflow runs after the dedicated owner PR gate succeeds.

The gate requires:

- `tools/Validate-Docs.ps1`
- `tools/Test-Production-Foundation.ps1 -Root $PWD`
- `tools/Test-EngineEvaluationEvidence.ps1 -Root $PWD`
- `tools/Test-EngineEvaluationDeterminismTraceTool.ps1 -Root $PWD`
- `git diff --check`

Automatic merge applies only when the pull request:

- was opened by `RocketDelivery2`;
- originates from `RocketDelivery2/GUMFALL`;
- targets `main`;
- is open and not a draft;
- has the exact head SHA that passed the gate;
- is mergeable;
- does not opt out with `[manual]` or a `manual-merge` label.

## Automatic PR creation

Repository-native GitHub Actions PR creation is not currently enabled because the repository Actions setting rejects PR creation by `GITHUB_TOKEN` with:

`GitHub Actions is not permitted to create or approve pull requests.`

To avoid a failing workflow on every branch push, PR creation is handled by the connected GitHub automation outside GitHub Actions.

Eligible owner branches use these prefixes:

- `design/`
- `docs/`
- `fix/`
- `feat/`
- `foundation/`
- `automation/`
- `ci/`
- `test/`
- `chore/`

The automation should create a PR only when the branch is ahead of `main`, no open PR exists, and no manual opt-out is present.

## Opt out

Use either:

- `[manual]` in the commit or PR title;
- the `manual-merge` label; or
- a `manual/` branch.

## Scope

This automates repository integration only. It does not turn unexecuted tests into passing evidence and does not authorize private legal, patent, credential, or minor data to enter the public repository.
