# Playbook — Broken / tilted / soft QR & barcodes

## Signals

- Image is mostly scenery; faint square/rect of modules on sky, paper, or desk
- Decoder returns **nothing**, or returns **garbage with control bytes** while finder looks OK
- Aspect not 1:1 → may be **rectangular Data Matrix**, not QR
- Classic CTF name: “broken QR”, “wounded QR”, burnt/torn/handprint on QR

## Taxonomy (pick path early)

| Class | Symptom | Primary tools |
|-------|---------|---------------|
| **A. Geometric** (tilt / perspective / warp) | Modules clear but skewed | crop → homography/deskew → upsample → zbar/zxing/opencv |
| **B. Structural damage** | Missing finder/alignment, holes, stamps | **QRazyBox** / manual repaint markers + timing; use ECC |
| **C. Soft / low-contrast embed** | Modules bleed into background (Bliss-style) | channel pick (HSV-S, R), local normalize, soft sample centers, **enforce L-finder+timing**, RS bit-repair |
| **D. Fragmented / shuffled** | Multiple pieces or text matrix | reassemble order, then A/B |
| **E. Format/mask missing** | Known QR bits but no format info | QRazyBox brute mask/format; “Wounded QR” theory |

**Bliss I** sits in **C** (soft Data Matrix on sky), not classic QR B.

## Workflow (budget-friendly)

1. **Triage file** — PNG chunks, trailing bytes, EXIF/XMP. If empty, payload is visual only.
2. **Identify symbology** — QR (3 square finders) vs Data Matrix (solid L + alternating timing) vs PDF417 etc.
3. **Geometry** — crop tight; perspective if corners known; for soft codes use bilinear sample of module centers.
4. **Binarize carefully** — adaptive/OTSU local; soft codes: keep float scores, threshold last.
5. **Validate structure**
   - QR: 3 finders, timing, format bits consistency
   - DM square: left+bottom solid black; top+right alternate 1010…
6. **Decode** — `zxing-cpp`, `zbarimg`, OpenCV `QRCodeDetector`, phone Lens as last resort.
7. **If garbage text** (control chars, wrong length) → modules wrong but ECC partially happy → **do not trust text**; export module matrix; flip uncertain bits; RS repair; **QRazyBox-style** for QR.
8. **Never invent flag from route/URL guesses** without decoder evidence.

## Tools whitelist

| Tool | When |
|------|------|
| Pillow / OpenCV | crop, warp, CLAHE, adaptive thresh |
| `zxing-cpp` / ZXing online | multi-format barcode decode/encode |
| `zbarimg` / pyzbar | QR/1D |
| [QRazyBox](https://merri.cx/qrazybox/) | damaged QR module editing + ECC |
| `reedsolo` / libdmtx | custom RS / Data Matrix |
| Phone Google Lens | soft modules humans+camera still beat desktop |

Avoid: full nmap/HexStrike scans; guessing long URL payloads by module similarity only.

## Reference challenges & writeups

| Source | Idea |
|--------|------|
| MMA CTF 2015 — QR recovery 400 ([robertxiao](https://www.robertxiao.ca/hacking/ctf-writeup/mma2015-qrcode/), QRazyBox example) | Classic corrupted QR + ECC |
| Tenable CTF — BrokenQR ([writeup](https://github.com/Tharunaya/CTF-writeups/blob/main/Tenable%20CTF/Misc/BrokenQR.md)) | Repaint markers; “Wounded QR codes” |
| New Year CTF 2025 — Broken QR ([CTFtime](https://ctftime.org/writeup/39908), [blog](https://emree-1.github.io/posts/newyearctf2025-broken-qrcode/)) | Handprint noise; QRazyBox |
| Trend Micro 2018 — burnt QR | QRazyBox + RS |
| STACK the Flags 2020 — partial QR | QRazyBox extract |
| [ctf.support QR & Barcodes](https://ctf.support/misc/qr-barcode/) | Scenario catalog + tool list |
| DataGenetics **“Wounded QR codes”** | Theory: what ECC can fix |

### Search keywords

`ctf broken qr`, `ctf qr recovery`, `tilted qr`, `skewed qr`, `perspective qr`, `wounded qr`, `QRazyBox writeup`, `datamatrix soft modules ctf`

## Bliss I notes (living)

- Artifact: soft white modules on blue sky; Affinity export; **no** stego in PNG chunks.
- Timing alternation on recovered crisp grid → **Data Matrix 18×18 data / 20×20 symbol**, not QR.
- zxing on bad recoveries can still emit garbage (`\x01DQR3…`) — treat as **false success**.
- Media-query / “atmospherically-questionable-runes” path is **Bliss II**, not verified Bliss I.

## Output after solve

- `OUTPUT/<id>/` report + module matrix ASCII + raw decode attempts  
- Card linking this playbook  
- Event writeup under `CTFTimeWriteup/...`
