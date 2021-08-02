% Here are some examples where sCASP gets into an infinite loop.

% This goes into an infinite loop
a(X1):-X1#=X+1,a(X),time(X).
d(X):-not a(X),time(X).
?- d(1).

% However this does not go into an infinite loop. This shows that order of body atoms matters in sCASP, which it shouldn't in a declarative language.

a(X1):-X1#=X+1,time(X),a(X).
d(X):-not a(X),time(X).
?- d(1).

% The program below goes into an infinite loop regrdless of order.
b(0).
b(1).
b(2).
a(X1):-X1#=X+1,X#<5,a(X).
d(X):-b(X),not a(X).
?- d(1).

% All the programs above are accepted by CLINGO. The first and third programs above stall because of issues with recursive loops.  The the third one in particular seems to point to a
% a fundamental problem with trying to fully 'justify' negated atoms. Namely that a finite model could correspond to an infinite justification tree.
