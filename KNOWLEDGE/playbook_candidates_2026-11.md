# Playbook candidates (backfill 2026-11-04)

Chua promote thanh PLAYBOOKS/. Moi muc da co card nguon; can review truoc khi tach.

## batch1

# Playbook candidates — Batch 1

## 1. Flask/werkzeug `send_file()` size-TOCTOU to read 0-size special files

- **Trigger:** A file-read primitive built on Flask's `send_file()` returns
  `Content-Length: 0` for a special file that genuinely has content (e.g.
  `/proc/self/environ`, `/proc/<pid>/cmdline`) — the OS reports its `stat()`
  size as 0, and `send_file()`/werkzeug stats the path before it opens it.
- **Preconditions:** Repeatable, fast file-read requests against the same
  `send_file()`-backed endpoint; ability to control (or guess/enumerate) what
  `open()` resolves to at the exact moment between the endpoint's `stat()` call
  and its later `open()`/read call — on Linux this is available via
  `/proc/self/fd/<N>` (every `open()`d fd is itself a symlink you can swap the
  *target* of, by repointing the underlying path, before the second access).
- **Minimal method:** 1) Trigger `send_file(<large decoy file>)` to get a real,
  large stat() size reported and an open fd created server-side. 2) Before the
  handler's second (read) access, swap what that fd's path target resolves to,
  pointing it at the real special file you want to read. 3) The server streams
  up to the decoy's reported size, but the bytes now come from the special
  file. Race by spamming requests (e.g. `ffuf` with a dummy wordlist) until
  timing lines up.
- **Verification:** Response body contains the expected special file's content
  (e.g. environment variables) rather than 0 bytes or the decoy's content.
- **Pitfalls:** The decoy's reported size must be smaller than the real target's
  actual size or the server will hang waiting for bytes that never come; you
  can pad a format-string-controlled value (e.g. repeat `$FLAG` several times)
  to hit a size you control instead of hunting for an exact-size decoy file.

## 2. React Server Components (Flight protocol) WAF bypass via recursive/charset re-decoding

- **Trigger:** Target is a Next.js app using React Server Components
  (react2shell-style RCE primitive: `resolved_model` chunks, `$N:a:b` property
  references, `__proto__`/`constructor` traversal) sitting behind a proxy/WAF
  that regex-blocks dangerous substrings like `:constructor` in the raw request
  body.
- **Preconditions:** The backend parses/decodes the body differently from the
  WAF in at least one dimension — either a declared charset the WAF ignores
  (e.g. multipart part with `charset=utf16le`), or the framework's own chunk
  resolution re-runs `JSON.parse` on nested string values (so wrapping the
  payload in one extra `resolved_model` layer buys one extra decode pass the
  WAF's single scan never sees).
- **Minimal method:** Start with a charset differential (UTF-16LE-encode just
  the blocked token) if the WAF decodes multipart bodies naively as UTF-8. If
  that is closed, nest the RCE payload inside additional `resolved_model`
  chunks, escaping the blocked token one extra `\u0063` level per nesting
  layer, using `Chunk.prototype.then` (reached via `$N:__proto__:then`) to make
  the framework itself re-resolve/re-decode the inner chunk. Increase nesting
  depth incrementally until the WAF stops matching but the app still decodes
  far enough to reach the RCE primitive.
- **Verification:** Server returns the expected redirect/response carrying a
  base64 or similar encoded result of the injected command.
- **Pitfalls:** Getting the escape-depth count wrong fails silently (no clear
  error) rather than throwing; treat depth as a parameter to sweep, not a fixed
  guess. This only generalizes to apps built on the React Flight wire protocol
  (react2shell family), not generic JSON APIs.

## 3. Replay captured protocol traffic into the legitimate consumer binary as a decrypt oracle

- **Trigger:** You have a packet capture of one side of a custom encrypted
  protocol AND the legitimate binary that implements the *other* side (the one
  that decrypts and displays/consumes the content for a human).
- **Preconditions:** The consumer binary can be run locally (even if still
  packed/not statically reversed) and its connection target (host/port) is
  discoverable (e.g. via `strings`) and matches, or can be forced to match,
  what the capture used.
- **Minimal method:** Export the captured bytes for the direction the consumer
  binary expects to receive (e.g. server->client in a chat protocol) from the
  capture tool (Wireshark "Follow TCP Stream", raw export). Stand up a listener
  on the consumer's default target (`nc -lvnp <port> < captured.bin`) and run
  the real consumer binary against it. Let it decrypt/display the content for
  you instead of reverse engineering the crypto.
- **Verification:** The consumer binary's output contains the expected
  plaintext/flag.
- **Pitfalls:** Only works when you have the *consuming* party's binary, not
  the one that only encrypts/sends; check which side displays content to the
  user before assuming this shortcut applies.

## batch2

# Playbook candidates — Batch 2 (H7CTF 2026 Quals)

Techniques below generalize beyond their source challenge and have no matching
existing playbook in ctf-ai-system/PLAYBOOKS.

## 1. Composable backdoor split across multiple LoRA adapters

- **Trigger:** A challenge hands you several (>=2) LoRA/PEFT adapter files for one base
  model, with flavor text implying no single adapter is malicious alone but a
  merge/scan flags the set, or a hint about a "composable"/"cartel" backdoor.
- **Preconditions:** Adapters are safetensors files; at least two of them target the
  same unusual module name (not a standard attention/MLP projection).
- **Minimal method:** List tensor keys in every adapter; group adapters by any shared,
  non-standard target module name. For that subset, compute the LoRA delta
  (`B @ A`) per adapter and sum them. Inspect the resulting matrix for non-zero
  integer entries and try decoding them directly as bytes/ASCII.
- **Verification:** The summed-delta bytes decode to a well-formed flag/string; a
  single adapter's delta alone does not.
- **Pitfalls:** Checking each adapter individually (the "obvious" merge-safety scan)
  never reveals anything; you must explicitly sum deltas across the implicated
  subset on the shared module.

## 2. Self-corroborating an agentic "confidence threshold" pipeline

- **Trigger:** An AI/agent-flavored service holds a privileged report/action behind
  a corroboration-count or confidence gate (e.g. "needs N supporting sources"),
  and separately exposes a public ingestion/submission endpoint that feeds that
  same pipeline.
- **Preconditions:** You can read the current working hypothesis/claim text, and the
  submission endpoint accepts free-form documents that the pipeline summarizes
  itself (no manual moderation).
- **Minimal method:** Read the hypothesis text closely. Submit N (or more) documents
  that restate/confirm its specific technical claims in varied wording via the
  public submission endpoint, then re-trigger the analysis/escalation action.
- **Verification:** The gated status flips from unverified/standard to
  corroborated/deep, and the resulting expanded report/action becomes available.
- **Pitfalls:** Vague or generic submissions may not count as corroborating; mirror
  the hypothesis's specific claims. The flag may live in a secondary artifact
  (e.g. a generated report's embedded file) rather than the top-level response.

## 3. Mobile API signature keyed only by a client-supplied value

- **Trigger:** A mobile backend demands custom request-signing headers (not a
  standard JWT/OAuth scheme); blind header/JWT fuzzing never changes a generic
  "missing signature" error, and an APK is provided.
- **Preconditions:** Decompiling the APK's signer code shows the HMAC/signature key
  is derived from a hardcoded constant ("pepper"/app secret) combined ONLY with a
  value the client itself chooses and sends (e.g. a self-generated device id),
  with no server-held per-user secret.
- **Minimal method:** Decompile with androguard/jadx to recover the exact
  canonical-string format and the hardcoded pepper. Reimplement the signer in
  Python. Mint any device id, compute the HMAC key, and sign ANY request
  (including ones the legitimate app never issues, such as a higher-privilege
  scope/query parameter) rather than only what the app's own UI constructs.
- **Verification:** A self-signed request for an elevated scope/endpoint the app
  never calls is accepted by the server.
- **Pitfalls:** Don't waste time black-box fuzzing header names/JWT algorithms once
  the error message is static — go straight to decompiling the client for the
  exact scheme once a custom (non-standard) signature header is observed.

## batch3

# Batch 3 playbook candidates (DeadfaceCTF2026)

## 1. Sequential-ID IDOR/BOLA fuzzing after obtaining any valid session
- trigger: An authenticated API exposes a numeric/guessable resource-ID parameter (account_id, order_id, document_id) in a path or body, and you hold a valid session token for *any* account (even a low-privilege/leaked one).
- preconditions: Endpoint returns resource data keyed only by the ID parameter, with no server-side check that the ID belongs to the caller's own account.
- minimal method: Authenticate with any valid credential set; call the resource endpoint while varying the ID parameter across a plausible numeric range near known/leaked values (sequential increments, or ±N around a seen ID); inspect each response for data that does not belong to the authenticated user.
- verification: A response for an ID other than the caller's own account returns valid, non-empty data belonging to a different user/entity (e.g. another customer's statement, another patient's record).
- pitfalls: Required auxiliary headers (internal API tokens, specific User-Agent strings) from a separate reverse-engineering step may be needed just to get requests accepted before IDOR testing is possible; rate limiting may require throttling the fuzz loop.

## 2. Streaming regex search of an oversized memory/disk image without full extraction
- trigger: A forensic image (memory dump, disk image) is distributed compressed but inflates to many GB — too large to comfortably extract to disk, while only a handful of ASCII string artifacts (file paths, command lines, task/service names) are actually needed.
- preconditions: The archive tool (7-Zip or similar) supports streaming decompression to stdout; the target strings are plain ASCII/UTF-16 substrings somewhere in the raw image.
- minimal method: Pipe the decompressor to stdout (`7z.exe e -so archive.7z`), read fixed-size chunks (several MB), prepend a small overlap buffer carried from the end of the previous chunk, and run regex `findall` against each chunk for the target pattern(s); accumulate matches in a set to dedupe.
- verification: The recovered strings exactly match the expected artifact format (a full file path, a complete command line) with no truncation at chunk boundaries.
- pitfalls: Without the overlap buffer, a match straddling a chunk boundary is silently missed; this only recovers plain string artifacts, not structured OS objects (processes, handles) — use Volatility for those.

## 3. Printer tracking-dot (MIC) steganography decode from a scanned/printed document
- trigger: A challenge gives a scanned or photographed printed document and asks for a hidden tracking/asset ID, with no obvious embedded-data file format (not a PNG chunk, not EXIF).
- preconditions: Image resolution is high enough to resolve individual dots (several megapixels); the suspect region is a corner/margin of the page where printer tracking dots are typically placed.
- minimal method: Compute a yellow-isolation channel `((R+G)/2 - B)` across the image; locate the bright dot cluster's bounding box to calibrate grid origin and row/column pixel spacing; for each grid row, sample a small window per column and threshold the yellow-channel value to get a bit; assemble 8 bits per row into a byte, skip any all-1 synchronization row, and decode remaining rows as ASCII.
- verification: Decoded bytes form a readable ASCII string (e.g. an asset/print ID) matching the expected flag format.
- pitfalls: Grid origin/spacing and the brightness threshold are scan/print-specific and must be calibrated per image by inspecting the yellow-diff heatmap; naive thresholds from one image may not transfer to another.

## batch5

# Playbook candidates — batch 5

## JWT `kid`-as-key-filename disclosure, then HMAC key reuse

- **Trigger:** JWT header's `kid` (or similar) claim selects which server-side file is loaded as the verification key/secret; a failed-signature debug/error path discloses the referenced file's full contents in the response.
- **Preconditions:** attacker can set an arbitrary `kid` value; the file-protection check is an explicit denylist/allowlist by path (not a structural restriction on which files can ever be used as key material).
- **Minimal method:** (1) forge a token with `kid` = any readable, non-denylisted file (e.g. `/etc/passwd`) and a throwaway signature — the server rejects the signature but discloses the file's content via the debug path; (2) forge a second token, same `kid`, now signing with the just-leaked file bytes as the HMAC secret and escalated claims (e.g. `role=admin`) — the server recomputes the same HMAC from the same file and accepts it.
- **Verification:** the second request returns privileged content/the flag.
- **Pitfalls:** an explicit denylist on the real key files and the flag path does not stop the underlying `kid`-controls-key-source confusion against any other readable file; the debug disclosure path may fire regardless of pass/fail, so test it even without first confirming an auth bypass is otherwise reachable.

## Browser per-domain cookie-priority eviction to overwrite an HttpOnly cookie

- **Trigger:** a privileged cookie is set `HttpOnly` (so client JS cannot overwrite it directly) but shares the browser's default (non-High) `Priority` tier with an attacker-controlled cookie-injection point on the same domain.
- **Preconditions:** a page/flow lets the attacker set many arbitrary same-domain cookies (e.g. via `document.cookie` from reflected/stored data) under a bot/reviewer browser session; the session cookie itself (if any) is `Priority=High` so it survives independently.
- **Minimal method:** flood the domain with enough junk cookies (named/valued arbitrarily) to exceed the browser's per-domain cookie cap (~180 in Chromium), with the desired override cookie (same name as the HttpOnly target, e.g. `role=chief`) submitted LAST so it is the newest in its priority tier; the oldest Medium/Low-priority cookie (the original HttpOnly privileged cookie) gets evicted first, and the attacker's same-name override cookie becomes what the server reads.
- **Verification:** the privileged endpoint now reflects the attacker's injected cookie value instead of the original HttpOnly one.
- **Pitfalls:** order matters — the override must be the newest cookie in its tier, not buried in the middle of the flood; a `Priority=High` session cookie is immune to this and will survive regardless.

## Vector-database (embedding-only) secret recovery via embedding inversion

- **Trigger:** a vector database (e.g. ChromaDB) item returned by its query/get API has a non-null embedding vector but a null/empty `document` field — the secret was stored only in embedding space, never as retrievable plaintext.
- **Preconditions:** the embedding function/model used to produce the vector is known or discoverable (e.g. from internal docs/emails); an embedding-inversion framework compatible with that embedding family is available (e.g. `vec2text` for GTR-family embedders).
- **Minimal method:** query the vector DB's REST API with `include=embeddings` to pull the raw vector for the null-document item; run the matching inversion model (hypothesizer + corrector, with the correct `num_steps`/`beam_width` parameters if specified anywhere) against that vector to reconstruct its hidden source text.
- **Verification:** the inverted text is coherent and matches other recovered context (e.g. corroborated by a companion clue describing the secret's format).
- **Pitfalls:** a document-level query will never surface this content since the document field is genuinely null; inversion quality depends on using the correct embedding function/model family and inversion parameters, not just any general-purpose text-embedding inverter.

## batch6

# Batch 6 playbook candidates

## 1. GDB-as-a-service source-path file read
- trigger: a service runs a debugger/disassembler (gdb, objdump with source annotation, etc.) on an attacker-uploaded binary, in the same working directory as a secret file, filtering only shell metacharacters from a secondary argument (e.g. function name).
- preconditions: attacker controls the uploaded binary's debug info (DWARF line-table source-file name), and the command-filter blocklist does not block the tool's own flags (`/`, space) or the DWARF-settable path.
- minimal method: build a minimal ELF whose DWARF line table names its "source file" as the target secret's filename; pass the tool's mixed-source-listing flag (e.g. `disassemble /s main`) so it opens and prints that file verbatim.
- verification: tool output includes the target file's literal content in its listing.
- pitfalls: a blacklist designed against shell injection may still leave legitimate tool flags/paths open, turning the analysis tool itself into the file-read primitive.

## 2. Python exec()/eval() substring-blacklist bypass via chr()-built identifiers + bracket-free attribute access
- trigger: a service runs `exec(user_input)` or `eval(user_input)` after checking the input against a list of forbidden substrings (keywords, quotes, brackets).
- preconditions: `globals()`/`locals()` already contains a sensitive callable the input must reach without using any blocked substring or syntax.
- minimal method: build the target identifier's name at runtime from `chr(ord)` arithmetic (avoiding any literal containing a blocked word), and retrieve it via `dict.get(name)` (or another non-bracket accessor like `getattr`) instead of subscript syntax if brackets/quotes are blocked, then call the result.
- verification: the sensitive function executes and its output (e.g. a flag file's content) is returned.
- pitfalls: substring blacklists are not a security boundary for exec()/eval(); any forbidden token is reconstructible and most forbidden syntax has a non-syntactic equivalent method call.

## 3. abi.encodePacked identity-key collision across two dynamic-length Solidity arguments
- trigger: a Solidity contract computes `abi.encodePacked(argA, argB)` (or more dynamic-length args) and uses the result as a mapping key or identity check, while a separate uniqueness/ownership check is keyed by the un-packed (argA, argB) pair.
- preconditions: at least one other account/record already has value accumulated under the packed-key mapping; attacker can choose their own (argA, argB) split.
- minimal method: pick a split of (argA, argB) whose packed concatenation exactly matches an already-funded identity's packed bytes (e.g. `("SatoshiNakamoto","")` collides with `("Satoshi","Nakamoto")`), deposit/register under the colliding split to inherit the existing packed-key mapping's accumulated value, then exploit any missing consumption/cap on repeated use of that value.
- verification: on-chain state (balance/weight/vote count) reflects the inherited value without ever depositing it directly; replay a privileged action to confirm it crosses the target threshold.
- pitfalls: `abi.encodePacked` on two or more dynamic types is ambiguous/non-injective; this is a well-known Solidity antipattern distinct from the uniqueness check being merely absent — the identity check and the storage key must use the SAME unambiguous encoding (`abi.encode`, or hash of individually length-prefixed fields).

## batch7

# Batch 7 — playbook candidates

## 1. LLM-mediated format-string leak
- trigger: a service pipes user input through a local LLM (esp. a deterministic/fixed-seed small model) and then prints the model's *generated* text with an unsanitized `printf`/format call.
- preconditions: fixed/deterministic sampler seed (or otherwise reproducible generation); the generation step sits directly before a vulnerable print/format sink.
- minimal method: craft a prompt that reliably primes the model to continue with format-specifier-shaped tokens (e.g. priming with `%p.%p.%p....` so the model naturally extends the pattern); replay against the sink; parse the leaked values from the printed output exactly as in a normal format-string attack.
- verification: confirm determinism first (same prompt -> same completion across repeated runs) before relying on it for a leak; cross-check recovered bytes against the expected flag format.
- pitfalls: non-deterministic sampling (temperature>0, no fixed seed) breaks reproducibility; treating the LLM output as "safe" because it's machine-generated rather than directly attacker-typed is the core misconception the challenge exploits.
- seen in: rstconctf2026_thought_slop

## 2. USB link-layer (PID/ACK) reconstruction of Bulk-Only Transport writes
- trigger: a pcap/pcapng capture with LinkType 288 (raw USB) or similarly low-level USB capture, containing a USB mass-storage device, and the task requires recovering a file written to that device.
- preconditions: capture includes the full low-level handshake (OUT token, DATA0/DATA1, ACK/NYET/NAK/STALL), not just a high-level USB-mass-storage dissection.
- minimal method: parse raw records; track the last (device, endpoint) announced by an OUT token; buffer the next DATA0/DATA1 payload; commit it to a reconstructed stream only when followed by ACK or NYET (discard on NAK/STALL); locate SCSI CBW signatures (`USBC` + little-endian tag) in the reconstructed stream to find file-part boundaries/offsets; concatenate and trim by known file magic/trailer bytes.
- verification: confirm reconstructed bytes start/end with correct file magic/trailer (e.g. PNG header + IEND chunk) before trusting the extraction.
- pitfalls: decoy devices/strings on other endpoints (e.g. a printer device emitting a fake flag-shaped string) can mislead; confirm which device/endpoint is the actual data channel before extracting.
- seen in: rstconctf2026_universal_suffering_begins_usb

## 3. Embedded RTOS object-structure forgery via unbounded index write
- trigger: an embedded/RTOS target (e.g. FreeRTOS on QEMU) exposes a debug/data-injection command that writes at `base + index*4` (or similar) with no bounds check on `index`.
- preconditions: static/decompiled firmware analysis is feasible to map out adjacent globals/kernel-object pointers reachable by walking the index forward, and a legitimate consumer routine exists that will dereference/process whichever object the pointer currently targets (e.g. a queue-read task).
- minimal method: suspend any producer/writer that would race the injection; walk the index until it reaches the adjacent object-pointer slot; write a forged version of that object's structure (matching the RTOS's exact field layout) pointing at the target memory (e.g. the flag's known address); trigger/resume the consumer so it processes the forged object and surfaces the target data through its normal output path.
- verification: live run against the real/emulated target reproduces the target data via the consumer's normal output format.
- pitfalls: must get the target RTOS's structure field layout exactly right (field order/sizes); failing to suspend the real producer can cause races that corrupt the forged structure before the consumer reads it.
- seen in: rstconctf2026_carbon_noneoxide

## batch8

# Batch 8 — playbook candidates

## 1. seccomp-bpf missing `arch` check -> cross-ABI syscall-number collision
- trigger: a pwn target installs a custom seccomp-bpf filter (via `prctl(PR_SET_SECCOMP, ...)`) that allows only a small set of numeric syscall numbers, and the binary/shellcode you control can switch between the `syscall` instruction (x86_64 ABI) and `int 0x80` (i386 ABI) on the same process.
- preconditions: the BPF program's first `BPF_LOAD` only reads `seccomp_data.nr` and never compares `seccomp_data.arch`; at least one allowed numeric value maps to a USEFUL syscall under the OTHER ABI than the one the filter author intended (e.g. the same number is a harmless syscall under x86_64 but `open`/`openat`/`execve` under i386, or vice versa).
- minimal method: disassemble/decode the BPF filter bytecode to confirm no `arch` comparison exists; enumerate each allowed `nr` value under both the x86_64 syscall table and the i386 syscall table; build the exploit so each step issues its syscall via whichever instruction (`syscall` vs `int 0x80`) makes that same numeric `nr` resolve to the syscall you actually need at that step.
- verification: single-step or strace the target locally to confirm the intended syscall (not the filter author's intended one) actually executes and returns the expected result (fd, bytes read, etc.) before relying on it in a longer chain.
- pitfalls: glibc helper functions (e.g. `setcontext`) that you plan to reuse as gadgets may themselves issue a disallowed syscall early in their normal entry path (e.g. `rt_sigprocmask`) and get killed before reaching the useful part -- jump into the function body past that prologue instead of calling it from its start.
- seen in: dctf2026quals_bitdebit

## 2. Sandboxed eval/exec substring blacklist bypass via runtime/escape construction
- trigger: a challenge service runs `eval()`/`exec()` (or an in-browser/server-side interpreter) over user-submitted source text, and defends itself by checking whether a fixed list of banned words/substrings appears literally in the raw submitted text, while still exposing the full interpreter builtins/globals or accepting standard language escape syntax.
- preconditions: the filter operates on the raw, unnormalized source string (no decoding of the target language's own escape/encoding rules before matching), and at least one reachable primitive (full `__builtins__`, `getattr`, string concatenation, or an escape sequence like `\uXXXX` inside an identifier) lets you spell a banned token without it appearing literally.
- minimal method: identify the exact banned substring; reconstruct it at runtime via string concatenation/`getattr`/`chr()`-joins (for a reflection-capable language like Python), or respell one or more characters using the target language's own identifier/string escape syntax (e.g. JavaScript `\uXXXX` inside an identifier) so the interpreter decodes it back to the original token after the filter has already passed the escaped form.
- verification: send the constructed payload to the live service and confirm the response contains the expected secret/flag, not just that the filter was bypassed.
- pitfalls: a filter that blacklists substrings but doesn't restrict the REACHABLE OBJECT GRAPH (e.g. passes the real `__builtins__`/globals through) is bypassable regardless of how clever the word list is; the fix is restricting what's reachable, not expanding the blacklist.
- seen in: securinets2026_banned_in_leonida, securinets2026_js_1_0

## 3. PDF font Encoding `/Differences` dual-glyph steganography
- trigger: a forensics/stego challenge provides a PDF (often styled as a "document" or "invoice") whose description stresses that two things "look the same" or "are processed as equivalent", and the body text uses a custom font with an `Encoding` dictionary containing a `/Differences` array.
- preconditions: the `/Differences` array remaps a second range of character codes (e.g. 160-254) to the SAME glyph names as a first range (e.g. 32-126), so two different byte values render as visually identical characters.
- minimal method: parse the font's `Encoding /Differences` array to find which code ranges alias to identical glyphs; extract the raw per-glyph bytes from the `Tj`/`TJ` show-text operators for that font in document order; classify each byte by which aliased range it falls in (e.g. 1 bit per character: "low" vs "high" range); reassemble the per-character bits (MSB-first or as specified by any header/length hint found) into a hidden byte stream.
- verification: the decoded byte stream should contain a recognizable header/tag or directly the flag format; cross-check the visible rendered text is unaffected (confirms the channel is genuinely invisible, not a rendering glitch).
- pitfalls: don't limit the search for hidden data to metadata/EXIF/overlay bytes when a PDF-specific stego challenge emphasizes visual equivalence -- check the font's own Encoding table first.
- seen in: securinets2026_khloss_lmouhami

## batch9

# Playbook candidates — batch 9

## 1. Blind CSS attribute-selector exfiltration (bridge hidden secret to visible sibling)

- **Trigger:** A page renders a secret value (flag, token) into a hidden DOM element
  that only a privileged victim (admin bot) actually sees populated; the page's CSP
  blocks `script-src` but allows `style-src 'unsafe-inline'`, and the HTML sanitizer
  strips scripts/event handlers but leaves `<style>`/`style=` untouched.
- **Preconditions:** The secret element and a visible element are reachable from each
  other via a CSS combinator (direct sibling `+`, general sibling `~`, descendant, or
  child); an out-of-band collector/log endpoint exists (or any attacker-controlled
  server) to observe which background/image request fires.
- **Minimal method:** For each unknown character position, inject one `<style>` block
  per candidate character: `#secret[value^="known+candidate"] ~ #visible { background:
  url(/collect?q=<candidate>) }`. Only the correct candidate's rule matches, firing
  exactly one beacon. Have the victim render the page (report/admin-bot visit), then
  read the collector log to learn which candidate fired; append it to `known` and repeat.
- **Verification:** The progressively exfiltrated string decodes to readable text (or
  the expected flag format); confirm by accepting it on the real target (scoreboard,
  login, etc.).
- **Pitfalls:** A shared/limited-use rendering bot may crash after only a few loads —
  batch many candidates into one `<style>` block per visit, use a light/complete charset
  in one pass, and fail fast rather than retrying a dead bot; once a partial result is
  human-readable, skip ahead by hand and let the oracle only verify, to save bot budget.

## 2. DWARF/addr2line-precise out-of-bounds write triage before building RCE

- **Trigger:** A pwn/native target has retained or recoverable debug symbols (DWARF)
  and an out-of-bounds array write/memset whose index or range is attacker-controlled
  from untrusted input (e.g. a parsed network response).
- **Preconditions:** `readelf`/`addr2line`/`nm` can resolve the struct layout and field
  offsets at the vulnerable write site; a local or isolated harness can reproduce the
  write without needing the full remote service.
- **Minimal method:** Compute the struct size and the overflowed field's byte offset
  from the base of the OOB-written array; for a given attacker-chosen index/range,
  predict exactly which adjacent struct field(s) get corrupted (counter, pointer tail,
  size field) before attempting any weaponization. Validate predictions against observed
  crash signatures (SIGSEGV on a specific corrupted pointer, malloc abort on size field
  corruption) in a local run.
- **Verification:** Local crash signatures match the predicted corrupted field exactly
  (e.g. an off-by-one index landing exactly on a counter's low byte, confirmed by an
  observed counter increment in program output).
- **Pitfalls:** A confirmed crash/corruption primitive is not automatically an RCE
  primitive — explicitly check whether the overflow's content is attacker-controlled
  data (write-what-where) versus merely internal allocator/pointer bytes (crash-only);
  and recompute whether a second overflow's *fixed* write size actually reaches a
  further-away target field before assuming it does.

## 3. Deterministic forward-replay of an iteration-seeded obfuscation transform

- **Trigger:** A reversed binary stores its real payload (bytecode, flag ciphertext,
  configuration) in a scrambled form, and a visible routine applies a transform to it
  some fixed number of times, where the transform's per-iteration state is seeded only
  from the iteration counter (not from any runtime-only secret like user input or a
  timestamp).
- **Preconditions:** The transform is fully specified by static disassembly (no opaque
  external call, no genuinely random seed); the iteration count and per-iteration state
  derivation (e.g. `state = f(k)` for iteration `k`) are both recoverable from the code.
- **Minimal method:** Re-implement the transform in a scripting language, replay it
  forward the exact recovered number of iterations against the extracted scrambled
  bytes, and parse the result against whatever structure consumes it (VM bytecode,
  config, ciphertext).
- **Verification:** Re-run the *original* consumer logic (e.g. replay the decoded
  bytecode through the actual recovered VM semantics) against the derived output to
  confirm it reaches the expected success state, not just that the transform "looks"
  reasonable.
- **Pitfalls:** Don't assume brute-forcing or fuzzing the scrambled form against the
  consumer is necessary — first check whether a separate routine is dedicated to
  unscrambling it deterministically, since that is far cheaper once identified.
