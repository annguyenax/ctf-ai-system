# Timeline

- Prior session on instance 47082: confirmed stacked SQLi, PostgreSQL 16.15, postgres superuser, WAF list, `FROM/**/PROGRAM` / `COPY/**/` bypasses. COPY into `dialogue (line)` produced no new rows. Time expired before RCE output.
- 2026-09-14: `row_to_json(dialogue)` → `(refight, seq, line)`. INSERT/COPY two-column killed. `CREATE TEMP TABLE` + `COPY FROM PROGRAM 'id'` → `uid=70(postgres)`. `ls /` shows `/flag.txt`. `cat /flag.txt` returns the flag. Re-read independently; dumped `app.py` / `init.sql` / `entrypoint.sh` via `base64`.
