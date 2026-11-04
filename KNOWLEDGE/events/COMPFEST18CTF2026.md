# COMPFEST18CTF2026 — digest (batch 9, partial: 6 of this event's challenges)

Recurring techniques observed in this subset (not confirmed to cover the full event):
- Smart-contract bugs that look like they need reentrancy/signature attacks but reduce to a plain authorization/accounting bypass (constructor credits deployer not funder; relayer can move any account's credit).
- RSA variants whose "unusual" phi/exponent construction still reduces to a Wiener-style continued-fraction attack when a private value is small, verified by exact re-encryption rather than trusting the algebraic formula.
- PCAP/forensics chains combining a covert channel (ICMP marker) with memory-dump (MiniDump) parsing and sequence-correct TCP reassembly before AES decryption.
- Native-parser out-of-bounds writes from untrusted server-controlled text (CLUSTER NODES) mapped precisely via DWARF/addr2line to adjacent struct fields.
- Reverse targets whose binary has no embedded flag at all — the real contract is a live, server-random challenge-response protocol that a statically-recovered transform must answer.

| path | category | one-line technique or pitfall | status | card id |
|---|---|---|---|---|
| Blockchain/Phantom Ledger | Blockchain | Vault constructor credits deployer (Setup) not funder; relayer can move any account's credit, so player (as relayer) drains Setup's stranded balance | solved | compfest18ctf2026_phantom_ledger |
| Crypto/hello | Crypto | Generalized Wiener attack: e=inverse_mod(phi-d,phi) with phi=(p^10-1)(q^10-1) leaks k/d via continued fractions of e/N^10; true quotient-ring exponent needs per-prime polynomial factorization, not phi-d | solved | compfest18ctf2026_hello |
| Forensics/save the water | Forensics | ICMP-marker exfil -> MiniDump parse -> seq-correct HTTP reassembly -> AES decrypt recovers video, but terminal WinZip-AES archive password never found; chalenge.md's flag is unverified/disavowed by the writeup | needs_verification | compfest18ctf2026_save_the_water |
| Pwn/redis-cli 0-day | Pwn | Unbounded CLUSTER NODES slot index/range causes OOB byte-write/memset past slots[16384], DWARF-mapped to exact adjacent struct fields; crash primitives confirmed locally, RCE and remote token gate unresolved | paused | compfest18ctf2026_redis_cli_0day |
| Pwn/未来日記 | Pwn | UAF+double-free via free-without-null in delete()/edit(), but the only leak (predict()) truncates a 64-bit pointer through a 16-bit cast to just 4 usable bits — insufficient against glibc 2.42 safe-linking; blocked at leak stage | paused | compfest18ctf2026_mirai_nikki |
| Reverse/The Last Bitbender | Reverse | Binary has no embedded flag; self-test is a decoy. Statically recovered a staged/Heaven's-Gate-obfuscated ARX transform, then answered the live server's random 16-byte challenge-response to get the real flag | solved | compfest18ctf2026_the_last_bitbender |
