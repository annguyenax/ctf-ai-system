# Pattern — Java Integer cache auth bypass

1. Spot boxed `==`.  
2. Pick whitelist value in [-128,127].  
3. Invert hashCode (MITM if base-31).  
4. Satisfy length constraints; send once.
