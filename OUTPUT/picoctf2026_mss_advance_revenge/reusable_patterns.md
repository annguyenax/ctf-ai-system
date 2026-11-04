# Reusable pattern - picoctf2026_mss_advance_revenge

## Detection signals

- Polynomial evals modulo a large prime, coefficients from hashes / keys (≪ p).
- Fewer points than degree+1.
- AES (or similar) keyed by the first coefficient or `sha256(flag)`.

## Decision rule

If `|c| << |p|`, recover short coeffs with LLL instead of interpolating. If dim ≳ 40 and entries are kilobit-sized, skip sympy.

## Minimal workflow

1. Affine lattice: `m` modular rows + `n` coeff rows + 1 affine row.
2. Reduce with flint / fpylll / Sage.
3. Harvest ~`|c|`-bit values; filter with hash-chain / extra evals / decrypt.

## Verification

Rebuild the published `(x,y)` and ciphertext from the recovered secret. Padding-valid AES alone is not enough.

## Pitfalls / non-applicable cases

- sympy `Matrix.lll` on this size.
- `long_to_bytes` vs fixed-width `to_bytes(32)` in the hash chain.
- Classical interpolation when coeffs are full-size in F_p.

## Faster path next time

See `PLAYBOOKS/crypto_small_coeff_poly_lll.md`. Flint ~14s for 51×51.
