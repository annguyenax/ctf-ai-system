# Reusable pattern - securinetsquals2026_encrypt

## Detection signals
Packed GUI encryptor, ciphertext length not block aligned, self-hash / anti-debug code feeding the seed, run-time generated machine code, only an encrypt direction available.

## Decision rule
If the routine is a pure function of (seed, lengths) and the seed is small or partly stored in the output, treat the program as a key-material oracle: emulate it on a dummy input, invert each stage, brute force the unstored seed part, accept via a checksum or format.

## Minimal workflow
1. Capture a real seed dynamically (Frida on an API called right after seed creation).
2. Decode the stored header with the observed seed values.
3. Emulate the routine (Unicorn) with hooks that dump S-boxes, round keys, constants and generated code.
4. Invert stage by stage and test each inverse against emulator snapshots.
5. Brute force the missing field, accept on valid decompression and format.

## Verification
Re-encrypt the recovered plaintext through the original routine and compare with the given ciphertext.

## Pitfalls / non-applicable cases
Anti-debug and self-hash values differ between the stub process and static analysis. Dumped runtime-generated code differs per seed. T-functions (bignum x + f(x)) are invertible bit by bit but may branch.
