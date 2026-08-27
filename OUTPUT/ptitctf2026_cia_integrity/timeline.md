# Timeline

- INTAKE: 280-bit RSA, 4 segments; password = sha256(flag); chall.zip encrypted.
- TRIAGE: hypothesis = factor small RSA -> recover password -> unpack -> read flag.
- Probing live service (144.79.188.39:42461) sent no banner; segments are in the provided chall.py.
- Factoring: sympy.factorint too slow. Checked gcd pairs, Fermat, Pollard p-1 (no). Built/ran GMP-ECM.
- Windows 24-core path: wrote own C ECM (GMP) + stage2; verified correctness on small semiprime.
- Password "1fcbf4aa..." opens chall.zip (AES) -> found 10 sub-challenges + secret.zip/secret.py.
- Layer1 pw f10fda62... opens secret.zip -> flag.py/flag.zip. Layer2 pw f4c77352... opens flag.zip -> flag.txt (decoy).
- Confirmed flag.txt decoy violates integrity (sha256 != top pw).
- Reconstructed real flag from chall3+chall6+chall7 (hex-decode + reverse).
- Verified sha256(reconstructed flag) == top password (preimage, infeasible to forge).
- Wrote solve.py (deterministic), writeup, card.
