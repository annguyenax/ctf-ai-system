# Report — L3akCTF2026 / L3ak APT

- **Status:** solved (verified)
- **Category:** forensics / Windows thumbnail cache
- **Artifact:** `L3AK_APT.zip` (SHA-256 `e681d3bacaa0b8ad36715e6b355981201816341dcef11d0829f80a7ac46c5a98`)

## Signal → approach

Recent LNKs named a deleted `important files.7z` and two `ARS-*.png` images.
uTorrent resume state proved the archive downloaded completely. ActivitiesCache
and its WAL showed the images were opened with Photos. Because the original PNGs
were absent, Windows Explorer `thumbcache_1280.db` was the cheapest content source.

Parse CMMM entries using their size fields rather than JPEG marker carving. Two
different cache hashes contained the same complete JPEG payload.

## Verification

The parser requires both cache keys and byte-identical payloads. Two clean runs
from the original ZIP produced the same 185,015-byte JPEG with SHA-256
`daa218b9d1713248f7069667ace2e21bcc46b42980e8b87c955ab1ec341701a2`.
The recovered image text was visually checked. Per workspace policy, the flag and
JPEG remain only in the event SHOW layer.

## Pointers

- Writeup: `../CTFTimeWriteup/L3akCTF2026/Forensics/L3ak APT/writeup/writeup.md`
- Solver: `../CTFTimeWriteup/L3akCTF2026/Forensics/L3ak APT/solve/solve.py`
- Playbook: `PLAYBOOKS/forensics_windows_thumbcache_recovery.md`
