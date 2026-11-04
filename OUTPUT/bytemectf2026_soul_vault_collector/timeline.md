# Timeline

1. **Intake:** Read the existing challenge metadata and archive. Confirmed the scoped service endpoint is `145.239.142.129:1338`; archive SHA-256 `B775446229370D42336B04010322DB5C862CC0AA501F3B12DAF670FF9D93BC54`.
2. **Static analysis:** Identified stale `souls[]` pointers, 0x40-byte soul chunks, adjacent BSS ritual counters at PIE offsets `0x40e0` through `0x40e8`, and the `system("/bin/sh")` branch.
3. **Local verification:** Safe-linking leaks recovered the heap layout. Tcache overlap leaked `callback_soul`, and the BSS poison passed the gate. Local transcript records the PIE map assertion and `LOCAL_OK`.
4. **Remote verification:** One TCP session reached the shell and read `OWASP{S0ul_St0ne_C0ll3ct0r_UAF_Aw4k3n3d}` from `/home/ctf/flag.txt`.
5. **Capture:** Added the solver, writeup, flag, evidence manifest, recovery JSON, knowledge card, and router entry. The portal was not submitted; metadata remains OPEN.
