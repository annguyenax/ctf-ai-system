# Meteor Shower — FortID CTF 2026

Status: solved and scoreboard confirmed on 2026-10-10.

Flag: `FortID{SCIENTIA_POTENTIA_EST}`

## Intake

- Category: Reverse.
- Challenge ID: `ecc61143-7a2b-4d82-875c-7b24a735d2a4`.
- Artifact: `CTFTimeWriteup/FortIDCTF2026/Reverse/Meteor Shower/files/meteor_shower.nes`.
- Artifact SHA-256: `B33D3EE1D0422DDDE72B7493CCC2200F67D3457AEA4ED08E1A6450E456996569`.
- No remote instance is listed.

## Solve

The visible Easter Egg screen is a clue. Its “BACON & EGGS” and “FIVE STRIPS AT A TIME” text points to Bacon's five-bit cipher. The game accepts 95 A/B button bits, exactly 19 five-bit letters.

The check at `$8158` initializes its table index to `0x0b`; for each input bit `i`, it computes `(table1[index] ^ table2[index] ^ i) & 1`, then advances the index by `0x25` modulo 128. The input handler maps A to 0 and B to 1. A zero mismatch accumulator returns carry set, which enters the Easter Egg state.

Reading the 128-byte tables at `$8718` and `$8798` reproduces the accepted stream:

```text
10010 00010 01000 00100 01101 10011 01000 00000 01111 01110
10011 00100 01101 10011 01000 00000 00100 10010 10011
```

Five-bit values from 0 to 25 map to A-Z, yielding `SCIENTIAPOTENTIAEST`, or `SCIENTIA POTENTIA EST`. The prompt's underscores produce the flag above.

An initial text-only guess from the visible Easter Egg prose was wrong; reversing the 95-bit checker identifies the actual phrase.

## Verification

The local solver independently recomputes the 95 bits and decodes the phrase. The preserved submission transcript reports `SUCCESS! The flag is correct`, and a read-only status query lists Meteor Shower as SOLVED.

Run `python solve/solve.py` from the event challenge directory to reproduce the offline decode.
