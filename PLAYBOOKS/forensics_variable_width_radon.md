# Variable-width Radon projection reconstruction

## Trigger

Use this playbook when an artefact contains one numeric detector vector per angle,
usually spanning 0–179 degrees, but vector widths vary with angle. A strong extra
signal is that values look like per-column averages from an image rotated with an
expanded canvas.

## Preconditions

- angle ordering and units are known;
- declared detector counts match decoded vector lengths;
- enough views cover approximately 180 degrees;
- projections share a common center.

## Minimal method

1. Find maximum detector width and create a zero-filled sinogram.
2. If values are means, infer canvas height at `θ` from the width at
   `(θ + 90) mod 180` and multiply to restore projection sums.
3. Center each vector along the detector axis; do not left-align ragged vectors.
4. Apply filtered backprojection with the real angle array, ramp filter, and
   `circle=False` for rectangular/expanded sources.
5. Contrast-normalize only for presentation; preserve the floating-point result
   while tuning.
6. Check flip/rotation conventions before interpreting embedded text.

## Verification

- replay from the original artefact and compare output hashes;
- confirm the same object/text remains visible with a nearby standard filter
  (for example Shepp–Logan) when independent visual corroboration is useful;
- distinguish reconstruction content from contrast or orientation choices.

## Pitfalls

- assuming a medical theme implies DICOM;
- confusing mean projections with line integrals;
- using edge alignment instead of centered padding;
- enabling circular support for a rectangular source;
- accepting mirrored flag-shaped text without checking braces and glyphs.

## Faster path

Inspect only container listing, SQLite schema, angle range, vector lengths, and a
few edge values. These signals are normally sufficient to choose reconstruction
without DICOM tooling, carving, or HexStrike.
