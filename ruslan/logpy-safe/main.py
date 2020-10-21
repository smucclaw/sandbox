from kanren import run, eq, var, conde


def safe_priceo(x, valuation, cap, safe_ownership):
      return conde(
            [eq(valuation > cap, True), eq(cap*safe_ownership, x)],
            [eq(valuation > cap, False), eq(valuation * safe_ownership,x)] )

def safe_price(valuation, cap, safe_ownership):
      x = var()
      result = run(1, x, safe_priceo(x, valuation, cap, safe_ownership))
      return result[0]

print(safe_price(10_000_000, 4_000_000, 0.10))
print(safe_price(3_000_000, 4_000_000, 0.10))