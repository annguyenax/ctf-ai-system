# Master prompt: solve, research, verify, and capture one CTF challenge

Copy the block below into the AI agent. Replace every `{{...}}` value that is known; leave unknown values blank for the agent to discover.

```text
Bạn đang giải một challenge CTF hợp pháp/được cho phép. Hãy làm đến khi có kết quả tái lập được; không bịa flag, stdout, nguồn tham khảo hoặc trạng thái tool.

CHALLENGE
- Event: {{EVENT}}
- Challenge name: {{CHALLENGE_NAME}}
- Category hint: {{CATEGORY_OR_UNKNOWN}}
- Prompt/URL/path: {{CHALLENGE_TEXT_URL_OR_PATH}}
- Attachments/service: {{ARTIFACTS_OR_HOST}}
- Flag format: {{FLAG_FORMAT_OR_UNKNOWN}}
- Time budget: {{MINUTES_OR_25}}

============================================================
0. DISCOVER THE CANONICAL WORKSPACE
============================================================

Canonical paths:
- D:\download\CTFTimeWriteup
  Event challenge files, solvers, evidence, and human-readable writeups.
- D:\download\ctf-ai-system
  Agent rules, router, category skills, playbooks, knowledge cards, and solve outputs.
- D:\download\hexstrike-ai
  Windows MCP client. The actual HexStrike tool server normally runs on Kali at
  http://192.168.77.138:8888.
- D:\download\ctf-scratch\<id>
  Disposable working directory outside both Git repositories. Put downloads,
  extracted copies, fuzz output, browser profiles, model caches, temporary
  payloads and large tool output here. Delete it after evidence capture.
- D:\download\PROJECTS.md
  Workspace map.

Before acting, read completely:
1. D:\download\CTFTimeWriteup\AGENTS.md
2. D:\download\ctf-ai-system\SKILL.md
3. D:\download\ctf-ai-system\ROUTER.md
4. D:\download\ctf-ai-system\SYSTEM_PROMPT.md
5. D:\download\ctf-ai-system\AGENT_RULES.md
6. D:\download\ctf-ai-system\KNOWLEDGE\sources_index.md

Then use progressive disclosure:
- Load exactly one primary SKILLS/<CATEGORY>.md file.
- Add a second category skill only if evidence proves the challenge is hybrid.
- Load at most two relevant playbooks/cards before the first test.
- Do not preload every skill, card, playbook, report, or raw log.

Never clone ctf-ai-system or hexstrike-ai into a temporary worktree. Durable data must stay under D:\download\.

Use this strict three-layer rule:

- SHOW -> CTFTimeWriteup: only what a human needs to reproduce and understand the challenge.
- LEARN -> ctf-ai-system: only generalized signals, decisions, verification and reusable knowledge.
- DISPOSABLE -> ctf-scratch: everything generated while searching; remove after capture.

Do not duplicate the same challenge binary/model/archive in both repositories.

============================================================
1. INTAKE AND LOCAL TRIAGE
============================================================

Create a stable challenge id: <event_lower>_<short_name>.
Create scratch workspace `D:\download\ctf-scratch\<id>` and keep it outside Git.

Record:
- exact prompt, event, author, points/solves if available;
- scope, URL/host/port, rate limits, offline-only constraints;
- expected flag format;
- attachment names, sizes, hashes, file types;
- supplied source, dependency/runtime versions, metadata and distinctive strings.

Preserve the original challenge files. Do not execute an untrusted pickle,
installer, macro, model checkpoint, or unknown binary before format/safety triage.

Classify category with confidence 0-1. Rank up to three initial hypotheses by:

  expected information gain / time + tool cost

For each hypothesis state:
- supporting observations;
- cheapest discriminative test;
- positive and negative indicators;
- timeout/output budget;
- fallback and kill condition.

Execute only the highest-value test first.

============================================================
2. RESEARCH LADDER
============================================================

Research is evidence-driven, not endless browsing.

Stage A - local knowledge first:
1. Search sources_index.md for the strongest artifact signal.
2. Open one matching card and one matching playbook.
3. Check prior challenges by the same event/author/series.

Stage B - fingerprint before Internet search:
- Extract exact challenge title, quoted flavor text, custom banners/functions,
  file hashes, framework/package versions, compiler/runtime, protocol and commit IDs.
- Do not search vague phrases such as only "CTF web challenge".

Stage C - initial external research, maximum three focused queries:
1. Exact challenge/writeup:
   "<event>" "<challenge>" writeup
   site:ctftime.org "<challenge>"
   site:github.com "<distinctive string>"
2. Technique/source reuse:
   GitHub code search for exact identifiers, constants, error strings or hashes.
3. Version/CVE research, only when an exact product/version exists:
   vendor/upstream advisory and changelog first; then NVD, CISA KEV,
   GitHub Advisory Database, OSV and a reputable technical analysis.

Choose queries from the evidence, not from a fixed checklist:
- exact-title route: event page, CTFtime task, team writeup repository, author profile;
- literal-code route: GitHub code search for function names, constants, error
  strings, protocol fields, magic bytes and unusual comments;
- provenance route: SHA-256/hash search, package metadata, container labels,
  compiler strings, build IDs and commit IDs;
- history route: Git history, pull requests, issues, release notes, patch diff,
  Wayback/Common Crawl and prior versions of the same challenge/service;
- academic route: original paper/spec/RFC when the task implements a named
  cryptographic, ML, compression, barcode or protocol technique;
- vulnerability route: vendor advisory -> fixed commit/diff -> affected version
  range -> NVD/GHSA/OSV/CISA corroboration -> public PoC only if still needed;
- author/series route: previous challenges by the same author, naming patterns,
  shared infrastructure and earlier parts of a chained challenge.

Research scale rules:
- initial research uses <=10% of total budget and no more than three queries;
- hard cap is 20% unless a new exact fingerprint materially narrows the search;
- run independent source queries in parallel when possible;
- keep a query/source log and do not repeat synonymous searches;
- stop reading a source as soon as it cannot match the artifact/version;
- never let external research replace local reproduction.

Source priority:
1. Supplied artifact/source and locally reproduced behavior.
2. Vendor/upstream documentation, advisory, commit or patch.
3. NVD/CISA/GHSA/OSV and original research paper.
4. CTFtime/team writeup with reproducible details.
5. Technical blog or forum post as supporting context only.

For every useful source record:
- URL, title, publication/update date;
- exact claim used;
- matching artifact/version evidence;
- whether it is fact, inference, or an unverified lead.

Stop initial research after three queries if no strong match. Return to local
analysis. Research again only when new evidence produces a narrower query.

A public writeup, copied flag, CVE label, generated PoC or blog statement is a
hypothesis until independently reproduced against this challenge.

============================================================
3. LOCAL TOOL OR HEXSTRIKE?
============================================================

Prefer local tools when they are installed, the artifact is local, and transfer
or remote-tool overhead would be larger than the expected saving.

Read D:\download\ctf-ai-system\KNOWLEDGE\tools_matrix.md before HexStrike use.

Use HexStrike only when all are true:
1. A named hypothesis requires a specific tool class.
2. HexStrike provides a missing capability or materially saves time.
3. The target is inside the authorized CTF scope.
4. The tool can be given a narrow target and stop condition.

HexStrike sequence:
1. Call server_health once and save the response.
2. Confirm the exact MCP tool is available.
3. Check artifact locality. HexStrike runs on Kali: a Windows path is not
   automatically visible there. Transfer/create only the minimum required file
   in a per-challenge Kali scratch path; never copy the whole repository.
4. Select one tool for the current question; maximum five per hypothesis.
5. Use narrow parameters, low concurrency and a 30-60 second initial budget.
6. For asynchronous/long jobs, use list_active_processes, get_process_status and
   terminate_process. Do not start the same job twice because output was delayed.
7. Save raw output in scratch, extract only decisive lines, then stop on a solid signal.
8. If down/degraded, record it once and continue locally. Do not waste solve time repairing it unless explicitly asked.

Examples of focused HexStrike choices:
- web baseline: httpx_probe; crawl only when needed: katana_crawl;
- confirmed parameter: ffuf_scan/sqlmap_scan/dalfox_xss_scan/arjun_scan;
- pwn/reverse: checksec_analyze, strings_extract, objdump_analyze,
  gdb_analyze, ropgadget_search, ghidra_analysis;
- forensics: exiftool_extract, binwalk_analyze, volatility_analyze;
- hashes: hashcat_crack or john_crack offline;
- CVE: monitor_cve_feeds or generate_exploit_from_cve only after an exact match.

Use the broader HexStrike capability without surrendering control:
- analyze_target_intelligence or select_optimal_tools_ai may propose a shortlist
  after scope/fingerprint are known; inspect the shortlist and execute only the
  justified tool, never an automatic comprehensive chain;
- api_fuzzer, graphql_scanner, jwt_analyzer and api_schema_analyzer only after
  the corresponding API surface is confirmed;
- feroxbuster_scan/gau_discovery/waybackurls_discovery only when route/history
  discovery answers a specific hypothesis;
- volatility_analyze/foremost_carving/steghide_analysis only after artifact
  type and shallow tests support that branch;
- angr_symbolic_execution/ghidra_analysis only on a target function or address;
- correlate_threat_intelligence/discover_attack_chains may enrich an exact
  product/version hypothesis, but generated chains are leads, not evidence;
- execute_command/execute_python_script are escape hatches for a named missing
  tool, not permission to build an unbounded shell pipeline.

"Full HexStrike potential" means using the right specialist, orchestration and
process-control capability at the right phase. It does not mean invoking every
scanner or autonomous attack chain.

Never begin with masscan_high_speed, autorecon_comprehensive,
comprehensive_api_audit, every Nuclei template, a full wordlist, or the entire
HexStrike arsenal. Crypto, jail, AI/ML and many misc tasks normally need no
network scanner.

Before each non-trivial tool call state:
Question: ...
Expected positive signal: ...
Expected negative signal: ...
Budget/timeout: ...

Store large output on disk. Use rg, filters, offsets and concise excerpts rather
than injecting full dumps, PCAPs, decompiler output, tensor dumps or scan logs
into model context.

============================================================
4. SOLVE LOOP AND VERIFICATION
============================================================

Use the state machine:
INTAKE -> TRIAGE -> HYPOTHESES -> TEST -> EXPLOIT -> VERIFY -> CAPTURE

After every meaningful test, append a schema-valid entry to:
D:\download\ctf-ai-system\OUTPUT\<id>\attempts.json

Record observation, evidence path, impact on hypothesis confidence, next action,
and why a path was killed. Stop a path after three failed discriminative tests
unless genuinely new evidence appears. At 12 command blocks or half the time
budget, run PROMPTS/critic_prompt.md.

Flag states:
- none: no candidate;
- candidate: flag-shaped or generated/extracted once;
- probable: supported by multiple signals;
- verified: independently reproduced or accepted.

Strong verification mechanisms include:
- decrypt then re-encrypt exact ciphertext;
- deterministic solver replay;
- local exploit plus one scoped remote confirmation;
- two independent extraction paths agreeing;
- exact flag bytes from a preserved source object;
- official challenge server/scoreboard acceptance.

One LLM/model generation, OCR guess, valid padding, visual resemblance, external
writeup or copied flag is not enough. Create final_flag.txt only when verified.

============================================================
5. WRITEUP FOR HUMANS
============================================================

After solving, write the event writeup beside the challenge:

D:\download\CTFTimeWriteup\<Event>\<category>\<challenge>\
  writeup\writeup.md
  solve\solve.py            # or appropriate deterministic solver/notes
  solve\evidence\manifest.md
  solve\evidence\           # only small decisive evidence referenced by manifest

The writeup must be understandable to a learner and useful to an expert:

1. Summary / flag and verification status.
2. Challenge files, environment and relevant versions.
3. Core concept from first principles; define specialized terms.
4. Triage: what signals mattered and why.
5. Exploit/recovery, step by step; explain the reason for each command.
6. Verification with exact evidence.
7. Failed approaches and why they failed.
8. Alternative solve paths when realistic.
9. Faster route next time and reusable checklist.
10. Sources with links and which claim each source supports.

Keep the main path concise. Put long dumps, exhaustive math, assembly, packets or
model tables in a clearly marked Deep Dive/evidence section. Never paste a public
writeup verbatim.

Do not leave large disposable files in the event directory: virtualenvs,
solve_vendor, node_modules, browser profiles/cache, downloaded common wordlists,
duplicate extracted archives, model caches or __pycache__. Keep original
challenge archives and the minimum evidence needed to reproduce the solve.

Default evidence budget:
- total generated evidence retained per challenge: <=10 MiB unless the original
  artifact itself is necessarily larger;
- text excerpt: <=200 KiB per tool, normally only the decisive 10-40 lines;
- screenshots: only those directly used by the explanation;
- payloads: keep the final working payload and at most one failed payload when it
  teaches a reusable pitfall;
- keep one original artifact copy in CTFTimeWriteup; cards/reports link to it.

The evidence manifest must map each retained file to:
claim supported -> source/tool -> reproduction command -> hash -> why it must be kept.
If a file supports no claim in the writeup, do not commit it.

============================================================
6. UPDATE CTF-AI-SYSTEM
============================================================

For a verified solve create/update:

D:\download\ctf-ai-system\OUTPUT\<id>\
  report.md
  timeline.md
  attempts.json
  reusable_patterns.md
  final_flag.txt
  raw\

D:\download\ctf-ai-system\KNOWLEDGE\cards\<id>.yaml
D:\download\ctf-ai-system\KNOWLEDGE\sources_index.md

Use KNOWLEDGE/card_template.yaml. The card must include signals, key idea,
verification method/evidence, failed paths, pitfalls, tools, HexStrike usefulness,
sources, playbook, writeup/solver paths, time heuristic and last-verified date.

If the technique is genuinely reusable and no playbook matches, add a short
PLAYBOOKS/<technique>.md containing:
trigger -> preconditions -> minimal method -> verification -> pitfalls -> faster path.
Do not create a new playbook for a one-off detail.

For paused/unsolved work:
- omit final_flag.txt;
- use status paused or needs_verification;
- preserve evidence, best hypothesis and next three actions;
- never list it as solved.

Finally run:
powershell -ExecutionPolicy Bypass -File D:\download\ctf-ai-system\scripts\Test-CtfAiSystem.ps1 -ChallengeId <id>

Fix every validator error before declaring capture complete.

ctf-ai-system is the LEARN layer, not a second artifact archive:
- report/timeline/attempts/reusable_patterns are concise text;
- raw contains small decisive excerpts or a manifest/link to CTFTimeWriteup;
- never copy original binaries, archives, PCAPs, model weights, wordlists,
  screenshots sets, dependency folders or full scanner output into OUTPUT;
- store a playbook only when the technique generalizes beyond this challenge.

============================================================
7. STORAGE HYGIENE AND FINAL CLEANUP
============================================================

Before completion, classify every created file:

SHOW:
- original challenge file once, deterministic solver, minimal requirements,
  writeup, evidence manifest and decisive evidence.

LEARN:
- compact report, attempts/timeline, card, reusable pattern and routed playbook.

DISPOSABLE:
- extracted duplicates, failed payload permutations, fuzz corpora/results,
  decompiler projects, browser profiles, temporary screenshots, embeddings/model
  downloads, common wordlists, package caches, venv/vendor/node_modules,
  __pycache__, logs and intermediate generated images.

Run a size review before deletion. Resolve and verify every cleanup path is under
`D:\download\ctf-scratch\<id>` or another explicitly named disposable target.
Then delete DISPOSABLE data. Never recursively delete a repository root, event
root, home directory or unresolved variable. Report retained evidence size and
reclaimed scratch size.

============================================================
8. FINAL RESPONSE
============================================================

Reply in Vietnamese unless requested otherwise. Lead with:
- solved/paused status and verified flag only if allowed;
- verification method;
- shortest reproducible solve command;
- all files created/updated;
- whether HexStrike was up/down, which tools were used, and whether it helped;
- SHOW/LEARN paths, retained evidence size, and scratch cleanup result;
- important remaining uncertainty or next steps.

During long work, send concise progress updates at least once per minute. Do not
claim completion merely because the time budget is nearly exhausted.
```
