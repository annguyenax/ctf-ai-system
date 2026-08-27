# Reusable patterns — Immiscible

- **Spot Oil-and-Vinegar:** multivariate quadratic system missing `oil*oil` terms ⇒ fixing
  vinegar linearizes in oil. See `PLAYBOOKS/crypto_oil_and_vinegar_invert.md`.
- **M>N ⇒ unique preimage:** overdetermined system has one solution; brute the small variable
  group and use the extra equations as a consistency filter.
- **z3/groebner can time out on modular MQ** — use the algebraic structure + vectorized linear
  algebra (numpy batched modular Gauss over F_p) instead.
- **Batched modular Gauss over F_p:** precompute an inverse table `inv[a]=pow(a,p-2,p)` and run
  Gauss-Jordan on stacked matrices for a huge speedup vs per-instance solving.
