import maude

maude.init()
maude.load("../.workdir/main.maude")

main_mod = maude.getModule("MAIN")

rules = '''
  RULE 'START
  WITHIN 1 DAY PARTY 'party0 MUST DO 'action0
  LEST 'rule2
  HENCE ('rule0 AND 'rule1),

  RULE 'rule0 PARTY 'party0 SHANT WITHIN 1 DAY 'action0,

  RULE 'rule1 PARTY 'party1 MUST DO 'action1 WITHIN 2 DAY HENCE 'rule3,

  RULE 'rule2 WITHIN 2 DAY PARTY 'party2 MUST 'action2 LEST 'rule3,

  RULE 'rule3 PARTY 'party3 MUST WITHIN 4 DAY DO 'action3
'''

transpiled = "transpile (" + rules + ")"

# term = main_mod.parseTerm("initialConfig")

rules_term = main_mod.parseTerm(rules)
transpiled_term = main_mod.parseTerm(transpiled)

def eval_trace(trace_str):
      strat = "rewriteTrace(" + trace_str + ")"
      strat_parsed = main_mod.parseStrategy(strat)
      return transpiled_term.srewrite(main_mod.parseStrategy())

result = transpiled_term.srewrite(main_mod.parseStrategy("rewriteTrace(tick)"))
# for i in result: print(i)

print(transpiled_term)