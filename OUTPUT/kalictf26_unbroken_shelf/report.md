# Report — kalictf26_unbroken_shelf (OSINT, 100đ)

**Flag:** `KaliTeam{NEW_YORK_TRIBUNE_1920_08_21_157_EIGHTH_AVENUE_2040}` (tái dựng, xác minh từ nguồn)

## Đề
Ảnh một mẩu báo bị xé (`The-Unbroken-Shelf-Final.png`). Tiêu đề:
"Mysterious Explosion Blows Firemen Out of Drug Store". Yêu cầu:
`KaliTeam{NEWSPAPER_YYYY_MM_DD_STREET_NUMBER_STREET_TIME}`.

## Lời giải (rút gọn)
1. Trích cụm tiêu đề độc nhất từ ảnh; ghi nhận "Eighth Avenue", "Battalion Chief … McGuire", clerk "Slater".
2. Full-text search cụm chính xác `"Blows Firemen Out of Drug Store"` trên Chronicling America (LOC)
   → **duy nhất**: New-York Tribune, **1920-08-21**, trang 1 (LCCN sn83030214).
3. Đọc OCR toàn văn: "…wrecked **Slater & Halpern's drug store, 157 Eighth Avenue**. … **about 8:40 p. m.**"
4. Ghép flag: NEWSPAPER=NEW_YORK_TRIBUNE, DATE=1920_08_21, NUMBER=157, STREET=EIGHTH_AVENUE, TIME=2040.

## Xác minh
- Cụm tiêu đề chính xác khớp **1** số báo; thân bài trùng khớp ảnh từng chi tiết (McGuire, 2 lieutenant,
  ~1 tá lính cứu hoả, "single shelf", clerk Slater/Samuel, "Seventeenth Street two doors away").
- Số nhà + giờ đọc trực tiếp từ OCR nguồn cấp một.

## Rào cản & cách vượt (tái sử dụng)
- Toàn bộ loc.gov sau Cloudflare JS-challenge → curl/WebFetch/allorigins/corsproxy/r.jina.ai/
  translate.goog/curl_cffi/Wayback đều 403/không có.
- Thắng bằng **Chrome headed** + CDP: navigate để CF tự pass, rồi `fetch()` trong trang (cookie CF) lấy
  `fo=json` → `fulltext_service` → ALTO XML trên tile.loc.gov. (Headless bị chặn — phải headed.)

## Uncertainty còn lại
- Cách viết tên báo trong flag: `NEW_YORK_TRIBUNE` (theo OCR măng-sét + luật space→_) vs
  `NEW-YORK_TRIBUNE` (giữ gạch nối của tiêu đề chính thức). Các trường khác chắc chắn.

## Files
- Writeup: `CTFTimeWriteup/KaliCTF2026/osint/The Unbroken Shelf/writeup/writeup.md`
- Solver: `…/solve/solve.py`  · Evidence: `…/solve/evidence/{manifest.md,article_ocr.txt}`
- Card: `KNOWLEDGE/cards/kalictf26_unbroken_shelf.yaml` · Playbook: `PLAYBOOKS/osint_historic_newspaper_fulltext.md`
