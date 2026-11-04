# Reusable patterns

- PostgreSQL WAF that matches `COPY ` (keyword + space) or `FROM PROGRAM` as a phrase dies to `COPY/**/` and `FROM/**/PROGRAM`.
- WAF `\bcreate\s+table` does **not** block `CREATE TEMP TABLE`.
- Stacked SQLi where the HTTP handler returns the last result set: end the payload with `SELECT ...` after COPY.
- `row_to_json(table)` / `table::text` dump column names without `pg_*` or `information_schema`.
- `to_regclass('public.name')` tests table existence without catalogs.
- Do not COPY into a production table until you know every NOT NULL column; use `CREATE TEMP TABLE o(x text)` instead.
- Superuser + `COPY FROM PROGRAM` is the "strongest attack"; catalog enum is optional.
