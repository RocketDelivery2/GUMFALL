# Owner PR Automation

**Status:** VERIFIED workflow policy after merge.

GUMFALL can automatically create and merge owner-authored pull requests.

## Automatic PR creation

A push by `RocketDelivery2` to one of these branch prefixes can create a pull request to `main` automatically when the branch is ahead of `main` and no open PR already exists:

- `design/`
- `docs/`
- `fix/`
- `feat/`
- `foundation/`
- `automation/`
- `ci/`
- `test/`
- `chore/`

The PR is created ready for review so the owner gate can run.

## Automatic merge

The existing owner merge workflow squash-merges the exact tested head SHA after:

- `tools/Validate-Docs.ps1`
- `tools/Test-Production-Foundation.ps1 -Root $PWD`
- `git diff --check`

The pull request must still be mergeable, same-repository, owner-authored, open, non-draft, and target `main`.

## Opt out

Use either:

- `[manual]` in the latest commit or PR title; or
- the `manual-merge` label.

A branch beginning with `manual/` is never auto-created as a PR.

## Scope

This automates repository integration only. It does not turn generated or unexecuted tests into passing evidence, and it does not authorize secrets or private legal records to enter the public repository.
