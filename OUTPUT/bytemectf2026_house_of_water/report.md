# ByteMe CTF 2026 — House of Water

Status: **remote flag extraction verified**. Portal submission and acceptance: **unverified**.

Flag: `OWASP{drink_fr0m_th3_p0is0n3d_tc4ch3}`

`free` leaves the pointer in its slot, and the bounds checker still permits
`show` and `edit` for freed entries. The first freed `0x90` tcache entry leaks
`p1 >> 12`; the adjacent freed entry leaks `p1 ^ (p0 >> 12)`. Since both user
pointers share a page and differ by `0x90`, these values recover the heap
addresses. Editing the freed `p0` entry poisons its safe-linked `next` pointer.
Two allocations then return the chosen address, and `show` reads the hidden
flag bytes.

On the remote service, the flag crossed adjacent reads at heap-page offsets
`0x240` and `0x2b0`. The solver concatenates those raw bytes before matching the
flag. Local primitive validation used a temporary marker under Kali WSL's
system glibc; the supplied loader/libc pair is mismatched. Evidence and hashes
are in `D:/download/CTFTimeWriteup/ByteMeCTF2026/Binary Exploitation/House of Water/solve/evidence/recovery.json`.

Reproduce the local primitive with `python3 solve/local_test.py` in Kali WSL.
The scoped remote exploit is `python3 solve/solve.py`. The portal snapshot in
`chalenge.md` remains OPEN because no portal submission was made.
