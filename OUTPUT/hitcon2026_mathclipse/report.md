# hitcon2026_mathclipse — report (PAUSED, not solved)

Event: HITCON CTF 2026 | Challenge: Misc/mathclipse (284p, 20 solves, author naup96321)
Status: **paused — no flag obtained. Remote confirmed live and behaving exactly
like the local docker model.**

## What was definitively established (all verified empirically, docker python:3.14-slim + remote)

1. Primitive: 2 swaps (`x[i], y[j] = v, u`) of 4 pristine (container,key,value)
   triples reachable from `math` via getattr/getitem steps; per-path <=6 steps,
   total <=19. All 4 reads resolve before any write; every read must hit an
   EXISTING key (obj[key] raises KeyError otherwise).
2. Cheapest useful paths: builtins.__dict__[k] = 5 steps via
   ["__loader__","create_module","__globals__",["__builtins__"],["k"]];
   _bootstrap_external.__globals__ = 3 steps; _bootstrap/_warnings/_io/posix/
   _imp module dicts = 6 steps; sys.__dict__/sys.modules = 6 steps.
   Crash trigger (read ok, write raises): [["__name__",[0]],["__name__",[1]]] (4 steps).
3. NOTHING runs between loop end and interpreter death except: (a) unhandled
   exception display, (b) shutdown (audit-hook traced: ZERO events at clean
   shutdown in script mode; no threading, no atexit, stdout/stderr flush only).
4. CPython 3.14 exception display imports the PYTHON `traceback` module FRESH
   (goes through swappable builtins.__dict__['__import__']), triggering a ~50
   module import cascade AFTER our swaps. Live callable sinks (marker-instrumented):
   __import__(name,g,l,fromlist,level) n=249; eval(src,ns) n=13 (ALL namedtuple,
   static strings); exec(code,dict) n=42; compile(bytes,path,'exec',flags) n=37;
   print(line,file=,end=) n=3; __build_class__ n=147; setattr n=210;
   open(frame,'rb') n=1 (linecache); sys.excepthook(T,V,tb) n=1;
   _bootext: cache_from_source/spec_from_file_location/_path_join/_path_stat/_get_cached;
   posix.stat n=143/listdir n=2/getcwd(only when '' in sys.path — NOT on server);
   _boot: _handle_fromlist/_find_and_load/module_from_spec/_call_with_frames_removed n=137.
5. pdb.set_trace in 3.14 is (*, header=None, commands=None) — positional calls die.
6. Brute-forced with ZERO wins: 342 (live-sink x builtin), ~5k (sink x sink/module),
   171 (_io/marshal/_imp dicts x builtins) — no flag leak, no PDB, no hang.

## Why every discovered sink fails
- eval/exec need arg2 DICT; every string-carrying sink passes a str there.
- __import__'s 5-positional shape only tolerates print/breakpoint/help among
  reachable values; all three are inert or arity-dead.
- No attacker-controlled string exists anywhere reachable (the JSON input lives
  in __main__.__dict__ = 7 steps, one over budget; swaps can't create dict keys).
- Exception type/args are fixed (TypeError from immutable-setitem); no controlled
  string ever reaches an exception.

## Next 3 actions (for resuming)
1. Enumerate ALL writable existing-key targets exhaustively (incl. list items:
   sys.path[i], sys.meta_path[i], sys.path_hooks[i], *_SUFFIXES[i],
   G['path_sep_tuple'][i]) x ALL values from every <=6-step dict — script exists
   in scratch (brute*.py); extend VALS with _bootext/_boot function objects.
2. Study whether namedtuple's eval ns (`{'__builtins__':{}}`) or class-body
   exec path can be influenced via collections.__dict__ swaps (unreachable? verify).
3. Ask: what did the author intend with EXACTLY 19 steps? Reverse-engineer the
   intended step-count budget (e.g. 6+6+6+1 or 5+5+5+4) to infer the intended
   two paths; the intended sink likely needs a 6+6 pair.
