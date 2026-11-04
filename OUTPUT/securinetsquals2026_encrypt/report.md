# Report - securinetsquals2026_encrypt

## Goal
Recover the plaintext of `cipher.txt` produced by a packed Rust/egui "Encrypt" tool (Securinets Quals 2026, Reverse, 475 pts).

## Environment and artifact hashes
handout.zip sha256 6b4d55efa6de50f1ee11341b4c2dfb288c9791a7e53db646f668d3ab59898f1f (cipher.txt + 7.5 KB stub `encrypt.exe` with LZMA resource FPACK -> inner PE).
Windows, Python 3.13, unicorn 2.1.2, capstone, pefile, Frida via REA.

## Enumeration and decisive signals
* Output is base64 (shuffled alphabet) of a publicly length-seeded Fisher-Yates permutation of header(14) | payload | tail(4).
* Header is masked by a stream keyed from the seed struct; the `q1` field is 0 in a real process (`GetModuleHandle(NULL)` is the stub, so the self-hash is 0).
* Seed fields: q0 (unix s), q1, w0 (ms), w1; w0 is not stored -> brute force 1000 values.
* Key material (S-box, round keys, generated machine-code function `f`, bignum constants, keystream) depends only on seed + lengths.

## Exploitation / recovery
Emulate the program's own encrypt routine with the guessed seed on a dummy plaintext to harvest key material, invert each stage in Python, XPRESS-decompress, accept the guess whose output is valid, 78 bytes and starts with `Securinets{`.

## Verification
Re-running the original routine with the recovered plaintext and seed (0x6ad336b7, 0, 725, 0x7d9e) reproduces cipher.txt byte for byte. Evidence: `CTFTimeWriteup/SecurinetsQuals2026/Reverse/Encrypt/solve/evidence/recovery.json`.

## Failed paths and why
Modelling q1 from the unpacked `.text` hash plus anti-debug tweaks (never decoded); trusting `0x3c6e... ^ q1` for fdd0 (failure path only).

## Lessons and faster path
Capture the seed struct dynamically first. Use the emulator as a key-material oracle instead of re-deriving RNG/float code by hand.

## Alternative approaches
Fully lifting the RNG and float table generator to Python would avoid the emulator but costs much more.
