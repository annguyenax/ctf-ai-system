# Intake prompt

Normalize a new challenge into the workspace.

## Input

- Raw challenge text / screenshot OCR / URL notes  
- Attached files list  

## Tasks

1. Create `INPUT/challenges/<challenge_id>.md` with:
   - event, name, category tags, points, author  
   - flag format  
   - service host:port / URL  
   - constraints (charset, offline-only, rate limits)  
   - verbatim prompt  
2. Move/copy artifacts to `INPUT/artifacts/<challenge_id>/`.
3. Create empty `OUTPUT/<challenge_id>/` with:
   - `attempts.json` (`{"challenge_id":"...","attempts":[]}`)  
   - `raw/`  
4. Category guess + confidence (0–1).
5. Load matching `SKILLS/<CAT>.md` and candidate `PLAYBOOKS/*`.
6. If distinctive strings/banner/version are present (or confidence is
   low), run `PLAYBOOKS/recon_external_search.md` (≤3 queries) before
   handing off to the solver.

## Output to user

- `challenge_id`  
- category + confidence  
- top 3 playbooks to consider  
- first 3 discriminative tests (no deep scan yet)  
- known-writeup / CVE hit, if any (with source link)  
