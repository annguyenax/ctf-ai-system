# Skill - WEB

## Triage signals

| Signal | Likely branches |
|---|---|
| Login/session/JWT | authorization, logic, forgery, reset flow |
| User input in DB query | SQL/NoSQL injection |
| Rendered template markers | SSTI |
| URL fetch/import/webhook | SSRF |
| Path/file/page parameter | traversal/LFI |
| Upload/parser | content-type confusion, XXE, archive/polyglot |
| API/GraphQL | IDOR, mass assignment, injection, batching |
| Named framework/version/build | exact advisory/changelog research after local fingerprint |

## Fast path

1. Preserve one baseline per route: request, response, status, headers, length/body hash.
2. Map trust boundaries: anonymous/user/admin/bot/internal service.
3. Read supplied source and client assets before broad discovery.
4. Apply one low-noise differential probe to each high-value input.
5. Fingerprint exact framework/runtime/package versions before CVE research.
6. Confirm exploitability manually before automation.

## CVE handling

Do not assume a CVE from a framework header alone. Match affected version/configuration and reproduce a harmless proof against the challenge. Prefer vendor/upstream advisory, NVD, CISA KEV, GHSA, and OSV. Challenge-specific exploit payloads belong in solver/evidence files, not always-loaded category prompts.

## Tool choices

Local curl/browser first. Use focused `httpx_probe`, `katana_crawl`, `ffuf_scan`, `sqlmap_scan`, `dalfox_xss_scan`, or `arjun_scan` only after the corresponding question is explicit. Avoid comprehensive and all-template modes.

## Verification

Preserve the exact request/response or deterministic source-level reproduction that yields the flag. Explain why the behavior crosses a trust boundary.
