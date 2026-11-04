# Baby Misc — FortID CTF 2026

Status: artifact-verified on 2026-10-10; no platform submission.

Flag: FortID{D0_or_D0_N07_Th3r3_15_n0_Tri3}

The public ZIP contains 7,000 PNG entries whose path components are decimal ASCII codes. Many decoded paths are flag-shaped decoys. Hashing each PNG's IHDR, PLTE, and IDAT chunks separates exactly one image from the other 6,999. The singleton is 288x320; its path decodes to the flag.

The result was reproduced by a Python ZIP parser and independently by a PowerShell/.NET ZIP reader checking IHDR dimensions and decoding the same path. No submission was made, so platform status may remain unsolved.

Event artifact: CTFTimeWriteup/FortIDCTF2026/Intro/Baby Misc/
Archive SHA-256: 6e4b56f34ca79cc50c37b2beb08d58f402b81c0e087759130257eb8e070c1a6b
