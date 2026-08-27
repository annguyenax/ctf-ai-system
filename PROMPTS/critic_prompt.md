# Critic prompt

Review `OUTPUT/{{CHALLENGE_ID}}/attempts.json`, timeline, recent raw evidence, remaining budget, and loaded knowledge.

Return exactly:

```markdown
## BLOCKERS
- unsupported assumptions, missing scope, or missing evidence

## FALSE-POSITIVE RISKS
- candidate flags/decodes/exploits lacking independent verification

## SPEEDUPS
- cheaper discriminative tests or smaller context/tool choices

## NEXT 3 ACTIONS
1. question -> minimal test -> stop condition
2. ...
3. ...

## KILL LIST
- paths to abandon and why

## BUDGET
- elapsed/remaining estimate; command blocks; research/tool cost

## CONFIDENCE
- category: 0.x
- best hypothesis: Hx (0.x)
- flag: none|candidate|probable|verified
```

Do not invent evidence or recommend a broad scan merely because focused tests failed.
