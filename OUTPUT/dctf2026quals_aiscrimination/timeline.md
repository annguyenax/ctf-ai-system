# Timeline — aiscrimination

All times approximate (session-local).

1. **INTAKE/TRIAGE** — Read challenge intake (`chalenge.md`): web, no attachment, flag
   format `CTF{sha256}`, service `http://136.92.7.211:32077`. Baseline GET `/` → Flask
   (gunicorn) "AIscrimination" feed.
2. **Map routes** — `/`, `/policy`, `/posts/<slug>`, `/join` (POST), `/people/<id>`,
   `/assets/cards/<id>/identity.css`, `/comments/<key>` (POST). Noted editorial hint
   "path rules as 'intuitive'" and comment "the renderer will include it".
3. **H1 (LFI via fragment import)** — Statement field reflected raw into CSS
   `content:`. Tested `@import url("/static/style.css")` → replaced with
   `/* design fragment unavailable */` (file-read sink exists).
4. **Confirm LFI** — `@import url("/etc/passwd")` → passwd content inlined in CSS. LFI
   confirmed.
5. **Locate app/flag** — `/proc/self/cmdline` (gunicorn `app:app`), `/proc/self/environ`
   (`PWD=/home/ctf/app`, `THEME_ROOT=.../themes/generated`, no `SECRET_KEY`).
6. **Read source** — `/home/ctf/app/app.py` → `compile_theme()` is the only file-read
   sink; secret key defaults to `development-only-change-me`.
7. **Read flag** — `/home/ctf/flag.txt` → `CTF{5bb9cb8b8ff43e243fe85fceaf646e7ba6a5c80250e96678be2aa71add38eb97}`.
8. **VERIFY** — Re-read the flag file on a second independent card; identical bytes,
   64-hex inner value. Verified.
9. **CAPTURE** — solver, writeup, card, index update.
