# Report — ptitctf2026_son_tung_mtp

## Goal

Recover the hidden flag from the supplied 7z/WAV artefact.

## Environment and artefact hashes

- Archive SHA-256: `40d74ae84433c3c28579b117b3709231bf444e92905bffa996bc06e1c1b2d5cd`.
- Extracted WAV SHA-256: `01a78ea1b28d71ca2b955d11048427e3acfe4d72ce6cfb15eb7e7581204dc713`.
- Stereo signed 16-bit PCM, 48 kHz, 245.6588125 s; canonical RIFF with only `fmt ` and `data`.

## Decisive signal

The whole-band spectrogram contains a unique high-energy region at roughly 1.7–19.2 s and 15.2–18.85 kHz. Cropping that band reveals serif glyphs spelling the flag.

## Recovery

Average stereo to mono, apply Hann windows, compute an FFT magnitude image, crop the ultrasonic band, and increase contrast. The deterministic NumPy solver retains one PNG as evidence.

## Verification

Two independent renderings agree: SciPy STFT (`nfft=4096`, hop 128) and manual NumPy framing/rFFT (`nfft=2048`, hop 96). Both show `PTITCTF{N0T_JUST_MUSIC_BUT_A_MASTERPIECE}`. The retained NumPy image hashes to `f4261c7d7514fb9612d4f0fc8c1c3f4b548133e51afc623cb3a8504915b495fe`.

## Failed paths

- RIFF metadata, custom chunks, and trailing bytes: absent.
- Raw flag regex: absent.
- Bit planes 0–3, interleaved and per-channel: no meaningful magic/text; LSB density ~50%.
- External exact-title and exact-flag searches: no results.

## Faster path

For high-sample-rate WAV forensics, use a full-band overview spectrogram immediately after shallow container/string checks; then crop any isolated high-frequency time region.
