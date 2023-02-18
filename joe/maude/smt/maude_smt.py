import maude
from umaudemc.grapher import DOTGrapher
from umaudemc.wrappers import FailFreeGraph

import z3

from smt_converter import SMTConverter

class CheckSMTHook(maude.Hook):
  def run(self, term, data):
    module = term.symbol().getModule()
    smt_converter = SMTConverter(module)
    smt_converter.load_boolean()
    smt_converter.load_real_integer()

    argument, = term.arguments()
    argument.reduce()

    smt_formula = smt_converter.translate(argument)
    # print(f'Proving formula: {smt_formula}')
    solver = z3.Solver()
    solver.add(z3.Not(smt_formula))
    # solver.set(unsat_core = True)
    result = None
    match solver.check():
      case z3.unsat:
        result = 'Proved'
      case z3.sat:
        result = f'Disproved "{solver.model()}"'
    result = module.parseTerm(result)
    return result

if __name__ == '__main__':
  maude.init(loadPrelude = False)
  # maude.load('smt-test')
  # mod = maude.getModule('SMT-TEST')

  maude.load('financial-advisor-core-maude.maude')
  mod = maude.getModule('FINANCIAL-ADVISOR')

  check_smt_hook = CheckSMTHook()
  maude.connectEqHook('smtCheck',  check_smt_hook)

  maude.input('set print attribute on .')

  # term = 'initialState'
  term = 'investStrat(testPerson)'
  term = mod.parseTerm(term)
  term.reduce()
  # rewrite_graph = maude.RewriteGraph(term)
  # rewrite_graph = FailFreeGraph(rewrite_graph)
  # DOTGrapher().graph(rewrite_graph)

  # ltl_formula = 'ltlFormula'
  # ltl_formula = mod.parseTerm(ltl_formula)

  # graph = maude.RewriteGraph(term)
  # model_check_result = graph.modelCheck(ltl_formula)

  # if model_check_result.holds:
  #   print('Model checking succeeded!')
  # else:
  #   print('Model checking failed. Here\'s a countereg: ')
  #   print(model_check_result.leadIn)
  #   print(model_check_result.cycle)