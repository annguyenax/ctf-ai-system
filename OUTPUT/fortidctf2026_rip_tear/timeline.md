# Timeline — fortidctf2026_rip_tear

- 2026-10-11: Confirmed the local `m_random.c` blob matches the challenge patch base; recorded `M_Random` indexing and the melt recurrence.
- 2026-10-11: Fit the new-game transition (frames 340/410 as references; 370/375/380 samples). Best start 2, ticks 21/24/27; 155 bits known.
- 2026-10-11: Fit E1M1-to-intermission (11130/11220 references; 11154/11160/11166 samples). Best start 144, ticks 16/20/23; 252 bits known.
- 2026-10-11: Fit intermission-to-E1M2 (12048/12120 references; 12066/12072/12078 samples). Best start 21, ticks 16/19/23; 255 bits known.
- 2026-10-11: Added extra samples from the first and third wipes. Index 134 remains tied because both RNG outcomes reflect the predecessor `y=-15` back to the same state.
- Current status: one bit unresolved; likely `_` from the plaintext structure, but not independently verified and not submitted.
