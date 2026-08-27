# baby-heap-V2

Verified flag: `PTITCTF{y0u_h4v3_f0und_th3_g00d_p4rt_0f_51gn41_decb0010da61}`

UAF (Delete does not NULL) on Ubuntu 22.04 glibc 2.35. Tcache poison to `_IO_2_1_stderr_`, House of Apple 2, trigger via SIGALRM `puts`+`exit`. Menu I/O is `write(2)` so stdout FSOP is the wrong FILE. Flag at `/flag.txt`.

Solver: `D:\download\CTFTimeWriteup\PTITCTF2026\Pwn\baby-heap-V2\solve\exploit.py`
