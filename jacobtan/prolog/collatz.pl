:- use_module(library(clpfd)).

hailstone(N, N).
hailstone(N0, N) :-
        N0 #= 2*N1,
        hailstone(N1, N).
hailstone(N0, N) :-
        N0 #= 2*_ + 1,
        N1 #= 3*N0 + 1,
        hailstone(N1, N).