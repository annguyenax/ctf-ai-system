# Timeline

- 2026-10-25: Fingerprinted the challenge-provided PLC simulator client. Found `/api/solve` for validating rung logic and `/api/flag` for checking the assembled word.
- 2026-10-25: Submitted eight corrected ladder rungs; simulator returned `01=Y, 02=T, 03=A, 04=F, 05=E, 06=S`.
- 2026-10-25: Ordered letters by slot to `SAFETY`; `/api/flag` returned `rstcon{LD_better_than_ST}`.
- 2026-10-25: Official RSTCON helper confirmed the flag was correct/already solved.
