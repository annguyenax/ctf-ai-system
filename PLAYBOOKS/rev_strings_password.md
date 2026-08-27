# Playbook — Password in ELF strings / rodata

## Preconditions

- Binary prompts for password.  
- Likely `strcmp` / `strncmp` / `memcmp` vs constant.  
- Stripped OK.

## Minimal chain

1. `file` + `checksec` (optional).  
2. `strings -n 5` — look for long alnum/leetspeak secrets.  
3. Confirm: `objdump`/`r2` xref to that string → compare call.  
4. If only remote has flag: `nc host port` with password.  
5. Do **not** reverse the whole binary if compare is plaintext.

## Success indicators

- Success message + flag format.

## Fallbacks

- Encoded password (xor/rot) → still often nearby in rodata.  
- Multi-stage series: note story for next challenge.

## Time-saving

`strings` before Ghidra for “vault/login/password” ELFs under ~50KB.
