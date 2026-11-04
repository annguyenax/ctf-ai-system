# Reusable pattern - securinetsquals2026_nyoom

## Detection signals

- Varnish `do_esi` gated on one URL prefix, with a fragment blocked only at `esi_level == 0`.
- Stored HTML rendered by `innerHTML` under a **meta** CSP `script-src 'nonce-...'` and no `default-src`.
- A bot that loads the victim page once, then sits still long enough for a refresh.
- `Cache-Control: public` on the HTML document and a second URL that refetches the same uncached JSON.

## Decision rule

If the nonce lives in a meta tag, leak it with `script[nonce*=]` CSS. If a later navigation can change the injection without changing the cached document, come back with `history.go` and run a srcdoc script that carries the leaked nonce. Use ESI (or any same-origin POST) only after that script runs on the victim origin.

## Minimal workflow

1. External stylesheet, one layered `background` of `var(--tXXX,none)`. Prefix custom properties so they do not start with a digit.
2. Serve CSS gzip over HTTP/1.1 with Content-Length.
3. Reconstruct the nonce as a Hamiltonian trigram path, not a unique-end merge.
4. Recache the profile with a different dashboard URL, then `history.go(-2)` once.
5. Same-origin POST the ESI template. Exfil with `Image`.

## Verification

Read `data-session` from the preview body, then `GET /me` with that cookie and require `role=administrator`.

## Pitfalls / non-applicable cases

- Nonce hiding on a real CSP header is a different bug. This path is for a meta CSP.
- Repeated trigrams inside one nonce cannot be rebuilt from a set.
- A `<base href>` aimed at the attacker drops the victim cookie on path-absolute fetches.
- Reporting `localhost` is rewritten; report the internal edge hostname the cookie was set on.

## Faster path next time

Budget about 10s from the first CSS byte to the bio swap. Refresh the cached document at 10s and the orch page at 2s. If the public tunnel hostname changes, restart the callback and store the leak bio again before the visit.
