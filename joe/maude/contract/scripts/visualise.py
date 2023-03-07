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

import itertools as it

import pyrsistent as pyrs
from cytoolz.functoolz import *
from cytoolz.curried import *

import networkx as nx
from pyvis.network import Network

@curry
def trace_to_strat(mod, trace_str):
  return pipe(
    f'(rewriteTrace({trace_str}))',
    mod.parseStrategy
  )
  # strat = f"rewriteTrace({trace_str})"
  # strat = mod.parseStrategy(strat)
  # return strat

# https://stackoverflow.com/questions/14693701/how-can-i-remove-the-ansi-escape-sequences-from-a-string-in-python
@curry
def escape_ansi(term):
  term = str(term)
  return pipe(
    r'(?:\x1B[@-_]|[\x80-\x9F])[0-?]*[ -/]*[@-~]',
    re.compile,
    lambda ansi_escape: ansi_escape.sub('', term)
  )

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

def node_to_colour(node):
  if node.contract_status == 'Active': return 'blue'
  if node.contract_status == 'Fulfilled': return 'green'
  if node.contract_status == 'Breached': return 'red'

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
  fn = escape_ansi(fn)
  arg = escape_ansi(arg)
  return pipe(
    f'{fn}({arg})',
    mod.parseTerm,
    do(lambda term: term.reduce())
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
def node_term_to_contract_status(mod, node_term):
  return pipe(
    node_term,
    apply_fn_to_str(mod, 'configToStatus'),
    lambda x: 'Fulfilled' if x == '(Fulfilled).ContractStatus' else x
  )

@curry
def node_term_to_node(mod, node_term):
  return pipe(
    node_term,
    # juxt(apply_fn_to_str(mod, 'pretty'), node_term_to_contract_status),
    juxt(escape_ansi, node_term_to_contract_status(mod)),
    lambda x: Node(term_str = x[0], contract_status = x[1])
  )

@curry
def edges_to_node_map(mod, rewrite_graph, edges):
  node_id_to_node = compose_left(
    get_state_term_str(rewrite_graph),
    node_term_to_node(mod)
  )
  return pipe(
    edges,
    # [... edge ...]
    map(lambda edge: (edge.src_id, edge.dest_id)),
    # [... (src_id, dest_id) ...]
    concat,
    # [... src_id, dest_id ...]
    map(juxt(identity, node_id_to_node)),
    # [... (src_id, Node_src_id), (dest_id, Node_dest_id)]
    pyrs.pmap
    # {... src_id: Node_src_id, dest_id: Node_dest_id ...}
  )

# Here we assume that rewrite_graph is an expanded fail-free graph.
# See: https://github.com/fadoss/umaudemc/blob/master/umaudemc/wrappers.py
# def rewrite_graph_to_graph(mod, rewrite_graph):
#   edges = pyrs.pset()
#   for node_id in range(rewrite_graph.getNrStates()):
#     succ_ids = rewrite_graph.getNextStates(node_id)
#     for succ_id in succ_ids:
#       # Do we need to handle transitions that don't have a rule label?
#       # What do they correspond to? Things like strategy applications?
#       # If so, then we should continue to ignore them and not expose them.
#       rule = rewrite_graph.getTransition(node_id, succ_id).getRule()
#       if rule:
#         rule_label = rule.getLabel()
#         if rule_label == 'tick': rule_label = '1 day'
#         if rule_label == 'action':
#          # the term corresponding to the succ_id node and get the
#          # action transition.
#           new_node_term = get_state_term_str(rewrite_graph, succ_id)
#           rule_label = apply_fn_to_str(mod, 'getAction', new_node_term)
#         edges = edges.add(
#           Edge(src_id = node_id, dest_id = succ_id, rule_label = rule_label)
#         )
#   node_map = edges_to_node_map(mod, rewrite_graph, edges)
#   graph = Graph(node_map = node_map, edges = edges)
#   return graph

@curry
def to_rule_label(mod, dest_node, rule_label):
  if rule_label == 'tick':
    return '1 day'
  if rule_label == 'action':
    return pipe(
      dest_node,
      # get_state_term_str(rewrite_graph),
      apply_fn_to_str(mod, 'getAction')
    )

@curry
def edge_pair_to_edge(mod, rewrite_graph, edge_pair):
  # TODO: Implement a proper Option type
  return pipe(
    edge_pair,
    lambda edge:
      # (edge[0], edge[1], rewrite_graph.getTransition(*edge).getRule()),
      (edge[0], edge[1], rewrite_graph.getRule(*edge)),
    # [... (n, succ, rule), ...]
    lambda edge:
      (edge[0], edge[1],
        to_rule_label(mod, get_state_term_str(rewrite_graph, edge[1]), edge[2].getLabel()))
      if edge[2] != None else None,
    # [... (n, succ, rule_label), ...]
    lambda edge:
      Edge(src_id = edge[0], dest_id = edge[1], rule_label = edge[2])
      if edge != None else None
    # [... Edge ...]
  )

# Based on:
# https://github.com/fadoss/umaudemc/blob/master/umaudemc/wrappers.py#L77
# def expand_rewrite_graph(rewrite_graph, state=0):
#   # Stack for the depth-first search
#   # (state index, child index, whether the state is already valid)
#   stack = [0]
#   seen_states = []

#   while stack:
#     state = stack.pop()
#     seen_states.append(state)

#     index = 0
#     next_state = rewrite_graph.getNextState(state, index)

#     # No more successors
#     if next_state == -1:
#       # If no valid successor has been reached, the
#       # state is not valid unless it is a solution
#       valid_child = valid or self.graph.isSolutionState(state)
#       self.valid_states[state] = valid_child

#     # A new state, process it
#     elif next_state >= len(self.valid_states):
#       self.valid_states.append(True)
#       stack.append((state, index + 1, valid))
#       stack.append((next_state, 0, False))

#     # The child is a known state
#     # (if it is valid or in the path, then this state is valid)
#     else:
#       stack.append((state, index + 1, valid or self.valid_states[next_state]))

# repeat = iterate(identity)

# BFS to explore all edges in a rewrite graph.
def rewrite_graph_to_edge_pairs(rewrite_graph):
  seen_ids = pyrs.pset([0])
  next_ids = pyrs.pdeque([0])

  while next_ids:
    curr_id = next_ids.left
    next_ids = next_ids.popleft()
    for succ_id in rewrite_graph.getNextStates(curr_id):
      if succ_id not in seen_ids:
        seen_ids = seen_ids.add(succ_id)
        next_ids = next_ids.append(succ_id)
      yield (curr_id, succ_id)

    # next_ids = pipe(
    #   next_ids,
    #   lambda q: q.popleft(),
    #   lambda q: q.extend(to_edge_pairs(seen_ids, curr_id))
    # )

@curry
def rewrite_graph_to_graph(mod, rewrite_graph):
  return pipe(
    # rewrite_graph.getNrStates(),
    # num_states
    # range,
    # [0 ... n ...]
    # map(juxt(repeat, rewrite_graph.getNextStates)),
    # [... ((n, n, ...), (succ0, succ1, ..., succm)) ...]
    # map(lambda x: zip(*x)),
    # [... ((n, succ0), (n, succ1), ..., (n, succm)) ...]
    # concat,
    # do(lambda x: print(list(take(57, x)))),
    # do(lambda _: print(list(rewrite_graph.getNextStates(27)))),
    # lambda iterable: it.takewhile(lambda xy: xy[1] >= 0, iterable),
    rewrite_graph,
    rewrite_graph_to_edge_pairs,
    # [... (n, succ) ...]
    map(edge_pair_to_edge(mod, rewrite_graph)),
    # [... Edge ...]
    filter(lambda edge: edge != None),
    pyrs.pset,
    # {... Edge ...}
    juxt(identity, edges_to_node_map(mod, rewrite_graph)),
    # ({... Edge ...}, node_map)
    lambda x: Graph(edges = x[0], node_map = x[1]),
    do(lambda g:
       print(f'Size of state space before quotiening: {len(g.node_map), len(g.edges)}'))
  )

@curry
def graph_to_nx_graph(mod, graph):
  node_to_nx_metadata = lambda node: {
    'title': apply_fn_to_str(mod, 'pretty', node.term_str),
    'contract_state': node.contract_status,
    'color': node_to_colour(node)
  }

  nodes = pipe(
    graph.node_map,
    # [... {node_id: Node} ...]
    valmap(node_to_nx_metadata),
    # [... {node_id: node_metadata} ...]
    lambda node_map: node_map.items()
    # [... (node_id, node_metadata) ...]
  )

  edge_to_nx_metadata = lambda edge: {
    'label': edge.rule_label,
    'next_state': edge_to_next_state(graph, edge),
    'color': edge_to_colour(graph, edge)
  }

  edges = pipe(
    graph.edges,
    # [... Edge ...]
    map(lambda edge:
        (edge.src_id, edge.dest_id, edge_to_nx_metadata(edge))),
    # [... (src_id, dest_id, edge_metadata) ...]
  )

  nx_graph = pipe(
    nx.DiGraph(),
    do(lambda nx_graph: nx_graph.add_nodes_from(nodes)),
    do(lambda nx_graph: nx_graph.add_edges_from(edges))
  )

  # nx_graph = nx.DiGraph()
  # for node_id, node in graph.node_map.items():
  #   nx_graph.add_node(
  #     node_id,
  #     # Do we want title or label?
  #     # Title can contain html and only shows when hovering over the node.
  #     # Label is visible all the time.
  #     title = node.term_str,
  #     contract_state = node.contract_status,
  #     color = node_to_colour(node)
  #   )
  # for edge in graph.edges:
  #   nx_graph.add_edge(
  #     edge.src_id, edge.dest_id,
  #     label = edge.rule_label,
  #     next_state = edge_to_next_state(graph, edge),
  #     color = edge_to_colour(graph, edge)
  #   )

  # Quotient states by same title, to merge states that have different global time.
  nx_node_titles = nx_graph.nodes(data = 'title')
  equiv_rel = lambda node1, node2: (
    nx_node_titles[node1] == nx_node_titles[node2]
  )
  node_data_fn = lambda nodes : nx_graph.nodes()[next(iter(nodes))]

  return pipe(
    nx_graph,
    lambda x: nx.quotient_graph(
      x, equiv_rel, node_data = node_data_fn, create_using = nx.MultiDiGraph
    ),
    # Ensure that the node labels in the output graph are consecutive.
    nx.convert_node_labels_to_integers
  )

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

@curry
def rewrite_graph_to_nx_graph(mod, rewrite_graph):
  return pipe(
    (mod, rewrite_graph),
    lambda x: rewrite_graph_to_graph(*x),
    graph_to_nx_graph(mod)
  )

@curry
def term_strat_to_nx_graph(mod, term, strat):
  return pipe(
    create_graph(
      term = term, # strategy = strat,
      # purge_fails = 'yes',
      logic = ''
    ),
    rewrite_graph_to_nx_graph(mod)
  )

def nx_graph_to_pyvis_network(nx_graph):
  netwk = Network(
    height = '800px', directed = True,
    select_menu = True, filter_menu = True,
    cdn_resources = 'remote',
    layout = 'hierarchical'
  )
  netwk.options.layout.hierarchical.sortMethod = 'directed'
  netwk.options.layout.hierarchical.nodeSpacing = 150
  netwk.show_buttons()
  netwk.from_nx(nx_graph)
  return netwk

def nx_state_space_to_pyvis_netwk(nx_state_space):
  netwk = nx_graph_to_pyvis_network(nx_state_space)
  netwk.options.layout.hierarchical.direction = 'LR'
  return netwk

def nx_trace_to_pyvis_netwk(nx_trace):
  netwk = nx_graph_to_pyvis_network(nx_trace)
  netwk.options.layout.hierarchical.direction = 'UD'
  return netwk

@curry
def term_strat_to_pyvis_netwk(mod, term, strat):
  return pipe(
    (mod, term, strat),
    lambda x: term_strat_to_nx_graph(*x),
    nx_state_space_to_pyvis_netwk
  )

def init_maude_n_load_main_file(main_file):
  maude.init(loadPrelude = False)
  with open(main_file) as f:
    maude.input(f.read())
  main_mod = maude.getModule('MAIN')
  return main_mod

@curry
def parse_natural4_file(main_mod, natural4_file):
  natural4_rules = ''
  with open(natural4_file) as f:
    natural4_rules = f.read()
  return pipe(
    natural4_rules,
    main_mod.parseTerm
  )

@curry
def natural4_rules_to_config(main_mod, natural4_rules):
  return pipe(
    natural4_rules,
    apply_fn(main_mod, 'init')
  )

@curry
def config_to_html_file(main_mod, config, strat, html_file_path):
  netwk = pipe(
    strat,
    main_mod.parseStrategy,
    term_strat_to_pyvis_netwk(main_mod, config)
  )

  # html_file = workdir / f'{natural4_file.stem}.html'
  pipe(
    html_file_path,
    str,
    netwk.write_html
  )

@curry
def race_cond_path_to_graph(mod, race_cond_path):
  # race_cond_path is a path of the form
  # https://fadoss.github.io/maude-bindings/#maude.StrategySequenceSearch.pathTo
  # ie, [state_0, trans_01, state_1, ..., state_n]

  node_id_to_term_map = pipe(
    race_cond_path,
    # [state_0, trans_01, state_1 ... state_n]
    take_nth(2),
    # [state_0, state_1 ... state_n]
    # map(apply_fn_to_str(mod, 'pretty')),
    enumerate,
    # [(0, state_0), (1, state_1) ... (n, state_n)]
    pyrs.pmap
  )

  node_term_to_id_map = pipe(
    node_id_to_term_map.items(),
    map(reversed),
    pyrs.pmap
  )

  edges = pipe(
    race_cond_path,
    # [state_0, trans_01, state_1 ... state_n]
    sliding_window(3),
    # [(state_0, trans_01, state_1), (trans_01, state_1, trans_12), (state_1, trans_12, state_2) ...]
    take_nth(2),
    # [(state_0, trans_01, state_1), (state_1, trans_12, state_2) ...]
    map(lambda e: 
        Edge(
          src_id = node_term_to_id_map[e[0]],
          dest_id = node_term_to_id_map[e[2]],
          rule_label = to_rule_label(mod, e[2], e[1].getRule().getLabel())))
    # [... Edge(src_id, dest_id, rule_label) ...]
  )

  node_map = pipe(
    node_id_to_term_map.items(),
    map(lambda kv: (kv[0], node_term_to_node(mod, kv[1]))),
    # valmap(node_term_to_node(mod), factory=dict),
    pyrs.pmap
  )

  return Graph(node_map = node_map, edges = edges)

@curry
def natural4_rules_to_race_cond_graphs(main_mod, natural4_rules, max_traces = 1):
  race_cond_strat = pipe(
    natural4_rules,
    escape_ansi,
    lambda rules: main_mod.parseStrategy(f'raceCond(({rules}))')
  )

  target_config = main_mod.parseTerm('c:Configuration')

  return pipe(
    natural4_rules,
    apply_fn(main_mod, 'init'),
    lambda config: config.search(
      maude.NORMAL_FORM, target_config, strategy = race_cond_strat
    ),
    take(max_traces),
    # https://fadoss.github.io/maude-bindings/#maude.StrategySequenceSearch.pathTo
    map(lambda soln: soln[2]()),
    # If the length of the path is <= 1, then there is no race condition and so
    # we don't generate a graph for it.
    filter(lambda path: len(path) > 1),
    map(race_cond_path_to_graph(main_mod)),
    pyrs.pvector
  )

@curry
def natural4_rules_to_race_cond_htmls(mod, html_file_path, natural4_rules, max_traces = 1):
  write_race_cond_netwk_to_html = lambda index, netwk: pipe(
    html_file_path,
    lambda f: f.parent / f'{f.stem}_{index}.html',
    str,
    netwk.write_html
  )

  pipe(
    (mod, natural4_rules),
    lambda x: natural4_rules_to_race_cond_graphs(*x, max_traces = max_traces),
    # [... race_cond_graph ... ]
    map(graph_to_nx_graph(mod)),
    # [... race_cond_nx_graph ...]
    map(nx_trace_to_pyvis_netwk),
    # [... race_cond_pyvis_netwk ...]
    enumerate,
    # [... (index, race_cond_pyvis_netwk) ...]
    map(lambda x: write_race_cond_netwk_to_html(*x)),
    # [... IO action ...]
    list # sequence, aka force all the IO actions to run.
  )

@curry
def main_file_term_strat_to_html_file(main_file, natural4_file, html_file_path, strat = 'all *'):
  main_mod = init_maude_n_load_main_file(main_file)
  pipe(
    natural4_file,
    parse_natural4_file(main_mod),
    escape_ansi,
    natural4_rules_to_config(main_mod),
    lambda config: config_to_html_file(main_mod, config, strat, html_file_path)
  )
  # natural4_rules = parse_natural4_file(main_mod, natural4_file)
  # natural4_rules = escape_ansi(natural4_rules)
  # config = natural4_rules_to_config(main_mod, natural4_rules)
  # config_to_html_file(main_mod, config, strat, html_file_path)

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

  natural4_rules_to_race_cond_htmls(main_mod, workdir / 'race_cond', natural4_rules)

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