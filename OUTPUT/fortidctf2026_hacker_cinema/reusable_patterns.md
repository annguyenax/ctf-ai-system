# Reusable patterns — fortidctf2026_hacker_cinema

1. **Two code paths for "the same" value = divergence bug candidate.** When a
   protocol derives one input (nonce) from field A computed by function f() and
   signs field B computed by function g(), where f and g "should" agree, scan
   the *entire* accepted input range (especially negative/overflow extremes)
   for f(x) == f(y) while g(x) != g(y). That pair = same key material,
   different message.
2. **Always test on the exact pinned runtime version.** The PHP year-0 quirk
   existed in 8.4.16 (Dockerfile pin) but not 8.4.24 (WSL default). A
   version-pinned Dockerfile in a challenge handout is itself a signal.
3. **Deterministic nonces make nonce reuse findable offline.** If the nonce is
   HMAC(derived-from-message-fields), enumerate inputs instead of reaching for
   lattice/HNP attacks. Detector: identical r across two signatures.
4. **PHP negative-timestamp calendar math is fragile around year 0.**
   `new DateTimeImmutable('@ts')` vs `createFromFormat('U')` diverge for
   ts ≈ -62164800000..-62162035200 (partition "0000-01-29" lasts 172800 s on
   the `@` path in ≤8.4.16).
5. **rCTF instance pattern**: `PUT /api/v2/integrations/challs/<uuid>/instance`
   returns `{status, endpoints[{host, port}]}` with ~30 min TTL; use it before
   interacting with challenge web instances.
