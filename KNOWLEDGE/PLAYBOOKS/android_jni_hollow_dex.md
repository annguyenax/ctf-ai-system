# Android JNI hollow DEX

## Signal

Tiny APK; `JNI_OnLoad`; strings `/proc/self/maps`, `/proc/self/mem`, `dex\n` / `.apk`; Java `verify*` looks present in DEX but does not disassemble as real Dalvik.

## Method

1. `unzip` / `file` the APK; extract `classes.dex` and `lib/*/lib*.so`.
2. Disassemble `JNI_OnLoad`. Confirm it finds a mapped DEX and writes insns.
3. Take the repeating XOR key from `.rodata` (often 16 bytes next to the path strings).
4. XOR `code_item` insns (`code_off+16`, length `insns_size*2`).
5. Disassemble the patched method (androguard/baksmali). Recover the real check (often hex parse + small ARX/Feistel).
6. Invert offline. If the portal says `CTF{sha256}`, hash the **secret string** the app would accept, not a guessed wrap.

## Verify

Forward-run the recovered algorithm on the candidate; bytecode after XOR must be valid Dalvik (`const/4` / `invoke-*`, not random).

## Pitfalls

- Trusting jadx of the stock DEX.
- Treating the XOR key as the vault key (it only un-hollows).
- Confusing app secret (32 hex) with scoreboard format.

## Not this

Native-only checkers that never touch `/proc/self/mem`. Packed DEX (open) is a different unpack path.
