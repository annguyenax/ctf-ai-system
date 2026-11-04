# PTITCTF2026 — digest (batch 9, partial: 5 of this event's challenges)

Recurring techniques observed in this subset (not confirmed to cover the full event):
- A size/length bounds check compared in a narrower width than the value used downstream (16-bit vs 64-bit) is a recurring truncation-bypass shape across this event's Pwn track.
- Reverse challenges hide the real validation/flag logic behind decoys (a fake printed flag, a conditional injection branch triggered only by an irrelevant process name) while the real cipher is reachable only via a data pointer, never executed directly.
- Android reverse challenges push the real license/key check into native (JNI) code while the Java layer only does a trivial check, and plant decoy-looking long strings in .rodata that serve an unrelated purpose.
- Web challenges exploit CSP gaps that block script-src but allow inline CSS, turning the style sheet itself into a blind-exfiltration side channel against a privileged bot's render.
- OSINT-only challenges (no local attachment) require mining a named individual's public GitHub history, including wiped/rotated file content, and are easy to pollute with unrelated leftover artifacts from the same account.

| path | category | one-line technique or pitfall | status | card id |
|---|---|---|---|---|
| Pwn/seccomp-V3 | Pwn | 16-bit truncated size check next to 64-bit read() allows huge stack overflow; probabilistic 2-byte partial-overwrite PIE leak (retry on fresh connection) then classic libc leak + ORW chain; no seccomp installed in this path | solved | ptitctf2026_seccomp_v3 |
| Reverse/P(roc)E(ss) | Reverse | Fake printed flag + decoy process-triggered injection are red herrings; real ARX cipher is only referenced via a .data pointer, never called — drive it directly with angr using key derived from a decoy process-name string | solved | ptitctf2026_procesess |
| Reverse/PhoneFarm | Reverse | Java-level check is trivial (non-empty); real license compare is native ARM64 code with a hardcoded 5-char literal ('hello'); a long .rodata string is a decoy response-decryption key, not the license | solved | ptitctf2026_phonefarm |
| Web/Approve Please, Genie! | Web | CSP blocks script-src but allows style-src unsafe-inline; blind CSS exfiltration via attribute-selector prefix oracle + sibling combinator + background:url() beacon leaks a hidden admin-only flag field one char per bot visit | solved | ptitctf2026_approve_please_genie |
| Forensics/Bug bounty | Forensics | Large PCAP attacker-timeline quiz over a 30-minute live netcat instance; timeline reconstructed (apt tool downloads, registrations, uploads) but Q1 filename guesses all rejected before instance expired | paused | ptitctf2026_bug_bounty |
| Reverse/Tiger Bạc | Reverse | No local attachment; OSINT of named GitHub handle's repo commit history recovered a wiped license-looking hash, but a decoy flag from an unrelated repo was submitted and rejected; true crackme/attachment never found | paused | ptitctf2026_tiger_bac |
