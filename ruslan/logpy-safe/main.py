from kanren import Relation, facts, run, eq, membero, var, conde


def safe_priceo(x, valuation, cap, safe_ownership):
      return conde(
            [eq(valuation > cap, True), eq(cap*safe_ownership, x)],
            [eq(valuation > cap, False), eq(valuation * safe_ownership,x)] )

x = var()

run(0, x, safe_priceo(x, 10_000_000, 4_000_000, 0.10))