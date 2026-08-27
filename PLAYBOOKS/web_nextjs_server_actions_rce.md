# Playbook - Next.js / React Server Actions advisory matching

This file intentionally omits weaponized payload strings because raw PoCs previously triggered endpoint antivirus and made the knowledge base unreadable. Keep challenge-specific payload bytes in the event solver/raw evidence archive.

## Trigger

- Next.js App Router / React Server Components / Server Actions signals.
- Exact package versions or lockfile are available.
- A vendor/upstream advisory matches the component and affected range.

## Workflow

1. Fingerprint from `package.json`, lockfile, build metadata, response headers, and client chunks.
2. Check the official Next.js/React advisory and affected/fixed ranges; corroborate with NVD/GHSA as needed.
3. Confirm the vulnerable feature is enabled and reachable. A header alone is insufficient.
4. Reproduce the smallest harmless protocol-level differential first.
5. Adapt the PoC to the challenge locally; constrain impact to reading the intended flag.
6. Preserve request/response and exact dependency versions.
7. Verify independently through source review, local reproduction, or challenge acceptance.

## Pitfalls

- Confusing App Router, Pages Router, middleware, cache, and Server Actions CVEs.
- Treating challenge narrative as technical evidence.
- Copying a public PoC/flag without matching versions and configuration.
- Keeping live payload signatures in always-loaded documentation.
