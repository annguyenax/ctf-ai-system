# Reusable pattern
Time-seeded PRNG (random.Random(int(time.time()))) + a published commitment/first
deterministic output = brute a small seconds window to recover the exact seed, then
predict all outputs. Verify by running the exact server locally.
