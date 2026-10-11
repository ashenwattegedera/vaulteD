# Security Policy

## Reporting a vulnerability

Please **do not** report vulnerabilities through a public GitHub issue.

Report it privately via GitHub's flow on this repository's
**Security tab → "Report a vulnerability"** (private vulnerability
reporting, [GitHub docs](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/privately-reporting-a-security-vulnerability)).

The maintainer sets up and maintains this channel in repo settings
(Settings → Code security & analysis → Private vulnerability reporting).

Include in your report:

- What is affected (component, file, workflow)
- How it could be exploited, with minimal reproduction steps
- Suggested mitigation, if you have one

Expect an initial response within a reasonable timeframe; responses are best -
effort until tooling and contacts are finalized. Please do not test against
any deployed instance.

## Supported versions

This project is **pre-release**: no versions are supported or released yet.
Security-relevant fixes are made against `main` and become part of the first
release. Status table will be added once releases exist via release-please.

## Scope and standing

vaulteD orchestrates [Vaultwarden](https://github.com/dani-garcia/vaultwarden),
an **unofficial community server** compatible with Bitwarden clients. This
project is **not affiliated with Bitwarden Inc.**, and does not consist of
Bitwarden application code. Bugs in Vaultwarden itself should be reported
upstream to the Vaultwarden repository.
