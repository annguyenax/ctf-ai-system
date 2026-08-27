# lit2026_faulty_image_3 — report
- LIT CTF 2026 / crypto ; solved (verified)
- Flag: `LITCTF{1mAg3_F1ag_1o3fjs!}`

## Signals
Valid PNG, opens directly; filter histogram mostly Up with a few Sub/Paeth top rows (colorful streak). Flag readable in pixels.

## Solve
Open the image; read the flag. No repair needed.

## Verification
raw 300200 == 200*(1+500*3); deterministic render; zoom-confirmed chars.
