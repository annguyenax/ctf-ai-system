# ELF telemetry FNV + xorshift section

## Signal

Custom ELF section (short, non-`.text`); prompt about host/activation profile; FNV offset `0xcbf29ce484222325` or xorshift64\* mul `0x2545f4914f6cdd1d`; README says do not run.

## Method

1. `readelf -S` — dump the custom section as ciphertext.
2. Collect **compare literals** from the host-check (not the real hostname).
3. FNV-1a-64 over each field; if you see `0xff` stores, absorb `0xff` after each field.
4. Mix with a baked ASCII constant if present (`xor` / `add`).
5. xorshift64\* : `s ^= s>>12; s ^= s<<25; s ^= s>>27; byte = (s * 0x2545F4914F6CDD1D) >> 56`.
6. XOR the section. Expect ASCII flag.

## Verify

Plaintext is the published flag format; length matches section size. Re-encrypt or second pass of the PRNG from the same seed.

## Pitfalls

Running a “dormant implant”. Wrong field order or delimiter. Using SHA-256 of the section.

## Not this

Packed UPX or whole-file crypto; those are not a tiny named section.
