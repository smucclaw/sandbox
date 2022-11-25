SYSTEM M0

SETS
  // ContractStatus = {breached, fulfilled, in_progress};
  Actor = {org, indiv, pdpc};
  RuleName = {
    Assessment, NotifyPdpc, NotifyIndiv, ProhibitNotifyIndiv
  }

CONSTANTS
  PublicAgency, is_notifiable,
  rule_qualifier

PROPERTIES
  // Invoke the global Choice operator to decide if org is a public agency.
  PublicAgency <: {org} &
  is_notifiable : BOOL &

  rule_qualifier : RuleName <-> Actor &
  rule_qualifier =
    {Assessment, NotifyPdpc, NotifyIndiv} * PublicAgency \/
    {(ProhibitNotifyIndiv, pdpc)}

VARIABLES
  rules_to_trigger, active_rules, rules_to_interrupt

INVARIANT
  rules_to_trigger : RuleName <-> Actor &
  active_rules <: RuleName &
  rules_to_interrupt <: RuleName

INITIALISATION
  rules_to_trigger := {rule_name, actor |
    rule_name = Assessment & (rule_name, actor) : rule_qualifier
  } ||
  active_rules := {} ||
  rules_to_interrupt := {}

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
      rules_to_trigger = {} &
      rules_to_interrupt = {}
    THEN
      active_rules := active_rules \ {Assessment} ||
      IF {is_done, is_notifiable} = {TRUE} THEN
        rules_to_trigger := {NotifyIndiv, NotifyPdpc} * {actor}
      ELSE
        skip
      END
    END;

  notify_pdpc(is_done, actor) =
    PRE
      is_done : BOOL &
      actor : Actor &
      rules_to_trigger = {} &
      rules_to_interrupt = {}
    THEN
      active_rules := active_rules \ {NotifyPdpc} ||
      IF is_done = TRUE THEN
        rules_to_trigger := {ProhibitNotifyIndiv} <| rule_qualifier
      ELSE
        skip
      END
    END;

  notify_indiv(is_done, actor) =
    PRE
      is_done : BOOL &
      actor : Actor &
      rules_to_trigger = {} &
      rules_to_interrupt = {}
    THEN
      active_rules := active_rules \ {NotifyIndiv} ||
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
      rules_to_trigger = {} &
      rules_to_interrupt = {}
    THEN
      active_rules := active_rules \ {ProhibitNotifyIndiv} ||
      IF is_done = TRUE & NotifyIndiv : active_rules THEN
        rules_to_interrupt := rules_to_interrupt \/ {NotifyIndiv}
      ELSE
        skip
      END
    END;

  tic =
    PRE
      rules_to_trigger = {} &
      rules_to_interrupt = {}
    THEN
      skip
    END;

  trigger_rule(rule_name, actor) =
    PRE
      (rule_name, actor) : rules_to_trigger
    THEN
      rules_to_trigger := rules_to_trigger \ {(rule_name, actor)} ||
      active_rules := active_rules \/ {rule_name}
    END;

  interrupt_rule(rule_name) =
    PRE
      rule_name : rules_to_interrupt
    THEN
      rules_to_interrupt := rules_to_interrupt \ {rule_name} ||
      active_rules := active_rules \ {rule_name}
    END

END