# Onboard, capture, and evaluate

Use after an agent has solved or paused a challenge outside the canonical workflow.

```text
Read D:\download\PROJECTS.md and D:\download\ctf-ai-system\SKILL.md.
Preserve the existing solve under D:\download\CTFTimeWriteup\<Event>\... .
Create/update OUTPUT/<id>, KNOWLEDGE/cards/<id>.yaml, and sources_index.md.
Never create final_flag.txt unless the evidence independently verifies it.
Run scripts/Test-CtfAiSystem.ps1 -ChallengeId <id> and fix every error.

Evaluate discoverability, retrieval, capture, HexStrike fit, friction, safety,
and reuse (1-5). Record the three highest-value improvements under
OUTPUT/_evals/<id>_stack_eval.md.

Canonical HexStrike health endpoint: http://192.168.77.138:8888/health.
If down/degraded, record once and continue locally; do not claim healthy without output.
```
