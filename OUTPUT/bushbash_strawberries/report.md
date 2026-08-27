# Report — bushbash_strawberries

## Goal

Force strawberry_count > 2^32 as premium user to print flag.

## Environment

- `nc 34.40.133.67 6001`  
- AES-CBC fixed IV/key; source `strawberryserver.py`  
- Sample `message.ct` (80 bytes)

## Enumeration

Honest decrypt oracle shows layout: t(8)|n(8)|u(16)|CHECK(32). Non-premium, n=1.

## Exploitation

CBC bit-flip C0: `C0' = C0 XOR u XOR PREMIUM_USER` → P1 becomes premium; P0 (n) garbled huge.

## Verification

Server accepts premium, adds huge n, prints `How DARE you` and calls `displayFlag()`.

## Lessons

Integrity only on trailing CHECK block; privilege in P1 is free via C0 flip.
