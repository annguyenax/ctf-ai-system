# Reusable pattern — deleted Windows image recovery

## Trigger

- Recent LNK or ActivitiesCache names an image that no longer exists;
- Explorer thumbnail databases are present;
- a full disk carve would be expensive or impossible from a triage collection.

## Minimal method

1. Recover target paths from Recent/LNK and correlate with ActivitiesCache + WAL.
2. Inventory `thumbcache_<size>.db`, preferring the largest non-empty cache.
3. Validate `CMMM` magic and walk entries by `entry_size`.
4. Compute payload boundaries from identifier length, padding length, and data size.
5. Preserve cache hash, source DB, payload size, and SHA-256.
6. Corroborate with a duplicate cache key/size and deterministic replay.

## Stop rule

If a decisive high-resolution thumbnail is recovered, do not carve `$MFT`, USN,
or contact an external download source solely to recover the same content.
