SYSTEM M0

VARIABLES
  timers

INVARIANT
  timers : POW(NATURAL1)

INITIALISATION
  timers := {365}

OPERATIONS
  tick =
    BEGIN
      timers := {x | #y. (y : timers \ {1} & x = y - 1)} 
    END;

  op1 = skip;

  op2 = skip

END