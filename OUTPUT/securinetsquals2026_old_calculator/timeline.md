# Timeline - securinetsquals2026_old_calculator

| Time | Phase | Observation / decision | Evidence |
|---|---|---|---|
| live | TEST | Submit prints one cell and a random R, then expects F(R). A wrong answer leaks the integer and closes. | report.md |
| live | TEST | Same R on two connections gives different outputs. Zeroing both tables does not change F. | report.md |
| live | TEST | Leaked pairs fit F(t)=a*t+b with small a,b. (y[j]-y[i])/(x[j]-x[i]) equals that a. | report.md |
| live | EXPLOIT | Float Newton packs a+b/256 into the 8-bit display. Sixteen correct rounds return the flag. | raw/flag_runs.txt |
