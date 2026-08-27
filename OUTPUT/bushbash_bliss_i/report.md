# BushBash 2026 — Bliss I

> **Invalidation notice:** The media-query flag documented below was rejected by
> the scoreboard for Bliss I. Public `/api/challenges` data shows Bliss II (ID 24,
> medium) is `chained_after: 23`, the ID of Bliss I. Therefore the rune/CSS work
> belongs to Bliss II and is not a verified Bliss I solve. `final_flag.txt` was
> removed in accordance with the evidence policy.

## Goal

Recover and verify the flag associated with the strange cloud in `bliss.png`.

## Environment

- Event/category: BushBash2026 / misc
- Artifact: `D:/download/CTFTimeWriteup/BushBash2026/misc/Bliss I/bliss.png`
- Solver: `D:/download/CTFTimeWriteup/BushBash2026/misc/Bliss I/solve/solve.py`
- Knowledge route: `SKILLS/FORENSICS.md` plus
  `PLAYBOOKS/misc_css_media_query_extraction.md`
- Artifact SHA-256: `8D1EB94E1980B94481732D36BC87F1E02ACF1738470B5FC0A67CC47AEE7B24FE`

## Enumeration

Initial visual analysis incorrectly prioritized QR/Data Matrix recovery. The
decisive pivot was the hidden Svelte component associated with
`atmospherically-questionable-runes`. `raw/route_node_22.js` defines 64
one-character elements named `square-1` through `square-64`. `raw/app.css`
highlights selected IDs under five unusual media conditions. `raw/runes.png`
orders them: aspect ratio, coarse pointer, landscape print, monochrome, and
device pixel ratio 3.

## Exploitation

| Condition | IDs | Segment |
|---|---|---|
| `screen and (aspect-ratio: 6/7)` | 6,20,23,36,44,52,55,60 | `bushbash` |
| `screen and (pointer: coarse)` | 22,28,49,52,58,61 | `alWaY$` |
| `print and (orientation: landscape)` | 2,9,17,23,31,34,47,50 | `quEsTi0N` |
| `(monochrome)` | 12,33,59,63 | `yoUR` |
| `screen and (-webkit-device-pixel-ratio: 3)` | 7,21,24,38,52,64 | `m3d1a!` |

The clue places braces after the event prefix and around the remaining segments,
and explicitly draws literal hyphens between the four inner pictograms. Thus the
payload segments must be joined with `-`, not concatenated directly.

## Verification

```powershell
python "D:\download\CTFTimeWriteup\BushBash2026\misc\Bliss I\solve\solve.py"
```

`raw/solver_stdout.txt` shows all five mappings and ends with the verified value
stored alone in `final_flag.txt`.

## Failure analysis

- QR/Data Matrix repair and traversal brute force failed because the visible grid
  was not the encoding layer (`raw/recovered.png`, `raw/decode_grid.py`).
- Bit-plane inspection found no coherent payload (`raw/bitplanes_small_rgb.jpg`).
- Background subtraction produced residue but no flag (`raw/difference_crop.jpg`).
- The semantic pivot was decisive: the runes referenced browser presentation
  capabilities, so client assets deserved inspection before deeper steganalysis.

## Lessons

For image-led misc challenges, keep QR/stego as bounded hypotheses. If clues map
to display, printing, pointer, or pixel density, search HTML/JS/CSS for hidden
routes and rare `@media` rules. Manual browser emulation is an alternative, but
static parsing is deterministic and cheaper.
