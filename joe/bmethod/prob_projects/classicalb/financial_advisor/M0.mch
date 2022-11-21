SYSTEM M0

// Statics
SETS
  Stat = {adequate, inadequate};
  InvestStrat = {savings, stocks, combination};
  EarningsStat = {steady, unsteady}

DEFINITIONS
  Indivs == struct(
    amt_saved : NATURAL,
    num_dependents : NATURAL,
    earnings_amt : NATURAL,
    earnings_stat : EarningsStat
  );

  indiv0 ==
    rec(
      amt_saved : 22000,
      num_dependents : 3,
      earnings_amt : 25000,
      earnings_stat : steady
    );

    Top == 0 = 0

ABSTRACT_CONSTANTS
  invest_strat, income_stat, savings_acc_stat,
  min_savings, min_income,

  precond, postcond

PROPERTIES
  // ∀ X. ((X : POW(INTEGER) => (0 ∈ X ⇒ ((∀ n. (n ∈ X ⇒ succ(n) ∈ X)) ⇒ ℕ ⊆ X))))  &

  min_savings = %x. (Top | 5000 * x'num_dependents) &
  // {x, y | y = 5000 * x'num_dependents} &
  min_income = {x, y | y = 15000 + 4000 * x'num_dependents} &

  // Reinventing Clark completion heh
  invest_strat =
    {indiv, invest_strat0 | indiv : Indivs &
      ((indiv, inadequate) : savings_acc_stat  <=> invest_strat0 = savings) & (
        // Disjunction elimination with a decidable predicate ensures this is computable.
        IF (indiv, adequate) : income_stat
        THEN
          invest_strat0 = stocks
        ELSE
          invest_strat0 = combination
        END
      )
    } &

  precond : NATURAL * NATURAL * NATURAL <-> NATURAL &
  postcond : NATURAL * NATURAL * NATURAL <-> NATURAL &
  /*@label lbl*/
  !w, x, y, z. (
    w : NATURAL & x : NATURAL & y : NATURAL & z : NATURAL => (
      (w, x, y, z) : precond => (w, x, y, z) : postcond
    )
  ) &

  /* invest_strat1 : Indivs --> BOOL &
  !indiv. (indiv : Indivs =>
    invest_strat1(indiv) = TRUE
  ) & */

  savings_acc_stat =
    {indiv, savings_acc_stat0 |
      indiv'amt_saved > min_savings(indiv) <=> savings_acc_stat0 = adequate
    } &

  income_stat =
    {indiv, income_stat0 |
      IF indiv'earnings_stat = unsteady
      THEN
        income_stat0 = inadequate
      ELSE
        indiv'earnings_amt > min_income(indiv) <=> income_stat0 = adequate
      END
    }

  // let indiv = rec(amt_saved : 22000, num_dependents : 3, earnings_amt : 25000, earnings_stat : steady)
  // invest_strat(indiv)

// Dynamics
VARIABLES
  known_indivs

INVARIANT
  known_indivs : STRING +-> (Indivs --> InvestStrat)

INITIALISATION
  known_indivs := {}

OPERATIONS
  add_indiv(name, amt_saved0, num_dependents0, earnings_amt0, earnings_stat0) =
    BEGIN
      LET x BE x = rec(
        amt_saved : amt_saved0,
        num_dependents : num_dependents0,
        earnings_amt : earnings_amt0,
        earnings_stat : earnings_stat0
      )
      IN
        // Technically we can use a global choice operator here to rid ourselves
        // of the obligation to prove that the function call is well defined.
        known_indivs(name) := {(x, invest_strat(x))}
      END
    END

END