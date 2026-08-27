# Tool routing matrix

Local tools are preferred when they are already available and avoid transfer overhead. HexStrike is an optional Kali execution backend, not the default solver.

## HexStrike preflight

1. Call `server_health` once.
2. Confirm the named tool appears available in `tools_status`/health data.
3. State the hypothesis and narrow target before calling it.
4. Save the response under `OUTPUT/<id>/raw/`.
5. If down/degraded, record once and continue locally.

HexStrike executes on Kali. A Windows artifact path is not automatically visible
to the server. Copy/create only the minimum required artifact in a per-challenge
Kali scratch directory and never transfer a whole repository.

Canonical endpoint in this workspace: `http://192.168.77.138:8888`. Do not use the stale localhost endpoint unless the server is actually running locally.

## Profiles (exact MCP names)

| Category/question | Cheap/local first | Focused HexStrike choices | Avoid by default |
|---|---|---|---|
| Web baseline/tech | curl/browser | `httpx_probe`, `katana_crawl` | `autorecon_comprehensive`, all-template scans |
| Confirmed web parameter | manual differential request | `sqlmap_scan`, `ffuf_scan`, `dalfox_xss_scan`, `arjun_scan` | scanning every route/parameter |
| Pwn triage | file/checksec/strings/gdb | `checksec_analyze`, `strings_extract`, `gdb_analyze` | network scanners |
| Pwn exploit support | pwntools/ROP locally | `ropgadget_search`, `ropper_gadget_search`, `one_gadget_search`, `libc_database_lookup` | full symbolic execution first |
| Reverse | file/strings/decompiler | `objdump_analyze`, `ghidra_analysis`, `angr_symbolic_execution` (targeted) | whole-binary angr without goal |
| Forensics | file/strings/tshark/exiftool | `exiftool_extract`, `binwalk_analyze`, `volatility_analyze`, `foremost_carving` | full carving before shallow search |
| Crypto/hash | Python/Sage | `hashcat_crack`, `john_crack`, `hashpump_attack` | scanners, unbounded masks |
| OSINT | browser/primary sources | usually none; `exiftool_extract` if transfer is justified | intrusive account activity |
| Jail | local REPL/container | usually none | generic arsenal |
| AI/ML | safetensors/tokenizer/Python | usually none; `execute_python_script` only if dependencies live on Kali | generic scanners/model execution |
| CVE research | vendor/NVD/CISA/GHSA/OSV | `monitor_cve_feeds`, `generate_exploit_from_cve` after exact match | generated PoC treated as fact |

## Advanced capability routing

| Need | Candidate MCP tools | Control rule |
|---|---|---|
| Tool shortlist after fingerprint | `analyze_target_intelligence`, `select_optimal_tools_ai` | recommendations only; manually approve one specialist |
| Long job control | `list_active_processes`, `get_process_status`, `terminate_process` | poll existing job; never duplicate on delay |
| API-specific testing | `api_fuzzer`, `graphql_scanner`, `jwt_analyzer`, `api_schema_analyzer` | confirmed API surface and narrow operation only |
| URL/history discovery | `katana_crawl`, `gau_discovery`, `waybackurls_discovery` | exact host and hypothesis; cap depth/results |
| Targeted reverse automation | `ghidra_analysis`, `angr_symbolic_execution` | target function/address and stop condition required |
| Threat/CVE correlation | `correlate_threat_intelligence`, `discover_attack_chains` | exact software/version; output is a lead |
| Missing Kali-side primitive | `execute_command`, `execute_python_script` | named command/script, bounded input/output, CTF scratch only |

Using HexStrike fully means using health, specialist selection, asynchronous job
control and evidence capture together. It never means launching every tool.

## Budget defaults

- One tool per question; at most five per hypothesis.
- Targeted probes: 30-60 seconds.
- Decompiler/carving/offline cracking: 120 seconds before reassessment unless progress is measurable.
- Use tool-specific timeout/threads/depth options where exposed. The MCP client's global default is currently 300 seconds, so agent-side early stopping remains necessary.
- Never start with `masscan_high_speed`, `autorecon_comprehensive`, `comprehensive_api_audit`, or a broad `nuclei_scan`.

## Selection rule

HexStrike is useful when `(expected time saved + missing local capability) > (health check + transfer + output-noise cost)`. Otherwise use the local tool directly.
