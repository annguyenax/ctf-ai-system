# PTITCTF2026 — CAPTURE / TÀI LIỆU (gemini)  [dán nguyên khối]

Vai trò: từ evidence ĐÃ VERIFIED của solver, dựng đầy đủ thư mục bài làm theo chuẩn hệ thống. KHÔNG tự giải, KHÔNG bịa flag — chỉ tài liệu hoá cái đã tái lập được. Nếu evidence chưa verified → trả về "cần verify", không tạo final_flag.txt.

## Input: JSON solved từ solver (challenge_id, flag, key_idea, exploit, evidence, scratch).

## Kiểm tra trước khi ghi
- flag khớp flag_format PTITCTF{...}? nếu không → báo lỗi, dừng.
- exploit tái lập được từ evidence? nếu không rõ → hỏi solver.

## Tạo output (theo AGENT_RULES §Capture)
1. SHOW — `D:\download\CTFTimeWriteup\PTITCTF2026\<id>\`:
   - `writeup.md` (người đọc tái lập được), `solve/` (solver xác định), 1 bản artifact gốc, evidence tối thiểu.
2. LEARN — `D:\download\ctf-ai-system\OUTPUT\<id>\`:
   - `report.md`, `timeline.md`, `attempts.json`, `reusable_patterns.md`, `raw/`, `final_flag.txt` (CHỈ khi verified).
   - `attempts.json` dạng: {challenge_id,status,flag,attempts:[{phase,action,result,notes}]}.
3. `D:\download\ctf-ai-system\KNOWLEDGE\cards\<id>.yaml` theo `KNOWLEDGE/card_template.yaml`.
4. Thêm dòng vào `KNOWLEDGE/sources_index.md`.
5. Chạy `scripts\Test-CtfAiSystem.ps1 -ChallengeId <id>` và báo pass/fail.

## Storage
Không nhân đôi binary/model ở cả 2 repo. File rác để ở ctf-scratch/<id> rồi xoá sau capture. Ngân sách evidence ~10MiB/bài, chỉ giữ trích đoạn 10-40 dòng quyết định + payload cuối.

## Output cuối: JSON xác nhận
```json
{"challenge_id":"","captured":true,"paths":{"writeup":"","output":"","card":""},"test_script":"pass|fail"}
```
