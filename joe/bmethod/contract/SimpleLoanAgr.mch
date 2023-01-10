SYSTEM SimpleLoanAgr

INCLUDES AbstractContract(Actor, RuleName, EventName)
PROMOTES tick

DEFINITIONS
  "CommonDefs.def"

SETS
  Actor = {borrower, lender};

  RuleName = {
    RequestPrincipal, SendPrincipal,
    Payment1, Payment2, PayAccelerated,
    EventOfDefault, NotifyBorrower, CureDefault
  };

  EventName = {
    request_principal, send_principal, pay1, pay2, pay_accelerated,
    event_of_default, notify_borrower, cure_default
  }

CONSTANTS
  rules0

PROPERTIES
  rules0 = {
    rec(
      name : RequestPrincipal,
      possible_actors : {borrower},
      deontic : COb,
      event : rec(
        name : request_principal,
        is_preemptive : TRUE,
        initial_timer_val : 1
      )
    ),

    rec(
      name : SendPrincipal,
      possible_actors : {lender},
      deontic : NCOb,
      event : rec(
        name : send_principal,
        is_preemptive : TRUE,
        initial_timer_val : 3
      )
    ),

    rec(
      name : Payment1,
      possible_actors : {borrower},
      deontic : COb,
      event : rec(
        name : pay1,
        is_preemptive : FALSE,
        initial_timer_val : 10
      )
    ),

    rec(
      name : Payment2,
      possible_actors : {borrower},
      deontic : COb,
      event : rec(
        name : pay2,
        is_preemptive : FALSE,
        initial_timer_val : 10
      )
    ),

    rec(
      name : EventOfDefault,
      possible_actors : {borrower},
      deontic : CProhib,
      event : rec(
        name : event_of_default,
        is_preemptive : TRUE,
        initial_timer_val : 25
      )
    ),

    rec(
      name : NotifyBorrower,
      possible_actors : {lender},
      deontic : Perm,
      event : rec(
        name : notify_borrower,
        is_preemptive : TRUE,
        initial_timer_val : 3
      )
    ),

    rec(
      name : CureDefault,
      possible_actors : {borrower},
      deontic : COb,
      event : rec(
        name : cure_default,
        is_preemptive : TRUE,
        initial_timer_val : 2
      )
    ),

    rec(
      name : PayAccelerated,
      possible_actors : {borrower},
      deontic : NCOb,
      event : rec(
        name : pay_accelerated,
        is_preemptive : TRUE,
        initial_timer_val : 1
      )
    )
  }

OPERATIONS
  setup =
    BEGIN
      start_contract; add_rules(rules0);
      trigger({(RequestPrincipal, borrower)}) 
    END;

  request_principal_happened(actor) = VAR rule_names IN
    rule_names ← event_happened(request_principal, actor);

    IF RequestPrincipal ∈ rule_names THEN
      trigger({(SendPrincipal, lender)})
    END
  END;

  request_principal_timeout(actor) = VAR rule_names IN
    rule_names ← event_timeout(request_principal, actor)
  END;

  send_principal_happened(actor) = VAR rule_names IN
    rule_names ← event_happened(send_principal, actor);
    
    IF SendPrincipal ∈ rule_names THEN
      trigger({(Payment1, borrower), (EventOfDefault, borrower)})
    END
  END;

  send_principal_timeout(actor) = VAR rule_names IN
    rule_names ← event_timeout(send_principal, actor)
  END;

  payment1_happened(actor) = VAR rule_names IN
    rule_names ← event_happened(pay1, actor);

    IF Payment1 ∈ rule_names THEN
      trigger({(Payment2, actor)})
    END
  END;

  payment1_timeout(actor) = VAR rule_names IN
    rule_names ← event_timeout(pay1, actor);

    IF Payment1 ∈ rule_names THEN
      trigger({(Payment2, actor), (NotifyBorrower, lender)})
    END
  END;

  payment2_happened(actor) = VAR rule_names IN
    rule_names ← event_happened(pay2, actor);

    IF Payment2 ∈ rule_names THEN
      discharge(RuleName * Actor)
    END
  END;

  payment2_timeout(actor) = VAR rule_names IN
    rule_names ← event_timeout(pay2, actor);

    IF Payment2 ∈ rule_names THEN
      trigger({(NotifyBorrower, lender)})
    END
  END;

  pay_accelerated_happened(actor) = VAR rule_names IN
    rule_names ← event_happened(pay_accelerated, actor)
  END;

  pay_accelerated_timeout(actor) = VAR rule_names IN
    rule_names ← event_timeout(pay_accelerated, actor)
  END;

  event_of_default_happened(actor) = VAR rule_names IN
    rule_names ← event_happened(event_of_default, actor);

    IF EventOfDefault ∈ rule_names THEN
      trigger({(NotifyBorrower, lender)})
    END
  END;

  event_of_default_timeout(actor) = VAR rule_names IN
    rule_names ← event_timeout(event_of_default, actor)
  END;

  notify_borrower_happened(actor) = VAR rule_names IN
    rule_names ← event_happened(notify_borrower, actor);

    IF NotifyBorrower ∈ rule_names THEN
      trigger({(CureDefault, borrower)})
    END
  END;

  notify_borrower_timeout(actor) = VAR rule_names IN
    rule_names ← event_timeout(notify_borrower, actor)
  END;

  cure_default_happened(actor) = VAR rule_names IN
    rule_names ← event_happened(cure_default, actor)
  END;

  cure_default_timeout(actor) = VAR rule_names IN
    rule_names ← event_timeout(cure_default, actor);

    IF CureDefault ∈ rule_names THEN
      discharge(RuleName * Actor);
      trigger({(PayAccelerated, borrower)})
    END
  END

END