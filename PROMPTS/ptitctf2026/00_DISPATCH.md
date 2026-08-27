# PTITCTF2026 — Bảng điều phối (quân sư)

Event dir SHOW: `D:\download\CTFTimeWriteup\PTITCTF2026\`
LEARN: `D:\download\ctf-ai-system\OUTPUT\<id>\` + `KNOWLEDGE\`
SCRATCH: `D:\download\ctf-scratch\<id>\` (xoá sau khi capture)

## Phân vai
| AI | Vai | Được làm | KHÔNG làm |
|----|-----|----------|-----------|
| **grok** | Solver (đua) | MỌI bài — chạy song song deepseek, theo hàng đợi ưu tiên | không viết writeup dài khi chưa có flag verified |
| **deepseek** | Solver (đua) | MỌI bài — chạy song song grok, theo hàng đợi ưu tiên | không viết writeup dài khi chưa có flag verified |
| **codex** | Analyst/hỗ trợ (chính sách chặt) | đọc source, triage tĩnh, sinh hypothesis + PoC nháp, gánh phần đuôi hàng đợi (bài chậm/khó) | KHÔNG tự bắn vào hạ tầng live / brute online — chỉ phân tích tĩnh + trả PoC cho solver chạy |
| **gemini** | Capture/tài liệu | dựng OUTPUT/<id>, writeup, card theo schema JSON, kiểm tra định dạng flag | KHÔNG tự "giải" hay bịa flag; chỉ tài liệu hoá evidence đã verified |

## Chống trùng việc
- Mỗi bài chỉ 1 solver `assigned_to`. grok giữ web/pwn, deepseek giữ crypto/rev; misc/forensics/osint chia theo tải.
- Solver phải verify flag độc lập trước khi báo. Flag chưa verify = `candidate`, KHÔNG ghi `final_flag.txt`.
- Sau khi solver ra flag verified → chuyển evidence cho **gemini** capture.

## Schema JSON challenge (input chung cho cả 4)
```json
{
  "event": "PTITCTF2026",
  "challenge_id": "ptit26_<short>",
  "name": "",
  "category": "web|pwn|crypto|rev|forensics|misc|osint",
  "priority": "P1|P2|P3",
  "points": 0,
  "prompt": "",
  "url": "", "host": "", "port": 0,
  "attachments": ["INPUT/artifacts/<id>/..."],
  "flag_format": "PTITCTF{...}",
  "assigned_to": "grok|deepseek|codex|gemini",
  "status": "queued|solving|solved|paused",
  "deadline_minutes": 25
}
```

## Hàng đợi ưu tiên (mọi bài tính 1st/2nd → xếp theo tốc-độ-ra-flag)
- **P1** = nhanh chốt: điểm thấp / nhiều solves / mẫu quen (baby-rop, baby-heap, SSTI renderer, QR, 🐧/🪟 forensics). grok+deepseek đua trước.
- **P2** = trung bình, vào ngay khi P1 cạn.
- **P3** = khó/ít solves (custom VM, seccomp, heap nâng cao) → để cuối, tránh đốt token.
- codex chạy phân tích tĩnh SONG SONG suốt hàng đợi để dọn đường cho solver.

## Rule bắt buộc (mọi AI)
- Chỉ scope CTF hợp pháp. Không DoS, không brute online hạ tầng chung, không full-scan HexStrike mặc định.
- Không bịa flag/stdout/nguồn. Mọi kết luận trích dẫn file/offset/output.
- Progressive disclosure: đọc ROUTER → 1 SKILLS/<CAT> → tối đa 2 playbook trước test đầu.
