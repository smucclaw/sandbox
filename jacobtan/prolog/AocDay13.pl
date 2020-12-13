:- use_module(library(clpfd)).

ans(N) :-
  N #= 67 * _,
  true,
  N + 2 #= 7 * _,
  N + 3 #= 59 * _,
  N + 4 #= 61 * _.

% doesn't work lol