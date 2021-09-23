%Expert System Propositional example

% Determine the truth value of 'a'
query(a,0).

% Original program
holds(a):-holds(b).
holds(a):-holds(f).
holds(b):-holds(c), not holds(d).
holds(d):-not holds(e).

% Generating abducibles
explains(b,a,N+1):-query(a,N).
explains(f,a,N+1):-query(a,N).
explains(c,b,N+1):-query(b,N).
explains(d,b,N+1):-query(b,N).
explains(e,d,N+1):-query(d,N).

query(X,N):-explains(X,Y,N),level(N).
level(N+1):-query(X,N).
maxlevel(N):-not level(N+1),level(N),N>0.

not_leaf(X):-explains(X,Y,N),explains(Z,X,N+1).
node(leaf,X,N):-explains(X,Y,N),not not_leaf(X).
node(nleaf,X,N):-explains(X,Y,N),not_leaf(X).

ask(X,N):-node(leaf,X,N).
ask(X,N):-node(nleaf,X,N),N>0.

{ab(X,N-M)}:-ask(X,M),maxlevel(N).
user_input(X):-ab(X,M).

holds(X):-user_input(X).

% Integrity Constraints
:-not holds(a).

%:-holds(a).

:~ab(X,M).[1@M,X,M]

%:-holds(f).
%holds(e).
%holds(c).
%holds(d).


#show user_input/1.
