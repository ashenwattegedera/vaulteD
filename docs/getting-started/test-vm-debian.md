# Debian test VM as interim host

The vault runs on a single Debian VM until (and after) a homelab exists.
This document is **architecture-neutral** (arm64 and amd64 are both fine;
Vaultwarden publishes multi-arch images).

> **Status**: Phase 0. Sections marked *planned* contain scope for Phase 1
> install steps only — the exact commands land in a later issue after being
> executed once.

## VM sizing

- **CPU**: 1–2 vCPUs is plenty for Vaultwarden
- **RAM**: 1 GB minimum, 2 GB comfortable (Tailscale + Docker included)
- **Disk**: 20 GB minimum (vault data stays small; Docker images, cache and
  backups consume the rest)
- **Backups**: plan for restic cache and snapshot space in the same disk
  sizing discussion — never size the root volume at exactly the image size.

## Networking notes

- The VM needs outbound internet for initial installs and image pulls.
- No inbound ports are required or wanted: Tailscale is an *outbound-only*
  mesh connection, and Tailscale Serve binds HTTPS on the node itself.
- Keep the VM off public IP exposure; SSH access should come from the local
  network or the tailnet, not from port-forwards.

## SSH hardening checklist

Do this during first login, before installing anything else:

- [ ] Key-based auth only; disable password login
- [ ] Prohibit root login; use a sudo user
- [ ] No port forwarding to the VM from routers; access via LAN or tailnet
- [ ] Keep `allowusers`/firewall boundaries tight; the default sshd config is
      acceptable *offline*; reconsider before any tailnet-wide ACL changes

## Planned installs (Phase 1 — not instructions yet)

Will be installed and then documented with real commands:

- **Docker Engine + Compose plugin** — runs the Vaultwarden container
- **Tailscale** — tailnet membership plus `tailscale serve` HTTPS
- **Backup tooling (Phase 2)** — sqlite3 snapshot script + restic

## Verification once installed

Phase 1 will add checks (both `docker` and `tailscale` binaries, service
status, and a smoke test of the Serve URL). These must be run once on
amd64 and once on arm64 (or an equivalent multi-arch check) before the doc
is finalized as tested.
