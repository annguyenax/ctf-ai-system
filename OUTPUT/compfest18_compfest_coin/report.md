# Report - compfest18_compfest_coin

## Goal

Drain the Compfest Coin incentive vault and flip `Setup.solved` on the live Sui instance, then read `COMPFEST18{...}` from the launcher `/flag` endpoint.

## Environment and artifact hashes

Sui Move package `challenge` (edition 2024). Live launcher `http://34.128.118.122:8502/` after POW. JSON-RPC at `/{uuid}`. `@mysten/sui` v1.x JSON-RPC client. Dry-run RPC method blocked.

## Enumeration and decisive signals

- `create_route_pool` takes `u64` reserves, not coins.
- Duplicate check is on `direct_market<Base,Quote>` before canonicalization.
- `add_liquidity` has no payment argument; fees start at 0.
- Score is `reserve_quote / reserve_base`, clamped to vault balance 1000.
- Bounty target 500.

## Exploitation / recovery

Reverse pool `<USDC,SUIX>(1, 2_000_000)` -> open position -> mint 500 shares -> `register_route_strategy` with empty `vector<u8>` -> claim 1000 -> `setup::solve`.

## Verification

Independent on-chain reads: `Setup.solved == true`, `earned == 1000`, vault `balance == 0`, event `IncentivesClaimed.amount == 1000`. Official `GET /flag` returned `success: true` and the flag (SHA-256 `116a76999daf9436ae45029bf238d516dc03917eddf58f3c3b725554df850ff0`).

## Failed paths and why

Primary `:8501` `pay-sui` gRPC transport / stale coin versions. First `:8502` instance reset (checkpoint jumped to 0; objects vanished). SDK dry-run `Method not allowed` until `setGasBudget`.

## Lessons and faster path

Audit integer reserves vs coins, then the market-key function used in the duplicate check. Prefer the alt launcher. Set gas budget. Retry launch until coins exist, then send immediately.

## Alternative approaches

Oracle admin takeover is unavailable and unnecessary. Direct `<SUIX,USDC>` recreation is rejected.
