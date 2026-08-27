# Reusable patterns — me fr

- **Keyboard shift cipher recognition:** near-English where each wrong letter is a
  QWERTY-adjacent key ⇒ misaligned-hands typing. Decode via ±1 column map on the
  physical keyboard. See `PLAYBOOKS/misc_keyboard_shift_cipher.md`.
- **Include the full keyboard:** always model the number row, punctuation, and the
  shift layer, or flag symbols get dropped.
- **Consistency = verification:** trust a substitution only when it makes the ENTIRE
  message readable, not just the flag substring.
- **Literal punctuation in flags:** repeated `...` / symbols may be real flag content,
  not a redaction placeholder.
