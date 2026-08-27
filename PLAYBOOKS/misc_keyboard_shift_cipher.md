# Playbook: Keyboard shift cipher (misaligned hands)

**Trigger:** Text looks like broken English where nearly every wrong letter is a
key physically adjacent to the intended one on QWERTY (e.g. "tjomlomg" = "thinking").
Prompt hints at typing / monkeytype / "looking at your hands".

## Preconditions

- One (or both) hands were offset by one column left/right while typing.
- Common variant: **right hand shifted one key right** — right-hand keys
  (y u i o p [ ] \, h j k l ; ', n m , . /, 6 7 8 9 0 - =) come out as the key to
  their right; left hand (q w e r t / a s d f g / z x c v b / 1-5) and space are normal.

## Minimal method

Build the physical QWERTY rows in BOTH shift layers, then remap each affected key
to the key one column toward the hand's home (opposite of the offset). For the
right-hand-shifted-right case, decode = one key LEFT:

```python
ROWS = [
    ("1234567890-=",  "!@#$%^&*()_+"),
    ("qwertyuiop[]\\", "QWERTYUIOP{}|"),
    ("asdfghjkl;'",   'ASDFGHJKL:"'),
    ("zxcvbnm,./",    "ZXCVBNM<>?"),
]
dec = {}
for lo, up in ROWS:
    for layer in (lo, up):
        for i in range(6, len(layer)):   # right-hand typed keys start at index 6
            dec[layer[i]] = layer[i-1]
plain = "".join(dec.get(c, c) for c in cipher)
```

If it comes out as gibberish, try the other direction (shift right / left hand)
or a full ±1 in both directions.

## Verification

The one substitution should turn the WHOLE message into coherent language AND
produce a well-formed flag simultaneously. If only the flag "works" but the prose
is garbage, the mapping is wrong.

## Pitfalls

- Include the number row and punctuation + shift layer, or symbols in the flag are lost
  (`|`->`}`, `+`->`_`, `-`->`0`).
- Don't mistake literal `...` / repeated punctuation in the flag for a redaction.

## Solved with this playbook

- L3akCTF2026 / me fr — `cards/l3akctf_me_fr.yaml`
