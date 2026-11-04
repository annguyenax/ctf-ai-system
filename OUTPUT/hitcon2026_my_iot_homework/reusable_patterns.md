# Reusable pattern

A Nordic BLE bootloader is only as secure as the reset gate and image policy. Disassemble the normal application's maintenance handler first; a fixed-length per-byte rotate/XOR check can reveal an undocumented boot request. Then inspect the bootloader's actual init and image validators rather than assuming a current signed DFU scheme. If uploaded firmware runs under an emulator that models secrets as MMIO, a tiny application can read the MMIO stream and expose it through a valid read-only GATT characteristic.

Verification must distinguish recovered target data from scoreboard acceptance. Preserve the live read and firmware validation evidence even when an anti-bot page blocks flag submission.
