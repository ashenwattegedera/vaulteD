# 0004: Trunk-based development and Conventional Commits

- **Status**: accepted
- **Date**: 2026-10-11
- **Deciders**: Ashen Wattegedera

## Context

vaulteD is a portfolio project where process quality matters. It is
maintained by one person (plus agents), needs readable history, and will run
releases via release-please later.

## Decision drivers

- Small surface: changes should merge fast, not stack up on long-lived branches
- Fully automated changelogs and semantic versioning are desired
- Commit discipline must be enforceable by hooks, not memory

## Considered options

- **GitFlow-style long branches** — heavyweight for a one-maintainer repo;
  branch rot and painful merges.
- **Trunk-based, Conventional Commits, release-please** — short-lived
  branches, enforced message convention, automated version tags.

## Decision

Develop trunk-based off `main` (protected): one issue = one branch = one PR,
squash-merged, branches living hours to days. All commits follow
[Conventional Commits](https://www.conventionalcommits.org/) with types
`feat, fix, docs, chore, ci, refactor, test, build, perf, revert` and scopes
`backup, deploy, ci, docs, security, tests` where useful. Enforcement by
`conventional-pre-commit`. Releases use SemVer via release-please (a later
issue configures it).

## Consequences

- Positive: history reads as a changelog; merges are small and reviewable;
  release automation has a reliable input format.
- Negative: message convention is a hard gate (by design, enforced locally
  and later in CI).
