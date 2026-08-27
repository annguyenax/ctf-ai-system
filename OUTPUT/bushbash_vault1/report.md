# Report — bushbash_vault1

## Goal

Open remote vault with password from binary.

## Enumeration

`strings vault` → `th3M0ssM4ni5h3re,y0uc4ntcatchm3`; `.rodata` + `strncmp` confirm.

## Exploitation

`nc 34.40.133.67 7776` + password.

## Flag

`bushbash{th1s-is-just-th3-beginning!}`

## Note

Series: “just the beginning” / Moss Man → expect Vault II.
