# Timeline — ptitctf2026_wellness_ring

- TRIAGE: custom heap, context 0x80 OOB, CET, no file I/O.
- TEST: menu6 after ctx+cache = rx-guard sentinel, not heap.
- TEST: free cache0 then ctx → cache1 overlap, leak heap+PIE.
- TEST: arb read GOT[puts] nibble 0xcc0 → live libc 8.8 not zip 0x87bd0.
- EXPLOIT: apple2 stderr, menu 10, cat /home/oura/flag.txt.
- VERIFY: remote output PTITCTF{...} plus cat: /flag.txt missing.
