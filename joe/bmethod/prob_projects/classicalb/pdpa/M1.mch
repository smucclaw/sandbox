SYSTEM M1

/*
Contract as reconfigurable, colored timed-arc petri net with guard
conditions expressed in the language of ZFC.

The marking is given by the relation
  active_rules ∈ RuleName * Actor ↔ NATURAL
with tokens being colored by rule names and actors attached to them.

Note that this is a relation as we allow for multiple colored, timed tokens.
Colored tokens are pairs of a RuleName and Actor.

The petri net has a single place and for each event, it has transitions of the
form
- event_happens(event)
- event_timeout(event)

Unlike TAPAAL, we count down rather than up.
Different timer mechanisms are implemented for tokens of various colors,
depending on whether the rule is pre-emptive or not.

Every event corresponding to a rule consumes a token of that colour.
Interruption of rules by an event corresponds to that event transition consuming
tokens of that color.
*/

DEFINITIONS
  // For convenience∈
  Top == TRUE = TRUE;
  Bottom == TRUE = FALSE;

  // Global choice function, just because.
  "CHOOSE.def";

  Event == struct(name ∈ EventName);

  Timer == struct(is_preemptive ∈ BOOL, initial_val ∈ ℕ₁);

  SideEffects == struct(
    trigger ∈ Actor → (RuleName ↔ Actor),
    interrupt ∈ ℙ(RuleName)
  );

SETS
  Deontic = {
    COb, // Compensable obligation
    NCOb, // Non-compensable obligation
    CProhib, // Compensable prohibition
    NCProhib, // Non-compensable prohibition
    Perm // Permission
  };

  Actor = {org, indiv, pdpc};
  RuleName = {
    Assessment, NotifyPdpc, NotifyIndiv, ProhibitNotifyIndiv
  };
  EventName = {
    assess, notify_pdpc, notify_indiv, prohibit_notify_indiv
  }

CONSTANTS
  Rule, is_compensable

PROPERTIES
  is_compensable = 
    λ rule. (rule ∈ Rule |
      bool(rule'deontic : {COb, CProhib, Perm})
    ) ∧

  // Database of rules.
  Rule ⊆ struct(
    name ∈ RuleName,
    possible_actors ∈ ℙ(Actor),
    deontic ∈ Deontic,
    event ∈ Event,
    timer ∈ Timer,
    on_done ∈ SideEffects,
    on_timeout ∈ SideEffects
  ) ∧

  Rule = {
    rec(
      name ∈ Assessment,
      possible_actors ∈ {org},
      deontic ∈ NCOb,
      event ∈ rec(
        name ∈ assess
      ),
      timer ∈ rec(
        is_preemptive ∈ TRUE, 
        initial_val ∈ 30
      ),
      on_done ∈ rec(
        trigger ∈
          λ actor. (actor ∈ Actor | {(NotifyIndiv, actor), (NotifyPdpc, actor)}),
        interrupt ∈ ∅
      ),
      on_timeout ∈ rec(
        trigger ∈
          λ actor. (actor ∈ Actor | ∅),
        interrupt ∈ ∅
      )
    ),

    rec(
      name ∈ NotifyPdpc,
      possible_actors ∈ {org},
      deontic ∈ NCOb,
      event ∈ rec(
        name ∈ notify_pdpc
      ),
      timer ∈ rec(
        is_preemptive ∈ TRUE,
        initial_val ∈ 3
      ),
      on_done ∈ rec(
        trigger ∈
          λ actor. (actor ∈ Actor | {(ProhibitNotifyIndiv, pdpc)}),
        interrupt ∈ ∅
      ),
      on_timeout ∈ rec(
        trigger ∈
          λ actor. (actor ∈ Actor | ∅),
        interrupt ∈ ∅
      )
    ),

    rec(
      name ∈ NotifyIndiv,
      possible_actors ∈ {org},
      deontic ∈ NCOb,
      event ∈ rec(
        name ∈ notify_indiv
      ),
      timer ∈ rec(
        is_preemptive ∈ TRUE,
        initial_val ∈ 3
      ),
      on_done ∈ rec(
        trigger ∈
          λ actor. (actor ∈ Actor | ∅),
        interrupt ∈ ∅
      ),
      on_timeout ∈ rec(
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
        initial_val ∈ 5
      ),
      on_done : rec(
        trigger :
          λ actor. (actor ∈ Actor | ∅),
        interrupt : {NotifyIndiv}
      ),
      on_timeout : rec(
        trigger :
          λ actor. (actor ∈ Actor | ∅),
        interrupt : ∅
      )
    )
  }

VARIABLES
  is_breached,
  active_rules

INVARIANT
  is_breached ∈ BOOL ∧

  active_rules ∈ RuleName * Actor ↔ ℕ ∧

  // Should we manually apply Choice to invert the quantifiers or just pray the
  // SMT translation knows how to Skolemnize properly?
  ∀ rule_name, actor, timer_val. (
    (rule_name, actor, timer_val) ∈ active_rules ⇒
    ∃ rule. (rule ∈ Rule ∧
      rule'name = rule_name ∧
      actor ∈ rule'possible_actors ∧
      // This enforces timers to count down and not up.
      timer_val ≤ rule'timer'initial_val
    )
  )

INITIALISATION
  is_breached := FALSE ||
  active_rules := {
    (Assessment, org, 30)
  }

OPERATIONS
  tic =
    PRE
      is_breached = FALSE ∧
      // The clock is allowed to tick iff all timers have a positive value.
      ∀ rule_name, actor, timer_val. (
        (rule_name, actor, timer_val) ∈ active_rules ⇒
          timer_val > 0
      )
    THEN
      active_rules := {rule_name, actor, timer_val |
        (rule_name, actor, timer_val + 1) ∈ active_rules
      }
    END;

  event_happens(event_name) =
    ANY rule, actor, timer_val, triggers, interrupts WHERE
      is_breached = FALSE ∧
      rule ∈ Rule ∧
      (rule'name, actor, timer_val) ∈ active_rules ∧
      rule'event'name = event_name ∧
      // Disjunction elimination with excluded middle.
      IF rule'timer'is_preemptive = TRUE THEN
        timer_val >= 0
      ELSE
        timer_val = 0
      END ∧

      interrupts = {rule_name, actor0, timer_val0 |
        (rule_name, actor0, timer_val0) ∈ active_rules ∧
        (rule_name ∈ rule'on_done'interrupt)
      } ∧

      triggers = {rule_name, actor0, timer_val0 |
        (rule_name, actor0) ∈ rule'on_done'trigger(actor) ∧ 
        ∃ rule. (rule ∈ Rule ∧
          rule'name = rule_name ∧
          timer_val0 = rule'timer'initial_val
        )
      }
    THEN
      active_rules :=
        ((active_rules \ {(rule'name, actor, timer_val)}) \ interrupts) ∪ triggers
      ||
      IF rule'deontic = NCProhib THEN
        is_breached := TRUE
      END
    END;

  event_timeout(event_name) =
    ANY rule, actor, triggers, interrupts WHERE
      is_breached = FALSE &
      rule ∈ Rule ∧
      (rule'name, actor, 0) ∈ active_rules ∧
      rule'event'name = event_name ∧

      interrupts = {rule_name, actor0, timer_val0 |
        (rule_name, actor0, timer_val0) ∈ active_rules ∧
        (rule_name ∈ rule'on_timeout'interrupt)
      } ∧

      triggers = {rule_name, actor0, timer_val0 |
        (rule_name, actor0) ∈ rule'on_timeout'trigger(actor) ∧ 
        ∃ rule. (rule ∈ Rule ∧
          rule'name = rule_name ∧
          timer_val0 = rule'timer'initial_val
        )
      }
    THEN
      active_rules :=
        ((active_rules \ {(rule'name, actor, 0)}) \ interrupts) ∪ triggers
      ||
      IF rule'deontic = NCOb THEN
        is_breached := TRUE
      END
    END

END
