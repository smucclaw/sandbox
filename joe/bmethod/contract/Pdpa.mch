SYSTEM Pdpa

INCLUDES AbstractContract
PROMOTES tick

DEFINITIONS
  "Defs.def";

  rules0 == {
    rec(
      name : Assessment,
      possible_actors : {org | is_public_agency(org) = TRUE},
      deontic : NCOb,
      event : rec(
        name : assess,
        is_preemptive : TRUE,
        initial_timer_val : 30
      )
    ),

    rec(
      name : NotifyIndiv,
      possible_actors : {org},
      deontic : NCOb,
      event : rec(
        name : notify_indiv,
        is_preemptive : TRUE,
        initial_timer_val : 3
      )
    ),

    rec(
      name : NotifyPdpc,
      possible_actors : {org},
      deontic : NCOb,
      event : rec(
        name : notify_pdpc,
        is_preemptive : TRUE,
        initial_timer_val : 3
      )
    ),

    rec(
      name : ProhibitNotifyIndiv,
      possible_actors : {pdpc},
      deontic : Perm,
      event : rec(
        name : prohibit_notify_indiv,
        is_preemptive : TRUE,
        initial_timer_val : 5
      )
    ),

    rec(
      name : CannotNotifyIndiv,
      possible_actors : {org},
      deontic : NCProhib,
      event : rec(
        name : notify_indiv,
        is_preemptive : TRUE,
        initial_timer_val : 5
      )
    )
  };

CONSTANTS
  // actors
  org, indiv, pdpc,
  is_public_agency,
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
  } ∧

  is_public_agency ∈ {org} → BOOL

VARIABLES
  is_indiv_notified

INVARIANT
  is_indiv_notified ∈ BOOL

INITIALISATION
  is_indiv_notified := FALSE ||
  add_rules(rules0);
  trigger(TRUE, {(Assessment, org)})

EVENTS
  assess_happened(actor) = BEGIN
    event_happened(assess, actor);

    VAR is_notifiable IN
      is_notifiable :∈ BOOL;

      trigger(is_notifiable, {(NotifyPdpc, actor), (NotifyIndiv, actor)})
    END
  END;

  assess_timeout(actor) = BEGIN
    event_timeout(assess, actor)
  END;

  notify_indiv_happened(actor) = BEGIN
    event_happened(notify_indiv, actor);
    is_indiv_notified := TRUE
  END;

  notify_indiv_timeout(actor) = BEGIN
    event_timeout(notify_indiv, actor)
  END;

  notify_pdpc_happened(actor) = BEGIN
    event_happened(notify_pdpc, actor);
    trigger(TRUE, {(ProhibitNotifyIndiv, pdpc)})
  END;

  notify_pdpc_timeout(actor) = BEGIN
    event_timeout(notify_pdpc, actor)
  END;

  prohibit_notify_indiv_happened(actor) = BEGIN
    event_happened(prohibit_notify_indiv, actor);
    discharge(TRUE, {(NotifyIndiv, org)});
    trigger(bool(is_indiv_notified = FALSE), {(CannotNotifyIndiv, org)})
  END;

  prohibit_notify_indiv_timeout(actor) = BEGIN
    event_timeout(prohibit_notify_indiv, actor)
  END

END