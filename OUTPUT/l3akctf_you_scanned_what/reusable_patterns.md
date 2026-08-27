# Reusable pattern — variable-width mean projections

## Trigger

- one vector per angle over roughly 180 degrees;
- vector length changes with the angle;
- values look like column means rather than large ray sums;
- the source image was likely rotated with an expanded bounding box.

## Minimal method

1. Verify angle coverage and that declared detector counts equal vector lengths.
2. Infer rotated height at angle `θ` from detector width at `(θ + 90) mod 180`.
3. Recover line integrals: `projection_sum = stored_mean * rotated_height`.
4. Center-pad all projections to the maximum detector length.
5. Run inverse Radon with a ramp filter and `circle=False`.
6. Check vertical/horizontal orientation before reading embedded text.

## Verification

Replay from the original container and compare output hashes. For text-bearing
images, also inspect brace boundaries and ambiguous leetspeak characters after
orientation correction.
