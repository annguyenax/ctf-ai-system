# DefCamp CTF 2026 Quals — batch 8 digest (13 entries)

This batch mixes 6 fully-solved "Insane"-tier challenges (real custom-crypto, kernel, SSRF-argv, cross-chain and DoS-privesc techniques) with 7 paused entries whose only recorded content is a templated auto-triage note (generic category hypotheses, no actual investigation signal) — likely a partial slice of the event, not its full set.

| path | category | technique | status | card id |
| --- | --- | --- | --- | --- |
| Crypto/power-with-errors | Crypto | matrix-power samples commute; linearize noise recovery as BDD/LLL, then small CVP for remaining key via centralizer dimension | solved | dctf2026quals_power_with_errors |
| Forensics/Kanji | Forensics | stream huge pcap via `7z x -so \| tshark/grep` instead of extracting; raw grep over plaintext IRC traffic is faster and already chronological | needs_verification | dctf2026quals_kanji |
| Misc/aethergate | Misc | hostname-allowlisted URL with embedded space smuggles extra curl argv tokens past a naive `.split()`; `-o -` + `file:///dev/vdb` dumps raw disk | solved | dctf2026quals_aethergate |
| Misc/arbitrary-funds-sweep | Misc | L2 bridge aliases caller address; redeploy identical owner bytecode via CREATE2 directly on L2 to match the unaliased address the vault expects | solved | dctf2026quals_arbitrary_funds_sweep |
| Misc/legacy | Misc | plant an ~850k-digit integer note to blow Python2's O(n^2) int-parse past a root cron's timeout, triggering a core dump of the still-live root process holding an unused secret | solved | dctf2026quals_legacy |
| Pwn/nephilim | Pwn | kernel UAF: remove() frees descriptor but leaves stale pointer in a snapshot array; periodic timer calls through it -> stack pivot -> kROP reads /flag | solved | dctf2026quals_nephilim |
| Forensics/Gnome Breaker | Forensics | trivial/no source — only a templated auto-triage note (GNOME keyring binary format, in-progress keyring password cracking); no real signal recorded | paused | - |
| Forensics/Kameosa | Forensics | no source — live ransomware sample disk image (18.8GB), analysis explicitly skipped for host safety; no technique recorded | paused | - |
| Misc/sea-of-theft | Misc | trivial/no source — only a templated fingerprint note (WASM game client/WebSocket protocol), no reverse-engineering performed | paused | - |
| Misc/solstice-9 | Misc | no source — firmware image (~4.2GB) never downloaded; only a templated fingerprint note | paused | - |
| Pwn/bitdebit² | Pwn | seccomp filter never checks arch field, so same syscall number maps to different syscalls under int 0x80 (i386) vs syscall (x86_64); read primitive (openat+preadv) confirmed, exfil/RIP-control step incomplete | paused | dctf2026quals_bitdebit |
| Web/coreweb | Web | trivial/no source — only a templated fingerprint note (URL-to-PDF SSRF/1-day hypothesis), no investigation performed | paused | - |
| Web/dungeon | Web | trivial/no source — only a templated fingerprint note (SQLi/graph/LDAP injection hypothesis), no investigation performed | paused | - |
