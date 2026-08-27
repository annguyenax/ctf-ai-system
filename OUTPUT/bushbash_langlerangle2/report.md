# Report — bushbash_langlerangle2

## Goal

Recover 18-byte flag body from template-level Feistel encryption.

## Environment

Obfuscated C++ header; key list `GEUE`; 16-round Feistel; `output[18]`.

## Exploitation

Deobfuscate ops → invert Feistel on pairs → `ma5B3_sf1NAe_neXt?` → wrap `bushbash{…}`.

## Verification

Re-encrypt matches provided ciphertext (solver notes + author path).

## Flag

`bushbash{ma5B3_sf1NAe_neXt?}`
