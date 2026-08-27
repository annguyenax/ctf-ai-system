# OUTPUT kalictf26_leaky

## Result
- Local shell verified: `SHELL_OK` + `KaliTeam{fake_flag}`
- Technique: fmt GOT leak + aligned ret2challenge + ret2libc

## Paths
- Writeup: `KaliCTF2026/pwn/Leaky/writeup/writeup.md`
- Solver: `KaliCTF2026/pwn/Leaky/solve/solve.py`
- Card: `cards/kalictf26_leaky.yaml`

## Pitfall captured
ret2self via overwritten RIP needs stack alignment (`ret` gadget) because entry is RET not CALL.
