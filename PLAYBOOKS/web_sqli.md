# Playbook — Web SQLi

## Preconditions

- Injectable parameter (GET/POST/cookie/header).  
- Some feedback: error / boolean / time / out-of-band.

## Minimal chain

1. Baseline response length + status.  
2. Probe: `'` and `''` (or JSON equivalent).  
3. Confirm: boolean `AND 1=1` / `AND 1=2` or time `SLEEP(3)`.  
4. Identify DB (version comment tricks / error).  
5. Extract: union columns → `information_schema` / stacked if allowed.  
6. Blind: binary search / bit extraction only if needed.  
7. Dump flag table/row only — not whole DB.

## Success indicators

- Differential response consistent with SQL truth.  
- Recovered flag string matching format.

## Fallbacks

- WAF: comment variants, case mix, JSON SQLi, second-order.  
- No error: switch boolean/time.  
- Read-only: file read functions if enabled (DB-specific).
- PostgreSQL stacked + superuser: skip catalogs. `CREATE TEMP TABLE` is **not** `CREATE TABLE`. Phrase filters on `COPY ` / `FROM PROGRAM` die to `COPY/**/` and `FROM/**/PROGRAM`. End the payload with `SELECT` so the HTTP handler returns command output. Confirm column names with `row_to_json(t)` before COPY into an existing table (`cards/ptitctf2026ck_megalovania.yaml`).

## Time-saving

Never start `sqlmap` on all params; one confirmed param + `--batch --threads 1` first.
