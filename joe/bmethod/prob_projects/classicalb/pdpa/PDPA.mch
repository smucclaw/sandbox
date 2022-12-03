REFINEMENT PDPA
REFINES ABSTRACT_CONTRACT

CONSTANTS
  // actors
  org, indiv, pdpc,
  // rule names
  Assessment, NotifyPdpc, NotifyIndiv, ProhibitNotifyIndiv,
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

  card(RuleName) = 4 ∧
  RuleName = {
    Assessment, NotifyPdpc, NotifyIndiv, ProhibitNotifyIndiv
  } ∧

  card(EventName) = 4 ∧
  EventName = {
    assess, notify_pdpc, notify_indiv, prohibit_notify_indiv
  } ∧

  Rule = {
    rec(
      name : Assessment,
      possible_actors : {org},
      deontic : NCOb,
      event : rec(
        name : assess
      ),
      timer : rec(
        is_preemptive : TRUE,
        initial_val : 30
      ),
      on_done : rec(
        trigger :
          λ actor. (actor ∈ Actor | {(NotifyIndiv, actor), (NotifyPdpc, actor)}),
        interrupt : ∅
      ),
      on_timeout : rec(
        trigger :
          λ actor. (actor : Actor | ∅),
        interrupt : ∅
      )
    ),

    rec(
      name : NotifyPdpc,
      possible_actors : {org},
      deontic : NCOb,
      event : rec(
        name : notify_pdpc
      ),
      timer : rec(
        is_preemptive : TRUE,
        initial_val : 3
      ),
      on_done : rec(
        trigger :
          λ actor. (actor ∈ Actor | {(ProhibitNotifyIndiv, pdpc)}),
        interrupt : ∅
      ),
      on_timeout : rec(
        trigger :
          λ actor. (actor ∈ Actor | ∅),
        interrupt : ∅
      )
    ),

    rec(
      name : NotifyIndiv,
      possible_actors : {org},
      deontic : NCOb,
      event : rec(
        name : notify_indiv
      ),
      timer : rec(
        is_preemptive : TRUE,
        initial_val : 3
      ),
      on_done : rec(
        trigger :
          λ actor. (actor ∈ Actor | ∅),
        interrupt : ∅
      ),
      on_timeout : rec(
        trigger :
          λ actor. (actor ∈ Actor | ∅),
        interrupt : ∅
      )
    ),

    rec(
      name : ProhibitNotifyIndiv,
      possible_actors : {pdpc},
      deontic : Perm,
      event : rec(
        name : prohibit_notify_indiv
      ),
      timer : rec(
        is_preemptive : TRUE,
        initial_val : 5
      ),
      on_done : rec(
        trigger :
          λ actor. (actor : Actor | ∅),
        interrupt : {NotifyIndiv}
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
  active_rules := {
    (Assessment, org, 30)
  }

END