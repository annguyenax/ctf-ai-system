# Reusable patterns — GhostVM

- Stacked VM: the outer interpreter is often a short decrypt/expand loop. Emulate it to obtain inner bytecode before reversing the inner ISA.
- Per-PC splitmix-like mix `(pc * golden + seed) ^ (pc<<32)` then byte fold is a common “encrypted bytecode” scheme; seeds/tables differ per stage.
- Opcode nibble: `T1[b] ^ ROL8(T2[b], b&7) ^ const`.
- 256-bit “hash” implemented as swap + XOR of a round function is a Feistel: invert from the compare constants without inverting F.
- Shift/rotate operands that look like `r8,r16,...,r56` are immediates, not register indices (regs are 0..15).
