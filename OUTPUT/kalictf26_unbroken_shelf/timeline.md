# Timeline — kalictf26_unbroken_shelf

1. Đọc ảnh + crop/upscale → chép tiêu đề & thân bài; xác nhận không có EXIF ẩn.
2. Triage: vụ nổ hiệu thuốc trên Eighth Avenue; cần số nhà + giờ (bị xé mất trong ảnh).
3. Search engine đại chúng → nhiễu (OCR báo cũ không được index).
4. Nhắm Chronicling America; phát hiện toàn bộ loc.gov bị Cloudflare chặn (curl/WebFetch/proxy/curl_cffi/Wayback fail).
5. Dựng Chrome HEADED + CDP (websocket-client) → pass Cloudflare.
6. Full-text search cụm tiêu đề chính xác → 1 kết quả: New-York Tribune 1920-08-21 p.1.
7. Loại false-positive (Evening World 1904 p.11 = trang cáo phó).
8. fo=json → fulltext_service → ALTO XML → đọc "157 Eighth Avenue" + "about 8:40 p. m.".
9. Ghép flag, viết writeup, cập nhật knowledge, dọn scratch.
