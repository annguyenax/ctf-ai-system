# Timeline - securinetsquals2026_encrypt

| Time | Phase | Observation / decision | Evidence |
|---|---|---|---|
| 2026-10-18 | TRIAGE | prior notes: AES S-box reuse, custom pipeline, outer layers inverted | notes/ORACLE.md |
| 2026-10-18 | TEST | header decode failed for all q1 models; Frida seed capture shows q1 = 0 | notes/ANALYSIS_SESSION3.md |
| 2026-10-18 | TEST | f is generated straight-line bijection; pass C is a bignum T-function; pass A AES-like | solve/dec.py |
| 2026-10-18 | VERIFY | brute w0 0..999: single valid XPRESS plaintext at 725; re-encrypt equals cipher.txt | solve/evidence/recovery.json |
