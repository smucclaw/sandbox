'''
Dependencies:
- maude
  For loading Maude modules and basic Maude stuff.
- umaudemc
  For model checking LTL, CTL, CTL*, mu-calc and probabilistic CTL using tools
  like ltsmin, Nusmv, Spin and PRISM.
- networkx
  Used to create and manipulate graphs from traces and state spaces.
- pyvis
  Used to generate interactive html/js visualizations from networkx graphs.
'''

import maude
import umaudemc.api

# from jaal import Jaal
import networkx as nx
import os
# import pandas as pd
from pathlib import Path
# from pipetools import pipe, where, X 
import pyrsistent as pyrs
from pyvis.network import Network
import re

def trace_to_strat(mod, trace_str):
  strat = f"rewriteTrace{trace_str})"
  strat = mod.parseStrategy(strat)
  return strat

# https://stackoverflow.com/questions/14693701/how-can-i-remove-the-ansi-escape-sequences-from-a-string-in-python
def escape_ansi(term):
  ansi_escape = re.compile(r'(?:\x1B[@-_]|[\x80-\x9F])[0-?]*[ -/]*[@-~]')
  term = str(term)
  return ansi_escape.sub('', term)

class Edge(pyrs.PRecord):
  src_id = pyrs.field(int)
  dest_id = pyrs.field(int)
  rule_label = pyrs.field(str)

# class Node(pyrs.PRecord):
#   id = pyrs.field(int)
#   label = pyrs.field(str)

class Graph(pyrs.PRecord):
  nodes = pyrs.pmap_field(int, str)
  edges = pyrs.pset_field(Edge)

def eval_fn(mod, fn, term):
  term = mod.parseTerm(f"{fn} ({term})")
  term.reduce()
  term = escape_ansi(term)
  return term

def get_state_term_str(graph, state_num):
  term = graph.getStateTerm(state_num)
  term = escape_ansi(term)
  return term

def edges_to_graph(mod, rewrite_graph, edges):
  nodes = pyrs.pmap()
  for edge in edges:
    for node_id in [edge.src_id, edge.dest_id]:
      node_term = get_state_term_str(rewrite_graph, node_id)
      node_term = eval_fn(mod, "pretty", node_term)
      nodes = nodes.set(node_id, node_term)
  graph = Graph(nodes = nodes, edges = edges)
  return graph

# def node_ids_to_edge(mod, graph, src_node_id, dest_node_id):
#   rule = graph.getTransition(src_node_id, dest_node_id).getRule()
#   edge = None
#   if rule:
#     rule_label = rule.getLabel()
#     match rule_label:
#       case 'tick':
#         rule_label = 'tick'
#       case 'action':
#         new_node_term = get_state_term_str(graph, dest_node_id)
#         rule_label = eval_fn(mod, "getAction", new_node_term)
#     edges = edges.add(
#       Edge(src_id = curr_node, dest_id = new_node, rule_label = rule_label)
#     )

# Based on:
# https://github.com/fadoss/maude-bindings/blob/master/tests/python/graph.py
def rewrite_graph_to_graph(mod, rewrite_graph):
  node_queue = pyrs.pdeque([0])
  nodes = pyrs.pset([0])
  edges = pyrs.pset()
  while len(node_queue) > 0:
    curr_node = node_queue.left
    node_queue = node_queue.popleft()
    succ_index = 0
    nodes = nodes.add(curr_node)
    while True:
      new_node = rewrite_graph.getNextState(curr_node, succ_index)
      if new_node == -1:
        break
      if new_node not in nodes:
        node_queue = node_queue.append(new_node)
      # Do we need to handle transitions that don't have a rule label?
      # What do they correspond to? Things like strategy applications?
      # If so, then we should continue to ignore them and not expose them.
      rule = rewrite_graph.getTransition(curr_node, new_node).getRule()
      if rule:
        rule_label = rule.getLabel()
        match rule_label:
          case 'tick':
            rule_label = 'tick'
          case 'action':
            new_node_term = get_state_term_str(rewrite_graph, new_node)
            rule_label = eval_fn(mod, "getAction", new_node_term)
        edges = edges.add(
          Edge(src_id = curr_node, dest_id = new_node, rule_label = rule_label)
        )
      succ_index += 1
  graph = edges_to_graph(mod, rewrite_graph, edges)
  return graph

def graph_to_nx_graph(graph):
  nx_graph = nx.DiGraph()
  for node_id, node_term in graph.nodes.items():
    nx_graph.add_node(node_id, label = node_term)
  for edge in graph.edges:
    nx_graph.add_edge(edge.src_id, edge.dest_id, label = edge.rule_label)
  return nx_graph

def nx_graph_to_pyvis_netwk(nx_graph):
  netwk = Network(
    height = "800px", directed = True,
    select_menu = True, filter_menu = True
  )
  netwk.from_nx(nx_graph)
  return netwk

  # vertices1 = pyrs.pset()
  # for edge in edges:
  #   for vertex in [edge['from'], edge['to']]:
  #     term = escape_ansi(str(rewrite_graph.getStateTerm(vertex)))
  #     vertices1 = vertices1.add(pyrs.pmap({'id': vertex, 'term': term}))

  # return pyrs.pmap({'vertices': vertices1, 'edges': edges})

# This is essentially a breadth-first traversal of the rewrite graph to construct a
# # networkx graph
# def rewrite_graph_to_graph(rewrite_graph):
#   vertex_queue = pyrs.pdeque([0])
#   vertices = pyrs.pset()
#   nx_graph = nx.DiGraph()
#   while len(vertex_queue) > 0:
#     curr_vertex = vertex_queue.left
#     vertices = vertices.add(curr_vertex)
#     vertex_queue = vertex_queue.popleft()
#     succ_index = 0
#     while True:
#       new_vertex = rewrite_graph.getNextState(curr_vertex, succ_index)
#       # It's ok to add -1 here because all our data structures are persistent.
#       if new_vertex in vertices.add(-1):
#         break
#       else:
#         succ_index += 1
#         vertex_queue = vertex_queue.append(new_vertex)
#         edge = (curr_vertex, new_vertex)
#         rule = rewrite_graph.getTransition(*edge).getRule()
#         if rule:
#           rule_label = rule.getLabel()
#           edge = map(rewrite_graph.getStateTerm, edge)
#           # Probably want to apply more post-processing beyond escaping ansi
#           # chars to terms to make them more readable.
#           edge = map(str, edge)
#           edge = map(escape_ansi, edge)
#           nx_graph.add_edge(*edge, rule_label = rule_label)
#   return nx_graph

def term_strat_to_graph(mod, term, strat):
  graph = maude.StrategyRewriteGraph(term, strat)
  graph = rewrite_graph_to_graph(mod, graph)
  return graph
 
if __name__ == '__main__':
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
  strat = main_mod.parseStrategy('all *')

  graph = term_strat_to_graph(main_mod, transpiled_term, strat)
  nx_graph = graph_to_nx_graph(graph)
  netwk = nx_graph_to_pyvis_netwk(nx_graph)
  netwk.barnes_hut()
  netwk.show_buttons()
  netwk.show('graph.html')

  # edge_df = pd.DataFrame(graph)
  # edge_df.to_csv("edges.csv")
  # # print(len(graph['edges']))
  # Jaal(edge_df).plot(
  #   directed = True,
  #   vis_opts = {
  #     'physics': {
  #       'barnesHut': {
  #         'centralGravity': 0.2,
  #         'springLength': 200,
  #         'springStrength': 0.05,
  #         'damping': 0.09,
  #         'gravitationalConstant' : -8000
  #       }
  #     }
  #   }
  # )
  # print(vertex_df)

  # pyvis_graph = Network(height = '800px', directed=True)
  # pyvis_graph.from_nx(nx_graph)
  # pyvis_graph.barnes_hut()
  # pyvis_graph.show_buttons(['physics', 'interaction'])
  # # pyvis_graph.show_buttons(filter_=['physics'])
  # pyvis_graph.show('graph.html')

  # print(graph.edges.data())

  # https://stackoverflow.com/questions/46244899/labeling-networkx-node-attributes-outside-of-nodes
  # plt.figure()
  # pos_nodes = nx.spring_layout(graph)
  # nx.draw(graph, pos_nodes, with_labels=True)
  # plt.show()

  # print(graph.nodes.data())
  # print(graph.edges)
  # print(graph.edges.data())