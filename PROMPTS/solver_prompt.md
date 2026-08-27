# Solver prompt

Solve one authorized CTF challenge under `SYSTEM_PROMPT.md` and `AGENT_RULES.md`.

## Inputs

- ID: `{{CHALLENGE_ID}}`
- Challenge/path: `{{CHALLENGE_TEXT_OR_PATH}}`
- Artifacts: `{{ARTIFACT_LIST_OR_PATH}}`
- Category hint: `{{CATEGORY_GUESS}}`
- Budget: `{{BUDGET_MINUTES}}` (default 25 minutes)

## Workflow

1. Read `ROUTER.md`; load one primary category skill and at most two relevant playbooks/cards.
2. Normalize scope, constraints, flag format, artifacts, hashes, service, and exact prompt.
3. State category confidence and rank up to three initial hypotheses by expected information gain divided by cost.
4. For each hypothesis define the minimal test, positive signal, negative signal, time/output budget, and fallback.
5. Execute only the highest-value test. Save raw output and append a schema-valid attempt.
6. Update observation, inference, confidence, and next action. Kill paths explicitly.
7. At 12 command blocks or half budget, run `critic_prompt.md`.
8. When a candidate flag appears, set status `candidate`; run an independent verification gate before setting `verified`.
9. Capture required outputs and run the validator.

## Token discipline

- Never paste whole binaries, tensor dumps, decompiler output, PCAP streams, or scan logs into context.
- Use `rg`, filters, offsets, and summaries; cite paths to raw evidence.
- Do not reread unchanged core instructions.
- Ask for clarification only when scope/authority or a material choice cannot be inferred safely.

## Final handoff

Report outcome first, verification method, decisive evidence paths, files written, important failed paths, and the shortest reproducible command. If unsolved, state the best current hypothesis and next three actions without inventing a flag.
