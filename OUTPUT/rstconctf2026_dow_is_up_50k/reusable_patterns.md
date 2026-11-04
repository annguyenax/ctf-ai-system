# Reusable patterns

- A Next.js Server Action route can accept RSC Flight multipart input; fingerprint first and confirm any suspected deserialization flaw with a harmless command marker.
- Carry command output in a redirect-safe encoding such as base64url, validate the result format, and limit remote reads to the challenge secret path.
- Preserve marker evidence separately from secret-read evidence, then verify through the event checker.

