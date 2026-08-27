# Anti-patterns (agent mistakes to avoid)

1. **Full-scan first** — nmap all ports + nuclei all templates before reading the prompt.  
2. **Fabricated flags** — writing `flag{…}` without capture evidence.  
3. **Online BF despite offline note** — burns infra and fails intent.  
4. **Infinite retries** — same payload 20 times hoping for luck.  
5. **Tool soup** — enabling HexStrike 150 tools on a crypto chall.  
6. **No baseline** — fuzzing without saving a clean response.  
7. **Skipping local** — only testing remote for binary pwn.  
8. **Ignore charset** — generating invalid jail payloads with `()` when banned.  
9. **Writeup without failures** — next agent repeats dead ends.  
10. **Budget blindness** — 90% time on recon, 10% on exploit.  
11. **Ignoring distinctive strings/versions** — not spending 1-3 quick searches (`PLAYBOOKS/recon_external_search.md`) when the artifact clearly names a version/CVE-able library or has a searchable custom banner, then re-deriving a publicly documented bug by hand.  
12. **Search rabbit-holing** — the opposite failure: burning the recon budget reading unrelated writeups/blog posts past the 3-query stop condition instead of moving to HYPOTHESIS.  
13. **Trusting external flags/PoCs blindly** — copying a flag from a public writeup instead of reproducing the exploit against the actual target (per-instance flags rotate; PoCs from CVE generators need verification against the real binary/build).  
