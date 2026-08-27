# Timeline — lit2026_faulty_image_2
1. Enumerate chunks: custom tIGr with bad CRC + tEXt XOR-Key.
2. Render IDAT -> decoy 'Nothing here lol!'.
3. Decode tEXt hex -> 'codetiger'; XOR tIGr body (skip 4-byte len) -> flag.
4. Verified by round-trip; wrote solver/evidence/writeup/card.
