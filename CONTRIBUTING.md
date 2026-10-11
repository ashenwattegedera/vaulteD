# Contributing to vaulteD

Thanks for helping. Read [AGENTS.md](AGENTS.md) first — the boundaries there
apply to humans as much as to agents.

## Dev setup

See [docs/getting-started/dev-environment.md](docs/getting-started/dev-environment.md).
Short version:

```sh
make setup   # install git hooks (pre-commit + commit-msg)
make check   # lint + test + gitleaks scan
```

## Branch strategy

Trunk-based development off `main`. `main` is protected; branches are
short-lived (hours to days) and land via squash-merge PRs.

Branch naming: `feat|fix|chore|docs|ci/<issue>-<short-slug>`, e.g.
`chore/1-repo-skeleton`.

## Commits

[Conventional Commits](https://www.conventionalcommits.org/), one logical
change per commit, enforced by the `conventional-pre-commit` commit-msg hook:

```text
feat: add Tailscale Serve config helper
fix(backup): quote paths in restic wrapper
docs: add ADR 0003
```

Useful scopes: `backup`, `deploy`, `ci`, `docs`, `security`, `tests`.

## Pull requests

- Keep PRs under ~400 changed lines; split otherwise (one issue = one
  branch = one PR).
- Fill in the [PR template](.github/pull_request_template.md), including a
  rollback plan for deploy-affecting changes.
- Squash-merge with a Conventional Commit title; delete the branch.
- Expect review against the definition of done in [AGENTS.md](AGENTS.md)
  (sections above). CI runs the same checks as `make check` (planned —
  CI pipeline is the next issue).

## Checks before every commit

`make check` must pass. Avoid weakening `.gitleaks.toml` allowlists or
`.gitignore` negations; they exist so secret-shaped content fails loudly.

## Releases

Releases use semantic versioning and are automated with
[release-please](https://github.com/googleapis/release-please). Configuration
lands in a later issue; until then, do not tag manually.

## Security

Found a vulnerability? Read [SECURITY.md](SECURITY.md) before publishing
anything.
