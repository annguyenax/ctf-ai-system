# Hack.lu CTF 2026 - knowledge digest

Recurring techniques:
- Many reverse tasks defeated by modelling the logic offline (Z3, brute force per char).
- VM/bytecode challenges: CHIP-8 OOB to SROP, per-character bytecode VM.
- Heap/allocator bugs: realloc old-size overflow, Cgo strlen truncation.
- Layered crypto reversal with rolling keys and ARX mixing.
- Infra-style misc: Kubernetes RBAC and annotation leaks.

| path | category | technique | status | card |
|---|---|---|---|---|
| Crypto/LinkedInspirator | crypto | CBC padding oracle plus ECB tag forge | solved | hackluctf2026_linkedinspirator |
| Misc/Challenge Deployment | misc | k8s controller multi-doc YAML bypass | solved | hackluctf2026_challenge_deployment |
| Misc/Remote DJ | misc | detailed exploit analysis but no flag evidence | paused | hackluctf2026_remote_dj |
| Pwn/CHIP | pwn | VM-in-VM ROP without leak | solved | hackluctf2026_chip |
| Pwn/Declassifier | pwn | Cgo strlen-on-binary-hash truncation | solved | hackluctf2026_declassifier |
| Pwn/turbo-malloc | pwn | custom allocator realloc old-size overflow | solved | hackluctf2026_turbo_malloc |
| Reverse/Every 7x7 Nonoflag | reverse | exhaustive search of huge puzzle space | solved | hackluctf2026_every_7x7_nonoflag |
| Reverse/flag_check_appliance_v2_FINAL.raw | reverse | systemd units as BDD/DAG modeled in Z3 | solved | hackluctf2026_flag_check_appliance |
| Reverse/IL2FLAG | reverse | IL2Cpp custom metadata parsing | solved | hackluctf2026_il2flag |
| Reverse/LIcense Validation Suite | reverse | static key derivation; GDB path is a red herring | solved | hackluctf2026_license_validation_suite |
| Reverse/Selene.Protocol.v1.1-LNR | reverse | rolling-key ChaCha20 with invertible ARX mixing | solved | hackluctf2026_selene_protocol |
| Reverse/Vaulty | reverse | Cgo strlen-on-binary-hash truncation | solved | hackluctf2026_vaulty |
| Reverse/VeryMildHidden | reverse | per-character bytecode VM brute force | solved | hackluctf2026_verymildhidden |
| Misc/doppelflip | misc | double-fault fd redirect via /proc/self/mem; unresolved | paused | hackluctf2026_doppelflip |
| Misc/uushell | misc | thin notes, auth-blocked | paused | - |
