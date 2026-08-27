# Playbook — Web SSRF

## Preconditions

- Server fetches URL or interacts with internal network from user input.

## Minimal chain

1. Find sink (`url=`, webhook, PDF renderer, imager).  
2. Prove outbound: canary DNS/HTTP (CTF interactors).  
3. Hit metadata / localhost flag service as challenge design allows.  
4. Bypass filters: redirect, IP encoding, DNS rebinding (if intended).  
5. Read response body if returned; else blind channel.

## Success indicators

- Canary hit + internal content / flag.

## Fallbacks

- Protocol smuggling (`gopher`,`file`,`dict`) only if stack supports.  
- Open redirect chain.

## Time-saving

Don't port-scan entire RFC1918; use challenge hints / common flag ports first.
