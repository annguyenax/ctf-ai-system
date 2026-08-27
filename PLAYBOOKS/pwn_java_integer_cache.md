# Playbook — Java Integer cache / boxed `==`

## Preconditions

- Java auth compares `Integer` / `Long` with **`==`** (not `.equals` / `intValue`).  
- Whitelist of permitted hash / id values.  
- Optional length constraints on input string.

## Minimal chain

1. Confirm types are **boxed** (autobox from `hashCode()`, `valueOf`).  
2. Recall cache range: **`Integer` [-128, 127]** (implementation detail, CTF-standard).  
3. Filter permitted values **inside** cache range only.  
4. Watch traps just outside range (`128`, `-129`).  
5. Craft input whose `String.hashCode()` (or other int) equals that value.  
6. If hash is modular poly in base 31: **meet-in-the-middle** on high/low coefficients.  
7. Send once; print responses ASCII-safe (emoji).

## Success indicators

- Auth success; flag printed.

## Fallbacks

- Different Java versions rarely change Integer cache default for CTF.  
- If no value in [-128,127]: re-read bug (maybe identityHashCode / other).  
- Long cache is different — check docs if Long boxed.

## Time-saving

Do not brute full 16-char space; MITM 3+3 printable chars is enough for one 32-bit target.
