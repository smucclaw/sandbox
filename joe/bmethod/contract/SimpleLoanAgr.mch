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
      initial_actors : {borrower},
      deontic : COb,
      event : rec(
        name : request_principal,
        is_preemptive : TRUE,
        initial_timer_val : 1
      ),
      on_done : rec(
        triggers :
          λ actor. (actor ∈ Actor | {(SendPrincipal, lender)}),
        discharges :
          λ actor. (actor : Actor | ∅)
      ),
      on_timeout : rec(
        triggers :
          λ actor. (actor : Actor | ∅),
        discharges :
          λ actor. (actor : Actor | ∅)
      )
    ),

    rec(
      name : SendPrincipal,
      possible_actors : {lender},
      initial_actors : ∅,
      deontic : NCOb,
      event : rec(
        name : send_principal,
        is_preemptive : TRUE,
        initial_timer_val : 3
      ),
      on_done : rec(
        triggers :
          λ actor. (actor ∈ Actor | {(Payment1, borrower), (EventOfDefault, borrower)}),
        discharges :
          λ actor. (actor ∈ Actor | ∅)
      ),
      on_timeout : rec(
        triggers :
          λ actor. (actor ∈ Actor | ∅),
        discharges :
          λ actor. (actor ∈ Actor | ∅)
      )
    ),

    rec(
      name : Payment1,
      possible_actors : {borrower},
      initial_actors : ∅,
      deontic : COb,
      event : rec(
        name : pay1,
        is_preemptive : FALSE,
        initial_timer_val : 10
      ),
      on_done : rec(
        triggers :
          λ actor. (actor ∈ Actor | {(Payment2, actor)}),
        discharges :
          λ actor. (actor ∈ Actor | ∅)
      ),
      on_timeout : rec(
        triggers :
          λ actor. (actor ∈ Actor | {(Payment2, actor), (NotifyBorrower, lender)}),
        discharges :
          λ actor. (actor ∈ Actor | ∅)
      )
    ),

    rec(
      name : Payment2,
      possible_actors : {borrower},
      initial_actors : ∅,
      deontic : COb,
      event : rec(
        name : pay2,
        is_preemptive : FALSE,
        initial_timer_val : 10
      ),
      on_done : rec(
        triggers :
          λ actor. (actor : Actor | ∅),
        discharges :
          λ actor. (actor : Actor | RuleName * Actor)
      ),
      on_timeout : rec(
        triggers :
          λ actor. (actor ∈ Actor | {(NotifyBorrower, lender)}),
        discharges :
          λ actor. (actor : Actor | ∅)
      )
    ),

    rec(
      name : EventOfDefault,
      possible_actors : {borrower},
      initial_actors : ∅,
      deontic : CProhib,
      event : rec(
        name : event_of_default,
        is_preemptive : TRUE,
        initial_timer_val : 25
      ),
      on_done : rec(
        triggers :
          λ actor. (actor : Actor | {(NotifyBorrower, lender)}),
        discharges :
          λ actor. (actor : Actor | ∅)
      ),
      on_timeout : rec(
        triggers :
          λ actor. (actor : Actor | ∅),
        discharges :
          λ actor. (actor : Actor | ∅)
      )
    ),

    rec(
      name : NotifyBorrower,
      possible_actors : {lender},
      initial_actors : ∅,
      deontic : Perm,
      event : rec(
        name : notify_borrower,
        is_preemptive : TRUE,
        initial_timer_val : 3
      ),
      on_done : rec(
        triggers :
          λ actor. (actor : Actor | {(CureDefault, borrower)}),
        discharges :
          λ actor. (actor : Actor | ∅)
      ),
      on_timeout : rec(
        triggers :
          λ actor. (actor ∈ Actor | ∅),
        discharges :
          λ actor. (actor : Actor | ∅)
      )
    ),

    rec(
      name : CureDefault,
      possible_actors : {borrower},
      initial_actors : ∅,
      deontic : COb,
      event : rec(
        name : cure_default,
        is_preemptive : TRUE,
        initial_timer_val : 2
      ),
      on_done : rec(
        triggers :
          λ actor. (actor : Actor | ∅),
        discharges :
          λ actor. (actor : Actor | ∅)
      ),
      on_timeout : rec(
        triggers :
          λ actor. (actor ∈ Actor | {(PayAccelerated, actor)}),
        discharges :
          λ actor. (actor : Actor | RuleName * Actor)
      )
    ),

    rec(
      name : PayAccelerated,
      possible_actors : {borrower},
      initial_actors : ∅,
      deontic : NCOb,
      event : rec(
        name : pay_accelerated,
        is_preemptive : TRUE,
        initial_timer_val : 1
      ),
      on_done : rec(
        triggers :
          λ actor. (actor : Actor | ∅),
        discharges : 
          λ actor. (actor : Actor | ∅)
      ),
      on_timeout : rec(
        triggers :
          λ actor. (actor ∈ Actor | ∅),
        discharges :
          λ actor. (actor : Actor | ∅)
      )
    )
  }

INITIALISATION
  init(rules0)

EVENTS
  request_principal_happened(actor) = event(happened, request_principal, actor);
  request_principal_timeout(actor) = event(timeout, request_principal, actor);

  send_principal_happened(actor) = event(happened, send_principal, actor);
  send_principal_timeout(actor) = event(timeout, send_principal, actor);

  payment1_happened(actor) = event(happened, pay1, actor);
  payment1_timeout(actor) = event(timeout, pay1, actor);

  payment2_happened(actor) = event(happened, pay2, actor);
  payment2_timeout(actor) = event(timeout, pay2, actor);

  pay_accelerated_happened(actor) = event(happened, pay_accelerated, actor);
  pay_accelerated_timeout(actor) = event(timeout, pay_accelerated, actor);

  event_of_default_happened(actor) = event(happened, event_of_default, actor);
  event_of_default_timeout(actor) = event(timeout, event_of_default, actor);

  notify_borrower_happened(actor) = event(happened, notify_borrower, actor);
  notify_borrower_timeout(actor) = event(timeout, notify_borrower, actor);

  cure_default_happened(actor) = event(happened, cure_default, actor);
  cure_default_timeout(actor) = event(timeout, cure_default, actor)

END