# Reusable pattern

For a spectrogram image without phase, first determine whether rows are linear
frequency bins or mel bins. Convert displayed dB pixels back to power, invert the
mel basis if needed, and estimate phase with a fixed-seed Griffin-Lim run. Use
stable column-energy groups to validate duration and align overlapping ASR
windows. Verify by changing the phase seed and comparing a second decoder; do
not trust a single transcript.

