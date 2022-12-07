SYSTEM Pdpa

INCLUDES AbstractContract
PROMOTES tick

CONSTANTS
  // actors
  org, indiv, pdpc,
  // rule names
  Assessment, NotifyPdpc, NotifyIndiv, ProhibitNotifyIndiv, CannotNotifyIndiv,
  // event names
  assess, notify_pdpc, notify_indiv, prohibit_notify_indiv

PROPERTIES
  /*
  Remember that writing {a, b} doesn't make a and b different from each other.
  Hence we need to use cardinality constraints to encode the fact that
  all the elements are distinct.
  */
  card(Actor) = 3 ∧
  Actor = {org, indiv, pdpc} ∧

  card(RuleName) = 5 ∧
  RuleName = {
    Assessment, NotifyPdpc, NotifyIndiv, ProhibitNotifyIndiv, CannotNotifyIndiv
  } ∧

  card(EventName) = 4 ∧
  EventName = {
    assess, notify_pdpc, notify_indiv, prohibit_notify_indiv
  }

DEFINITIONS
  rules0 == {
    rec(
      name : Assessment,
      possible_actors : {org},
      initial_actors: {org},
      deontic : NCOb,
      event : rec(
        name : assess,
        is_preemptive : TRUE,
        initial_timer_val : 30
      ),
      on_done : rec(
        triggers :
          λ actor. (actor ∈ Actor | {(NotifyIndiv, actor), (NotifyPdpc, actor)}),
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
      name : NotifyPdpc,
      possible_actors : {org},
      initial_actors : ∅,
      deontic : NCOb,
      event : rec(
        name : notify_pdpc,
        is_preemptive : TRUE,
        initial_timer_val : 3
      ),
      on_done : rec(
        triggers :
          λ actor. (actor ∈ Actor | {(ProhibitNotifyIndiv, pdpc)}),
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
      name : NotifyIndiv,
      possible_actors : {org},
      initial_actors : ∅,
      deontic : NCOb,
      event : rec(
        name : notify_indiv,
        is_preemptive : TRUE,
        initial_timer_val : 3
      ),
      on_done : rec(
        triggers :
          λ actor. (actor ∈ Actor | ∅),
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
      name : ProhibitNotifyIndiv,
      possible_actors : {pdpc},
      initial_actors : ∅,
      deontic : Perm,
      event : rec(
        name : prohibit_notify_indiv,
        is_preemptive : TRUE,
        initial_timer_val : 5
      ),
      on_done : rec(
        triggers :
          λ actor. (actor : Actor | {(CannotNotifyIndiv, org)}),
        discharges :
          λ actor. (actor : Actor | {(NotifyIndiv, org)})
      ),
      on_timeout : rec(
        triggers :
          λ actor. (actor ∈ Actor | ∅),
        discharges :
          λ actor. (actor ∈ Actor | ∅)
      )
    ),

    rec(
      name : CannotNotifyIndiv,
      possible_actors : {org},
      initial_actors : ∅,
      deontic : NCProhib,
      event : rec(
        name : notify_indiv,
        is_preemptive : TRUE,
        initial_timer_val : 5
      ),
      on_done : rec(
        triggers :
          λ actor. (actor ∈ Actor | ∅),
        discharges :
          λ actor. (actor ∈ Actor | {(NotifyIndiv, org)})
      ),
      on_timeout : rec(
        triggers :
          λ actor. (actor ∈ Actor | ∅),
        discharges :
          λ actor. (actor ∈ Actor | ∅)
      )
    )
  }

INITIALISATION
  init(rules0)

EVENTS
  assess_happened(actor) = event(happened, assess, actor);
  assess_timeout(actor) = event(timeout, assess, actor);

  notify_indiv_happened(actor) = event(happened, notify_indiv, actor);
  notify_indiv_timeout(actor) = event(timeout, notify_indiv, actor);

  notify_pdpc_happened(actor) = event(happened, notify_pdpc, actor);
  notify_pdpc_timeout(actor) = event(timeout, notify_pdpc, actor);

  prohibit_notify_indiv_happened(actor) = event(happened, prohibit_notify_indiv, actor);
  prohibit_notify_indiv_timeout(actor) = event(timeout, prohibit_notify_indiv, actor)

END