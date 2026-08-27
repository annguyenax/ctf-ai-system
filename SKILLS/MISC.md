# Skill - MISC coordinator

Misc is a routing category, not permission to try every tool.

## Classify representation first

| Signal | Branch |
|---|---|
| QR/Data Matrix/barcode | geometry -> structure -> ECC -> decode |
| Image/audio signal | metadata -> channels/spectrum -> bounded stego |
| Archive/document/custom format | container inventory -> embedded objects -> parser behavior |
| Browser/CSS/JS puzzle | static assets/routes/styles before browser emulation |
| Model/checkpoint/tokenizer | switch to `SKILLS/AI_ML.md` |
| Mobile APK/IPA | manifest/resources -> decompile -> native/network branch |
| Hardware/logic capture | protocol/clock/encoding -> decode -> validate |
| Blockchain/smart contract | source/ABI/state -> invariant and transaction simulation |

## Fast path

1. Preserve hash, type, dimensions, metadata, and container structure.
2. Write three competing representations, not three decoders for one assumption.
3. Run one cheap discriminative test per representation.
4. Use structural invariants: barcode finder/timing, file signatures, checksums, protocol framing, image dimensions.
5. Escalate to brute force or repair only after the representation is proven.

## Common traps

- Treating any square pattern as QR.
- Trusting garbage emitted by an error-correcting decoder.
- Running generic stego suites before inspecting visible structure.
- Misattributing a chained challenge's clue or route.

## Verification

Require checksum/ECC success plus coherent payload, an independent decoder, deterministic reconstruction, or scoreboard/server acceptance.
