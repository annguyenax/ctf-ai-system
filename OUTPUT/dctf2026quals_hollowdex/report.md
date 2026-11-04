# report — dctf2026quals_hollowdex

Goal: recover CyberEDU flag for HollowDex Vault APK.
Environment: Windows + python3.13, androguard, r2 on WSL Kali. Offline file only.
Enumeration: APK listing; DEX strings `verifyFlag`; SO strings maps/mem/dex.
Exploitation: XOR-restore verifyFlag; invert 3-round ARX; sha256(ascii hex).
Verification: ARX forward matches constants. Portal `CTF{sha256}`; raw hex wrap rejected.
Failed paths: DCTF{hex}; CTF{hex}.
Lessons: hollow DEX; app key ≠ submit format.
Alternatives: emulate JNI_OnLoad in an Android sandbox — slower, same XOR.
