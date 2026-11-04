# editorial-board (FortID CTF 2026, Pwn, 500pts, 0 global solves)

Status: UNSOLVED. No flag obtained or submitted.

Vuln confirmed: non-PIE 32-bit ELF, no canary, stack buffer overflow in copy
routine near 0x804979e (601-byte stack buf, saved EIP at offset 605). Fixed
RWX mmap at 0x656c6000 holds the attacker-controlled article; return address
can be built from allowed ASCII bytes ("able" -> 0x656c6261) to jump into
that RWX region and execute article bytes as shellcode.

Blocker: validate.py's real LanguageTool-backed grammar/style gate (0 spelling
tolerance, <=2.2 issues/100 words) conflicts with the x86 opcode subset that
survives the allowed-charset filter (letters + .,;:'-?!). AND-based memory
writes needed to assemble execve("/bin/sh") shellcode force uppercase ModRM
bytes after '!', which LanguageTool's SENTENCE_WHITESPACE rule flags -- 5
needed writes = 5 unavoidable findings, exceeding budget at any word count
tested. Full detail + attempted mitigations in:
D:\download\CTFTimeWriteup\FortIDCTF2026\Pwn\Editorial Board\notes\analysis.md

Confirmed locally (validator stubbed): overflow -> RWX exec -> /bin/sh shell
works end to end (solve/replay_local_shell_stage.py). Not yet confirmed with
the real validator gate passing simultaneously. No remote instance attempted
this session.
