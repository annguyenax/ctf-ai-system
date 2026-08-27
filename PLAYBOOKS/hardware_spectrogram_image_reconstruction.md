# Playbook: Reconstruct speech from a spectrogram image

**Trigger:** An image is unusually wide, its vertical axis resembles frequency
bins, and the prompt hints that a message is spoken or should be heard.

## Preconditions

- Preserve the original image hash and inspect mode, dimensions and metadata.
- Determine whether brightness is likely amplitude, power, or decibels.
- Treat the vertical orientation as unknown until tested.

## Minimal method

1. Measure column energy and count stable activity groups over several thresholds.
2. Test competing representations cheaply:
   - linear STFT when `height = n_fft/2 + 1` is plausible;
   - mel power when the height looks like a chosen mel-bin count;
   - both vertical orientations.
3. Convert displayed dB values back to power or magnitude.
4. For a mel image, approximate linear magnitude with `mel_to_stft`; estimate
   missing phase with Griffin-Lim using a fixed seed.
5. Check duration and activity count before listening or using ASR.
6. For spelled characters, transcribe overlapping windows of roughly 10-12
   activity groups. Single-token ASR often loses too much context.

## Verification

- Replay reconstruction from the original hash with at least two phase seeds.
- Require invariant dimensions, activity count, sample count and duration.
- Compare overlapping transcripts and, when practical, two ASR model sizes or
  manual listening. Resolve isolated ASR confusions using positions, charset and
  whole-message coherence; never trust one generated transcript alone.

## Pitfalls

- Image frequency order is commonly high-to-low, opposite the matrix expected by
  audio libraries.
- Treating dB pixels as linear magnitude produces poor audio.
- A mathematically compatible linear-STFT height is not proof of a linear STFT.
- Letter names and digits are easily confused by ASR (`3/E`, `7/T`).
- Per-token clustering can fail because of coarticulation and varying phonetic
  context.

## Faster path

Use activity count and reconstructed duration as early discriminators. A result
with roughly one second per spoken symbol is much stronger than an arbitrary
parameter set that merely yields a valid WAV.

