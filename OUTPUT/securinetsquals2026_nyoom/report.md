# nyoom — solve report

## Summary
- **Event:** Securinets CTF Quals 2026 (Web, challenge 14, 491 pts)
- **Author:** d3dn0v4
- **Flag:** `Securinets{68b8f90ea6be091c5a7f4c6092fd6140}`
- **Status:** verified
- **Instance:** `http://10ef3a999dd9.inst1.securinets.tn:8080`

## Vulnerability
The flag is the admin session cookie. Varnish ESI on `POST /preview` includes `/fragments/session-info` into `data-session`. The bot's dashboard bio is stored HTML under a meta CSP nonce. Chrome 131 reuses the cached dashboard document (and its nonce) on a back navigation after a second dashboard URL recaches `/profile`.

## Attack chain
1. Bio loads a gzip trigram stylesheet and refreshes to `/dashboard?u=nyoomx&r=1` after 10s.
2. HTTP/1.1 callback collects ~30 trigrams and rebuilds nonce `cd31facf3f72c806017151658bafe771` with a Hamiltonian overlap path.
3. Bio is replaced with a 2s refresh to `/orch` plus a srcdoc iframe whose script nonce matches.
4. `/orch` runs `history.go(-2)` once. The restored page inserts the iframe. The script POSTs the ESI preview and beacons the body.

## Verification
`GET /me` with `Cookie: session=<flag>` returned `{"username":"admin","role":"administrator"}`.

## Artifacts
- Solver: `D:\download\CTFTimeWriteup\SecurinetsQuals2026\Web\nyoom\solve\solve.py`
- Writeup: `D:\download\CTFTimeWriteup\SecurinetsQuals2026\Web\nyoom\writeup\writeup.md`
- Excerpt: `raw/winning_visit.txt`
