# Using vaulteD (end users)

How to set up your password vault once the live instance exists.

> **Status**: the server is not deployed yet (Phase 0). Items marked
> *planned* below depend on Phase 1 deployment — track issue #1 for the
> roadmap; do not treat placeholders as instructions.

## What you need

- A device with a Bitwarden-compatible **client app or browser extension**
- Membership in the **Tailscale tailnet** (invited by the maintainer; every
  device that should reach the vault joins the private network)
- Nothing else: no public URL exists

## Connect your client to the self-hosted server

*planned (Phase 1)*: once Tailscale Serve is running, server access happens
via a tailnet-internal HTTPS name (e.g. `https://vault.<tailnet-name>`).

1. Open your Bitwarden client's **Account → Log in** screen.
2. Choose the **self-hosted / custom server** option and set **Server URL**
   to that HTTPS name. Mobile apps call this "bitwarden.com" account type —
   change it to your own server.
3. Enter your email and master password to create or log in to your account.

The URL is your Tailscale Serve HTTPS name, issued when Serve is configured
in Phase 1.

## Create your account

*planned (Phase 1)*: sign-up will be open to tailnet members; admin invites
and disables come later.

Your **master password** is the only thing that opens your vault — it is not
recoverable if lost. Treat the following as planned, not yet enforced:

- Choose a long, unique master password you don't reuse anywhere.
- **Enable two-factor (2FA)** on your vault account after your first login.
- **Store recovery codes outside the vault** (paper in a safe, or a sealed
  printout). Storing your vault's recovery codes inside the vault defeats
  their purpose — it is the one secret that must live outside.

## When the server is unreachable

The server lives on a private network on one VM. Expected behavior:

- Your client keeps recently synced vaults **available offline**; you can
  still read and create entries locally.
- Sync is delayed until the server is back.
- Typical causes: you are off the tailnet, or the VM is down. Reconnect to
  Tailscale first; if the server itself is down, you can't fix that — the
  maintainer's runbooks (planned, `docs/runbooks/`) define recovery paths
  and contacts.
