# Playbook — External recon: known writeups & fresh CVEs

## Purpose

Before deriving an exploit from scratch, spend a small, timeboxed slice of
TRIAGE checking whether this exact (or a near-identical) challenge has
already been solved publicly, or whether the identified software/library
has a known, recent vulnerability. Many CTF challenges are:

- reused/rebranded from a previous event (same binary, renamed strings),
- built on a vulnerable library/framework version with a public CVE,
- inspired directly by a recent security advisory or blog post.

Skipping this step means re-deriving bugs by hand that are already
documented — expensive. Over-doing this step means burning the whole
budget reading unrelated blog posts — also bad. This playbook exists to
bound both failure modes.

## Preconditions (when to run this, inside TRIAGE)

- Challenge/binary has **distinctive strings**: challenge name, custom
  banner text, unusual function/variable names, a flag-format hint, or
  quoted flavor text (e.g. "Moss Man", a made-up product name).
- Service/binary identifies a **named 3rd-party software + version**
  (banner, `Server:` header, `--version` output, package manifest,
  bundled library symbol versions like `GLIBC_2.34`, a git commit hash).
- Category confidence is otherwise low, or the bug isn't obvious after a
  first pass of local static analysis.

Skip this step (go straight to HYPOTHESIS) when the challenge is clearly
small, self-contained, and fully solvable from the artifact alone (e.g. a
trivial strings-password ELF, a short custom crypto oracle) — don't search
the web for something you can already read in front of you.

## Steps (timeboxed: max 3 targeted queries, part of the ≤10% TRIAGE budget)

1. **Fingerprint first.** Extract exact identifiers before searching:
   - binary: `strings`, `file`, version banners, library `GLIBC_x.y.z`
     symbol versions, comment sections (`.comment` in ELF often has the
     exact `GCC (Distro X.Y)` compiler string).
   - web/service: HTTP `Server`/`X-Powered-By` headers, error page
     signatures, `package.json`/`requirements.txt`/`go.mod` versions.
   - challenge metadata: event name, challenge title, author name (often
     reused across an author's challenges/events).
2. **Search for a prior public writeup of this exact challenge.**
   - Query patterns: `"<event>" "<challenge name>" writeup`,
     `site:ctftime.org <event name>`, `<challenge name> ctf writeup github`,
     `"<unique flavor-text quote>" ctf`.
   - Prefer official writeup archives (`ctftime.org/event/.../tasks`,
     linked team writeup repos) and GitHub (`github_text_search` /
     `github_repo` for `<challenge-name> writeup` or a distinctive string
     literally copied from the binary/service).
   - If the SAME author/team has past challenges in this repo's
     `KNOWLEDGE/cards/`, check those first — authors often reuse bug
     classes/patterns across their own challenge series.
3. **Search for a known vulnerability in the identified software/version.**
   - CVE / NVD / GitHub Security Advisories / the vendor's own changelog,
     scoped to the *exact* version string found in step 1.
   - If a CVE is a strong match, treat it as a HYPOTHESIS candidate (not
     an assumption): still verify locally against the actual artifact/
     service before trusting a generated PoC. HexStrike's
     `generate_exploit_from_cve` can bootstrap a PoC, but the offsets/
     behavior must be confirmed against this specific binary/build.
4. **Record the source, don't copy the flag.** If a public writeup solved
   this or a near-identical challenge, note the technique and add
   `known_writeup: <url>` to the eventual `KNOWLEDGE/cards/<id>.yaml`.
   Never paste a flag found externally without independently reproducing
   the exploit against the actual target — copied flags are often stale
   (per-instance flags, rotated services) and violate the "no fabricated
   flags" rule.
5. **Stop condition.** After 3 queries with no clear hit, abandon this
   playbook and proceed to normal HYPOTHESIS generation from the artifact
   itself. Do not rabbit-hole through unrelated search results.

## Tools

- `open_browser_page` / `navigate_page` / `read_page` — browse search
  engines / ctftime / blog writeups when no direct URL is known yet.
- `fetch_webpage` — once a candidate URL is known (search result, ctftime
  task page, GitHub file).
- `github_text_search` / `github_repo` — search GitHub for writeup repos
  or literal distinctive strings pulled from the binary/service.
- `generate_exploit_from_cve` (HexStrike) — only after a CVE is confirmed
  relevant; treat output as a draft, verify against the real artifact.

## Success indicators

- A matching writeup/CVE materially shortens the HYPOTHESIS phase (skip
  straight to a known bug class instead of deriving it from raw
  disassembly/traffic).

## Failure / fallback

- Nothing found in 3 queries → fall back to first-principles static/
  dynamic analysis per the category `SKILLS/<CAT>.md` and other
  signal-based playbooks in `KNOWLEDGE/sources_index.md`.
- Found a writeup for a *similar but not identical* challenge (e.g. same
  author's earlier vault challenge) → use it to seed hypotheses about the
  bug class, but re-derive exact offsets/strings from this artifact —
  don't assume byte-for-byte identical layout.
