# Owner PR Auto-Merge Policy

**Status:** VERIFIED workflow policy after merge.

Owner-authored pull requests targeting `main` may be squash-merged automatically after the dedicated GUMFALL owner PR gate passes.

The gate runs:

- `tools/Validate-Docs.ps1`
- `tools/Test-Production-Foundation.ps1 -Root $PWD`
- `tools/Test-EngineEvaluationEvidence.ps1 -Root $PWD`
- `tools/Test-EngineEvaluationDeterminismTraceTool.ps1 -Root $PWD`
- `tools/Test-EngineEvaluationBodyIntegrityTimingTool.ps1 -Root $PWD`
- `git diff --check`

Automatic merge applies only when all of these are true:

- the pull request was opened by `RocketDelivery2`;
- the head branch is in `RocketDelivery2/GUMFALL`;
- the base branch is `main`;
- the pull request is open and not a draft;
- the head SHA is the exact SHA that passed the gate;
- GitHub reports the pull request mergeable;
- the PR title does not contain `[manual]`;
- the PR does not carry a `manual-merge` label.

A new commit invalidates the prior gate run and requires a fresh successful run before automatic merge.

Pull requests from forks or other authors are never auto-merged by this workflow.

Use `[manual]` in the PR title whenever a change should remain human-merge-only.
