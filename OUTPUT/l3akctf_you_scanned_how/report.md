# Report — L3akCTF2026 / You Scanned HOW?!?!

- **Status:** solved (verified)
- **Category:** forensics / multi-slice tomography
- **Artifact:** `scan2.7z` (SHA-256 `7f1ee82b27d7d7a5886703e26082fde58705f4272b38c09ad0943d5f3e1e598c`)

## Signal → approach

The SQLite database contains 617 uniformly spaced `slice_<z>cm` tables. Each
table has 180 variable-width projections matching the earlier 2D Radon challenge.
Instead of inverse-transforming every slice, stack angle-0 line integrals across
z to form a longitudinal radiograph.

Table names encode z spacing 3. Restore that physical aspect ratio, then use the
foreground principal axis for deterministic deskew and choose the 180-degree
orientation that reads forward.

## Verification

Two archive-to-PNG solver runs independently produced 617 slices, spacing 3,
PCA angle `79.126338`, and SHA-256
`354c5578d38b5efd4e32094a5c3d15875a1be445ca9c77b24cee87dfd4b76004`.
The image text was visually checked. Flag and image remain only in SHOW.

## Pointers

- Writeup: `../CTFTimeWriteup/L3akCTF2026/Forensics/You Scanned HOW_!_!/writeup/writeup.md`
- Solver: `../CTFTimeWriteup/L3akCTF2026/Forensics/You Scanned HOW_!_!/solve/solve.py`
- Playbook: `PLAYBOOKS/forensics_multislice_projection_stack.md`
