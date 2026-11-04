# FAUST CTF 2026 — Event LEARN (Attack/Defense)

**Type:** Attack/Defense (A/D), not jeopardy. Team 504. 2026-09-26, 13:00–21:00 UTC (8h).
**Infra:** Player VPN = OpenVPN (`player-faustctf.conf`, shared). Vulnbox VPN = WireGuard
(`vuln-faustctf.conf`, **only ONE connection allowed at a time**). Vulnbox = provided VM image
(qcow2/OVA) running 4 services; decrypt with `/srv/extract-services.py /srv/vulnbox_services.tar.xz.gpg`
(password released at start). Services auto-start via `faustctf.target`.

## Scoring model (memorize for A/D)
- `offense = Σ 1 + 1/(#teams_who_also_captured_that_flag)` → public/easy bugs get divided among ~40 teams → ~1.1/flag. High offense needs bugs FEW teams have.
- `defense = -Σ (captures_of_your_flag)^0.75` → **negative** if you don't patch your own vulns.
- `sla = (ticks_up + 0.5·ticks_recovering) · sqrt(#teams)` ≈ 22 pts/tick/service here → **biggest lever ≈ 448 pts/h/service**. Keeping the vulnbox UP is worth more than offense.
- 1 tick = 3 min; flags valid 5 ticks.

## Services (this event)
| Service | Lang/stack | Notes |
|---|---|---|
| Interstellar Mission Control (IMC) | Neko (`.neko` compiled by `nekoc` at container start via `make socks`), socat on :8080 | Vuln: `null==null` auth bypass in `fetch.neko` SPACESHIP filter (`being.crew==row.crew`). Patch = guard `(being.crew!=null && being.crew==row.crew)` (mirror `update.neko:25`). |
| Lamp | LaTeX + MariaDB + Redis | `lamp-latex-1` compiles attacker `.tex` → **CPU/RAM bomb** under attack. |
| Alf | Typst + DB | Typst sandbox blocks file read (symlink escape #5454 patched → dead end offensively). |
| Rufflecopter | Flash/SWF + Postgres/PostgREST | SSRF/file-read backend but `sanitize()` blocks reaching sink. |

## Outcome / honest debrief
Offense (IMC null==null) scored steadily but capped (~40 teams share it). The whole endgame was a
firefight over **keeping the vulnbox up** — that is where SLA points live and where it went wrong.

## OPERATIONAL LESSONS (the reusable value)
1. **Disk space is the silent killer.** Local host C: filled to 0.3 GB → WSL ext4 went read-only →
   qcow2 write failures → guest ext4 corruption → cascading "crashes" that looked like SIGHUP/OOM but
   were **ENOSPC**. Always check free disk on the host BEFORE running a vulnbox VM, and monitor it.
   `qemu-img check` showed only "leaked clusters" (recoverable, no data loss) after the scare.
2. **Only ONE Vulnbox VPN connection.** Running local VM + cloud droplet with the same
   `vuln-faustctf.conf` → they fight over the WireGuard handshake (keepalive kicks the other) →
   BOTH flap → SLA lost for both. Pick one host; stop the other.
3. **One manager per host.** Two AI agents both doing `docker build/up` on one box = churn/overload.
   Assign: one agent owns the vulnbox, the other owns offense.
4. **Vulnerable services fork-bomb under 40-team attack.** IMC's `socat TCP6-LISTEN:8080,fork` had
   **no child limit** → unbounded `neko` processes → load 200+, RAM exhausted, sshd starved, box
   unreachable. FIX: `socat ...,fork,max-children=32 ...` (edit Makefile → rebuild image). Verify:
   `docker exec <imc> grep max-children /imc/Makefile` and neko proc count ≈ limit, not thousands.
5. **Cap every service's CPU/RAM** so no single one can melt the box: per-container
   `docker update --cpus=N --memory=Xg` or `mem_limit:`/`cpus:` in compose. `lamp-latex` especially.
   On a 4-core/8 GB box the combined attack load needs this or the box dies.
6. **WireGuard team address must be persisted.** wg-quick brought up only `fe80::2/64` from the
   config; the team addr `fd66:666:<team>::2/64` was added manually → **lost on reboot** → gameserver
   unreachable → SLA 0. Put it in the config `Address = fe80::2/64, fd66:666:504::2/64`.
7. **Local QEMU vulnbox must be daemonized.** `-nographic` + terminal = dies on SIGHUP when the
   driver script exits. Use `-daemonize -serial pty -monitor unix:… -pidfile …` (survives) + a
   watchdog that reboots it if the pidfile process dies. Drive console via the pty (`os.open`/socat),
   not a socket chardev (drops output when no client attached).
8. **Cloud (DigitalOcean) gotchas:** `docker-compose` v1 → `docker build` needs `DOCKER_BUILDKIT=0`
   (buildx missing). Rapid docker restarts → systemd `start-limit-hit` → `systemctl reset-failed docker`.
   A melted box: sshd banner-timeouts; catch it during a load dip / right after reboot with an
   aggressive SSH retry loop that runs `systemctl stop docker` on connect. **Power-off still bills on
   DO — only Destroy stops billing.**
9. **Patch your own vulns for defense** (IMC null==null guard) — else `defense` goes negative.

## Anti-patterns hit (append candidates to KNOWLEDGE/anti-patterns.md)
- Deleting the only working local image (qcow2) right after "committing" to cloud, before the cloud
  host was proven stable — lost the fallback.
- Hammering SSH into a melted box (repeated attempts risk fail2ban and waste time); prefer one
  reboot + early catch, or the provider's serial Web Console (works when sshd is starved).
- `pkill -f <pat>` where `<pat>` also appears in the running command line → self-kill. Put kills in a
  script file, or use a bracket trick (`'dri[v]e.py'`).
- Assuming SIGHUP/OOM/cache mode for repeated VM crashes when the real cause was a full host disk.
- Git-Bash on Windows mangles `/root/...` args to `wsl -- cmd`; always wrap in `bash -lc '…'`.
