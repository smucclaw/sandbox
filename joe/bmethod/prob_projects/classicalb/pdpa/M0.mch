SYSTEM M0

SETS
  // ContractStatus = {breached, fulfilled, in_progress};
  Actor = {org, indiv, pdpc};
  RuleName = {
    Assessment, NotifyPdpc,
    NotifyIndiv, ProhibitNotifyIndiv
  }

CONSTANTS
  PublicAgency, rule_qualifier

PROPERTIES
  PublicAgency = {org} &

  rule_qualifier =
    {Assessment, NotifyPdpc, NotifyIndiv} * {PublicAgency} \/
    {(ProhibitNotifyIndiv, {pdpc})}

VARIABLES
  // contract_status,
  is_notifiable,
  rules_to_trigger, rules_to_interrupt

INVARIANT
  // Invariants to appease the typechecker.
  // contract_status : ContractStatus &
  {rules_to_trigger, rules_to_interrupt} <: POW(RuleName) &
  is_notifiable : BOOL &
  rule_qualifier : RuleName --> POW(Actor)

INITIALISATION
  // contract_status := in_progress ||
  rules_to_trigger := {Assessment} ||
  rules_to_interrupt := {} ||
  is_notifiable := FALSE

  // Invoke the global choice operator to pick a subset of organisations.

OPERATIONS
/*
  Note here that we prioritze trigger_rule and interrupt_rule over all other
  events.
  The trick is to view the logic of guard conditions as a classical theory
  augmented with a defeasible superiority relation.
  We then use the same hack that is used in baby l4 to turn all the defeasible
  rules involving subjectTo etc into classical ones, we squeeze in lots of
  (... and not ...) in the guard conditions.

  Can we formalize a defeasible metatheory in classical logic in another
  B machine and simply include that for use?
*/
  assess(is_done, actor) =
    PRE
      is_done : BOOL &
      actor : Actor &
      {rules_to_trigger, rules_to_interrupt} = {{}}
    THEN
      IF is_done = TRUE THEN
        is_notifiable :: BOOL;
        IF is_notifiable = TRUE THEN
          rules_to_trigger := rules_to_trigger \/ {NotifyIndiv, NotifyPdpc}
        ELSE
          skip
        END
      ELSE
        skip
      END
    END;

  notify_pdpc(is_done, actor) =
    PRE
      is_done : BOOL &
      actor : Actor &
      {rules_to_trigger, rules_to_interrupt} = {{}}
    THEN
      IF is_done = TRUE THEN
        rules_to_trigger := rules_to_trigger \/ {ProhibitNotifyIndiv}
      ELSE
        skip
      END
    END;

  notify_indiv(is_done, actor) =
    PRE
      is_done : BOOL &
      actor : Actor &
      {rules_to_trigger, rules_to_interrupt} = {{}}
    THEN
      IF is_done = TRUE THEN
        skip
      ELSE
        skip
      END
    END;

  prohibit_notify_indiv(is_done, actor) =
    PRE
      is_done : BOOL &
      actor : Actor &
      {rules_to_trigger, rules_to_interrupt} = {{}}
    THEN
      IF is_done = TRUE THEN
        rules_to_interrupt := rules_to_interrupt \/ {NotifyIndiv}
      ELSE
        skip
      END
    END;

  tic =
    PRE
      {rules_to_trigger, rules_to_interrupt} = {{}}
    THEN
      skip
    END;

  trigger_rule(rule_name, actor) =
    PRE
      rule_name : rules_to_trigger &
      actor : rule_qualifier(rule_name)
    THEN
      rules_to_trigger := rules_to_trigger \ {rule_name}
    END;

  interrupt_rule(rule_name) =
    PRE
      rule_name : rules_to_interrupt
    THEN
      rules_to_interrupt := rules_to_interrupt \ {rule_name}
    END

END