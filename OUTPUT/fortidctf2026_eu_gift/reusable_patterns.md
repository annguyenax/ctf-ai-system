# Reusable patterns

- Parse security policy files with the same YAML version and loader semantics as the target application; bare YAML 1.1 values such as `NO` can become booleans.
- Compare both value and type when translating configuration lists into membership checks.
- Preserve a protected result artifact and its hash when protocol/session credentials are ephemeral and should not be logged.
