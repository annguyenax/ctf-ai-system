# Reusable patterns - ptitctf2026_winux

Per-character keyed SHA-256 proofs (`tag || le32(i) || salt_i || (byte XOR pad_i)`) brute independently. If the recovered string is already `PTITCTF{...}`, skip container decrypt.
