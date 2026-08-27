# Playbook — Esoteric language / “wrong orientation”

## Preconditions

- Source in BF / Whitespace / custom esolang.  
- Vanilla interpreter gives **decoy** or nonsense.  
- Title hints: turned around, reverse, upside down, backwards, mirror.

## Minimal chain

1. Run with standard semantics → capture decoy.  
2. Enumerate **orientation transforms**:
   - reverse entire program  
   - reverse only data section  
   - swap `<>` and/or `[]`  
   - flip PC direction (run from end)  
   - transpose if 2D esolang  
3. Trace both branches; collect partial secrets.  
4. If halves use mask char (`_`, `?`, `.`), **zip-merge**.  
5. Verify length + charset + flag format.

## Success indicators

- Non-decoy printable secret; merge consistent (no conflicting non-mask chars).

## Fallbacks

- Self-modifying BF: instrument memory writes.  
- Dual interpreters in one file (commented layers).

## Time-saving

Do not debug 10k BF cells before testing reverse/flip — orientation is cheaper.
