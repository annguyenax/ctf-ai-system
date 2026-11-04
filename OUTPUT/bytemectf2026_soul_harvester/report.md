# ByteMe CTF 2026 — SOUL STONE — THE SOUL HARVESTER

Status: **solved by deterministic static reconstruction**. Flag: `OWASP{forensics_harvester_complete}`. The executable was not run and portal acceptance is unverified.

The source fixes `SEED = 0x534F554C53544F4F`, defines a five-class targeting selector, and keeps three Soul fragments out of the general file-handling pass. The fourth fragment is XORed bytewise with `mix(SEED + i) & 0xff`; reversing the same stream recovers `SOUL|02|harvester_`. A Python model regenerated all 73 records and validated recovery of all 69 files that use the general selector. The model did not create files or execute the sample.

The four fragment payloads are tag 1 `forensics_`, tag 2 `harvester_`, tag 3 `OWASP{`, and tag 4 `complete}`. Tags 1 and 2 order the body; the unique flag delimiters define the start and end. The solver verifies this assembly against the declared `OWASP{...}` format and checks the four source literals against the supplied ELF.

Reproduce from the challenge folder with `python solve/solve.py`. Evidence and SHA-256 values are in `solve/evidence/recovery.json`; event writeup is in `Miscellaneous/SOUL STONE — THE SOUL HARVESTER/writeup/writeup.md`.
