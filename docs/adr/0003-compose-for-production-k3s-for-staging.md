# 0003: Compose for production, k3s + Argo CD for staging

- **Status**: accepted
- **Date**: 2026-10-11
- **Deciders**: Ashen Wattegedera

## Context

vaulteD needs a production runtime for a single service with a container
image, a volume, and scheduled backups — deployed on a small Debian VM. In
parallel, the project's goals include demonstrating GitOps on Kubernetes
without giving the real vault a fragile or experimental runtime.

## Considered options

- **Kubernetes in production now** — overkill: one stateful service, extra
  operational surface on the machine storing the vault.
- **Compose only, no lab** — production runtime is right-sized, but the
  portfolio goal of real GitOps experience goes unmet.

## Decision

Use **Docker Compose** for the production runtime: minimal, inspectable,
well-matched to a single host. Run a separate **k3s (Kustomize-first) +
Argo CD** staging lab later for GitOps practice and change validation; it
never runs the production vault data.

## Consequences

- Positive: production stays small and robust; staging gives a safe place
  for Kubernetes practice and pre-deployment validation.
- Negative: two deployment styles to keep honest; the staging lab must not
  drift into running anything user-facing.
