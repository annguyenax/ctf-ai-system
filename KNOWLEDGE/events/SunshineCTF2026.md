# SunshineCTF 2026

Recurring techniques across this batch:
- Pwn challenges repeatedly chain a copy/transfer-then-free dangling-pointer UAF with GLIBC 2.39 safe-linking tcache poisoning to redirect allocations into a global array or function pointer (Cache Money, Code Breaker).
- Forensics challenges hide payloads inside unusual container substructures rather than plain file content: VBA MediaCache stream, SIP/RTP audio, PNG height-field tampering, and two distinct .klc keyboard-layout stego encodings (deadkey-chain vs physical-arrow-trail).
- Several web challenges exploit an asymmetry between a trust mechanism and what it actually protects (cookie priority vs HttpOnly, JWT kid-as-key-file vs a narrow denylist, GraphQL introspection exposing an unauthenticated diagnostic mutation).
- RE challenges favor writing inverse/symbolic solvers (GF(p) linear algebra, backward round inversion, SROP, BPS patch parsing) over manual disassembly-only approaches.

| path | category | technique | status | card id |
| --- | --- | --- | --- | --- |
| Bsides orlando/A Hardy Mystery | BSides Orlando | physical scavenger-hunt challenge, no digital artifact; unsolved (flag placeholder) | paused | - |
| Forensics/ghost in the thread - 1 - start here | Forensics | no documented technique (solve.py stub); flag present but undocumented | needs_verification | - |
| Forensics/my eyes burn | Forensics | .klc deadkey-chain state-graph traversal | solved | sunshinectf2026_my_eyes_burn |
| Forensics/NAS coal | Forensics | .pptm OLE VBA MediaCache base64 PowerShell extraction | solved | sunshinectf2026_nas_coal |
| Forensics/suntrail | Forensics | .klc physical-keyboard arrow-trail walk | solved | sunshinectf2026_suntrail |
| Forensics/Welcome Call! | Forensics | SIP/RTP pcap + G.711 u-law decode + reversed audio | solved | sunshinectf2026_welcome_call |
| Forensics/you cut me off | Forensics | PNG IHDR height-truncation repair (tampered height + recomputed CRC) | solved | sunshinectf2026_you_cut_me_off |
| Misc/Greetings | Misc | trivial (flag given verbatim in prompt) | solved | - |
| Misc/Vecnet | Misc | exposed .git leak -> SSRF-like internal fetch -> ChromaDB vector-DB embedding inversion (vec2text) -> password crack | solved | sunshinectf2026_vecnet |
| Pwn/Cache Money | Pwn | transfer-then-free UAF + safe-linking tcache poison to .bss global array | solved | sunshinectf2026_cache_money |
| Pwn/Code Breaker | Pwn | custom encrypted protocol reversing + copy-then-free UAF + tcache poison to function pointer | solved | sunshinectf2026_code_breaker |
| Pwn/Homemaker | Pwn | off-by-one (<=) length-field self-expanding overflow + stack leak + ROP | solved | sunshinectf2026_homemaker |
| Pwn/Mad Libs | Pwn | format string GOT overwrite (printf->system) inside a self-repeating call loop | solved | sunshinectf2026_mad_libs |
| Pwn/Print Print Revolution | Pwn | custom printf arbitrary-write primitive + ret2dlresolve | solved | sunshinectf2026_print_print_revolution |
| Pwn/Total Recall | Pwn | SROP (rt_sigreturn) via a single rax-controlling gadget in a gadget-starved binary | solved | sunshinectf2026_total_recall |
| Re/FlameOn | RE | BPS patch literal-chunk parsing + embedded XOR-encrypted asm payload | solved | sunshinectf2026_flameon |
| Re/IntMod | RE | signal-handler JIT VM + GF(65521) Vandermonde solve + 45-round backward inversion | solved | sunshinectf2026_intmod |
| Re/RoboCall | RE | stack-depth-addressed uninitialized-variable leak via menu call-graph arithmetic | solved | sunshinectf2026_robocall |
| Web/CookieCorp | Web | browser per-domain cookie-priority eviction bypass of an HttpOnly privileged cookie | solved | sunshinectf2026_cookiecorp |
| Web/Groundhog Day | Web | SSRF via disabled override param + gopher-smuggled HTTP to internal wkhtmltopdf PDF renderer | needs_verification | sunshinectf2026_groundhog_day |
| Web/Planetary Probe | Web | boolean-blind PostgreSQL SQLi, parallelized binary-search extraction | solved | sunshinectf2026_planetary_probe |
| Web/Used Goods of Tomorrow | Web | GraphQL introspection + unauthenticated diagnostic mutation leaking a vendor key | solved | sunshinectf2026_used_goods_of_tomorrow |
| Web/You Are Kidding Me | Web | JWT kid-as-key-file disclosure + HMAC key reuse to forge admin token | solved | sunshinectf2026_you_are_kidding_me |
