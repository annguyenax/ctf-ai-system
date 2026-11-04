# Reusable patterns
1. Patched-game backdoors: diff against vanilla, then trace the patched RNG table
   consumers for side channels (melt/wipe randomness).
2. Video side-channel extraction: detect tick rate, track per-column edges,
   Viterbi with physical constraints; anchor unknown offsets with known plaintext.
