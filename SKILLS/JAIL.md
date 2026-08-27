# SKILL — JAIL / SANDBOX ESCAPE

## Triage signals

| Signal | Likely |
|--------|--------|
| `eval` / restricted Python | pyjail |
| charset allowlist | limited tokens jail |
| `jq` / `bash` / `lua` filter | language jail |
| ok/error only | boolean oracle |
| flag in env / `/flag` | read primitive needed |

## Fast path checklist

1. Exact **charset** and banned builtins.  
2. Inventory **0-arity / allowed** operations.  
3. Locate secret (`env`, `open`, `os`, file).  
4. Reduce secret → integers/strings you can test.  
5. If oracle-only: fingerprint offline, query online sparsely.

## Discriminative tests

- What works: `true`, `env`, `open`?  
- Error vs empty vs timeout as channels.  
- Local docker with planted flag before remote.

## Tool whitelist

Language REPL, challenge docker, small Python oracle scripts. **Not** nmap.

## Avoid early

Mass remote queries before local uniqueness proof; ignoring charset (parentheses, underscore).

## Deliverables

- Escape/read primitive  
- Recovery method (oracle / RCE / file read)  
- Flag + evidence  
