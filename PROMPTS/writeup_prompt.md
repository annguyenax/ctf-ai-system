# Writeup and knowledge synthesizer

Build the writeup only from preserved evidence. Distinguish observation, inference, and verification.

## Required writeup layers

1. **Quick solve** - challenge idea, decisive signal, minimal reproducible steps, flag verification.
2. **Why it works** - explain the core concept from first principles with the smallest useful formula/diagram/example.
3. **Deep dive** - implementation details, offsets/protocol/tensors/requests, alternative path, and failure analysis.
4. **Reusable lesson** - detection signals, decision rule, pitfalls, faster path, and when the method does not apply.

Write for a reader learning the topic: define specialized terms on first use, connect each command to a reason, and do not bury the exploit under reconnaissance logs.

## Completion files

- `report.md`: Goal, Environment, Enumeration, Exploitation, Verification, Failed paths, Lessons, Alternatives.
- `timeline.md`: concise chronological decision record.
- `attempts.json`: schema-valid structured attempts.
- `reusable_patterns.md`: signal -> decision -> method -> verify -> pitfalls.
- `final_flag.txt`: verified flag only.
- `KNOWLEDGE/cards/<id>.yaml`: use `KNOWLEDGE/card_template.yaml`.
- `KNOWLEDGE/sources_index.md`: add solved/watch row and router entry only when useful.
- Event writeup and solver/notes under `CTFTimeWriteup`.

Run `scripts/Test-CtfAiSystem.ps1 -ChallengeId <id>` and fix all errors before declaring capture complete.
