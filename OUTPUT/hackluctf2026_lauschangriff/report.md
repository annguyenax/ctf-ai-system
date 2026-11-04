# hackluctf2026_lauschangriff

Status: solved. Flag: flag{5429d271438bd9cd7be14be8d17507e2}

Weak global 96-bit ARX kernel PRNG (patched drivers/char/random.c) leaks through TLS 1.3 ServerHello.random. Z3 recovers the state; the server's ephemeral X25519 scalar (stream offset 0) and ML-KEM-768 Encaps coins (offset 32) are drawn from the same stream and confirmed against the public ServerHello key_share. Hybrid shared secret (mlkem_ss || x25519_ss) feeds the RFC 8446 schedule to decrypt the bot's POST body. Verified: flag identical across two independent sessions and both traffic directions. Tools: z3, python-cryptography, dpkt, kyber-py. HexStrike not used.

Writeup: CTFTimeWriteup/HackluCTF2026/Crypto/Lauschangriff/writeup/writeup.md
Solver:  CTFTimeWriteup/HackluCTF2026/Crypto/Lauschangriff/solve/solve.py
