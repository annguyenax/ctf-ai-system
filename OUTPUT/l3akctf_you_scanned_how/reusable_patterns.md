# Reusable pattern — avoid full multi-slice reconstruction

## Trigger

- many equally spaced slice tables/files;
- each slice contains projections at the same angle set;
- the goal is object/text recognition from one view, not quantitative 3D density.

## Minimal method

1. Choose one projection angle and restore line integrals if values are means.
2. Center-pad detector vectors to a common axis.
3. Stack vectors in physical slice order to make a longitudinal radiograph.
4. Correct z spacing before interpreting aspect or angles.
5. Select the most informative view with a sparse angle sweep.
6. Use PCA or a known fiducial for deterministic deskew.

## Stop rule

If one calibrated projection stack exposes the decisive content and replays
deterministically, do not spend time reconstructing every 2D slice or storing a
multi-gigabyte float volume.
