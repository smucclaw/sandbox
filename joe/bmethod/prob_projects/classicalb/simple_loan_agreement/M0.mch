SYSTEM M0

DEFINITIONS
  subject_to_interrupts_triggers ==
    rules_to_interrupt = {} & rules_to_trigger = {};

  event_guard_defeasible ==
    is_done : BOOL &
    actor : Actor &
    subject_to_interrupts_triggers

SETS
  // ContractStatus = {breached, fulfilled, in_progress};
  Actor = {org, indiv, pdpc};
  RuleName = {
    Assessment, NotifyPdpc, NotifyIndiv, ProhibitNotifyIndiv
  }

CONSTANTS
  PublicAgency, is_notifiable,
  rule_actors

PROPERTIES
  // Invoke the global Choice operator to decide if org is a public agency.
  PublicAgency <: {org} &
  is_notifiable : BOOL &

  rule_actors =
    {Assessment, NotifyPdpc, NotifyIndiv} * PublicAgency \/
    {(ProhibitNotifyIndiv, pdpc)}

VARIABLES
  rules_to_trigger, active_rules, rules_to_interrupt

INVARIANT
  {rules_to_trigger, active_rules} <: POW(rule_actors) &
  rules_to_interrupt <: dom(active_rules)

INITIALISATION
  rules_to_trigger := {Assessment} <| rule_actors ||
  active_rules := {} ||
  rules_to_interrupt := {}

EVENTS
  assess(is_done, actor) =
    PRE
      event_guard_defeasible
    THEN
      active_rules := active_rules \ {(Assessment, actor)} ||
      IF {is_done, is_notifiable} = {TRUE} THEN
        rules_to_trigger := {NotifyIndiv, NotifyPdpc} * {actor}
      ELSE
        skip
      END
    END;

  notify_pdpc(is_done, actor) =
    PRE
      event_guard_defeasible
    THEN
      active_rules := active_rules \ {(NotifyPdpc, actor)} ||
      IF is_done = TRUE THEN
        rules_to_trigger := {ProhibitNotifyIndiv} <| rule_actors
      ELSE
        skip
      END
    END;

  notify_indiv(is_done, actor) =
    PRE
      event_guard_defeasible
    THEN
      active_rules := active_rules \ {(NotifyIndiv, actor)} ||
      IF is_done = TRUE THEN
        skip
      ELSE
        skip
      END
    END;

  prohibit_notify_indiv(is_done, actor) =
    PRE
      event_guard_defeasible
    THEN
      active_rules := active_rules \ {(ProhibitNotifyIndiv, actor)} ||
      IF is_done = TRUE & NotifyIndiv : dom(active_rules) THEN
        rules_to_interrupt := rules_to_interrupt \/ {NotifyIndiv}
      ELSE
        skip
      END
    END;

  tic =
    PRE
      subject_to_interrupts_triggers
    THEN
      skip
    END;

  trigger_rule(rule_name, actor) =
    PRE
      (rule_name, actor) : rules_to_trigger
    THEN
      rules_to_trigger := rules_to_trigger \ {(rule_name, actor)} ||
      active_rules := active_rules \/ {(rule_name, actor)}
    END;

  interrupt_rule(rule_name) =
    PRE
      rule_name : rules_to_interrupt
    THEN
      rules_to_interrupt := rules_to_interrupt \ {rule_name} ||
      active_rules := {rule_name} <<| active_rules
    END

END