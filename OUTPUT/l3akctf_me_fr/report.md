# Report — L3akCTF2026 / me fr (Beginner/misc)

- **Status:** solved (verified)
- **Flag:** `L3AK{WHY_D0_1_dO_TH1S_s0_0f73N...}`
- **Artifact:** `me_fr.txt` (sha256 f927e41...7891a), 170 B

## Signal → approach

Prompt references monkeytype/typing. `me_fr.txt` is near-English text where wrong
letters are QWERTY-adjacent (`tjomlomg`=`thinking`). Right hand was shifted one key
right; decode by mapping right-hand keys one column left (both shift layers).

## Result

Full message decodes to a coherent sentence ending with the flag. Digits 1-5,
left-hand keys and spaces unchanged; symbols handled via the shift layer
(`|`->`}`, `+`->`_`, `-`->`0`).

## Verification

One substitution decodes BOTH the prose and the flag consistently → verified.
Fully offline, no tools/HexStrike.

## Pointers

- Writeup: `../CTFTimeWriteup/L3akCTF2026/Beginner/me fr/writeup/writeup.md`
- Solver: `../CTFTimeWriteup/L3akCTF2026/Beginner/me fr/solve/solve.py`
- Card: `KNOWLEDGE/cards/l3akctf_me_fr.yaml`
- Playbook: `PLAYBOOKS/misc_keyboard_shift_cipher.md`
