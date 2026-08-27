# lit2026_faulty_image_2 — report
- LIT CTF 2026 / crypto ; solved (verified)
- Flag: `LITCTF{c0d3t1g3r_w4s_h3r3_x0r!}`

## Signals
IDAT intact (decoy 'Nothing here lol!'); tEXt XOR-Key=hex('codetiger'); custom chunk tIGr with bad CRC; tIGr=[len32][ciphertext].

## Solve
key='codetiger'; XOR tIGr[4:4+32] -> flag (null padded).

## Verification
round-trip re-XOR reproduces tIGr body; length prefix matches; ends '}'.

## Reusable
Hidden data in non-standard/bad-CRC PNG chunk; tEXt supplies key; skip length prefix before XOR.
