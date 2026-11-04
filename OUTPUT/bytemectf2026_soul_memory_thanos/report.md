# ByteMe CTF 2026 — Soul // Memory of Thanos

Status: solved; flag verified locally and on the scoped remote service. Portal submission was not made.

Flag: OWASP{Th4n0s_S0ul_Mem0ry_UAF_Type_Confusion}

merge_souls frees its source object but leaves archive[source] pointing to it. transfer_soul immediately allocates the same 0x40 size and lets input set its callback at +0x38 and essence at +0x20. The final merge source slot therefore aliases the controlled record.

Inspecting a type-1 soul leaks inspect_human at PIE offset 0x13a9. Subtracting this address yields the PIE base; soul_ascension is at offset 0x14fb. Seven captures, one erase, and three merges satisfy the callback counters. The essence magic is 0x50574e534f554c53. Inspecting the stale final source slot calls the hidden callback and returns the exact flag.

Local and remote transcripts are kept in the event repository under solve/evidence. The original archive hash is recorded in recovery.json. The bundled loader/libc pair aborts locally; the WSL system runtime works. No portal acceptance is claimed.