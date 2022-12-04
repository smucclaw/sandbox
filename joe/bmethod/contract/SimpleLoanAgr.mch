REFINEMENT SimpleLoanAgr
REFINES AbstractContract

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
  } ∧

  Rule = {
    rec(
      name : RequestPrincipal,
      possible_actors : {borrower},
      deontic : COb,
      event : rec(
        name : request_principal
      ),
      timer : rec(
        is_preemptive : TRUE,
        initial_val : 1
      ),
      on_done : rec(
        trigger :
          λ actor. (actor ∈ Actor | {(SendPrincipal, lender)}),
        interrupt : ∅
      ),
      on_timeout : rec(
        trigger :
          λ actor. (actor : Actor | ∅),
        interrupt : ∅
      )
    ),

    rec(
      name : SendPrincipal,
      possible_actors : {lender},
      deontic : NCOb,
      event : rec(
        name : send_principal
      ),
      timer : rec(
        is_preemptive : TRUE,
        initial_val : 3
      ),
      on_done : rec(
        trigger :
          λ actor. (actor ∈ Actor | {(Payment1, borrower), (EventOfDefault, borrower)}),
        interrupt : ∅
      ),
      on_timeout : rec(
        trigger :
          λ actor. (actor ∈ Actor | ∅),
        interrupt : ∅
      )
    ),

    rec(
      name : Payment1,
      possible_actors : {borrower},
      deontic : COb,
      event : rec(
        name : pay1
      ),
      timer : rec(
        is_preemptive : FALSE,
        initial_val : 365
      ),
      on_done : rec(
        trigger :
          λ actor. (actor ∈ Actor | {(Payment2, actor), (EventOfDefault, actor)}),
        interrupt : ∅
      ),
      on_timeout : rec(
        trigger :
          λ actor. (actor ∈ Actor | {
            (Payment2, actor), (EventOfDefault, actor),
            (NotifyBorrower, lender)
          }),
        interrupt : ∅
      )
    ),

    rec(
      name : Payment2,
      possible_actors : {borrower},
      deontic : COb,
      event : rec(
        name : pay2
      ),
      timer : rec(
        is_preemptive : FALSE,
        initial_val : 365
      ),
      on_done : rec(
        trigger :
          λ actor. (actor : Actor | ∅),
        interrupt : RuleName \ {Payment2}
      ),
      on_timeout : rec(
        trigger :
          λ actor. (actor ∈ Actor | {(NotifyBorrower, lender)}),
        interrupt : ∅
      )
    ),

    rec(
      name : EventOfDefault,
      possible_actors : {borrower},
      deontic : CProhib,
      event : rec(
        name : event_of_default
      ),
      timer : rec(
        is_preemptive : TRUE,
        initial_val : 365
      ),
      on_done : rec(
        trigger :
          λ actor. (actor : Actor | {(NotifyBorrower, lender)}),
        interrupt : ∅
      ),
      on_timeout : rec(
        trigger :
          λ actor. (actor ∈ Actor | ∅),
        interrupt : ∅
      )
    ),

    rec(
      name : NotifyBorrower,
      possible_actors : {lender},
      deontic : Perm,
      event : rec(
        name : event_of_default
      ),
      timer : rec(
        is_preemptive : TRUE,
        initial_val : 3
      ),
      on_done : rec(
        trigger :
          λ actor. (actor : Actor | {(CureDefault, borrower)}),
        interrupt : ∅
      ),
      on_timeout : rec(
        trigger :
          λ actor. (actor ∈ Actor | ∅),
        interrupt : ∅
      )
    ),

    rec(
      name : CureDefault,
      possible_actors : {borrower},
      deontic : COb,
      event : rec(
        name : cure_default
      ),
      timer : rec(
        is_preemptive : TRUE,
        initial_val : 2
      ),
      on_done : rec(
        trigger :
          λ actor. (actor : Actor | ∅),
        interrupt : ∅
      ),
      on_timeout : rec(
        trigger :
          λ actor. (actor ∈ Actor | {(PayAccelerated, actor)}),
        interrupt : RuleName \ {CureDefault, PayAccelerated}
      )
    ),

    rec(
      name : PayAccelerated,
      possible_actors : {borrower},
      deontic : NCOb,
      event : rec(
        name : pay_accelerated
      ),
      timer : rec(
        is_preemptive : TRUE,
        initial_val : 1
      ),
      on_done : rec(
        trigger :
          λ actor. (actor : Actor | ∅),
        interrupt : ∅
      ),
      on_timeout : rec(
        trigger :
        λ actor. (actor ∈ Actor | ∅),
        interrupt : ∅
      )
    )
  }

INITIALISATION
  breached_by := ∅ ||
  active_rules := ∅ ||
  initial_rules := {
    (RequestPrincipal, borrower)
  }

END