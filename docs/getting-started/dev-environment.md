# Dev environment (contributors)

Everything below was verified on macOS (arm64, Homebrew) on 2026-10-11.
Debian equivalents are given for the key tools but marked **(untested)** —
install them on your VM first and confirm.

## Prerequisites

- `git` (any recent version)
- `make` (macOS: via Xcode CLT; Debian: preinstalled)
- Homebrew on macOS / `apt` on Debian

## Install tooling

macOS (verified):

```sh
brew install pre-commit gitleaks shellcheck shfmt yamllint markdownlint-cli
```

Debian **(untested)**:

```sh
sudo apt-get update
sudo apt-get install -y git make gitleaks shellcheck shfmt yamllint \
     pre-commit markdownlint-cli2
```

## One-time setup

```sh
git clone git@github.com:ashenwattegedera/vaulteD.git
cd vaulteD
make setup
```

`make setup` runs `pre-commit install --install-hooks` and
`pre-commit install --hook-type commit-msg` (verified) — the first run
downloads each hook executable and environment, then reuses them.

## Everyday checks

```sh
make help    # list targets
make lint    # all hooks, all files
make test    # placeholder, exits 0 until tests exist (Issue #1)
make check   # lint + test + full gitleaks scan of the repo
```

Hooks also run automatically at `git commit` (pre-commit and commit-msg
stages), so an invalid Conventional Commit wording or a secret-looking
string is rejected locally — the same rules CI will later enforce (CI is
planned; no workflows exist yet).

## Verify the gitleaks hook works

1. `git checkout -b test/gitleaks-demo && echo x > probe.txt && git add probe.txt`
2. Append a fake token-shaped string to `probe.txt` **at runtime** (write
   your own obviously fake `tskey-auth-...` value while offline; do not
   commit it anywhere, and delete the file immediately after) and
   `git add probe.txt`
3. `git commit -m "test: gitleaks"` should fail with a gitleaks finding.
4. `git checkout . && git checkout main && git branch -D test/gitleaks-demo`
   — confirm the tree is clean (`git status`) and nothing containing the
   fake string was committed.

## Rules that matter

- Never weaken `.gitleaks.toml` allowlists to make CI greener.
- Hooks are pinned by tag; bumping pre-commit `rev`s requires verifying the
  tag exists upstream (see [AGENTS.md](../../AGENTS.md)).
- Ask questions before guessing; see [CONTRIBUTING.md](../../CONTRIBUTING.md).
