/*
  B machine for reasoning with state variables and coordinating all the
  processes.
*/

SYSTEM contract

VARIABLES
  trigger, interrupt

INVARIANT
  // Invariants to appease the typechecker.
  {trigger, interrupt} <: BOOL

INITIALISATION
  trigger := TRUE ||
  interrupt := FALSE

OPERATIONS
  evnt(done) =
    PRE
      done : BOOL
    THEN skip
    END;

  tic = skip

END