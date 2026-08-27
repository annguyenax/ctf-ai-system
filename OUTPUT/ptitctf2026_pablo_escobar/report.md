# Report - ptitctf2026_pablo_escobar

## Goal

Recover `PTITCTF{...}` for Reverse challenge **Pablo Escobar**. Prompt: last location photo still in the seized software/account `luongvd`/`luongvd`.

**Status:** paused. Reverse + user inbox done. Flag not verified. No `final_flag.txt`.

## Environment and artifact hashes

| File | SHA256 | Size |
|---|---|---|
| Tool.exe | 66adf83ef86d8e76605063c7d01dc61fdd87cac446f34696a305b3a394c6aae7 | 3023360 |
| config.enc | 7b546c39e853fe2907c07d54ede5d5c08f183e9360953079ad6ff51f0f1bfb54 | 470 |
| dist.zip | 257fec34a3b0ad32bc18a700fa898e379003bc739da884694eb781a0ca3daf54 | 1262685 |
| inbox/1.jpg | ea2d63e77f755d5302539b9cd03273e9bea95d1b8646adb3aa14da94a03ea66a | 1768998 |
| inbox/2.jpg | b6479820f75efedaeac4fdf69467197d199e982a295a2fef624f31469a4956bc | 119827 |
| inbox/4.jpg | 3c06e7c5b970f2246bf78f01875f0d4fa5eccdad455ad97b08860f913556ac97 | 35998 |

Scratch: `D:\download\ctf-scratch\ptitctf2026_pablo_escobar\`
Event: `D:\download\CTFTimeWriteup\PTITCTF2026\Reverse\Pablo Escobar\`

## Enumeration and decisive signals

- Go PE WebView2 + `config.enc` JSON: `kdf=pbkdf2-sha256`, 210000, AES-GCM.
- Password from `configkey.Key` XOR tables, not plaintext strings.
- Decrypt → `http://144.79.188.36:6500/` (Vinext gallery, cookie `anhhop_session`).
- User sees images 1,2,4. Image 3 exists (403). Image 4 is last `createdAt` and matches prompt “ảnh địa điểm cuối”.

## Exploitation / recovery

1. Recover 44-byte PBKDF2 password from PE, AES-GCM open `config.enc`.
2. Login `luongvd`/`luongvd`, GET `/api/images`, save 1/2/4.
3. Identify image 1 as Pexels 38512126 (Ikoyi, Lagos) — not treated as flag (not last image).
4. OSINT image 4 unfinished (no pixel-matched source).

## Verification

None for a flag. Config decrypt is independently replayable via `solve/decrypt_config.py`. Inbox listing saved in `notes/evidence/inbox.json`.

## Failed paths and why

- Admin login / IDOR / Next middleware / mass-assignment: no image 3.
- Reverse-image and news compare (Mẫn Xá, Franking/Nếnh, Nha Trang ketamin, Hưng Yên oil): different photos.
- Stego on inbox JPEGs: no flag bytes.

## Lessons and faster path

Treat this as **rev-to-URL then OSINT**, not a second crypto layer. After decrypt, dump inbox timestamps first; last `createdAt` + admin-only id is the remaining work.

## Alternative approaches

Google Lens on `notes/inbox/4.jpg`; hunt admin without broad brute; if image 3 leaks a filename via error/timing, fetch it.
