SYSTEM SimpleLoanAgr

INCLUDES AbstractContract
PROMOTES tick

CONSTANTS
  // actors
  borrower, lender,
  // rule names
  RequestPrincipal, SendPrincipal,
  Payment1, Payment2, PayAccelerated,
  EventOfDefault, NotifyBorrower, CureDefault,
  // event names
  request_principal, send_principal, pay1, pay2, pay_accelerated,
  event_of_default, notify_borrower, cure_default

PROPERTIES
  card(Actor) = 2 ∧
  Actor = {borrower, lender} ∧

  card(RuleName) = 8 ∧
  RuleName = {
    RequestPrincipal, SendPrincipal,
    Payment1, Payment2, PayAccelerated,
    EventOfDefault, NotifyBorrower, CureDefault
  } ∧

  card(EventName) = 8 ∧
  EventName = {
    request_principal, send_principal, pay1, pay2, pay_accelerated,
    event_of_default, notify_borrower, cure_default
  }

DEFINITIONS
  rules0 == {
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

INITIALISATION
  add_rules(rules0);
  trigger(TRUE, {(RequestPrincipal, borrower)})

EVENTS
  request_principal_happened(actor) = BEGIN
    event_happened(request_principal, actor);
    trigger(TRUE, {(SendPrincipal, lender)})
  END;

  request_principal_timeout(actor) = BEGIN
    event_timeout(request_principal, actor)
  END;

  send_principal_happened(actor) = BEGIN
    event_happened(send_principal, actor);
    trigger(TRUE, {(Payment1, borrower), (EventOfDefault, borrower)})
  END;

  send_principal_timeout(actor) = BEGIN
    event_timeout(send_principal, actor)
  END;

  payment1_happened(actor) = BEGIN
    event_happened(pay1, actor);
    trigger(TRUE, {(Payment2, actor)})
  END;

  payment1_timeout(actor) = BEGIN
    event_timeout(pay1, actor);
    trigger(TRUE, {(Payment2, actor), (NotifyBorrower, lender)})
  END;

  payment2_happened(actor) = BEGIN
    event_happened(pay2, actor);
    discharge(TRUE, RuleName * Actor)
  END;

  payment2_timeout(actor) = BEGIN
    event_timeout(pay2, actor);
    trigger(TRUE, {(NotifyBorrower, lender)})
  END;

  pay_accelerated_happened(actor) = BEGIN
    event_happened(pay_accelerated, actor)
  END;

  pay_accelerated_timeout(actor) = BEGIN
    event_timeout(pay_accelerated, actor)
  END;

  event_of_default_happened(actor) = BEGIN
    event_happened(event_of_default, actor);
    trigger(TRUE, {(NotifyBorrower, lender)})
  END;

  event_of_default_timeout(actor) = BEGIN
    event_timeout(event_of_default, actor)
  END;

  notify_borrower_happened(actor) = BEGIN
    event_happened(notify_borrower, actor);
    trigger(TRUE, {(CureDefault, borrower)})
  END;

  notify_borrower_timeout(actor) = BEGIN
    event_timeout(notify_borrower, actor)
  END;

  cure_default_happened(actor) = BEGIN
    event_happened(cure_default, actor)
  END;

  cure_default_timeout(actor) = BEGIN
    event_timeout(cure_default, actor);
    discharge(TRUE, RuleName * Actor);
    trigger(TRUE, {(PayAccelerated, borrower)})
  END

END