# Recover deleted images from Windows thumbnail cache

## Trigger

Use this playbook when Recent Items, LNKs, Windows Search, or ActivitiesCache name
an image that is absent from a Windows forensic collection, while
`Explorer/thumbcache_*.db` files remain.

## Preconditions

- preserve the original cache files and hashes;
- keep ActivitiesCache DB beside its WAL/SHM files;
- identify the largest non-empty thumbnail cache first;
- treat path correlation and image-content recovery as separate claims.

## Minimal method

1. Extract target names/paths from Recent LNKs.
2. Correlate user interaction via ActivitiesCache/WAL and Search/registry.
3. Validate thumbnail database magic `CMMM`.
4. Start at the database header's first-entry offset.
5. For each CMMM entry, validate `entry_size`, read cache hash, identifier length,
   padding length, and data size.
6. Derive the exact payload boundary; do not rely only on JPEG/PNG signatures.
7. Record cache hash, source cache size, payload dimensions/size, and SHA-256.
8. Stop after a decisive high-resolution payload is independently corroborated.

## Verification

- require a complete recognized image container;
- compare duplicate cache keys or the same image at another cache size;
- replay the parser from the preserved original collection and compare hashes;
- verify ambiguous visible text only on the recovered SHOW-layer image.

## Pitfalls

- forgetting the ActivitiesCache WAL;
- assuming `$MFT` contains non-resident deleted image content;
- false/truncated results from blind SOI/EOI carving;
- keeping a contact sheet or hundreds of system icons as durable evidence;
- downloading a missing file externally when local thumbnail evidence suffices.

## Faster path

Recent path -> Activity confirmation -> largest thumbcache -> length-based CMMM
parser. Defer MFT/USN parsing until these shallow sources fail.
