# Timeline - ptitctf2026_pablo_escobar

| Time | Phase | Observation / decision | Evidence |
|---|---|---|---|
| 2026-08-22 | INTAKE | dist.zip = Tool.exe + config.enc; creds luongvd; last location photo | chalenge.md |
| 2026-08-22 | TRIAGE | Go WebView2 + pbkdf2-sha256 envelope → recover Key then hit URL | Tool.exe / config.enc hashes |
| 2026-08-22 | EXPLOIT | configkey.Key XOR tables → password → AES-GCM → http://144.79.188.36:6500/ | solve/decrypt_config.py, notes/evidence/config_decrypted.json |
| 2026-08-22 | TEST | login user; inbox ids 1,2,4; id 3 403; cookie anhhop_session | notes/evidence/inbox.json |
| 2026-08-22 | TEST | img1 = Pexels 38512126 Ikoyi Lagos (stock match) | notes/inbox/1.jpg |
| 2026-08-22 | TEST | img4 factory inspection; no EXIF; last createdAt | notes/inbox/4.jpg |
| 2026-08-22 | TEST | Mẫn Xá / Franking / ketamin NT / Hưng Yên oil photos ≠ img4 | scratch danviet_*.jpg kho.jpg cq.jpg |
| 2026-08-22 | TEST | Yandex/Bing reverse-image no exact hit; catbox jy72x2.jpg | reverse_search.py |
| 2026-08-22 | TEST | ~377 admin logins 401; middleware/IDOR/NoSQL no id3 | probe_api.py |
| 2026-08-22 | CAPTURE | paused; no final_flag.txt | notes/SESSION.md, this OUTPUT dir |
