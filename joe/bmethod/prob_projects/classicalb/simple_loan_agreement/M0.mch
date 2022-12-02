SYSTEM M0

DEFINITIONS
  subject_to_interrupts_triggers ==
    is_contract_breached = FALSE &
    rules_to_interrupt = {} & rules_to_trigger = {};

  event_guard_defeasible ==
    is_done : BOOL &
    actor : Actor &
    subject_to_interrupts_triggers

SETS
  Actor = {borrower, lender};
  RuleName = {
    RequestPrincipal, SendPrincipal,
    Payment1, Payment2,
    EventOfDefault, NotifyBorrower, CureDefault,
    PayAccelerated
  }

CONSTANTS
  rule_actors

PROPERTIES
  rule_actors =
    RuleName * {borrower} <+
      {SendPrincipal, NotifyBorrower} * {lender}

VARIABLES
  is_contract_breached,
  rules_to_trigger, active_rules, rules_to_interrupt

INVARIANT
  is_contract_breached : BOOL &
  {rules_to_trigger, active_rules} <: POW(rule_actors) &
  rules_to_interrupt <: dom(active_rules)

INITIALISATION
  is_contract_breached := FALSE ||
  rules_to_trigger := {RequestPrincipal} <| rule_actors ||
  active_rules := {} ||
  rules_to_interrupt := {}

EVENTS
  request_principal(is_done, actor) =
    PRE
      event_guard_defeasible
    THEN
      active_rules := active_rules \ {(RequestPrincipal, actor)} ||
      IF is_done = TRUE THEN
        rules_to_trigger := rules_to_trigger \/ (
          {SendPrincipal} <| rule_actors
        )
      ELSE
        skip
      END
    END;

  send_principal(is_done, actor) =
    PRE
      event_guard_defeasible
    THEN
      active_rules := active_rules \ {(SendPrincipal, actor)} ||
      IF is_done = TRUE THEN
        rules_to_trigger :=
          {Payment1, EventOfDefault} <| rule_actors
      ELSE
        is_contract_breached := TRUE
      END
    END;

  pay1(is_done, actor) =
    PRE
      event_guard_defeasible
    THEN
      active_rules := active_rules \ {(Payment1, actor)} ||
      rules_to_trigger :=
        rules_to_trigger \/ (({EventOfDefault} \ dom(active_rules)) <| rule_actors);
      IF is_done = TRUE THEN
        rules_to_trigger :=
          rules_to_trigger \/ ({Payment2} <| rule_actors)
      ELSE
        rules_to_trigger := rules_to_trigger \/
          ({Payment2, NotifyBorrower} <| rule_actors) \/
          ({EventOfDefault} <| rule_actors)
      END
    END;

  pay2(is_done, actor) =
    PRE
      event_guard_defeasible
    THEN
      active_rules := active_rules \ {(Payment2, actor)} ||
      IF is_done = TRUE THEN
        rules_to_interrupt :=
          (RuleName \ {Payment2}) /\ dom(active_rules)
      ELSE
        rules_to_trigger :=
          rules_to_trigger \/ ({NotifyBorrower} <| rule_actors)
      END
    END;

  event_of_default(is_done, actor) =
    PRE
      event_guard_defeasible
    THEN
      active_rules := active_rules \ {(EventOfDefault, actor)} ||
      // rules_to_trigger := {EventOfDefault} <| rule_actors;
      IF is_done = TRUE THEN
        rules_to_trigger := rules_to_trigger \/ (
          {NotifyBorrower} <| rule_actors
        )
      ELSE
        skip
      END
    END;

  notify_borrower(is_done, actor) =
    PRE
      event_guard_defeasible
    THEN
      active_rules := active_rules \ {(NotifyBorrower, actor)} ||
      IF is_done = TRUE THEN
        rules_to_trigger := rules_to_trigger \/ (
          {CureDefault} <| rule_actors
        )
      ELSE
        // is_contract_breached := TRUE
        skip
        // rules_to_trigger := {(EventOfDefault, borrower)} \ active_rules
      END
    END;

  cure_default(is_done, actor) =
    PRE
      event_guard_defeasible
    THEN
      active_rules := active_rules \ {(CureDefault, actor)} ||
      IF is_done = TRUE THEN
        skip
        // rules_to_trigger :=
        //  {EventOfDefault} <| rule_actors
      ELSE
        rules_to_trigger := {PayAccelerated} <| rule_actors ||
        rules_to_interrupt :=
          (RuleName \ {CureDefault}) /\ dom(active_rules)
      END
    END;

  pay_accelerated(is_done, actor) =
    PRE
      event_guard_defeasible
    THEN
      active_rules := active_rules \ {(PayAccelerated, actor)} ||
      IF is_done = TRUE THEN
        skip
      ELSE
        is_contract_breached := TRUE
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