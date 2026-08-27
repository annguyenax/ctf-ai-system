# The Wellness Ring Bypass

Verified flag: `PTITCTF{h3y_th1s_r1ng_1s_y0ur_c0ngr4tul4t10n_8f9f9eee06eb}`

Context OOB + free-list reorder so a live 0x80 cache occupies the rx-guard slot. Arb R/W, House of Apple 2 on stderr, menu 10 → exit() flush. Live libc 2.39-0ubuntu8.8.

Solver: `_work/win.py`
