SYSTEM Pdpa

INCLUDES AbstractContract(Actor, RuleName, EventName)
PROMOTES tick

DEFINITIONS
  "CommonDefs.def"

SETS
  Actor = {org, indiv, pdpc};

  RuleName = {
    Assessment, NotifyPdpc, NotifyIndiv, ProhibitNotifyIndiv, CannotNotifyIndiv
  };

  EventName = {
    assess, notify_pdpc, notify_indiv, prohibit_notify_indiv
  }

CONSTANTS
 rules0
 
PROPERTIES
  rules0 = {
    rec(
      name : Assessment,
      possible_actors : {org},
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
  }

/*
Instead of initialising the variables non-deterministically in the
INITIALISATION operation, we add a new started variable and start event that
handles that for us.
This is akin to adding a new initial state and tau transitions to get rid of
multiple initial states.
This is because CTL semantics evaluates formulas over all possible initial
states, which messes up the generation of witnessing traces via EF + EX[action].
*/
VARIABLES
  is_public_agency, is_notifiable

INVARIANT
  started ∈ BOOL ∧
  is_public_agency ∈ {org} → BOOL ∧
  is_notifiable ∈ BOOL

INITIALISATION
  is_public_agency := {(org, FALSE)} ||
  is_notifiable := FALSE

OPERATIONS
  setup =
    BEGIN
      start_contract; add_rules(rules0);

      // Nondeterministic initialization of variables.
      is_public_agency :∈ {org} → BOOL;

      // Trigger starting rules based on nondet initialization.
      IF is_public_agency(org) = TRUE THEN
        trigger({(Assessment, org)})
      END
    END;

  assess_happened(actor) = VAR rule_names IN
    rule_names ← event_happened(assess, actor);

    IF Assessment ∈ rule_names THEN
      // Constitutive rules for deciding if a data breach is notifiable should
      // go here.
      is_notifiable :∈ BOOL;

      IF is_notifiable = TRUE THEN
        trigger({(NotifyPdpc, actor), (NotifyIndiv, actor)})
      END
    END
  END;

  assess_timeout(actor) = VAR rule_names IN
    rule_names ← event_timeout(assess, actor)
  END;

  notify_indiv_happened(actor) = VAR rule_names IN
    rule_names ← event_happened(notify_indiv, actor)
  END;

  notify_indiv_timeout(actor) = VAR rule_names IN
    rule_names ← event_timeout(notify_indiv, actor)
  END;

  notify_pdpc_happened(actor) = VAR rule_names IN
    rule_names ← event_happened(notify_pdpc, actor);

    IF NotifyPdpc ∈ rule_names THEN
      trigger({(ProhibitNotifyIndiv, pdpc)})
    END
  END;

  notify_pdpc_timeout(actor) = VAR rule_names IN
    rule_names ← event_timeout(notify_pdpc, actor)
  END;

  prohibit_notify_indiv_happened(actor) = VAR rule_names IN
    rule_names ← event_happened(prohibit_notify_indiv, actor);

    IF ProhibitNotifyIndiv ∈ rule_names THEN
      discharge({(NotifyIndiv, org)});

      trigger({(CannotNotifyIndiv, org)})
    END
  END;

  prohibit_notify_indiv_timeout(actor) = VAR rule_names IN
    rule_names ← event_timeout(prohibit_notify_indiv, actor)
  END

END