# Reusable patterns — kalictf26_unbroken_shelf

- **Định danh báo lịch sử = full-text search cụm TIÊU ĐỀ chính xác** trên Chronicling America.
  Cụm đủ dài → thường khớp duy nhất số báo gốc. Luôn đối chiếu thân bài để loại false-positive.
- **Đọc trường còn thiếu từ OCR nguồn cấp một:** `?fo=json` → `fulltext_service` → ALTO XML trên
  `tile.loc.gov`; ghép `CONTENT="…"` thành text.
- **Vượt Cloudflare "Just a moment" khi tự động hoá:** Chrome **headed** + CDP; navigate để CF pass rồi
  `fetch(...,{credentials:'include'})` trong `Runtime.evaluate`. Headless/proxy/curl_cffi KHÔNG qua.
  Với host phụ (tile.loc.gov) phải navigate qua đó 1 lần để nhận cookie CF trước khi fetch.
- **Chuẩn hoá flag OSINT:** am/pm → 24h (8:40 p.m. = 2040); chữ hoa; space→`_`; cẩn thận tên riêng có gạch nối.
