# My IOT homework — solved from live GPIO exfiltration

The maintenance firmware's fixed seven-byte command check is a reversible ROL/XOR equation. Its accepted payload sets GPREGRET to `0xb1`, causing a reset into the Nordic DFU bootloader. The bootloader accepts an unsigned application with an init packet requesting SoftDevice ID `0xfffe` and validates the image with CRC16.

A 500-byte Thumb image reads GPIO P0.IN at `0x50000510` sixteen times, then registers a valid vendor UUID service and a read-only GATT characteristic through S130 SVCs. After DFU activation, the host's GPIO model streamed the instance flag into the characteristic. The exact flag was independently recovered from the live endpoint, and the firmware's local init and image validators both returned success.

The official submit helper was tried; Cloudflare returned HTTP 403, so platform acceptance remains unconfirmed.

- Event evidence: `D:\download\CTFTimeWriteup\HITCONCTF2026\Pwn\My IOT homework_new folder（1）_ver.114514(final）\solve\evidence\manifest.md`
- Solver: `D:\download\CTFTimeWriteup\HITCONCTF2026\Pwn\My IOT homework_new folder（1）_ver.114514(final）\solve\solve.py`
- Writeup: `D:\download\CTFTimeWriteup\HITCONCTF2026\Pwn\My IOT homework_new folder（1）_ver.114514(final）\writeup\writeup.md`
- App SHA-256: `ff48e0a55de28ccbdfb580e1c648e750b497244d3226749ea5bd145cae92e9dd`
- Flag SHA-256: `4fec66725d309935a883fb72beec877e49944fb46e607212e5c1ae22cc2a0ae4`
