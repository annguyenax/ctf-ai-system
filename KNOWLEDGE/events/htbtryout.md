# HTB TryOut - Event Index (consolidated LEARN)

SHOW artifacts (source, solvers, writeups, final_flag) live in
`CTFTimeWriteup/HTB-TryOut/<category>/<name>/`. This file is the aggregated LEARN
index for the whole event. Per-challenge reusable detail: `KNOWLEDGE/cards/htbtryout_*.yaml`.

| Category | Challenge | Solved | Technique / summary |
|---|---|---|---|
| blockchain | NotADemocraticElection | yes | Loại: Blockchain (Solidity, EVM) |
| coding | Dynamic Paths | yes | Tác giả: makelaris |
| crypto | Blessed | yes | unveil_secrets trả flag nếu FastAggregateVerify đúng trên mọi robot đã verified. Server tạo sẵn 4 robot với sk giấu → ph |
| crypto | Dynastic | yes | Có source.py (hàm mã hoá) + output.txt (ciphertext). Khôi phục plaintext, bọc HTB{...}. |
| forensics | An unusual sighting | yes | Challenge: An unusual sighting (HTB Try Out — Forensics, mức rất dễ) |
| forensics | Phreaky | yes | Phreaky là challenge forensics (HackTheBox, mức độ medium) đi kèm một file phreaky.pcap (7.2 MB). Câu chuyện: có một "co |
| forensics | Silicon Data Sleuthing | yes | Cho một dump flash router 16 MiB (chal_router_dump.bin, OpenWrt). Service (nc) |
| general | Welcome to CTF | yes | Bài onboarding. Web app Flask/Werkzeug (Server: Werkzeug/3.0.2 Python/3.12.3) |
| hw | Critical Flight | yes | Challenge hardware (very easy), file-only: hw_critical_flight.zip. |
| hw | Debug | yes | Challenge: Debug (Hardware, easy) — HTB Try Out (nguyên gốc Cyber Apocalypse 2023). |
| hw | It's Oops PM | yes | Các cảm biến môi trường liên lạc với một vệ tinh qua một crypto-processor (TPM) mã hoá |
| ics | Shush Protocol | yes | Challenge ICS (very easy), file-only: ics_shush_protocol.zip → traffic.pcapng (thực ra là PCAP cổ điển magic d4 c3 b2 a1 |
| misc | Character | yes | Service cố tình làm cho việc đọc bí mật trở nên nhàm chán: mỗi lần kết nối (thực ra là mỗi lượt trong cùng session) chỉ  |
| misc | Chrono Mind | yes | Challenge: Chrono Mind — HTB Try Out (misc, easy, tác giả makelaris) |
| misc | Hidden Path | yes | Challenge cung cấp mã nguồn của một endpoint "kiểm tra hệ thống" (system check-up) — một ứng dụng Node.js/Express có for |
| misc | Locked Away | yes | Challenge đưa cho ta một "môi trường bị hạn chế" (restricted environment): một Python jail đơn giản. Người chơi gõ lệnh, |
| misc | Prison Pipeline | yes | Challenge mô phỏng một hệ thống quản lý hồ sơ tù nhân ("record management system") của một nhà tù. Nhiệm vụ: xâm nhập mạ |
| misc | Stop Drop and Roll | yes | Mini-game "The Fray": server lần lượt đưa một hoặc nhiều tình huống GORGE / PHREAK / FIRE. Người chơi phải trả đúng hành |
| pwn | Abyss | yes | Service (ELF64 non-PIE, NX) đọc .creds (ngẫu nhiên 15:15 mỗi lần deploy) làm |
| pwn | Getting Started | yes | Loại: pwn (binary exploitation) |
| pwn | Labyrinth | yes | Loại: pwn (binary exploitation) |
| pwn | Regularity | yes | ELF64 tĩnh viết tay bằng assembly. Non-PIE, không canary, GNU_STACK = RWE |
| pwn | Router Web | wip | Firmware ARM32 Buildroot chạy QEMU versatilepb. Dịch vụ mới router-web-panel |
| pwn | Void | yes | Loại: pwn (binary exploitation) |
| rev | Don't Panic! | yes | Câu chuyện đưa người chơi vào vai một điệp viên cần vô hiệu hóa robot dò nhiệt |
| rev | FlagCasino | yes | Challenge: FlagCasino (HackTheBox TryOut, rev, rất dễ) |
| rev | LootStash | yes | Challenge cung cấp một file ELF 64-bit stash (30.704 bytes). Flavor text gợi ý |
| rev | Satellite Hijack | yes | Một bảng điều khiển liên lạc với vệ tinh thời tiền-chiến bị kẻ thù "sửa" để chặn |
| rev | TunnelMadness | yes | tunnel là ELF64 x86-64, PIE, không strip. Chương trình đưa người chơi đi trong |
| web | Blueprint Heist | yes | Challenge WEB (medium), source web_blueprint_heist.zip. |
| web | Flag Command | yes | Challenge WEB (very easy), không có file đính kèm. |
| web | Guild | yes | Challenge WEB (easy), có source web_guild.zip. |
| web | HTB Proxy | yes | Challenge WEB (medium), source web_htb_proxy.zip. |
| web | Jailbreak | yes | Một challenge WEB (remote, không có file tải về), chơi qua trình duyệt. |
| web | Labyrinth Linguist | yes | Challenge WEB (easy), source web_labyrinth_linguist.zip (password zip: hackthebox). |
| web | OmniWatch | yes | Challenge web Hard (code-audit, HTB TryOut). Một web app tên "OmniWatch" dùng để theo dõi thiết bị của nhóm lính đánh th |
| web | TimeKORP | yes | Challenge WEB (very easy), có source web_timecorp.zip. |

**Total: 37 challenges - 36 solved, 1 WIP.**

