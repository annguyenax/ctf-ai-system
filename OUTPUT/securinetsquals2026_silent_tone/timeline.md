# Recovery timeline

1. Rejected the old flat-int16 loader; skipped native chunk rendering pyramids → 6554396 samples/channel, chunk continuity checked
2. Matched RRC/ZC plus UID pilots → A UID C1E20DC4 at +22 kHz; first packet RS+CRC verified
3. Deinterleaved before LFSR descrambling → Old firmware 51x40, seed crc8, Fibonacci shift-left LFSR
4. Compared complete A codewords, reconstructed and cancelled strong source → Repeated complete A packets identical; UID B 145D75BF, root104
5. Combined repeated B frames with phase refinement and RS parity equations → Part2 31 bytes, CRC32 13491388; matching independent recovery variants
6. Cancelled B and synchronized C root47 → UID C0F4E5B2; part1 30 bytes, CRC32 3f075e45
7. Sorted binary UIDs; SHA256(key||uint32be counter) → 61-byte flag; exact ciphertext re-encryption
8. Packaged solver and replayed original SAL in fresh temporary directory → All three RS parity and CRC32 checks pass; no scoreboard submission
