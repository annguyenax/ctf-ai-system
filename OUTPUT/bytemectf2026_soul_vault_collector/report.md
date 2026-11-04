# Soul Vault: The Collector — capture report

Status: verified. Exact flag: `OWASP{S0ul_St0ne_C0ll3ct0r_UAF_Aw4k3n3d}`.

A stale pointer in the global soul table permits inspection and renaming after free. Safe-linking leaks recover the heap layout; a poisoned 0x40 tcache entry overlaps a soul’s callback field to leak PIE. A second tcache poison allocates over the adjacent BSS ritual counters. The hidden branch starts `/bin/sh` after the counters are set to `6, 3, 1`.

The final solver passed locally with a `/proc/maps` PIE assertion and `LOCAL_OK`, then one direct TCP session to `145.239.142.129:1338` returned the same flag from `/home/ctf/flag.txt`. Portal submission was not made; portal status remains OPEN.

Primary artifacts and hashes are recorded in the event repository at `CTFTimeWriteup/ByteMeCTF2026/Binary Exploitation/Soul Vault_ The Collector/solve/evidence/manifest.md`.
