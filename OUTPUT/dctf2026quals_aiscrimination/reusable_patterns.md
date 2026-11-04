# Reusable pattern — web: CSS @import local file-read (LFI) sink

## Signal
A web app that reflects a user-controlled string into a generated stylesheet and
"compiles" / "imports design fragments" — especially with editorial hints like
"path rules as intuitive" or "the renderer will include it".

## Pattern
1. Identify where user input lands inside a CSS (or any text) string that the server
   post-processes.
2. Probe with `@import url("<path>");` and look for either the file content inlined or
   a placeholder such as `/* ... unavailable */`.
3. If the sink resolves `(ROOT / requested).resolve()` without a containment check,
   an absolute path overrides `ROOT` (pathlib semantics) — read any file.
4. Use `/proc/self/environ` / `/proc/self/cmdline` to find `PWD`, app path, and flag
   location, then read the flag file.

## Payload
```
statement: @import url("/home/ctf/flag.txt");
```

## Reference implementation
`D:\download\CTFTimeWriteup\DCTF2026Quals\Web\aiscrimination\solve\solve.py`

## Pitfalls
- URL-path traversal (`/assets/cards/../`, `/posts/../`) often 404s because routing is
  DB-keyed — the file read lives inside a *different* sink (here, CSS import expansion).
- The reflected file content is usually escaped (`\n` → `\A `, `"` → `\"`, `\` → `\\`);
  unescape before comparing hashes.
- Short/non-browser User-Agents may trigger a heuristic 429 block; send a browser UA.
