# 0001: Record architecture decisions

- **Status**: accepted
- **Date**: 2026-10-11
- **Deciders**: Ashen Wattegedera

## Context

Infrastructure and deployment decisions for vaulteD accumulate over many
issues and contributors. Without a durable record, each future change risks
revisiting or silently contradicting earlier reasoning.

## Considered options

- **No record** — cheap, but repeats debates and hides rationale.
- **Decision history in issue comments** — scattered, hard to search,
  trampled by process talk.
- **Architecture Decision Records (MADR style)** — one short document per
  decision, versioned in-repo, discoverable and reviewable.

## Decision

Record every meaningful architecture decision as a short MADR-style ADR in
`docs/adr/`, numbered sequentially from 0001. Use
[0000-template.md](0000-template.md). ADRs are updated in the same PR that
changes a decision; a superseding decision supersedes rather than deletes.

## Consequences

- Positive: rationale is reviewable alongside code; cheap to reference; AI
  agents have an unambiguous place to look.
- Negative: small ongoing documentation overhead, acceptable under ~1 page
  per decision.
