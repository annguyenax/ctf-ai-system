# Timeline — hackluctf2026_lauschangriff

- Triage: handout has only source + VM image, no pcap; flag is per-instance in captured TLS. Initially blocked (remote-only, expired token).
- Unblocked: coordinator supplied the live instance pcap (solve/evidence/capture.pcap, sha256 8d88ce2a…759d).
- Verified the 96-bit ARX PRNG is invertible from ServerHello.random (z3 self-test).
- Parsed pcap: 10 TLS sessions; 8 negotiate X25519MLKEM768 (0x11ec), 2 plain X25519 probes.
- Recovered server ephemerals from the PRNG stream (X25519 scalar at offset 0, ML-KEM Encaps coins at offset 32) via public key_share oracle.
- Rebuilt hybrid shared secret (mlkem||x25519), ran TLS 1.3 schedule, decrypted the bot's POST body.
- Verified: flag identical across conn4 (id:1, 09:36:02) and conn9 (id:2, 09:36:47, +45s), in both client request and server 201 echo.
