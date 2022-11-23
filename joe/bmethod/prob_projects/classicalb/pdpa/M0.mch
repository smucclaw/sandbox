SYSTEM M0

SETS
  Status = {breached, fulfilled};
  Actor = {org, indiv, pdpc};
  RuleName = {
    Assessment,
    NotifyPdpc, NotifyIndiv,
    Exclusions
  }

VARIABLES
  triggered_rules,
  public_agencies

INVARIANT
  // Invariants to appease the typechecker.
  triggered_rules <: RuleName &
  public_agencies <: {org}

INITIALISATION
  triggered_rules := {Assessment} ||
  public_agencies : (public_agencies <: {org})

OPERATIONS
  assess(done) =
    PRE
      done : BOOL
    THEN skip
    END;

  notifyPdpc(done) =
    PRE
      done : BOOL
    THEN skip
    END; 

  tic = skip;

  status(rn, s, a) =
    PRE
      rn : RuleName &
      s : Status &
      a : Actor
    THEN skip
    END;

  trigger_rule(rn) =
    PRE
      rn : triggered_rules
    THEN
      triggered_rules := triggered_rules \ {rn}
    END

END