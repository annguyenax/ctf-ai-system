# Playbook — Sui fake-reserve reverse market

## Preconditions

- Move pool constructor takes `u64` reserves, not `Coin<T>`.
- Registry duplicate-check uses the **direct** type-order key, then later canonicalizes.
- Incentive/score uses `reserve_quote / reserve_base` (or similar attacker-controlled integers).
- LP mint does not require a deposit.

## Discriminative test

Create the reverse type order `<Quote, Base>` with `reserve_base=1` and a large `reserve_quote` under any cap. If the call succeeds, the canonical market bytes should equal the already-listed pair.

## Minimal chain

1. `create_pool<Quote, Base>(1, large)`.
2. Open a position and mint shares equal to `min_liquidity` with fee = 0.
3. Register a fresh `drop` strategy witness (`vector<u8>` empty is enough if the generic is `Strategy: drop`).
4. Claim; confirm earned/balance; call `solve`.

## Pitfalls

- Recreating the original type order is rejected; only the reverse direct key is new.
- Sui CLI/gRPC may be blocked; JSON-RPC + explicit `gasBudget` avoids `dryRun`.
- Shared launchers often fail funding (`pay-sui` stale coin versions). Retry until `getObject(setup)` and `getCoins(player)` succeed, then send immediately.
