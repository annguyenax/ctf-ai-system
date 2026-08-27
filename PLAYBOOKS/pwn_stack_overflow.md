# Playbook — Stack buffer overflow

## Preconditions

- Overflowable buffer; ability to control return / saved RIP (after canary if any).

## Minimal chain

1. `checksec` + local crash with cyclic.  
2. Find offset to RIP/RBP.  
3. If canary: leak via fmt/overflow partial.  
4. If PIE/ASLR: leak libc or binary.  
5. Build ROP (`system(/bin/sh)` or `one_gadget` or ORW).  
6. Stabilize local → remote once.

## Success indicators

- Shell or deterministic flag read.

## Fallbacks

- Partial overwrite; ret2csu; ret2dlresolve; SROP.

## Time-saving

Local reliability > early remote; match remote libc.
