# Timeline

1. Intake: confirmed the challenge source and ELF exist; no previous local solve artifacts. Did not execute the sample because no isolated VM was confirmed.
2. Static analysis: traced the fixed seed, SplitMix-style finalizer, FNV-style path hash, five handling classes, and four-fragment exception.
3. Recovery: reversed the final fragment's bytewise XOR stream and recovered tag 2.
4. Verification: checked all four tagged source literals against the ELF, assembled the wrapper and ordered body, and validated the `OWASP{...}` shape.
5. Capture: saved solver, recovery JSON, final flag, writeup, and knowledge card. No portal submission was made.
