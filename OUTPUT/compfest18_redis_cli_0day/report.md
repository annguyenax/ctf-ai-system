# COMPFEST 18 — redis-cli 0-day

## Status

**Vulnerability: probable / statically confirmed. Exploit and flag: unverified; no flag candidate.**

The supplied `redis-cli` is a Redis 8.10.0 build (DWARF compilation directory) using `MALLOC=libc` per its README. Its `clusterManagerNodeLoadInfo` parses a server-provided `CLUSTER NODES` bulk reply and writes slot IDs into a fixed 16,384-byte `node->slots` array without validating the index/range.

## Exact defect

CWE-787 / improper input validation: a malicious `CLUSTER NODES` line whose `myself` node has an extra slot token of `16384` reaches the single-slot path:

```c
node->slots[atoi(slotsdef)] = 1;
node->slots_count++;
```

Valid slots are `0..16383`; `16384` is one byte past the array. The matching supplied-binary instruction at PIE-relative `0x44cf1` is:

```asm
mov BYTE PTR [r14+rax*1+0x54],0x1
```

`r14+0x54` is the `slots` base; `rax` is the parsed index. The range form is also unbounded (`while (start <= stop) node->slots[start++] = 1`) and compiles to an unbounded `memset` at `0x44cd1`.

## Offline reproduction

```sh
cd 'D:/download/CTFTimeWriteup/COMPFEST18CTF2026/Pwn/redis-cli 0-day'
python solve/local_poc.py --model
# or, on a Linux host able to execute the supplied ELF:
python solve/local_poc.py --serve 6380
# in another terminal: ./files/redis-cli --user compfest --pass 'redis_cli_0_day_wow!' --cluster info 127.0.0.1 6380
```

The model executed and reported `payload slot=16384; valid indices=0..16383; out_of_bounds=True`. The server harness emits the required RESP2 `AUTH`, `INFO`, and `CLUSTER NODES` responses, with a `myself,master` line ending in `16384`.

## Exploit prerequisites and limits

1. The victim must invoke this custom cli against an attacker-controlled Redis-compatible endpoint; the wrapper accepts a user-supplied host and port.
2. The endpoint must answer auth/INFO then return the malicious `CLUSTER NODES` bulk string.
3. A usable RCE/data-leak chain still requires allocator/layout analysis. `16384` is a one-byte adjacent write; larger values/ranges provide wider OOB writes but their reliability is untested. README explicitly says libc allocation was selected because default jemalloc hindered exploitation.
4. Actual supplied-ELF execution was blocked locally: Docker Desktop's engine was down and the only available WSL distribution is musl-based `docker-desktop`, with no glibc loader/compiler. The Python model and binary static correspondence were executed instead.

## Instance result / next step

Confirmed endpoint `34.2.22.80:30068` was contacted exactly once without a host or port payload. It returned `CTFd access token:` rather than the wrapper. Do not send a candidate host/port until an authorized CTFd token is supplied and a reachable controlled Redis responder has been prepared. Then conduct one scoped end-to-end run with the `16384` reply and observe whether the child crashes/returns abnormally; that verifies reachability, not an exploit chain.

Evidence: `D:/download/CTFTimeWriteup/COMPFEST18CTF2026/Pwn/redis-cli 0-day/solve/evidence/slot_index_oob_proof.txt`.
