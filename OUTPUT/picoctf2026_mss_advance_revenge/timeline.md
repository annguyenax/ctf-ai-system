# Timeline — picoctf2026_mss_advance_revenge

| Time | Phase | Observation / decision | Evidence |
|---|---|---|---|
| T0 | INTAKE | chall.py + output.txt: 1024-bit p, 20 pairs, AES-CBC IV zeros | files/ |
| T1 | TRIAGE | 30 coeffs = SHA256 chain from MASTER_KEY=sha256(flag); 20 < 30 points | chall.py |
| T2 | HYPOTHESIS | coeffs 256-bit << p → affine modular LLL | H1 |
| T3 | TEST | sympy Matrix.lll on 51×51 hangs | solve/solve.py |
| T4 | EXPLOIT | python-flint LLL 14s recovers MASTER_KEY | solve/solve_flint.py |
| T5 | VERIFY | flag rebuilds all 20 evals + AES plaintext | solve/verify_flag.py |
| T6 | CAPTURE | writeup, card, playbook, OUTPUT | this directory |
