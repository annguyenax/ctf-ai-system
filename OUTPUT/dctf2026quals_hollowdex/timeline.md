# timeline — dctf2026quals_hollowdex

- Intake APK 17KiB, prompt says DEX check is a lie.
- SO JNI_OnLoad XOR-patches verifyFlag via /proc/self/mem.
- Restored bytecode: 32 hex + ARX. Invert → c19e6e4be6148b5581809ae7291c9cfe.
- Portal screenshot: CTF{sha256}; CTF{hex} still NOT SOLVED.
- Flag = CTF{sha256(ascii hex)}.
