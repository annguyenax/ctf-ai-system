# Capture report: l3akctf_spectre

- Status: solved and verified offline from the original PNG.
- Reusable signal: a wide grayscale image with frequency-like rows and many
  regularly separated activity groups.
- Effective method: invert an 80 dB mel power image with mel-to-STFT and seeded
  Griffin-Lim, then transcribe overlapping activity-aligned windows.
- Verification: two phase seeds produced identical sample count/duration and two
  ASR model sizes agreed on the long message structure.
- Challenge flag and generated audio/model caches are intentionally omitted.

