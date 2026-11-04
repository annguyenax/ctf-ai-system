# HITCON CTF 2026 - knowledge digest

Recurring techniques:
- Most challenges unsolved; only VoteMe and RESEARCH.md have flag evidence.
- Hash/PRNG cryptanalysis (VoteMe fixed nonce, FastColl XXH3 collision).
- Many web/pwn entries were blocked by missing live instances.
- Python 3.15 PEP 810 lazy-import maze needs exact interpreter.

| path | category | technique | status | card |
|---|---|---|---|---|
| Crypto/VoteMe | crypto | TLS PRNG state recovery (MT19937 + JS Math.random) | solved | hitconctf2026_voteme |
| Misc/mathclipse | misc | Python object-graph swap primitive; unresolved | paused | hitconctf2026_mathclipse |
| Misc/RESEARCH.md | misc | anti-agent trap plus Finder-metadata stego | solved | hitconctf2026_research_md |
| Osint/Will be there OSINT_ | osint | candidate flag in worklist contradicted by own writeup as unverified; unresolved | paused | hitconctf2026_will_be_there_osint |
| Reverse/SPI TPM Free Trial | reverse | custom cipher CPA oracle; unresolved | paused | hitconctf2026_spi_tpm_free_trial |
| Welcome/Welcome | welcome | trivial (flag in HTML comment) | solved | - |
| Crypto/FastColl | crypto | XXH3-128 seed-independent collision; same-seed 576-byte family does not work with per-call seed increment | paused | hitconctf2026_fastcoll |
| Misc/File Inspector | misc | no reusable technique found; recon blocked | paused | - |
| Misc/flag.png | misc | stego probes all negative; no technique | paused | - |
| Misc/io_urust | misc | Rust io_uring fs-model permission race; unresolved | paused | hitconctf2026_io_urust |
| Misc/Night Shift Archive | misc | D-Bus black-box via ttyd websocket; unresolved | paused | hitconctf2026_night_shift_archive |
| Pwn/Book of Eclipse | pwn | inconclusive MSR-bit toggle primitive; no confirmed technique | paused | - |
| Pwn/Secret Notes Revenge | pwn | no vulnerability found | paused | - |
| Pwn/SPI TPM | pwn | same SPI TPM firmware as Reverse/SPI TPM Free Trial; see that card | paused | - |
| Pwn/vulcreator | pwn | Windows driver SDDL misconfiguration; unresolved | paused | hitconctf2026_vulcreator |
| Rev/lazy-maze | reverse | PEP 810 lazy-import maze; fixed-point BFS dead end at 487 cells | paused | hitconctf2026_lazy_maze |
| Web/Repo Cassette | web | thin notes, access blocked | paused | - |
| Web/Site Preview | web | inconclusive SSRF reviewer-bot behaviour | paused | - |
| Web/Wiki.js | web | blocked, no live instance | paused | - |
| Web/Works on My Machine | web | XXE/XInclude probes all negative | paused | - |
| Web/You Got Calc'd_ | web | planning only, no technique executed | paused | - |
