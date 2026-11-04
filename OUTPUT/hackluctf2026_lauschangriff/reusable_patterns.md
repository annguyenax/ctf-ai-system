# Reusable patterns — weak kernel RNG -> TLS 1.3 decryption

- A patched kernel `random.c` that funnels ALL `getrandom` consumers through one weak PRNG
  turns any plaintext nonce into a stream-lock. In TLS 1.3, `ServerHello.random` (32 B) is
  that free leak; the server's ephemeral keygen is drawn from the same stream right after.
- Recover PRNG state from the plaintext nonce (Z3 for ARX/bitwise PRNGs), then brute a small
  `getrandom`-offset window forward. Disambiguate non-unique states and pin the offset using
  a PUBLIC value you already have: the ephemeral public key / KEM ciphertext in ServerHello.
- Post-quantum hybrid (X25519MLKEM768, 0x11ec): the ML-KEM shared secret is recoverable from
  the SERVER's deterministic `Encaps` coins (weak RNG), not from a client secret. Recompute
  `ML-KEM.Encaps(client_ek, m)`; shared secret = `mlkem_ss || x25519_ss`.
- Always reassemble TCP before parsing TLS: ML-KEM key shares (>1 KB) span segments.
- Verify by independent paths: multiple sessions + both traffic directions must agree.
- Tools: z3-solver, python-cryptography, dpkt, kyber-py (deterministic `_encaps_internal`).
