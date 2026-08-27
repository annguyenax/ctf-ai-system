# Timeline — BabyLCG

1. INTAKE: read challenge.md, extracted tar.gz to scratch. Saw `chall.py` + `output.txt`.
2. TRIAGE: LCG keystream, modulus + 3 states leaked → known-modulus LCG recovery (confidence 0.95).
3. EXPLOIT: computed a, c via diff-of-recurrences; predicted key; XOR ct.
4. VERIFY: recurrence asserts pass; flag = clean ASCII `L3AK{n3v3r_trU5t_b4s1c_LCG5_frfr}`.
5. CAPTURE: writeup + solver + evidence (SHOW); card + playbook + report (LEARN); scratch cleaned.
