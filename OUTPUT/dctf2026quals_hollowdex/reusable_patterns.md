# reusable — hollowdex

Signal: JNI_OnLoad + /proc/self/mem + broken DEX checker.
Decision: XOR .rodata against code_item; invert real algorithm; hash for CTF{sha256} if portal says so.
Method: PLAYBOOKS/android_jni_hollow_dex.md
Verify: valid Dalvik after XOR; ARX forward replay.
Pitfalls: jadx decoy; wrapping the vault key directly.
