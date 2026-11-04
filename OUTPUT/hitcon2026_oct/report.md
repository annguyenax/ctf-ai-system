# oct — recovered and verified offline

The solver recovered all 1,044 generator indices from the published 8-coordinate value, rebuilt the original non-associative octonion product, and matched the entire public vector. The recovered SHA-256 AES-CTR key decrypts the supplied ciphertext; re-encryption matches it byte for byte. The flag format and plaintext are coherent. The official submit helper received HTTP 403 from Cloudflare, so scoreboard acceptance was not established.

The 8D modular lattice recovers a short integer representative up to a small coefficient vector. The norm constraint, reduced modulo a known divisor assembled from generator norms, linearizes in the 36 products `c_j*c_k`; LLL returns a rank-one row. Moufang identities then peel the six indices of each block. See the event writeup for the full derivation.

Event evidence: `D:\download\CTFTimeWriteup\HITCONCTF2026\Crypto\oct\solve\evidence\manifest.md`
Solver: `D:\download\CTFTimeWriteup\HITCONCTF2026\Crypto\oct\solve\solve.py`
Writeup: `D:\download\CTFTimeWriteup\HITCONCTF2026\Crypto\oct\writeup\writeup.md`
Input SHA-256: `19519042b5bc5426188bc6af5b011cb76978363754a28da985d153ec69ce5fd6`
Flag SHA-256: `d76cf2f86dfc547e9c3ab0621270e1e0c6d7883fdf11345bd03fa1b8aeef2e41`
