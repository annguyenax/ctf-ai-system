# Playbook — Auth service + hash leak (offline BF)

## Preconditions

- Login service; prompt says offline brute / do not BF infra.  
- Or error path **leaks hash** after N failures.

## Minimal chain

1. Map protocol (user enum? lockout? length limit?).  
2. Trigger leak / obtain hash from binary/download.  
3. Identify algorithm (`hashid` / length / prefix).  
4. **Offline** crack (hashcat/john/wordlist/mask) within max length.  
5. **One** online login to verify.  
6. Capture flag.

## Success indicators

- Offline preimage found; login success; flag.

## Fallbacks

- Rules/masks after rockyou exhaust.  
- Binary still needed if no leak.

## Time-saving

Never spray large online wordlists; leak/hash first.
