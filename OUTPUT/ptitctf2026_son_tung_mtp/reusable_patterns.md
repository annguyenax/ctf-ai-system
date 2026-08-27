# Reusable patterns

## Ultrasonic spectrogram text over music

Trigger: a 48/96 kHz WAV whose RIFF container is clean but whose overview spectrogram has a time-localized region above the ordinary musical bandwidth.

Minimal method:

1. Hash and parse the source WAV.
2. Render a coarse full-band spectrogram.
3. Locate the isolated region by time and frequency.
4. Re-render only that region with a smaller hop and high contrast.
5. Verify ambiguous glyphs with a second FFT size/hop or implementation.

Pitfall: listening alone may miss content above normal hearing; deep LSB/carving work is wasted if the payload is plainly visible in the frequency domain.

Existing playbook: `PLAYBOOKS/rf_multimode_audio_spectrogram.md`.
