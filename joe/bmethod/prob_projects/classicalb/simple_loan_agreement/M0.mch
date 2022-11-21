MACHINE M0

SETS
  Deontic = {Ob, Perm, Prohib};
  Rule_state = {In_effect, Terminated, Breached, Fulfilled};
  Events = {Event0}

CONSTANTS
  Rules, next_state

DEFINITIONS
  Choice(X, Y) ==
    ∀ R. (R ∈ ℙ(X × Y)
    ⇒ ((∀ x. (x ∈ X ⇒ ∃ y. (y ∈ Y ∧ (x, y) ∈ R)))
    ⇒ ∃ f. (f ∈ (X → Y) ∧ ∀ x. (x ∈ X ⇒ (x, f(x)) ∈ R))));

  Induction ==
    ∀ X. (0 ∈ X ⇒ ((∀ n. (n ∈ X ⇒ succ(n) ∈ X)) ⇒ ℕ ⊆ X));

  GrdActiveRuleInstance(e) ==
    #r, n. (
      r : dom(rule_instances) & n : ℕ1  &
      (In_effect, n) : rule_instances(r) &
      e = r'event
    );

PROPERTIES
  Rules <: struct(
    name : STRING,
    deontic : Deontic,
    event : Events,
    // Number of instances to instantiate, ie upper bound on the number of times
    // we care about the perdurant rule being violated.
    perdurance : ℕ1 
  ) &
  next_state : Deontic --> (BOOL --> Rule_state) &
  next_state = {
    (Ob, {(TRUE, Fulfilled), (FALSE, Breached)}),
    (Perm, {(TRUE, Fulfilled), (FALSE, Fulfilled)}),
    (Prohib, {(TRUE, Breached), (FALSE, Fulfilled)})
  }

VARIABLES
  rule_instances

INVARIANT
  rule_instances : Rules --> (Rule_state --> ℕ)
  /* & !rule, state. ((rule : Rules) & (state : Rule_state) => 
        rule_instances(rule)(state) <= rule'perdurance
    ) */

INITIALISATION
  rule_instances := %r. (r : Rules | {})

OPERATIONS
  Event0Op(done) =
    SELECT
      done : BOOL &
      GrdActiveRuleInstance(Event0)
    THEN
      rule_instances := %r. (r : Rules |
        {}
      )
    END

END