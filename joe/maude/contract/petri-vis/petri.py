from pathlib import Path
import re
import sys

import maude
import snakes.plugins
snakes.plugins.load('gv', 'snakes.nets', 'nets')
import nets as pn

import pyrsistent as pyrs
from cytoolz.functoolz import *
from cytoolz.curried import *
import itertools as it


@curry
def parse_natural4_file(main_mod, natural4_file):
  natural4_rules = ''
  with open(natural4_file) as f:
    natural4_rules = f.read()
  return pipe(
    natural4_rules,
    main_mod.parseTerm
  )

# https://stackoverflow.com/questions/14693701/how-can-i-remove-the-ansi-escape-sequences-from-a-string-in-python
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

if __name__ == '__main__':
  natural4_file = Path(sys.argv[1])

  maude.init()
  with open('petri.maude') as f:
    maude.input(f.read())
  
  petri_mod = maude.getModule('PETRI')
  petri_net = pipe(
      natural4_file,
      parse_natural4_file(petri_mod),
      do(lambda x: x.rewrite()),
      apply_fn(petri_mod, 'filterPetri'),
      escape_ansi,
      lambda x: x.split(', ')
  )

  snakes_net = pn.PetriNet('Petri net')
  counter = 0
  trans = {}
  for triple in petri_net:
    src = f'{apply_fn(petri_mod, "triple->src", triple)}'
    dest = f'{apply_fn(petri_mod, "triple->dest", triple)}'
    done_or_not = f'{apply_fn(petri_mod, "triple->doneOrNot", triple)}'

    try:
      snakes_net.add_place(pn.Place(src))
    except pn.ConstraintError:
      pass

    try:
      snakes_net.add_place(pn.Place(dest))
    except pn.ConstraintError:
      pass

    if src in trans and done_or_not in trans[src]:
      done_or_not_counter = trans[src][done_or_not]
    else:
      done_or_not_counter = f'{done_or_not} {counter}'
      snakes_net.add_transition(pn.Transition(done_or_not_counter, None))
      snakes_net.add_input(src, done_or_not_counter, pn.Value(''))
      trans[src] = {done_or_not: done_or_not_counter}

    snakes_net.add_output(dest, done_or_not_counter, pn.Value(''))
    counter += 1

  snakes_net.draw('out.svg')