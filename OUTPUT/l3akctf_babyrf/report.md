# Report — L3akCTF2026 / BabyRF (Beginner/hardware-rf) — PAUSED

- **Status:** paused / needs_verification (4 of 6 parts recovered)
- **Flag:** not concluded (2 parts live in speech; no ASR/audio offline)
- **Artifact:** `BabyRF.wav` 96 kHz mono, sha256 f0ff1d4...ed87dd

## Structure (multi-mode, split by time/band)

| Region | Band | Mode | Result |
|---|---|---|---|
| 6-16s | ~11.6kHz | Morse OOK | `R3QU1RES` (uppercase; likely part 4) |
| 24-30s | 8-14kHz | spectrogram text (reversed) | `Pr0c3ss1ng` |
| 31-41s | 8-14kHz | spectrogram digits (fwd) | `3851642` |
| 44-47s | 26-33kHz | spectrogram text (fwd) | `31337` |
| 0-22s | 0-4kHz | speech + noise | needs listening |
| 42-51s | 0-4kHz | speech + noise | needs listening |

## Reproducible now

`python solve/analyze.py files/BabyRF.wav` -> Morse `R3QU1RES`, and writes
`speech1_clean.wav` / `speech2_clean.wav`. Spectrogram texts read from crops in
`solve/evidence/`.

## Blocker

Two speech segments carry the remaining part(s). No ffmpeg/whisper/audio playback in
this offline environment. Per rules, no flag is fabricated. Clean clips handed off.

## Next actions

1. Transcribe speech1/speech2 by ear (case-sensitive, leetspeak).
2. Order the 6 parts (part4 = R3QU1RES) into `L3AK{...}` and verify framing.

## Pointers

- Writeup: `../CTFTimeWriteup/L3akCTF2026/Beginner/BabyRF/writeup/writeup.md`
- Solver: `../CTFTimeWriteup/L3akCTF2026/Beginner/BabyRF/solve/analyze.py`
- Card: `KNOWLEDGE/cards/l3akctf_babyrf.yaml`
- Playbook: `PLAYBOOKS/rf_multimode_audio_spectrogram.md`
