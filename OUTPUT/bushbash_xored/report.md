# Report — bushbash_xored

## Goal

Recover flag from repeating-key XOR ciphertext.

## Environment

- Event: BushBash2026  
- Files: `encrypt.py`, `flag.enc` (31 bytes)  

## Enumeration

Encrypt script uses `byte ^ key[i % len(key)]`. No key file in handout.

## Exploitation

Known-plaintext prefix `bushbash` → 8-byte key `3a3bebb319914818` → full decrypt.

## Verification

Re-encrypt matches `flag.enc` byte-for-byte.

## Flag

`bushbash{to-x0r-or-nOt-To-Xor}!`

## Lessons

Flag-prefix crib first; always re-encrypt verify.
