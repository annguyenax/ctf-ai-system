# SKILL — REVERSE

## Triage signals

| Signal | Likely |
|--------|--------|
| Crackme / “find password” | algo reverse + keygen |
| Packed / high entropy | unpack first |
| .NET / Java / Python | decompile > disasm |
| VM / bytecode | handler map |
| Anti-debug | patch or emulate |
| Giant `.cpp` of `enable_if` / template constraints | SMT / Z3 (not manual) |
| Template mess **with key list + output[] + loop 16** | Feistel/cipher reverse in types |
| BF/esolang + decoy text + name reverse/turned | orientation transform + mask merge |
| Small stripped ELF “password/vault” | `strings` first (often plaintext secret) |

## Fast path checklist

1. `file` + entropy + packer detect.  
2. Strings / interesting imports.  
3. High-level decompiler (Ghidra/IDA/Binary Ninja/dnSpy/jadx) before raw asm.  
4. Identify check function; simplify conditions.  
5. Script the algo in Python; verify offline.  
6. If constraints-only templates: **parse → Z3** (`PLAYBOOKS/rev_template_z3.md`).  
7. If key+CT+round loop in templates: **Feistel reverse** (`PLAYBOOKS/rev_template_feistel.md`).  
8. If esolang decoy: orientation transforms (`PLAYBOOKS/rev_esolang_orientation.md`).  
9. Password ELF: `strings` before deep RE (`PLAYBOOKS/rev_strings_password.md`).

## Discriminative tests

- Patch `jz` → always pass (confirms location).  
- Emulate function with `unicorn`/`angr` only if static stuck.  
- Side-by-side compare good/bad inputs.

## Tool whitelist

Ghidra/IDA, `strings`, `ltrace`/`strace`, decompilers, Python RE scripts.

## Avoid early

Full symbolic execution of whole binary without target function.

## Deliverables

- Algorithm summary  
- Key derivation / password  
- Script to reproduce  
