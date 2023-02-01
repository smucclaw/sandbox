umaudemc graph \
  prolog.maude \
  "< 'no-children('erica) | family ; negation-bycut ; 'no-children(x{1}) :- '\+('parent[x{1}, x{2}]) >" \
  solve \
  | dot -Tsvg -o out.svg