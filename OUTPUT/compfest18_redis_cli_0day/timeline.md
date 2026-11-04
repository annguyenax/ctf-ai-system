# Timeline

- Intake: identified authorized COMPFEST 18 pwn challenge; preserved artifact hash `af3f4fc786853724115375d369649c088a15f3d48fac4a92e422a38ce0f7c067`.
- Static triage: debug info identified build path `/home/ztaufik002/Misc/redis-8.10.0/src`; `addr2line 0x44cf1` mapped to `redis-cli.c:5848`.
- Source/binary correlation: Redis 8.10.0 source has unchecked `node->slots[atoi(slotsdef)]`; supplied binary has the indexed byte store at `0x44cf1` and unbounded range `memset` path at `0x44cd1`.
- Offline PoC: created and executed `solve/local_poc.py --model`; it confirmed slot `16384` exceeds the 16,384-slot bound. Added local RESP2 server mode for a glibc Linux replay.
- Local execution limitation: Docker engine unavailable; only musl WSL system available, so the glibc ELF was not executed.
- Scoped remote check: one connection to `34.2.22.80:30068`, no payload; service requested `CTFd access token:`. No further remote action taken.
