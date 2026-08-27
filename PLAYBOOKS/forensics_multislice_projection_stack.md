# Multi-slice projection stacking

## Trigger

Use this playbook when a tomography artefact has many ordered slices and every
slice contains the same projection-angle set. It is especially useful when the
goal is visual recognition rather than a quantitative 3D reconstruction.

## Preconditions

- slice order and spacing can be recovered;
- projection angles use a common detector convention;
- detector vectors can be centered on a common axis;
- stored means can be converted to line integrals when necessary.

## Minimal method

1. Inventory slice count/range/spacing and validate one representative schema.
2. Sample 6–12 angles across 180 degrees.
3. For each sampled angle, stack the corresponding projection from every slice.
4. Center-pad ragged detectors and restore sums from means using orthogonal canvas
   height when appropriate.
5. Inspect the sparse views and choose the angle with the highest information.
6. Apply physical slice spacing before measuring shapes or rotation.
7. Deskew via PCA/fiducials and test the 180-degree orientation ambiguity.

## Verification

- replay from the original container and compare output hashes;
- confirm slice count, spacing, chosen angle, and deskew angle are deterministic;
- use coherent object/text structure as a second signal;
- keep the calibrated final view, not every sampled angle.

## Pitfalls

- treating slice index as physical z without spacing correction;
- immediately running inverse Radon on every slice;
- retaining a multi-gigabyte reconstructed volume when one view is decisive;
- choosing a projection where a planar object is edge-on;
- tuning rotations manually instead of deriving them from geometry.

## Faster path

One projection row per slice is often several orders of magnitude cheaper than
all angles for all slices. Test this projection-stack shortcut before full FBP.
