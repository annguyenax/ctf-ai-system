# Reusable patterns — BabyRF

- **Multi-mode audio triage:** high sample-rate WAV + prompt about "pieces" ⇒ split the
  spectrogram by time/frequency band; each band is a separate mode. See
  `PLAYBOOKS/rf_multimode_audio_spectrogram.md`.
- **Mirrored spectrogram glyphs ⇒ reversed audio:** reverse in time to read; orientation
  can differ per segment.
- **Speech hidden as "noise":** a 0-4 kHz region with fundamental + moving formants is a
  voice under broadband noise; low-pass and listen, don't discard.
- **Honest pause:** when a part needs audio/ASR unavailable offline, extract clean clips
  and pause — never fabricate the missing part.
