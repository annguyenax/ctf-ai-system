# Sticky Headers — FortID CTF 2026

Status: solved, platform-confirmed 2026-10-10.
Flag: FortID{1_C4NT_5H4K3_TH15_H34D3R_8aa9ae0bba}

- Web; TLS gateway (1 request/connection) fronting a Python BaseHTTP staff app.
- Vuln chain: chunked-body TRAILER request smuggling — gateway mishandles the
  section after the terminal `0\r\n` chunk: swallows exactly 2 bytes then parses
  the remainder as the next request on the same backend connection, bypassing the
  gateway router/ACL ("older courier protocol" + "more than one encoding" hints).
- Smuggled POST /staff/preview (field `message` from robots.txt) hits a Jinja2
  template render -> SSTI -> read /opt/candy/recipe.txt via
  __init__.__globals__.__builtins__.__import__('os').popen('cat /opt/candy/recipe.txt').
- Practical details: smuggled request needs a 2-byte junk prefix (XX) and the
  outer body must end with `0\r\n\r\n`; smuggled body uses Content-Length.
- Solver: CTFTimeWriteup/FortIDCTF2026/Web/Sticky Headers/solve/solve.py
  (`python solve.py <instance_host>`; verified replay, SSTI check 7*7=49).
