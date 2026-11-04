# Report — fortidctf2026_rip_tear

## Goal and scope

Recover the 32-byte flag encoded by XORing each MSB-first flag bit into one
Chocolate Doom `rndtable` LSB. Use only the already-local challenge patch,
matching local source, and the gameplay copy previously authorized by the user.
No network access or submission occurred in this solve pass.

## Inputs

- Patch: `CTFTimeWriteup/FortIDCTF2026/Misc/Rip & Tear/files/chocolate-doom.patch`, SHA-256 `1678b2162fc83c8df274428d73f823ec50c4552bfc992fdb17bc9c7a6c2c9114`.
- Local gameplay: `D:/download/ctf-scratch/rip_and_tear/gameplay.mkv`, SHA-256 `54a529228be00a59d84da676f049d722b57ac22cd57851a29b35c5b5f31b5aa9`.
- Local `m_random.c` matches patch base blob `b4f59b33f47cb73bd7333a65cfa969dfd6676f62`.

## Method and results

The source's melt wipe provides a measurable channel: `wipe_initMelt()` sets
the first column position with `%16`, then derives later positions with `%3`
and reflection into `[-15,0]`. `wipe_doMelt()` visibly uses 160 packed columns.
The solver fits each boundary against both old and new screen segments, then
uses Viterbi with the known `FortID{` prefix to infer table bits.

Three transitions independently favor table starts 2, 144, and 21. The first
fit gives 155 known bits; the second raises coverage to 252; the third reaches
255/256. Extra samples from the first and third wipes leave bit 134 tied. In
both transitions its previous state is `y=-15`, where the two possible `%3`
increments, 0 and −1, both reflect to `-15`.

The seven known bits in the affected byte are `010111?1`, leaving `]` or `_`.
The underscore produces a coherent plaintext, but this is an inference from
structure rather than an observed bit. No verified flag is recorded, and no
`final_flag.txt` exists.

## Verification status

`solve/rndtable_observations.csv` contains the 255 resolved entries. Running
the event decoder reports 255/256 and the partial decode. The remaining bit
has not been distinguished by the available wipe observations or by a
scoreboard check. Status: `needs_verification`; not submitted.

## Failed paths and lessons

The bounded audio-pitch probe found only 1.00 playback-rate matches; it did not
identify RNG calls. A simple visual onset detector was also unreliable because
the title background animates. The decisive approach matched the old screen
shift and new screen together under the source recurrence. A table edit is not
enough to identify a bit if a state transition maps both values to the same
reflected state.

## Next actions

1. Check whether the remaining local video contains another wipe that consumes
   index 134 from a non-reflected predecessor state.
2. Otherwise trace a non-wipe `M_Random()` consumer around a synchronized
   index-134 sample and test whether its value changes a visible HUD/game event.
3. Keep both final-byte alternatives until direct evidence or a later
   authorized scoreboard check resolves them.
