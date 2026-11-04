# Timeline - securinetsquals2026_nyoom

| Time | Phase | Observation / decision | Evidence |
|---|---|---|---|
| local | TEST | ESI on POST /preview reflects the caller cookie. Direct fragment GET is 403. Absolute ESI src is not SSRF. | notes/SESSION.md |
| local | TEST | Bot sends SameSite=Lax on a top-level POST to edge. Preview is text/plain, so img in that body does not fire. | notes/SESSION.md |
| local | TEST | Meta CSP nonce is visible to script[nonce*=] CSS. history back replays /profile. A second dashboard URL overwrites that cache entry. bfcache persisted stayed false. | notes/SESSION.md |
| remote | EXPLOIT | HTTP/1.0 trigram leak took ~18-20s and missed the warm bot window. HTTP/1.1 + gzip finished in ~9s. | raw/winning_visit.txt |
| 11:23:22 | EXPLOIT | Hamiltonian reconstruct returned nonce cd31facf3f72c806017151658bafe771. | raw/winning_visit.txt |
| 11:23:32 | VERIFY | Preview data-session matched the flag. GET /me with that cookie returned admin/administrator. | raw/winning_visit.txt |
