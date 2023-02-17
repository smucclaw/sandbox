import maude
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
    print(f'Proving formula: {smt_formula}')
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
  maude.init()
  maude.load('smt-test')
  mod = maude.getModule('SMT-TEST')

  check_smt_hook = CheckSMTHook()
  maude.connectEqHook('smtCheck',  check_smt_hook)

  term = 'initialState'
  term = mod.parseTerm(term)
  term.rewrite()
  print(term)

  # t = 'smtCheck(testPred)'
  # t = mod.parseTerm(t)
  # t.reduce()

  ltl_formula = 'ltlFormula'
  ltl_formula = mod.parseTerm(ltl_formula)

  # graph = maude.RewriteGraph(term)
  # model_check_result = graph.modelCheck(ltl_formula)

  # if model_check_result.holds:
  #   print('Model checking succeeded!')
  # else:
  #   print('Model checking failed. Here\'s a countereg: ')
  #   print(model_check_result.leadIn)
  #   print(model_check_result.cycle)