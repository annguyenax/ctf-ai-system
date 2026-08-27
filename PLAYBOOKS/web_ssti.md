# Playbook — Web SSTI

## Preconditions

- User input rendered by server-side template engine.

## Minimal chain

1. Detect: `{{7*7}}` → `49`, `${7*7}`, `#{7*7}`, `<%= 7*7 %>`.  
2. Fingerprint engine (Jinja2/Twig/Freemarker/Smarty…).  
3. Read config / class chain for RCE (engine-specific).  
4. Read flag file or env.  
5. Prefer file read over full RCE if enough.

## Success indicators

- Math evaluation; then object access; then flag content.

## Fallbacks

- Sandbox: alternate subclasses / filters bypass lists.  
- Blind SSTI: time or error oracle.

## Time-saving

One payload family per engine; don't spray 50 engines blindly.
