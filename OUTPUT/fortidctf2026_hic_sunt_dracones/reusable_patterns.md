# Reusable pattern

## Trigger

A renderer returns translated cryptographic coordinates, and its internal heading or orientation persists between calls.

## Method

1. Trace the renderer's exact turn sequence and identify persistent state.
2. Simulate displacement coefficients separately from the unknown coordinate and step size.
3. Use known encoding bounds to constrain the hidden step size and reconstruct inputs.
4. Validate reconstructed points with the underlying algebraic relation and every encoder selection rule.

## Verification

For Koblitz-style point encoding over a curve, checking only that the x values decode to readable text is weak. Recover or constrain the modulus and curve coefficients, then verify every point and the exact square-root/index selection behavior.

## Pitfalls

- Resetting turtle heading for every render produces the wrong offset sequence.
- Reading only x coordinates can reveal a plausible flag without proving the y coordinates belong to the same curve.
- Confirm `j` is the first acceptable Koblitz candidate, not merely a later value that also lies on the curve.
