# Timeline

- 2026-10-25: Read challenge source and existing partial lattice/peeling solver.
- 2026-10-25: Ran the solver using Python 3.13.1, python-flint 0.9.0 and PyCryptodome; recovered a short projective representative.
- 2026-10-25: LLL Gram row passed rank-one checks; all 174 blocks peeled, leaving `(-1,0,0,0,0,0,0,0)`.
- 2026-10-25: Replayed all 174 products and matched the complete published vector; AES-CTR re-encryption matched the provided ciphertext.
- 2026-10-25: Tried the official submit helper once; Cloudflare returned HTTP 403, so no scoreboard result is claimed.
- 2026-10-25: Captured the deterministic solver, verification evidence, writeup and knowledge card.
