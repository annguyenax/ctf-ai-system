# SKILL — OSINT

## Triage signals

| Signal | Likely |
|--------|--------|
| Username / email / handle | account pivots |
| Image only | reverse image + EXIF |
| Map / geo | geolocation |
| Company / event lore | public docs / Wayback |
| “warm blooded” social | careful public sources only |

## Fast path checklist

1. Extract all entities (names, domains, phones, hashes, coords).  
2. Reverse image + EXIF (if not stripped).  
3. Username search across major platforms (public).  
4. Domain: crt.sh, historical DNS, Wayback.  
5. Correlate; stop when flag-format string appears.

## Discriminative tests

- Google/dork exact unique phrases from prompt.  
- Metadata first (cheap).  
- Cross-verify two independent sources before claiming identity.

## Tool whitelist

Browser, Wayback, `exiftool`, public OSINT sites; **no** illegal access.

## Avoid early

Harassment, credential stuffing, non-public data breaches as primary path unless challenge provides them.

## Deliverables

- Entity graph (short)  
- Source links  
- Flag with citation  
