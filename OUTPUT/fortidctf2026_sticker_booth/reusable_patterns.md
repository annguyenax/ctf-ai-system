# Reusable patterns
1. Custom-arena pwn: map the read/dump primitives FIRST; secrets stored inside the
   same arena (ticket before asset path) turn any length-overwrite into a leak.
2. Refcounted shared blocks + a write that zeroes a header = deterministic UAF
   without heap grooming: mono/photo render off-by-one (`jae` loop bound) is a
   classic 1-row overflow.
3. Gate analysis: a "valid builtin" check compares a per-process secret; forging
   the in-arena copy after leaking it beats attacking the comparison.
4. rCTF tcp-ssl instances: Windows Python ssl.wrap_socket works when WSL DNS fails.
