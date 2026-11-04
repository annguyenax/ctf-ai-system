# Hic Sunt Dracones — FortID CTF 2026

Status: locally verified and listed as SOLVED by a read-only platform status query on 2026-10-10.

Flag: `FortID{1f_D0n_Knu7h_H4s_1t_0n_th3_W4ll_Th3n_17_Mu57_B3_G00d_F0r_Crypt0_r1ght?}`

## Intake

- Category: Crypto.
- Challenge ID: `fd17ec7a-834b-4342-bd51-a3329b8f2025`.
- Handout: `CTFTimeWriteup/FortIDCTF2026/Crypto/Hic Sunt Dracones/files/handout.zip`.
- Handout SHA-256: `384B4B3ADE8E0A008E54AF7C4820EFE0C4F2E907B5D0F35CDDC413DAA7A036A0`.
- The challenge has no remote instance.

## Solve

The dragon renderer carries turtle heading across successive characters. Reproduce its turn sequence for each candidate iteration count and angle, and calculate the displacement coefficients. Printable Koblitz x-coordinates bound the 128-bit step size and recover the original x values; subtracting the y offsets recovers the original y values.

The verifier then derives the common 256-bit prime and curve coefficients from the reconstructed points. It checks all 78 curve equations, the patched square-root calculation, the first valid Koblitz `j`, the coefficient generation ranges, and the nonzero discriminant. Exactly one candidate passes. Run `python solve/verify.py` from the event challenge directory.

## Evidence

- Event verification transcript: `CTFTimeWriteup/FortIDCTF2026/Crypto/Hic Sunt Dracones/solve/evidence/verification.txt`.
- Event evidence manifest: `CTFTimeWriteup/FortIDCTF2026/Crypto/Hic Sunt Dracones/solve/evidence/manifest.md`.
- A read-only status query listed the challenge as SOLVED; the verifier does not make network requests.
