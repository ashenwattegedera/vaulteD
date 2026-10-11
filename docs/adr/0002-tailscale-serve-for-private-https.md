# 0002: Tailscale Serve for private HTTPS

- **Status**: accepted
- **Date**: 2026-10-11
- **Deciders**: Ashen Wattegedera

## Context

Vaultwarden needs HTTPS for client compatibility (Bitwarden clients refuse
plain HTTP login endpoints) and must not be reachable from the public
internet. Options included a public domain + reverse proxy + Let's Encrypt,
VPN-only access without TLS, and Tailscale.

## Decision drivers

- No public attack surface for the vault
- No domain purchase or DNS management
- Minimal moving parts on a single VM host
- Server is unreachable outside the private network — by design

## Considered options

- **Public reverse proxy (nginx/Caddy + Let's Encrypt)** — full public
  exposure, real risk for a password vault; needs domain care.
- **Plain HTTP over VPN** — simpler, but Bitwarden clients expect HTTPS and
  traffic in transit deserves the friction of TLS on a vault.

## Decision

Expose Vaultwarden only via **Tailscale Serve**, which provisions a
tailnet-private HTTPS URL with valid certificates automatically. Client
devices join the tailnet and point at the Serve URL. No public ports are
opened; there is no public domain.

## Consequences

- Positive: strong default security; zero cert management; identity-gated
  access at the network layer.
- Negative: every user must join the tailnet (documented in the user guide);
  server is intentionally unavailable outside the tailnet.
