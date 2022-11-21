SYSTEM M1

// Statics
SETS
  Stat = {adequate, inadequate};
  InvestStrat = {savings, stocks, combination};
  EarningsStat = {steady, unsteady}

DEFINITIONS
  indiv0 ==
    rec(
      amt_saved : 22000,
      num_dependents : 3,
      earnings_amt : 25000,
      earnings_stat : steady
    );

ABSTRACT_CONSTANTS
  Indivs,
  min_savings, min_income,
  invest_strat, income_stat, savings_acc_stat

PROPERTIES
  Indivs = {indiv0} &
  
  min_savings = {x, y | y = 5000 * x'num_dependents} &
  min_income = {x, y | y = 15000 + 4000 * x'num_dependents} &

  !indiv. (indiv : Indivs => (
    (indiv, inadequate) : savings_acc_stat =>
    (indiv, savings) : invest_strat
  )) &

  !indiv. (
    ((indiv, adequate) : savings_acc_stat & (indiv, adequate) : income_stat) =>
    (indiv, stocks) : invest_strat
  ) &

  !indiv. (
    ((indiv, adequate) : savings_acc_stat & (indiv, inadequate) : income_stat) =>
    (indiv, combination) : invest_strat
  ) &

  !indiv. (
    (indiv'amt_saved > min_savings(indiv)) =>
    (indiv, adequate) : savings_acc_stat
  ) &

  !indiv. (
    (not (indiv'amt_saved > min_savings(indiv))) =>
    (indiv, inadequate) : savings_acc_stat
  ) &

  !indiv. (
    indiv'earnings_amt > min_income(indiv) =>
    (indiv, adequate) : income_stat
  ) &

  !indiv. (
    (not (indiv'earnings_amt > min_income(indiv))) =>
    (indiv, inadequate) : income_stat
  ) &

  !indiv. (
    indiv'earnings_stat = unsteady =>
    (indiv, inadequate) : income_stat
  )

  // let indiv = rec(amt_saved : 22000, num_dependents : 3, earnings_amt : 25000, earnings_stat : steady)
  // invest_strat(indiv)

END