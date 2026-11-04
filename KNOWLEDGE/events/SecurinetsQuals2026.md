# Securinets Quals 2026 - knowledge digest

Recurring techniques:
- Pwn: Rust trait-object UAF, signed/unsigned comparison, seccomp side-channel.
- Reverse: packers, memfd launchers, layered .NET plus native crackmes.
- Mobile Flutter AOT with PRNG-seeded deshuffling.
- OSINT entries paused; game-engine PCK extraction.

| path | category | technique | status | card |
|---|---|---|---|---|
| Crypto/Misdirection_ Part 1 | crypto | ECDSA public nonce plus soft-locked forge | solved | securinetsquals2026_misdirection_part1 |
| Forensics/DumPwn | forensics | Windows crashdump Volatility3 patch plus kernel ROP/PTE walk | solved | securinetsquals2026_dumpwn |
| Hardware/Gelatino | hardware | LUKS2 manual unlock IV unit pitfalls | solved | securinetsquals2026_gelatino |
| Mobile/Backdrop | mobile | Flutter/Dart AOT layered crypto with PRNG-seeded tile deshuffle | solved | securinetsquals2026_backdrop |
| Pwn/crust | pwn | Rust trait-object shadow-registry UAF | solved | securinetsquals2026_crust |
| OSINT/Murder | osint | Godot game export PCK extraction; unresolved | paused | securinetsquals2026_murder |
| OSINT/RabbitHole | osint | pure OSINT chain, no generalizable technique | paused | - |
| Pwn/Over_flow | pwn | signed-compare bypass but no reachable overwrite | paused | securinetsquals2026_over_flow |
| Pwn/Void | pwn | seccomp exit-only side-channel exfil; unresolved | paused | securinetsquals2026_void |
| Reverse/CUR53D ENTR0PY | reverse | custom packer identification via section names | paused | securinetsquals2026_cur53d_entr0py |
| Reverse/letmethink | reverse | memfd/execveat self-decrypt, glibc version patch, seccomp-notify trace | paused | securinetsquals2026_letmethink |
| Reverse/NightFall | reverse | layered .NET plus native packer crackme | paused | securinetsquals2026_nightfall |
| Web/Tessera | web | recon/planning only, no live instance | paused | - |
