# OSINT playbook — annotated star fields

## Trigger

A poem or cultural description identifies celestial objects, while an image contains a dense field of dots/stars with short labels or codes.

## Workflow

1. Resolve every clue to canonical object names and preserve the clue order.
2. Obtain trusted coordinates for the named objects and include one or more unused anchor objects when available.
3. Extract source centroids after masking annotation colors. Rank by flux only to bound hypotheses, not as identity proof.
4. Search similarity transforms first; allow affine transforms only when resize/projection distortion is evidenced.
5. Require multi-point consensus. A pair or triangle is weak in dense fields; use the complete constellation and normalized residuals.
6. Associate annotations using expected text baseline and visual inspection. Do not rely solely on nearest-centroid distance when halos overlap.
7. Enlarge ambiguous glyphs and keep bounded alternatives for `0/9`, `B/8/6`, `D/B`, and `1/7`.
8. Follow the supplied decoder exactly. Validate a candidate with coherent plaintext, expected encoding, and flag format—not padding alone.

## Evidence to retain

- Artifact hash and dimensions.
- Entity/name mapping table.
- Transform type and residuals.
- Final object-to-label table.
- Exact key bytes, plaintext, and a deterministic solver.

## Common failure mode

Bright neighboring stars can merge into one component, shifting a centroid between them. The closest red word can then belong to the wrong physical star. Inspect the enlarged raster and compare the annotation baseline/vertical ownership.
