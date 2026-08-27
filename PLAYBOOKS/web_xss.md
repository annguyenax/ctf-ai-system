# Playbook — Web XSS

## Preconditions

- Reflection or stored sink; CTF bot or self-XSS to cookie/flag endpoint.

## Minimal chain

1. Find reflection context (HTML body / attr / JS / URL).  
2. Minimal breakout for context.  
3. Prove execution (`alert` or fetch to logger **in CTF scope**).  
4. Steal cookie / call admin API as bot requires.  
5. Retrieve flag from bot interaction.

## Success indicators

- Bot hits logger with secret or flag appears in response.

## Fallbacks

- CSP: nonce/hash bypass or gadget.  
- Filter: encoding, event handlers, SVG.

## Time-saving

Context first; polyglot last.
