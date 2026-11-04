# Reusable pattern

## Trigger

A recursive proof verifier accepts prover-supplied intermediate objects and checks only their commitments and a small number of evaluations.

## Method

Trace every transition between rounds. A commitment proves that an object matches its own hash; it does not prove the object was correctly derived from the previous round. If the fold relation is absent, derive values that satisfy the remaining scalar equations, interpolate a low-degree polynomial at the checked points, and commit to it.

## Verification

Run the forged proof through the local verifier and confirm the application policy accepts the claimed report. Separately confirm the challenge flag through its expected source.

## Pitfalls

- Do not mistake self-consistent commitments for a proof of correct state transitions.
- Track the round indices and evaluation points carefully when interpolating.
- Preserve the submitted proof and server response for a fully reproducible live record.
