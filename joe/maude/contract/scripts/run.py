'''
Dependencies:
- maude
  For loading Maude modules and basic Maude stuff.
- umaudemc
  For model checking LTL, CTL, CTL*, mu-calc and probabilistic CTL using tools
  like ltsmin, Nusmv, Spin and PRISM.
- networkx
  For constructing graphs from traces and state spaces.
- pyvis
  Used to generate interactive html/jss visualizations from networkx graphs
  representing traces and state spaces.
'''

import maude
import umaudemc.api
import networkx as nx
import os
from pathlib import Path
# from pipetools import pipe, where, X 
import pyrsistent as pyrs
from pyvis.network import Network
import re

contract_dir = Path(__file__).parent.parent

rules = ""
with open(contract_dir / "natural4" / "rules.natural4") as f:
  rules = f.read()

workdir = contract_dir / ".workdir"
os.chdir(workdir)

maude.init(loadPrelude = False)

with open("main.maude") as f:
  maude.input(f.read())

main_mod = maude.getModule("MAIN")

transpiled = f"transpile ({rules})"

rules_term = main_mod.parseTerm(rules)
transpiled_term = main_mod.parseTerm(transpiled)

def trace_to_strat(mod, trace_str):
  strat = f"rewriteTrace{trace_str})"
  strat = mod.parseStrategy(strat)
  return strat

# https://stackoverflow.com/questions/14693701/how-can-i-remove-the-ansi-escape-sequences-from-a-string-in-python
def escape_ansi(line):
  ansi_escape = re.compile(r'(?:\x1B[@-_]|[\x80-\x9F])[0-?]*[ -/]*[@-~]')
  return ansi_escape.sub('', line)

# Based on:
# https://github.com/fadoss/maude-bindings/blob/master/tests/python/graph.py
# This is essentially a breadth-first traversal of the rewrite graph to construct a
# # networkx graph
def rewrite_graph_to_graph(rewrite_graph):
  vertex_queue = pyrs.pdeque([0])
  vertices = pyrs.pset()
  nx_graph = nx.DiGraph()
  while len(vertex_queue) > 0:
    curr_vertex = vertex_queue.left
    vertices = vertices.add(curr_vertex)
    vertex_queue = vertex_queue.popleft()
    succ_index = 0
    while True:
      new_vertex = rewrite_graph.getNextState(curr_vertex, succ_index)
      # It's ok to add -1 here because all our data structures are persistent.
      if new_vertex in vertices.add(-1):
        break
      else:
        succ_index += 1
        vertex_queue = vertex_queue.append(new_vertex)
        edge = (curr_vertex, new_vertex)
        rule = rewrite_graph.getTransition(*edge).getRule()
        if rule:
          rule_label = rule.getLabel()
          edge = map(rewrite_graph.getStateTerm, edge)
          # Probably want to apply more post-processing beyond escaping ansi
          # chars to terms to make them more readable.
          edge = map(str, edge)
          edge = map(escape_ansi, edge)
          nx_graph.add_edge(*edge, rule_label = rule_label)
  return nx_graph

def term_strat_to_graph(term, strat):
  graph = maude.StrategyRewriteGraph(term, strat)
  graph = rewrite_graph_to_graph(graph)
  return graph

if __name__ == '__main__':
  test_strat = main_mod.parseStrategy('all *')

  nx_graph = term_strat_to_graph(transpiled_term, test_strat)

  pyvis_graph = Network(height = '800px', directed=True)
  pyvis_graph.from_nx(nx_graph)
  pyvis_graph.barnes_hut()
  pyvis_graph.show_buttons(['physics', 'interaction'])
  # pyvis_graph.show_buttons(filter_=['physics'])
  pyvis_graph.show('graph.html')

  # print(graph.edges.data())

  # https://stackoverflow.com/questions/46244899/labeling-networkx-node-attributes-outside-of-nodes
  # plt.figure()
  # pos_nodes = nx.spring_layout(graph)
  # nx.draw(graph, pos_nodes, with_labels=True)
  # plt.show()

  # print(graph.nodes.data())
  # print(graph.edges)
  # print(graph.edges.data())