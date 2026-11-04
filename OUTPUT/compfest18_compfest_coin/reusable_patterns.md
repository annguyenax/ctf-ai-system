# Reusable patterns - compfest18_compfest_coin

- If a Move pool stores attacker-chosen `u64` reserves, treat them as fake until coins are escrowed.
- Duplicate-check the **canonical** market key, not the direct type-order key.
- Empty `vector<u8>` is a convenient `drop` witness for public generic strategy registration.
- Restricted Sui JSON-RPC often blocks `sui_dryRunTransactionBlock`; set `gasBudget`/`gasPrice` so the TS SDK does not dry-run.
- pwn.red blockchain launchers: `GET /challenge` -> redpwnpow -> `POST /solution` -> `POST /launch` -> `GET /data` -> `GET /flag`.
- Shared `pay-sui` admin coins race; retry launch and send the exploit immediately after coins appear.
