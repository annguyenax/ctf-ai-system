# Playbook: Multi-mode RF-styled audio (spectrogram + Morse + speech)

**Trigger:** A high-sample-rate WAV (e.g. 96 kHz) whose prompt hints at "pieces",
"RF", or a broken flag; the spectrogram shows several distinct time/frequency
regions and/or broadband noise.

## Method

1. **Overview spectrogram** of the whole file, full band (0..Fs/2). Note distinct
   regions by TIME and FREQUENCY — each is likely a separate encoding.
2. **Per band, classify the mode:**
   - Narrow tone toggling on/off -> **Morse (OOK)**: complex-demod at the tone,
     envelope, threshold, cluster dot/dash + gaps, decode.
   - Blocky glyphs / letters drawn in the spectrogram -> **spectrogram text**.
     If glyphs are **mirrored**, the segment is reversed audio: reverse it in time
     (`x[::-1]`) and re-plot. Orientation can differ **per segment**.
   - 0-4 kHz with a ~150-250 Hz fundamental + moving formants -> **human speech**
     (often buried under added broadband noise). Low-pass ~3.8 kHz, normalize, and
     LISTEN (or ASR). Don't dismiss it as noise.
   - Two clean tones -> DTMF; horizontal image lines 1500-2300 Hz -> SSTV; etc.
3. **Assemble** the parts in order (use appearance time + any explicit hints such as
   "part N is uppercase") and verify the flag framing.

## Verification

Morse/DTMF/SSTV decodes are reproducible in code. Spectrogram text is read visually
(keep the annotated crop as evidence). Speech requires listening/ASR — mark the flag
unverified until every part is recovered.

## Pitfalls

- Broadband "noise" may hide 0-4 kHz speech — always zoom the low band and check for
  formants before calling it filler.
- Each drawn-text segment may be forward OR reversed; test both orientations.
- Offline environments may lack audio playback / ffmpeg / whisper: extract clean
  speech clips and hand off, do NOT guess the transcript.

## Used by

- L3akCTF2026 / BabyRF (paused on speech transcription) — `cards/l3akctf_babyrf.yaml`
