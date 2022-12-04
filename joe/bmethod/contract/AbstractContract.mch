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
  // For convenience
  Top == TRUE = TRUE;
  Bottom == TRUE = FALSE;

  Event == struct(name ∈ EventName);

  Timer == struct(is_preemptive ∈ BOOL, initial_val ∈ ℕ₁);

  Effects == struct(
    // Multiplicities of the output arcs.
    trigger ∈ Actor → (RuleName ↔ Actor),
    // Multiplicities of the reset tarcs.
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

  Actor; RuleName; EventName

CONSTANTS
  Rule, is_compensable

PROPERTIES
  is_compensable = 
    λ rule. (rule ∈ Rule |
      bool(rule'deontic ∈ {COb, CProhib, Perm})
    ) ∧

  // Database of rules.
  Rule ⊆ struct(
    name : RuleName,
    possible_actors : ℙ(Actor),
    deontic : Deontic,
    event : Event,
    timer : Timer,
    on_done : Effects,
    on_timeout : Effects
  )

CONCRETE_VARIABLES
  initial_rules, breached_by, active_rules

INVARIANT
  initial_rules ∈ RuleName ↔ Actor ∧
  breached_by ∈ ℙ(Actor) ∧
  card(breached_by) ≤ 1 ∧

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
  initial_rules := ∅ ||
  breached_by := ∅ ||
  active_rules := ∅

OPERATIONS
  start =
    PRE
      initial_rules ≠ ∅ 
    THEN
      initial_rules := ∅ ||
      active_rules := {rule_name, actor, timer_val |
        (rule_name, actor) : initial_rules ∧
        ∃ rule. (rule : Rule ∧
          rule'name = rule_name ∧
          rule'timer'initial_val = timer_val
        )
      }
    END;

  // Discrete clock tic transition.
  tic =
    PRE
      // The clock is allowed to tick iff the contract hasn't been breached yet
      // and all timers have a positive value.
      initial_rules = ∅ ∧
      breached_by = ∅ ∧
      ∀ rule_name, actor, timer_val. (
        (rule_name, actor, timer_val) ∈ active_rules ⇒
          timer_val > 0
      )
    THEN
      active_rules := {rule_name, actor, timer_val |
        (rule_name, actor, timer_val + 1) ∈ active_rules
      }
    END;

  /* TODO:
    Maybe squish event_happens and event_timeout into a single operation since
    they overlap so much.
  */
  event_happens(event_name, actor) =
    ANY rule, timer_val, triggers, interrupts WHERE
      breached_by = ∅ ∧
      // Consume the oldest token.
      // (active_rules ≠ ∅ ⇒ timer_val = min(ran(active_rules))) ∧
      rule ∈ Rule ∧
      (rule'name, actor, timer_val) ∈ active_rules ∧
      rule'event'name = event_name ∧

      // Disjunction elimination with excluded middle.
      IF rule'timer'is_preemptive = TRUE THEN
        timer_val ≥ 0
      ELSE
        timer_val = 0
      END ∧

      interrupts = {rule_name, actor0, timer_val0 |
        (rule_name, actor0, timer_val0) ∈ active_rules ∧
        (rule_name ∈ rule'on_done'interrupt)
      } ∧

      triggers = {rule_name, actor0, timer_val0 |
        // Here we implicitly invoke the axiom of global choice to discharge the
        // annoying obligation to prove that the relation is actually a
        // well-defined function.
        (rule_name, actor0) ∈ rule'on_done'trigger(actor) ∧ 
        ∃ rule. (rule ∈ Rule ∧
          rule'name = rule_name ∧
          timer_val0 = rule'timer'initial_val
        )
      }
    THEN
      IF rule'deontic = NCProhib THEN
        breached_by := {actor} ||
        active_rules := ∅
      ELSE
        active_rules :=
          ((active_rules \ {(rule'name, actor, timer_val)}) \ interrupts) ∪ triggers
      END
    END;

  event_timeout(event_name, actor) =
    ANY rule, triggers, interrupts WHERE
      breached_by = ∅ ∧
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
      IF rule'deontic = NCOb THEN
        breached_by := {actor} ||
        active_rules := ∅
      ELSE
        active_rules :=
          ((active_rules \ {(rule'name, actor, 0)}) \ interrupts) ∪ triggers
      END
    END

END
