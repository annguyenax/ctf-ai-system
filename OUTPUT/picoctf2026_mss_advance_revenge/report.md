# Report - picoctf2026_mss_advance_revenge

## Goal
Recover picoCTF flag from 20 evals of a SHA256-chained degree-29 polynomial and AES-CBC ciphertext.

## Environment and artifact hashes
- `chall.py` sha256 `2fa2596a22d064030ccb2f2ec2c35e90dc54560a6e25a0e93e86d0ab7cd7a7ce`
- `output.txt` sha256 `ddf8fe30802c0084c4e9bbc93fdf13e8776eef7aafa9f8bd7344d01fad759044`

## Enumeration and decisive signals
1024-bit p, 30 hash-chained 256-bit coeffs, 20 points, AES key = SHA256(flag).

## Exploitation / recovery
51-dim affine lattice, python-flint LLL 14.2s, 30 bit-length candidates, one hash-chain + AES hit.

## Verification
All 20 points match reconstructed coeffs; PKCS7 unpad; `picoCTF{...}` plaintext.

## Failed paths and why
Existing `solve.py` sympy LLL — too slow for this lattice size.

## Lessons and faster path
Use flint/fpylll/Sage for LLL ≥ ~40 dim with >1k-bit entries. Sympy is a trap.

Agent writeup (Hermes-oriented): `D:\download\CTFTimeWriteup\picoCTF2026\Crypto\MSS_ADVANCE Revenge\writeup\writeup.md`

Flag: `picoCTF{MSS_Advance_but_we_brought_it_back_and_made_it_harder!!!}`
