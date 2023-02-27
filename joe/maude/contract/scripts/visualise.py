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

- pyrsistent
  For persistent hash array mapped trie maps and sets.

- cytoolz
  For functional forward piping.

Usage:
python visualise.py natural4_file [strategy]

This outputs a file called natural4_filename.html in contract/.workdir.
Here, natural4_filename is the file name of natural4_file without the extension.

If strategy is not provided, we take the default value to be 'all *', which
means generate all traces and hence traverse the whole state space.
The strategy can also be a strategy describing a trace, say
  rewriteTrace(tick ++ ('party0 does 'action0) ++ tick)
Note that it is important to put parens around "... does ..." actions.
'''

from pathlib import Path
import re
import sys

import maude
from umaudemc.wrappers import create_graph

import pyrsistent as pyrs
from cytoolz.functoolz import *
from cytoolz.curried import *

import networkx as nx
from pyvis.network import Network

def trace_to_strat(mod, trace_str):
  strat = f"rewriteTrace({trace_str})"
  strat = mod.parseStrategy(strat)
  return strat

# https://stackoverflow.com/questions/14693701/how-can-i-remove-the-ansi-escape-sequences-from-a-string-in-python
def escape_ansi(term):
  ansi_escape = re.compile(r'(?:\x1B[@-_]|[\x80-\x9F])[0-?]*[ -/]*[@-~]')
  term = str(term)
  return ansi_escape.sub('', term)

class Edge(pyrs.PRecord):
  src_id = pyrs.field(int, mandatory = True)
  dest_id = pyrs.field(int, mandatory = True)
  rule_label = pyrs.field(str, mandatory = True)

class Node(pyrs.PRecord):
  term_str = pyrs.field(str, mandatory = True)
  contract_status = pyrs.field(str, mandatory = True)

class Graph(pyrs.PRecord):
  node_map = pyrs.pmap_field(int, Node)
  edges = pyrs.pset_field(Edge)

@curry
def node_to_colour(node):
  if node.contract_status == 'Active': colour = 'blue'
  if node.contract_status == 'Fulfilled': colour = 'green'
  if node.contract_status == 'Breached': colour = 'red'
  return colour

@curry
def edge_to_colour(graph, edge):
  return pipe(
    edge,
    lambda x: x.dest_id,
    flip(get, graph.node_map),
    node_to_colour
  )

@curry
def edge_to_next_state(graph, edge):
  return pipe(
    edge,
    lambda x: x.dest_id,
    flip(get, graph.node_map),
    lambda x: x.contract_status
  )

@curry
def apply_fn(mod, fn, arg):
  # fn = escape_ansi(fn)
  # arg = escape_ansi(arg)
  return pipe(
    f'{fn}({arg})',
    mod.parseTerm,
    do(lambda x: x.reduce())
  )

@curry
def apply_fn_to_str(mod, fn, arg):
  return pipe(
    arg,
    apply_fn(mod, fn),
    escape_ansi
  )

@curry
def get_state_term_str(graph, node_id):
  return pipe(
    node_id,
    graph.getStateTerm,
    escape_ansi
  )

@curry
def node_id_to_node(mod, rewrite_graph, node_id):
  node_term_to_contract_status = compose_left(
    apply_fn_to_str(mod, 'configToStatus'),
    lambda x: 'Fulfilled' if x == '(Fulfilled).ContractStatus' else x
  )

  return pipe(
    node_id,
    get_state_term_str(rewrite_graph),
    # Split the railway track
    juxt(apply_fn_to_str(mod, 'pretty'), node_term_to_contract_status),
    # Join the railway tracks
    lambda x: Node(term_str = x[0], contract_status = x[1])
  )

def edges_to_node_map(mod, rewrite_graph, edges):
  return pipe(
    edges,
    map(lambda edge: (edge.src_id, edge.dest_id)),
    concat,
    map(juxt(identity, node_id_to_node(mod, rewrite_graph))),
    pyrs.pmap
  )

# Here we assume that rewrite_graph is an expanded fail-free graph.
# See: https://github.com/fadoss/umaudemc/blob/master/umaudemc/wrappers.py
def rewrite_graph_to_graph(mod, rewrite_graph):
  edges = pyrs.pset()
  for node_id in range(rewrite_graph.getNrStates()):
    succ_ids = rewrite_graph.getNextStates(node_id)
    for succ_id in succ_ids:
      # Do we need to handle transitions that don't have a rule label?
      # What do they correspond to? Things like strategy applications?
      # If so, then we should continue to ignore them and not expose them.
      rule = rewrite_graph.getTransition(node_id, succ_id).getRule()
      if rule:
        rule_label = rule.getLabel()
        if rule_label == 'tick': rule_label = '1 day'
        if rule_label == 'action':
         # the term corresponding to the succ_id node and get the
         # action transition.
          new_node_term = get_state_term_str(rewrite_graph, succ_id)
          rule_label = apply_fn_to_str(mod, 'getAction', new_node_term)
        edges = edges.add(
          Edge(src_id = node_id, dest_id = succ_id, rule_label = rule_label)
        )
  node_map = edges_to_node_map(mod, rewrite_graph, edges)
  graph = Graph(node_map = node_map, edges = edges)
  return graph

def graph_to_nx_graph(graph):
  nx_graph = nx.DiGraph()
  for node_id, node in graph.node_map.items():
    nx_graph.add_node(
      node_id,
      # Do we want title or label?
      # Title can contain html and only shows when hovering over the node.
      # Label is visible all the time.
      title = node.term_str,
      contract_state = node.contract_status,
      color = node_to_colour(node)
    )
  for edge in graph.edges:
    nx_graph.add_edge(
      edge.src_id, edge.dest_id,
      label = edge.rule_label,
      next_state = edge_to_next_state(graph, edge),
      color = edge_to_colour(graph, edge)
    )

  # Quotient states by same title, to merge states that have different global time.
  nx_node_titles = nx_graph.nodes(data = 'title')
  equiv_rel = lambda node1, node2: (
      nx_node_titles[node1] == nx_node_titles[node2]
  )
  node_data_fn = lambda nodes : (
    nx_graph.nodes()[next(iter(nodes))]
  )
  # edge_data_fn = lambda edges : (
  #   nx_graph.edges()[next(iter(edges))]
  # )
  nx_graph = nx.quotient_graph(
    nx_graph, equiv_rel,
    node_data = node_data_fn,
    create_using = nx.MultiDiGraph
    # edge_data = edge_data_fn
  )

  # for node, title in nx_node_titles:
  #   for other_node, other_title in nx_node_titles:
  #     if title == other_title:
  #       nx_graph = nx.contracted_nodes(nx_graph, node, other_node, copy = False)
  #       nx_node_titles = nx_graph.nodes(data = 'title')

  # Ensure that the node labels in the output graph are consecutive.
  nx_graph = nx.convert_node_labels_to_integers(nx_graph)
  # print(nx_graph.nodes[0])
  return nx_graph

# We start with the root node that has a node_id, ie state number, of 0.
# For each node in our queue, we start with the index succ_index = 0 and loop
# until new_node = getNextState(curr_node, succ_index) is -1.
# When that happens, we have exhausted all successors.
# For each successor we encounter until that point, we add it to our queue
# to visit if it's not already visited.
# For each node we encounter, we look at the rule label corresponding to the
# edge.
# We leave 'tick' labels alone and convert 'action' labels to something of the
# form 'actorName does actionName', depending on the destination node.
# def rewrite_graph_to_graph(mod, rewrite_graph):
#   node_queue = pyrs.pdeque([0])
#   visited_nodes = pyrs.pset()
#   edges = pyrs.pset()
#   while len(node_queue) > 0:
#     curr_node = node_queue.left
#     node_queue = node_queue.popleft()
#     visited_nodes = visited_nodes.add(curr_node)
#     succ_index = 0
#     while True:
#       new_node = rewrite_graph.getNextState(curr_node, succ_index)
#       if new_node == -1: break
#       if new_node not in visited_nodes:
#         node_queue = node_queue.append(new_node)
#       # Do we need to handle transitions that don't have a rule label?
#       # What do they correspond to? Things like strategy applications?
#       # If so, then we should continue to ignore them and not expose them.
#       rule = rewrite_graph.getTransition(curr_node, new_node).getRule()
#       if rule:
#         rule_label = rule.getLabel()
#         match rule_label:
#           case 'tick':
#             rule_label = 'tick'
#           case 'action':
#             # Get the term corresponding to the new node's id and get the
#             # action transition.
#             new_node_term = get_state_term_str(rewrite_graph, new_node)
#             rule_label = eval_fn(mod, "getAction", new_node_term)
#         edges = edges.add(
#           Edge(src_id = curr_node, dest_id = new_node, rule_label = rule_label)
#         )
#       succ_index += 1
#   graph = edges_to_graph(mod, rewrite_graph, edges)
#   return graph

def rewrite_graph_to_nx_graph(mod, rewrite_graph):
  graph = rewrite_graph_to_graph(mod, rewrite_graph)
  nx_graph = graph_to_nx_graph(graph)
  return nx_graph

def term_strat_to_nx_graph(mod, term, strat):
  graph = create_graph(
    term = term, strategy = strat,
    purge_fails = 'yes',
    logic = ''
  )
  nx_graph = rewrite_graph_to_nx_graph(mod, graph)
  return nx_graph

def nx_graph_to_pyvis_netwk(nx_graph):
  netwk = Network(
    height = '800px', directed = True,
    select_menu = True, filter_menu = True,
    cdn_resources = 'remote',
    layout = 'hierarchical'
  )
  netwk.from_nx(nx_graph)
  netwk.options.layout.hierarchical.sortMethod = 'directed'
  netwk.options.layout.hierarchical.direction = 'LR'
  netwk.options.layout.hierarchical.nodeSpacing = 150
  return netwk

def term_strat_to_pyvis_netwk(mod, term, strat):
  nx_graph = term_strat_to_nx_graph(mod, term, strat)
  pyvis_netwk = nx_graph_to_pyvis_netwk(nx_graph)
  return pyvis_netwk

def init_maude_n_load_main_file(main_file):
  maude.init(loadPrelude = False)
  with open(main_file) as f:
    maude.input(f.read())
  main_mod = maude.getModule('MAIN')
  return main_mod

def parse_natural4_file(main_mod, natural4_file):
  natural4_rules = ''
  with open(natural4_file) as f:
    natural4_rules = f.read()
  natural4_rules = main_mod.parseTerm(natural4_rules)
  return natural4_rules

def natural4_rules_to_config(main_mod, natural4_rules):
  transpiled_term = apply_fn(main_mod, 'init', natural4_rules)
  return transpiled_term

def config_to_html_file(main_mod, config, strat, html_file_path):
  strat = main_mod.parseStrategy(strat)
  netwk = term_strat_to_pyvis_netwk(main_mod, config, strat)
  netwk.show_buttons()

  # html_file = workdir / f'{natural4_file.stem}.html'
  html_file_path = str(html_file_path)
  netwk.write_html(html_file_path)

def natural4_rules_to_race_cond_traces(main_mod, natural4_rules, max_traces = 1):
  race_cond_strat = pipe(
    natural4_rules,
    escape_ansi,
    lambda x: main_mod.parseStrategy(f'raceCond(({x}))')
  )

  # action = main_mod.parseTerm("'party0 does 'action0")
  # action = escape_ansi(action)
  # race_cond_strat = main_mod.parseStrategy(f'raceCondActionEvent({action})')
  # print(f'race_cond_strat: {race_cond_strat}')

  target_config = main_mod.parseTerm('config:Configuration')
  race_cond_solns = pipe(
    natural4_rules,
    apply_fn(main_mod, 'init'),
    lambda x: x.search(
      maude.NORMAL_FORM, target_config, strategy = race_cond_strat
    ),
    take(max_traces),
    list
  )

  # race_cond_path is a list of terms and transitions as in:
  # https://fadoss.github.io/maude-bindings/#maude.StrategySequenceSearch.pathTo
  race_cond_paths = pipe(
    race_cond_solns,
    map(lambda soln : soln[2]()),
    pyrs.pvector
  )
  print(f'race_cond_paths: {race_cond_paths}')
  # curr_state = race_cond_path[0]
  # for index in range(1, len(race_cond_path) - 2):
  #   pass
  return race_cond_paths

def main_file_term_strat_to_html_file(main_file, natural4_file, html_file_path, strat = 'all *'):
  main_mod = init_maude_n_load_main_file(main_file)
  natural4_rules = parse_natural4_file(main_mod, natural4_file)
  natural4_rules = escape_ansi(natural4_rules)
  config = natural4_rules_to_config(main_mod, natural4_rules)
  config_to_html_file(main_mod, config, strat, html_file_path)

if __name__ == '__main__':
  natural4_file = Path(sys.argv[1])
  # strat = sys.argv[2] if len(sys.argv) >= 3 else 'all *'
  strat = 'all *'

  contractdir = Path(__file__).parent.parent
  
  # transpile_sh = contractdir / 'scripts' / 'transpile-main.sh'
  # subprocess.call([transpile_sh])

  workdir = contractdir / '.workdir'

  main_file = workdir / 'main.maude'
  html_file_path = workdir /  f'{natural4_file.stem}.html'

  main_mod = init_maude_n_load_main_file(main_file)
  natural4_rules = parse_natural4_file(main_mod, natural4_file)
  natural4_rules = escape_ansi(natural4_rules)
  config = natural4_rules_to_config(main_mod, natural4_rules)
  config_to_html_file(main_mod, config, strat, html_file_path)

  race_cond_path = natural4_rules_to_race_cond_traces(main_mod, natural4_rules)

  # main_file_term_strat_to_html_file(main_file, natural4_file, html_file_path, strat)

  # Experiments with Jaal.
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