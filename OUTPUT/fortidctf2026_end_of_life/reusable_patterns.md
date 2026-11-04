# Reusable patterns

1. When validation and use reopen the same file, compare text-mode and binary-mode EOF behavior. DOS Ctrl-Z can terminate a text-mode check while leaving later bytes available to a binary consumer.
2. For 16-bit DOS programs, track `SS`, `DS`, near-pointer wrap, and physical aliasing. A stack offset wrapping at `0xffff` can redirect a near return into bytes that alias another segment's offset zero.
3. An unbounded `scanf` scanset such as `%[^ ]` needs a field width even when a separate front-end validator appears to limit the input.

Pitfall: a local crash is not enough. Verify that the redirected code uses DOS file APIs to produce the service's expected output file, then verify the returned flag with the challenge portal.
