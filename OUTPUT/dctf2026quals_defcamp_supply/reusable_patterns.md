# Reusable pattern — web: daily-credit race → delayed command injection → static exfil

## Signal
A Flask "shop" where a daily free-credit claim can be raced, and a user-controlled
field is interpolated into a `shell=True` subprocess that only executes when an
asynchronous job (order "delivery") fires after a delay longer than the session.

## Pattern
1. **Credit race:** fire N concurrent POSTs to the daily-claim endpoint. If the
   "already claimed" check is check-then-act, each request before the first commit
   awards the reward. Repeat until you can afford the gated action.
2. **Delayed sink:** the injection runs only at job completion (`created_at + eta`).
   Confirm by observing `result: null` immediately after checkout and a non-null
   `result` only after the delay.
3. **Session-outlives-delivery problem:** if the session expires before the delayed
   sink fires, do not rely on reading the sink's output through the session. Instead
   make the injected command write the flag into a served path (`static/`) and read it
   without auth.

## Payload
```
profile = stealth"; BODY="$(cat /flag* /home/ctf/flag.txt 2>/dev/null)"; for d in static /home/ctf/app/static /app/static; do echo "$BODY" > "$d/pwned.txt" 2>/dev/null; done; echo "$BODY"; #
```

## Pitfalls
- Mass-assigning `eta`/`created_at`/`status` to force early delivery is usually ignored.
- The static write path must be correct: prefer writing to several candidate
  directories (relative `static/` plus absolute `/home/ctf/app/static`, `/app/static`).
- Non-premium items may hard-code the gated field and never reach the sink.

## Reference implementation
`D:\download\CTFTimeWriteup\DCTF2026Quals\Web\defcamp-supply\solve\solve.py`
