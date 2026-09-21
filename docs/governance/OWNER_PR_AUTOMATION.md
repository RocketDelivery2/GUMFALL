# Owner PR Automation

**Status:** VERIFIED automatic merge / EXTERNAL AUTOMATION for PR creation.

GUMFALL automatically validates and squash-merges eligible owner-authored pull requests after the owner gate succeeds.

## Automatic merge

The repository-native owner merge workflow runs after the dedicated owner PR gate succeeds.

The gate requires:

- `tools/Validate-Docs.ps1`
- `tools/Test-Production-Foundation.ps1 -Root $PWD`
- `tools/Test-EngineEvaluationEvidence.ps1 -Root $PWD`
- `tools/Test-EngineEvaluationDeterminismTraceTool.ps1 -Root $PWD`
- `tools/Test-EngineEvaluationBodyIntegrityTimingTool.ps1 -Root $PWD`
- `tools/Test-EngineEvaluationPassContractTool.ps1 -Root $PWD`
- `tools/Test-EngineEvaluationFrameTimingTool.ps1 -Root $PWD`
- `tools/Test-EngineEvaluationReconciliationTool.ps1 -Root $PWD`
- `tools/Test-EngineEvaluationCandidateDiscoveryTool.ps1 -Root $PWD`
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

Repository-native PR creation was retested on 2026-09-20 after restoring `.github/workflows/gumfall-owner-auto-pr.yml`.

The push-triggered workflow received `pull-requests: write`, but GitHub returned HTTP 403:

`GitHub Actions is not permitted to create or approve pull requests.`

The failing workflow was removed again so normal owner branch pushes do not generate a known-failing Action.

PR creation therefore remains handled by the connected GitHub automation outside GitHub Actions. Eligible owner branches include:

- `design/`
- `docs/`
- `fix/`
- `feat/`
- `foundation/`
- `automation/`
- `ci/`
- `test/`
- `chore/`
- `tools/`
- `schema/`

The external automation creates a PR only when the branch is ahead of `main`, no equivalent open PR exists, and no manual opt-out applies.

Repository-native PR creation can be reconsidered only after the repository setting that permits Actions to create pull requests is independently verified enabled.
## Opt out

Use either:

- `[manual]` in the commit or PR title;
- the `manual-merge` label; or
- a `manual/` branch.

## Scope

This automates repository integration only. It does not turn unexecuted tests into passing evidence and does not authorize private legal, patent, credential, or minor data to enter the public repository.
