# Report - ptitctf2026_ghostvm

## Goal

Recover the 32-byte whisper from `GhostVM.exe` (PTITCTF2026 Reverse / GhostVM).

## Environment and artifact hashes

- `GhostVM.exe` PE32+ MSVC, 44032 bytes, ImageBase `0x140000000`.
- Scratch: `D:\download\ctf-scratch\ptitctf2026_ghostvm\GhostVM.exe`.

## Enumeration and decisive signals

- Length check `0x20` in checker `0x140005BA0`.
- Two interpreters: VM1 `0x1400026A0` (seed `0xD00DFEED11223344`), VM2 `0x1400039B0` (seed `0x0BADC0FFEE0DDF00`).
- Shared splitmix-fold keystream + opcode tables XOR `0xA5`.

## Exploitation / recovery

Emulate VM1 to decrypt 0x1E5C inner bytecode. Disassemble VM2: pack 32 input bytes into 4 qwords, 16 Feistel rounds, compare to four constants. Invert Feistel (forward `F` only) and unpack.

## Verification

- Inverse then forward matches
  `0xffe472913819fb83`, `0xff12a1c6dff42510`,
  `0xaba41a37d8f557ea`, `0xdf68174149473fc4`.
- Live `GhostVM.exe` prints `Correct flag!` for `PTITCTF{vm_1s_ju5t_4_sh4d0w_r3!}`.

## Failed paths and why

- Decoding VM1 stream with VM2 tables (`0x9480` vs `0x9280`) → first opcode 255.
- Treating SHL second operand as a register (values 8..56 are immediates).

## Lessons and faster path

Dump VM1 output first (short decrypt loop). If the inner compare is swap+XOR of a round function, invert as Feistel instead of inverting ARX/S-box.

## Alternative approaches

Unicorn-emulate the checker with symbolic 32-byte input (heavier than Feistel inverse).
