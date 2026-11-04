# Timeline

1. Inspected the combined nRF51 flash and located `command_handler` at `0x1b008`.
2. Derived and locally checked the seven-byte ROL/XOR maintenance request.
3. Connected to the scoped challenge instance, sent the request, and observed the maintenance-to-DFU reset.
4. Reverse-engineered the firmware's prevalidate and postvalidate behavior; confirmed the 14-byte init packet and CRC16 locally.
5. Built a static read-only GATT image and locally emulated it with a dummy test marker; confirmed 16 GPIO reads and a valid UUID service.
6. Sent image via Nordic DFU. Opcodes 1, 2, 3, and 4 returned success; activation exposed the app GATT service.
7. Read the flag from the live GPIO-backed GATT characteristic.
8. Tried official submission; Cloudflare returned HTTP 403, leaving scoreboard state unconfirmed.
