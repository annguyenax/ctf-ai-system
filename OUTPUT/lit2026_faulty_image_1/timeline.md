# Timeline — lit2026_faulty_image_1
1. Parse chunks/CRC: IHDR ok, IDAT CRC bad, zlib fails early.
2. grep 'haha' -> equal spacing 104 -> inserted marker every 100 bytes.
3. Strip on stride -> IDAT decompresses to 180150 bytes.
4. Rebuild clean PNG -> render -> flag.
5. Verified deterministically; wrote solver/evidence/writeup/card/playbook.
