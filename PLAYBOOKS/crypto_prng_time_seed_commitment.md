# Playbook: predict a time-seeded PRNG via a published commitment

## Trigger
- A service seeds `random` from the clock, e.g.
  `random.Random(int(time.time()))` / `random.seed(time.time())`, and
- publishes something that lets you verify a guessed seed (a commitment such as
  `sha256(seed)`, or any deterministic output derived from the seed).

## Preconditions
- The RNG is Python's `random` (MT19937) or another PRNG whose seed space at
  1-second resolution is tiny.
- You can read the commitment/first output right after connecting (known ~time).

## Minimal method
1. Read the commitment `C` (and note your local `now = int(time.time())`).
2. Recover the seed by brute over a few dozen seconds:
   ```python
   for t in range(now+5, now-120, -1):
       cand = random.Random(t).randbytes(16).hex()   # reproduce server's seed derivation
       if sha256(cand) == C:
           seed = cand; break
   ```
   Match the EXACT derivation the server uses (randbytes/getrandbits/hex/etc.).
3. Reproduce the server's per-round function with the recovered seed and answer
   each prompt deterministically until the win condition.

## Verification
- Run the exact server code locally as a subprocess with a dummy flag and drive it
  with the attack; confirm it wins and prints the flag. Then run live.

## Pitfalls
- Clock skew: brute a WINDOW of seconds, not one value.
- Match the seed derivation precisely (byte count, hex, endianness).
- Never fabricate the real flag when solving offline; only the technique is
  proven locally — the flag comes from the live server.

## Faster path next time
Grep the handout for `time.time()` / `random.seed(` / `Random(`. If a commitment
or first deterministic output is printed, it is your seed-verification oracle.
