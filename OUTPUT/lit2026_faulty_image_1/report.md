# lit2026_faulty_image_1 — report

- Event: LIT CTF 2026 / crypto ; Status: solved (verified)
- Flag: `LITCTF{y0u_f1x3d_m3_85hf91j!}`

## Signals
PNG won't open; IDAT CRC bad; zlib 'invalid literal/lengths set'; text repeats 'haha';
bytes 68 61 68 61 at offsets 100,204,308,... every 104 bytes.

## Solve
Marker b'haha' inserted every 100 original bytes (stride 104). Strip on stride ->
IDAT (len 2155) decompresses to 180150 = 150*(1+400*3). Rebuild PNG -> renders flag.

## Verification
Exact raw size match + deterministic solver replay + readable flag text.

## Reusable
See PLAYBOOKS/crypto_png_inserted_marker_repair.md (applies to faulty_image series).
