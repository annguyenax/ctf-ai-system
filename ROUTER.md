# Fast router

This file is the small context entry point. Do not load the full repository.

## 1. Normalize the challenge

Capture: event, category hint, prompt, flag format, attachments, service, scope, rate limits, and artifact hashes. Preserve the prompt verbatim.

## 2. Route by strongest signal

| Signal | Primary skill | First cheap action |
|---|---|---|
| HTTP app, source, API, cookies | `SKILLS/WEB.md` | baseline request + stack/version fingerprint |
| Native service/binary exploitation | `SKILLS/PWN.md` | `file`, `checksec`, strings |
| Crackme, bytecode, obfuscated program | `SKILLS/REVERSE.md` | type/packer/import/strings triage |
| Cipher, oracle, algebraic parameters | `SKILLS/CRYPTO.md` | identify primitive, sizes, invariants |
| PCAP, memory, disk, document, stego | `SKILLS/FORENSICS.md` | hash + file type + shallow extraction |
| Public-source identity/place/research | `SKILLS/OSINT.md` | entity extraction + source plan |
| Restricted interpreter/sandbox | `SKILLS/JAIL.md` | charset/capability inventory |
| Puzzle, barcode, signal, unusual format | `SKILLS/MISC.md` | classify representation before decoding |
| Model, checkpoint, LoRA, tokenizer, embeddings | `SKILLS/AI_ML.md` | inspect metadata/tensors before inference |

For mobile, cloud, hardware, or blockchain challenges, use `SKILLS/MISC.md` as the coordinator and one adjacent specialist skill; record the missing specialist path after the solve.

## 3. Retrieve only relevant knowledge

1. Search `KNOWLEDGE/sources_index.md` for distinctive signals.
2. Open one matching card to learn the prior evidence chain.
3. Open one matching playbook for the reusable method.
4. Stop loading context and run the cheapest discriminative test.

If no match exists, solve from first principles and create a new playbook only if the technique generalizes.

## 4. External research gate

Use `PLAYBOOKS/recon_external_search.md` only when a distinctive string, exact software/version, author pattern, or low category confidence makes search high value.

- Fingerprint locally first.
- Use at most three focused queries in initial triage.
- Prefer vendor advisories, upstream docs, NVD/CISA/GHSA/OSV, and exact-challenge writeups.
- Treat a CVE/writeup as a hypothesis until reproduced against the artifact.
- Continue research later only when new local evidence creates a narrower query.

## 5. HexStrike gate

Use HexStrike only when it supplies a tool missing locally or materially reduces execution time.

1. Check server health and actual tool availability.
2. Select one tool; at most five over the whole hypothesis.
3. Set the narrowest target, parameters, and timeout supported by that tool.
4. Save raw output, extract a small evidence excerpt, and stop on decisive signal.
5. Fall back locally if the server is down or degraded; do not spend solve time repairing infrastructure unless asked.

## 6. Verification gate

A flag is verified by at least one strong mechanism:

- deterministic decrypt/re-encrypt or solver replay;
- local exploit plus one scoped remote confirmation;
- two independent extraction paths agreeing;
- server/scoreboard acceptance;
- exact flag bytes in a preserved source object with provenance.

Model generation, visual guessing, padding validity, a public writeup, or flag-shaped text alone is only a candidate.

## 7. Beyond CTF — real-world / career skills router

CTF sits inside a bigger cybersecurity practice. When a task is NOT a CTF challenge
(live pentest, red-team TTP, DFIR/IR, malware analysis, threat hunting, detection
engineering, cloud/AD/mobile security, compliance), route to the external skills
libraries under `..\refs\` instead of forcing it through the CTF skills above.

| Reference (under `D:\download\refs\`) | Use it for | How to look up |
|---|---|---|
| `Anthropic-Cybersecurity-Skills\` | 817 agentskills.io skills across 29 domains, mapped to MITRE ATT&CK (v16, 291 techniques). Primary router for real-world work. | Grep `index.json` (`{skills:[{name,description}]}`) or `skills\<name>\SKILL.md`; see `ATTACK_COVERAGE.md` to route by ATT&CK technique. |
| `reverse-skill\` | Broad skills router (api/apk/ghidra/ida reverse, firmware-pentest, cloud-k8s, llm-security, edr-bypass, ...). | `skills\INDEX.md` / `MASTER-ROUTING.md`. |
| `Awesome-Cybersecurity-Handbooks\` | Red-team/CTF payload & cheatsheet reference notes. | `handbooks\` by topic. |

Routing rule: pick the ONE most specific external skill by matching the task to a
skill `name`/`description` (prefer `Anthropic-Cybersecurity-Skills\index.json`);
load only that skill file; keep the CTF gates in sections 3-6 for verification and
evidence. These are reference inputs — read them, do not edit them in place.

> **Router tổng (mọi loại việc, không chỉ CTF):** dán `PROMPTS/arsenal_router.md` làm system prompt.
