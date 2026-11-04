# Checksum — FortID CTF 2026

Status: needs verification; no flag recovered.

The `FLAG` command selects a static call graph of 1,912 functions. Expanding its XOR operations produces 4,818 bytes whose XOR is the observed one-byte result `0x39`. That trace is not plaintext. Direct SHA-1 checks over the function code, subtree traces, folded values, and common local-operation serializations found no symbol-name matches. Supplying two different local `FLAG` environment values also left the result unchanged.

No candidate flag is established, and no new flag was submitted. The next useful work is to inspect the `main` dispatch and all reachable node behavior for a distinct input-dependent path; avoid broad symbolic execution or more command-name guessing.

Evidence stays in the event folder: `D:/download/CTFTimeWriteup/FortIDCTF2026/Reverse/Checksum/`.
