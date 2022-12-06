SYSTEM AbstractContract

/*
Contract as reconfigurable, colored timed-arc petri net with guard
conditions expressed in the language of ZFC.
Technically we allow for an infinite number of tokens and transitions on the
petri net.

The marking is given by the relation
  active_rules ∈ RuleName * Actor ↔ NATURAL
with tokens being colored by rule names and actors attached to them.

Note that this is a relation as we allow for multiple colored, timed tokens.
Colored tokens are pairs of a RuleName and Actor.

The petri net has 2 places, p and breached_by, and for each event, it has
transitions of the form
- event_happens(event)
- event_timeout(event)
These loop from p back to itself and there is an inhibitor arc from breached_by
to these transitions.
Non-compensable obligations (resp prohibitions) have an arc from
event_timeout(event) (resp event_happens(event)) to breached_by.
The colored token on breached_by is used for blame assignment.

Unlike TAPAAL, we count down rather than up.
Different timer mechanisms are implemented for tokens of various colors,
depending on whether the rule is pre-emptive or not.

Every event corresponding to a rule consumes a token of that colour.
Interruption of rules by an event corresponds to a reset arc.
*/

DEFINITIONS
  "Defs.def"

SETS
  Deontic = {
    COb, // Compensable obligation
    NCOb, // Non-compensable obligation
    CProhib, // Compensable prohibition
    NCProhib, // Non-compensable prohibition
    Perm // Permission
  };

  Actor; RuleName; EventName

CONSTANTS
  Rule //, is_compensable

PROPERTIES
  /*
  is_compensable = 
    λ rule. (rule ∈ Rule |
      bool(rule'deontic ∈ {COb, CProhib, Perm})
    ) ∧
  */

  // Database of rules.
  Rule ⊆ struct(
    name : RuleName,
    possible_actors : ℙ(Actor),
    initial_actors : ℙ(Actor),
    deontic : Deontic,
    event : Event,
    on_done : Effects,
    on_timeout : Effects
  ) ∧

  ∀ rule. (rule : Rule ⇒
    rule'initial_actors ⊆ rule'possible_actors
  )

CONCRETE_VARIABLES
  started, breached_by, active_rules

INVARIANT
  started : BOOL ∧
  breached_by ∈ ℙ(Actor) ∧
  card(breached_by) ≤ 1 ∧

  active_rules ∈ RuleName * Actor ↔ ℕ ∧

  ∀ rule_name, actor, timer_val. (
    (rule_name, actor, timer_val) ∈ active_rules ⇒
    ∃ rule. (rule ∈ Rule ∧
      rule'name = rule_name ∧
      actor ∈ rule'possible_actors ∧
      // This enforces timers to count down and not up.
      timer_val ≤ rule'event'initial_timer_val
    )
  )

INITIALISATION
  started := FALSE ||
  breached_by := ∅ ||
  active_rules := ∅

OPERATIONS
  start =
    PRE
      started = FALSE
    THEN
      started := TRUE ||
      active_rules := {rule_name, actor, timer_val |
        ∃ rule. (rule : Rule ∧
          rule'name = rule_name ∧
          actor : rule'initial_actors ∧
          rule'event'initial_timer_val = timer_val
        )
      }
    END;

  // Discrete clock tic transition.
  tic =
    PRE
      // The clock is allowed to tick iff the contract hasn't been breached yet
      // and all timers have a positive value.
      started = TRUE ∧
      breached_by = ∅ ∧
      ∀ rule_name, actor, timer_val. (
        (rule_name, actor, timer_val) ∈ active_rules ⇒
          timer_val > 0
      )
    THEN
      active_rules := {rule_name, actor, timer_val |
        (rule_name, actor, timer_val + 1) ∈ active_rules
      }
    END
END