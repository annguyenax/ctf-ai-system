# Reusable pattern - securinetsquals2026_old_calculator

## Detection signals

- Hidden unary map sampled as parallel input/output tables.
- Arithmetic opcodes with add and multiply, no division.
- A single small readout at the same moment the challenge input is revealed.
- Output magnitude larger than the input word size.

## Decision rule

If output differences are a constant multiple of input differences, the map is affine. Recover the slope by a straight-line reciprocal (Newton in floats, or an integer inverse when a modulus is known), then the intercept from one sample. Pack both coefficients into the one allowed readout.

## Minimal workflow

1. Confirm `E = a*R + b` on leaked pairs, with `b = E % R` small.
2. Compute a weighted sum of `(y[j]-y[i])` and `(x[j]-x[i])`.
3. Invert the denominator with a fixed Newton schedule that converges for the full delta range.
4. Display `a + b/2^k` with `k` large enough for the intercept.
5. Answer `a*R+b` before the connection closes.

## Verification

The service must accept the value. A leaked `Expected` on a sacrificed connection is only a check of the formula, not a pass.

## Pitfalls / non-applicable cases

- The slope is undefined when every weighted input delta sums to zero. Use several power-of-two weights.
- Packing the intercept into too few bits aliases a larger intercept with the next slope.
- Do not stop a socket read on the word "number" if that word also appears in "random number".

## Faster path next time

Fit one leaked `(R, E)` as `a = E//R`, `b = E%R`. If `b` is tiny, go straight to in-connection Newton. Do not spend queries on a global polynomial.
