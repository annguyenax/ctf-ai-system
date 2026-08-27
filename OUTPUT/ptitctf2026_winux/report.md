# Report - ptitctf2026_winux

## Goal

Recover the Winux package key / flag from `Winux.zip`.

## Environment and artifact hashes

- `winux.exe` 34816 PE32+ Mingw
- `lib/winuxsvc.dll` 40448 export `WnxService`
- `lib/libpam_w32.dll` 12800 `PamStart` = `ROL5 XOR 0x7b1e960f` cookie
- `rootfs.wux` 592 `WUX2` five 100-byte records

## Enumeration and decisive signals

- `cat: flag.txt: corrupted package key`
- 64-byte key at request+0x362, hex length 0x40
- SHA-256 IV in `WnxService` hash helper
- Tag `winux:char:v3`

## Exploitation / recovery

For i in 0..63 brute `key[i]` so
`SHA256("winux:char:v3"||le32(i)||salt16[i]||(key[i]^pad[i])) == hash32[i]`.

## Verification

All 64 hashes recomputed; key is
`PTITCTF{1_7h1nk_y0u_kn0w_h0w_70_cr4ck_p1r473d_50f7w4r3_R19H7???}`.

## Failed paths and why

AES/XOR of WUX2 records with SHA256(key) → non-text. Records are a separate layer.

## Lessons and faster path

When a checker hashes one character at a time against a table, brute the table; do not invert the container format first.

## Alternative approaches

Run `winux.exe` as Administrator for the recovery shell, then still need the same 64-byte key to `cat flag.txt`.
