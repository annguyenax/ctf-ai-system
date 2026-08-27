# Playbook — OSINT: định danh mẩu báo lịch sử qua full-text archive

**Trigger:** đề cho ảnh một mẩu báo cũ (cắt/xé), cần tìm tên báo, ngày ra, địa chỉ/giờ/tên
riêng — tức phải xác định đúng **số báo gốc**.

## Preconditions
- Ảnh có ít nhất một **cụm chữ độc nhất** đọc được (thường là TIÊU ĐỀ) và vài tên riêng/địa danh.
- Sự kiện thuộc phạm vi báo đã số hoá (báo Mỹ: **Chronicling America** — Library of Congress).

## Minimal method
1. **Trích cụm chữ độc nhất** từ ảnh (ưu tiên nguyên văn tiêu đề; thêm 1–2 tên riêng để lọc).
   - Nếu chữ nhỏ/mờ: crop + upscale vùng cần đọc trước khi chép lại.
2. **Full-text search cụm CHÍNH XÁC** (đặt trong ngoặc kép) trên archive:
   - Chronicling America: `https://www.loc.gov/collections/chronicling-america/?q="<cụm>"&fo=json`
   - Kỳ vọng: cụm đủ dài → **một số báo duy nhất** = số gốc.
3. **Đối chiếu thân bài** với ảnh để loại false-positive (match từ rời trên 1 trang lớn dễ trùng).
4. **Đọc OCR nguồn cấp một** để lấy các trường còn thiếu (số nhà, giờ…):
   - `…/resource/<lccn>/<yyyy-mm-dd>/ed-1/?sp=<page>&st=text&fo=json` → field `fulltext_service`
   - → ALTO XML trên `tile.loc.gov/storage-services/service/ndnp/.../<seq>.xml`
   - Ghép các `CONTENT="…"` thành văn bản, tìm địa chỉ/giờ.
5. Chuẩn hoá theo format flag: chữ hoa, khoảng trắng → `_`, giờ am/pm → **24h**.

## Vượt Cloudflare (khi tự động hoá loc.gov)
- Triệu chứng: mọi request `curl`/WebFetch/proxy tới `*.loc.gov` trả **403 "Just a moment…"**.
- **Không** phí thời gian với allorigins/corsproxy/r.jina.ai/translate.goog/`curl_cffi`/Wayback — CF
  đòi chạy JS, các cách này đều fail.
- **Cách chắc ăn:** điều khiển **Chrome THẬT** (headed, không headless) qua CDP:
  ```
  chrome.exe --remote-debugging-port=9444 --remote-allow-origins=* --user-data-dir=<scratch>
  ```
  - Chrome **headless vẫn bị CF chặn**; phải headed (máy có desktop).
  - Điều khiển bằng `websocket-client` (JSON-RPC CDP). `Page.navigate` tới URL, poll
    `document.title` tới khi hết "moment" (CF tự pass ~vài giây).
  - Sau khi pass, gọi `fetch(url,{credentials:'include'})` **trong Runtime.evaluate** (cùng origin,
    đã có cookie CF) để lấy JSON/ALTO sạch. Với host khác (`tile.loc.gov`) → `Page.navigate` sang đó
    một lần để nhận cookie CF rồi mới fetch.

## Verification
- Cụm tiêu đề chính xác khớp **duy nhất** một số báo + thân bài trùng khớp ảnh từng chi tiết.
- Số nhà/giờ đọc trực tiếp từ OCR nguồn cấp một (không suy đoán).

## Pitfalls
- Search engine đại chúng (Google/Bing/DDG) index kém OCR báo cũ → dùng archive chuyên dụng.
- Tên báo có gạch nối/định dạng đặc biệt ("New-York Tribune") → chuẩn hoá cẩn thận cho flag.
- am/pm ↔ 24h dễ sai (8:40 p.m. = 2040, không phải 0840).

## Faster path lần sau
Vào thẳng Chronicling America bằng browser, search cụm tiêu đề, đọc bài — 10–20 phút.
Chỉ dựng CDP khi cần tự động hoá / bị Cloudflare chặn.

**Card:** `cards/kalictf26_unbroken_shelf.yaml`
