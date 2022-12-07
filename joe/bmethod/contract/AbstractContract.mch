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
  Top == TRUE = TRUE;
  Bottom == TRUE = FALSE;

  Event == struct(
    name ∈ EventName,
    is_preemptive ∈ BOOL,
    initial_timer_val ∈ ℕ₁
  );

  Rule == struct(
    name ∈ RuleName,
    possible_actors ∈ ℙ(Actor),
    initial_actors ∈ ℙ(Actor),
    deontic ∈ Deontic,
    event ∈ Event,
    on_done ∈ Effects,
    on_timeout ∈ Effects
  );

  Effects == struct(
    // Multiplicities of the output arcs.
    triggers ∈ Actor → (RuleName ↔ Actor),
    // Multiplicities of the reset tarcs.
    discharges ∈ Actor → (RuleName ↔ Actor)
  );

SETS
 Deontic = {
    COb, // Compensable obligation
    NCOb, // Non-compensable obligation
    CProhib, // Compensable prohibition
    NCProhib, // Non-compensable prohibition
    Perm // Permission
  };

  HappenedTimeout = {happened, timeout};

  Actor; RuleName; EventName

VARIABLES
  rules, breached_by, active_rules

INVARIANT
  rules ⊆ Rule ∧
  breached_by ∈ ℙ(Actor) ∧ card(breached_by) ≤ 1 ∧

  active_rules ∈ RuleName * Actor ↔ ℕ ∧
  ∀ rule_name, actor, timer_val. (
    (rule_name, actor, timer_val) ∈ active_rules ⇒
    ∃ rule. (rule ∈ rules ∧
      rule'name = rule_name ∧
      actor ∈ rule'possible_actors ∧
      // This enforces timers to count down and not up.
      timer_val ≤ rule'event'initial_timer_val
    )
  )

INITIALISATION
  rules, breached_by, active_rules := ∅, ∅, ∅

EVENTS
  init(new_rules) =
    PRE
      new_rules ⊆ Rule ∧
      rules = ∅
    THEN
      rules := new_rules ||
      active_rules := {rule_name, actor, timer_val |
        ∃ rule. (rule ∈ new_rules ∧
          rule'name = rule_name ∧
          actor ∈ rule'initial_actors ∩ rule'possible_actors ∧
          rule'event'initial_timer_val = timer_val
        )
      }
    END;

  // Discrete clock tic transition.
  tick =
    PRE
      // The clock is allowed to tick iff the contract hasn't been breached yet
      // and all timers have a positive value.
      rules ≠ ∅ ∧
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

 event(happened_or_timeout, event_name, actor) =
    LET on_done_timeout BE
      on_done_timeout =
        IF happened_or_timeout = happened THEN
            λ rule. (Top | rule'on_done)
          ELSE
            λ rule. (Top | rule'on_timeout)
          END
    IN
      ANY rule, timer_val, triggers, discharges WHERE
        rule ∈ rules ∧
        breached_by = ∅ ∧
        // Consume the oldest token, currently faulty.
        // (active_rules ≠ ∅ ⇒ timer_val = min(ran(active_rules))) ∧
        IF rule'event'is_preemptive = FALSE ∨ happened_or_timeout = timeout THEN
          timer_val = 0
        ELSE
          Top
        END ∧
        (rule'name, actor, timer_val) ∈ active_rules ∧
        rule'event'name = event_name ∧

        discharges = {rule_name, actor0, timer_val0 |
          (rule_name, actor0, timer_val0) ∈ active_rules ∧
          (rule_name, actor0) ∈ on_done_timeout(rule)'discharges(actor)
        } ∧

        triggers = {rule_name, actor0, timer_val0 |
          // Here we implicitly invoke the axiom of global choice to discharge the
          // annoying obligation to prove that the relation is actually a
          // well-defined function.
          (rule_name, actor0) ∈ on_done_timeout(rule)'triggers(actor) ∧ 
          ∃ rule. (rule ∈ rules ∧
            rule'name = rule_name ∧
            actor0 ∈ rule'possible_actors ∧
            timer_val0 = rule'event'initial_timer_val
          )
        }
      THEN
        IF (happened_or_timeout = happened ∧ rule'deontic = NCProhib) ∨
           (happened_or_timeout = timeout ∧ rule'deontic = NCOb)
        THEN
          breached_by := {actor} ||
          active_rules := ∅
        ELSE
          active_rules :=
            ((active_rules \ {(rule'name, actor, timer_val)}) \ discharges) ∪ triggers
        END
      END
    END

END