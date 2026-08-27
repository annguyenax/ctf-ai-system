# lit2026_carnival_game — report
- LIT CTF 2026 / crypto ; exploit VERIFIED locally; real flag NOT captured (remote-only, offline).
- Flag: (server-side; not fabricated)

## Signals
seed=random.Random(int(time.time())).randbytes(16).hex(); commitment=sha256(seed); roll(seed,round)=int(sha256(f"{seed}-{round}"),16)%100; win=5 in a row.

## Exploit
Brute int(time.time()) window; match commitment to recover seed; predict rolls; guess 5/5.

## Verification
End-to-end local run of the exact server (subprocess) wins and prints the (dummy) flag. See raw/local_run.txt.

## Reusable
PLAYBOOKS/crypto_prng_time_seed_commitment.md
