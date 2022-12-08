MACHINE AbstractContract

/*
Contract as reconfigurable, colored timed-arc petri net with guard
conditions expressed in the language of ZFC.
Technically we allow for an infinite number of tokens and transitions on the
petri net.

The marking is given by the relation
  active_rules : RuleName * Actor ↔ NATURAL
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

CONSTANTS
  Event, Rule

PROPERTIES
  Event = struct(
    name : EventName,
    is_preemptive : BOOL,
    initial_timer_val : NATURAL
  ) &

  Rule = struct(
    name : RuleName,
    possible_actors : POW(Actor),
    deontic : Deontic,
    event : Event
  )

VARIABLES
  rules, breached_by, active_rules

INVARIANT
  rules <: Rule &
  breached_by : POW(Actor) & card(breached_by) <= 1 &

  active_rules : RuleName * Actor ↔ ℕ &
  ! rule_name, actor, timer_val. (
    (rule_name, actor, timer_val) : active_rules ⇒
    # rule. (rule : rules &
      rule'name = rule_name &
      actor : rule'possible_actors &
      // This enforces timers to count down and not up.
      timer_val <= rule'event'initial_timer_val
    )
  )

INITIALISATION
  rules, breached_by, active_rules := {}, {}, {}

OPERATIONS
  add_rules(rules_to_add) =
    PRE
      rules_to_add <: Rule
    THEN
      rules := rules \/ rules_to_add
    END;

  remove_rules(rules_to_remove) =
    PRE
      rules_to_remove <: Rule
    THEN
      rules := rules \ rules_to_remove
    END;

  // Discrete clock tic transition.
  tick =
    PRE
      // The clock is allowed to tick iff the contract has started,
      // hasn't been breached yet, and all active timers have a positive value.
      rules /= {} &
      breached_by = {} &
      ran(active_rules) : POW1(NATURAL1)
    THEN
      active_rules := {rule_name, actor, timer_val |
        (rule_name, actor, timer_val + 1) : active_rules
      }
    END;

  event_happened(event_name, actor) =
    ANY relevant_rules WHERE
      breached_by = {} &
      relevant_rules /= {}  &
      relevant_rules = {rule |
        rule : rules &
        # timer_val. (
          (rule'name, actor, timer_val) : active_rules &
          (rule'event'is_preemptive = FALSE ⇒ timer_val = 0) &
          rule'event'name = event_name
        )
      }
    THEN
      IF # rule. (rule : relevant_rules & rule'deontic = NCProhib)
      THEN
        breached_by, active_rules := {actor}, {}
      ELSE
        LET to_remove BE
          to_remove = {rule_name, actor, timer_val |
            (rule_name, actor, timer_val) : active_rules &
            # rule. (rule : relevant_rules & rule'name = rule_name)
          }
        IN
          active_rules := active_rules \ to_remove
        END
      END
    END;

  event_timeout(event_name, actor) =
    ANY relevant_rules WHERE
      breached_by = {} &
      relevant_rules /= {}  &
      relevant_rules = {rule |
        rule : rules &
        (rule'name, actor, 0) : active_rules &
        rule'event'name = event_name
      }
    THEN
      IF # rule. (rule : relevant_rules & rule'deontic = NCOb)
      THEN
        breached_by, active_rules := {actor}, {}
      ELSE
        LET to_remove BE
          to_remove = {rule_name, actor, timer_val |
            (rule_name, actor, timer_val) : active_rules &
            timer_val = 0 &
            # rule. (rule : relevant_rules & rule'name = rule_name)
          }
        IN
          active_rules := active_rules \ to_remove
        END
      END
    END;

    discharge(precond, discharges) =
      ANY timed_discharges WHERE
        breached_by = {} &
        discharges : RuleName ↔ Actor &
        timed_discharges = IF precond = TRUE
          THEN
            {rule_name, actor, timer_val |
              (rule_name, actor, timer_val) : active_rules &
              (rule_name, actor) : discharges
            }
          ELSE
            {}
          END
      THEN
        active_rules := active_rules \ timed_discharges
      END;

    trigger(precond, triggers) =
      ANY timed_triggers WHERE
        breached_by = {} &
        triggers : RuleName ↔ Actor &
        timed_triggers =
          IF precond = TRUE THEN
            {rule_name, actor, timer_val0 |
              (rule_name, actor) : triggers & 
              # rule. (rule : rules &
                rule'name = rule_name &
                actor : rule'possible_actors &
                timer_val0 = rule'event'initial_timer_val
              )
            }
          ELSE
            {}
          END
      THEN
        active_rules := active_rules ∪ timed_triggers
      END

END