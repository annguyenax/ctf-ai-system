# Reusable pattern

For archive-based OSINT puzzles, separate source selection from string construction. Follow the timestamp and alias instructions to identify records, then preserve each selected field exactly. Apply only the stated normalization rules; joining fields with underscores does not silently replace punctuation inside a field. Validate the resulting flag by replaying the full extraction from the current metadata-named artifacts, not stale snapshots.
