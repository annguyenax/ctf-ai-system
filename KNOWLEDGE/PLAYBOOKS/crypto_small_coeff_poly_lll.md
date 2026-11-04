# Small-coefficient polynomial interpolation via LLL

## Signal

- A polynomial is evaluated modulo a large prime `p` (typically 512–2048 bits).
- Coefficients are much smaller than `p` (hash outputs, 128/256-bit keys, bounded random).
- Number of published points `m` is less than degree+1, so classical interpolation is underdetermined.
- Related: `MASTER_KEY = SHA256(flag)` and later coeffs are a hash chain of the previous coeff.

## Why it works

The unknown is a short vector `(c0,...,c_{n-1})` plus modular reductions. Build the affine lattice of dimension `m + n + 1`:

- first `m` rows: `p * W` on the diagonal (clear modular wrap)
- next `n` rows: Vandermonde `x_i^{n-1-j} * W` in the eval columns, identity in the coeff columns
- last row: `-y_i * W` and a trailing `1`

Weight `W ≈ 2^{(|p|-|c|)/2}` (512 is a safe default when `|p|=1024` and `|c|=256`). Short vectors after LLL expose the coefficients.

## Workflow

1. Confirm coeff bit-length vs `p` and count points vs degree.
2. Do **not** start `sympy.Matrix.lll` on dim ≳ 40 with kilobit entries — it can run for hours.
3. Reduce with **python-flint** `fmpz_mat.lll`, **fpylll**, or Sage. Expect tens of seconds, not hours.
4. Harvest ~coeff-sized integers from reduced rows (absolute value; both signs).
5. Filter candidates with the challenge invariant (hash chain, AES key, extra evals).
6. Independently re-derive the published data from the recovered secret.

## Pitfalls

- `Crypto.Util.number.long_to_bytes` is unpadded; hash-chain reconstruction must match the challenge, not `to_bytes(32)`.
- Recovered lattice entries may be negated; try `abs`.
- Too-small `W` mixes coeff columns with modular noise; too-large `W` wastes bits but is safer.
- 20 points of a degree-29 poly is enough when coeffs are 256-bit and `p` is 1024-bit.

## Faster path next time

`python-flint` LLL on a 51×51 lattice with ~1536-bit entries finished in ~14s. Same lattice in sympy did not finish.
