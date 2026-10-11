# vaulteD: single entry point for all developer tasks.

.PHONY: help setup lint test check

help: ## Show available targets (default)
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  %-10s %s\n", $$1, $$2}'

setup: ## Install git hooks (pre-commit + commit-msg stages)
	pre-commit install --install-hooks
	pre-commit install --hook-type commit-msg

lint: ## Run all pre-commit hooks over every tracked file
	pre-commit run --all-files

test: ## Placeholder: no tests yet (planned, see Issue #1)
	@echo "No tests exist yet; test suite is planned (Issue #1). Exiting 0."

check: lint test ## lint + test + full gitleaks scan of the repository
	gitleaks detect --source . --no-banner -c .gitleaks.toml
