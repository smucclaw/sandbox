import maude
import umaudemc.api
import graph_tool as gt
import pyrsistent as pyrs

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

# rules_term = main_mod.parseTerm(rules)
transpiled_term = main_mod.parseTerm(transpiled)

def trace_to_strat(trace_str):
  strat = "rewriteTrace(" + trace_str + ")"
  strat_parsed = main_mod.parseStrategy(strat)
  return strat_parsed

trace_strat = trace_to_strat("tick ++ tick")

# for x in transpiled_term.srewrite(trace_strat):
#     print(x)

g = gt.Graph()
states = g.new_vertex_property("string")

for i in g.add_vertex():
	print(i)

# https://github.com/fadoss/maude-bindings/blob/master/tests/python/graph.py
def exploreAndGraph(graph, stateNr):
  g.add_vertex()
  states[stateNr] = '[label="' + str(graph.getStateTerm(stateNr)) + '"];'
  index = 0
  nextState = graph.getNextState(stateNr, index)

  while nextState >= 0:
    if stateNr != nextState:
      print(stateNr, '->', nextState, ';')
      
    if nextState > stateNr:
      exploreAndGraph(graph, nextState)

    index = index + 1
    nextState = graph.getNextState(stateNr, index)

graph = maude.StrategyRewriteGraph(transpiled_term, trace_strat)

# print(exploreAndGraph(graph, 0))