from pathlib import Path
import re
# import sys

import maude
# import clingo
# import pgf

import pyrsistent as pyrs
from cytoolz.functoolz import *
from cytoolz.curried import *
# import itertools as it

@curry
def escape_ansi(term):
  term = str(term)
  return pipe(
    r'(?:\x1B[@-_]|[\x80-\x9F])[0-?]*[ -/]*[@-~]',
    re.compile,
    lambda ansi_escape: ansi_escape.sub('', term)
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

def parse_term_containing_qids(term):
  replace_fn = lambda match: pipe(
    match,
    lambda x: x.group(0),
    lambda x: x[1:],
    lambda x: x.upper()
  )
  return pipe(
    term,
    escape_ansi,
    lambda x: re.sub(r'`.', replace_fn, x),
    lambda x: x.replace("'", '')
  )

# def term_to_prefix_replace_fn(args_iter, match):
#   for match in match.group(0):
#     next(args_iter)

def term_to_prefix(term):
  pred = term.symbol()

  range_sort = pipe(pred, lambda x: x.getRangeSort(), str)
  result = term

  if range_sort not in pyrs.s(
    'Bool', 'Nat', 'NzNat', 'Int', 'NzInt', 'Rat', 'NzRat'
  ):
    # Depth first traversal over the arguments of the term.
    args = pipe(
      term,
      lambda x: x.arguments(),
      map(term_to_prefix)
    )

    goal_goallist = pyrs.s('Goal', 'GoalList')

    if range_sort in goal_goallist.add('LogicProgram'):
      if range_sort in goal_goallist:
        result = ', '.join(args)
      if range_sort == 'Goal':
        result = f'{pred}({result})' if args else str(pred)
      if range_sort == 'LogicProgram':
        result = ' '.join(args)
    else:
      result = pipe(
        pred,
        escape_ansi,
        lambda x: re.sub(r'_', lambda _: next(args), x)
      )

  return parse_term_containing_qids(result)

if __name__ == '__main__':
  maude.init()
  maude.load('maude/main.maude')
  main_mod = maude.getModule('MAIN')

  term = main_mod.parseTerm('eg0')
  term.reduce()

  eqns = pipe(
    term,
    parse_term_containing_qids,
    lambda x: re.sub(r'•', '', x),
    lambda x: re.sub(r' +', ' ', x),
    lambda x: re.sub(r'\.', '.\n', x),
    lambda x: f'{x} .',
  )

  print(eqns)

  # term = test_mod.parseTerm('X is employed by Y')
  # print(term.symbol().getIdHooks())
  # print(term.prettyPrint(maude.PRINT_FORMAT))

  # Transpile to a logic program and use Clingo to check for satisfiability.
  # ctl = clingo.Control()

  # pipe(
  #   'testProgram',
  #   test_mod.parseTerm,
  #   apply_fn(test_mod, 'fromNatural'),
  #   do(lambda x: print(f'Natural language mixfix:\n {x}\n')),
  #   term_to_prefix,
  #   do(lambda x: print(f'ASP prefix form:\n {x}\n')),
  #   lambda s: s.replace("'", ""),
  #   do(lambda x: ctl.add('test', [], x))
  # )

  # print(f'Clingo answer: {ctl.solve()}\n')

  # # Transpile to GF abstract grammar
  # pipe(
  #   test_mod.parseTerm("upModule('TEST, false)"),
  #   apply_fn(test_mod, 'maude->gf'),
  #   parse_term_containing_qids,
  #   do(lambda x: print(f'GF abstract syntax:\n {x}'))
  # )