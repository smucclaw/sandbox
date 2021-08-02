% Method for generating justification graphs for logic programs

% Generating explainations, ground program.
% Original program
b.
a:-b,c.
c:-not d.

% Reverse each rule from original program. These rules should be amenable to algorithmic generation
explains(pos,fact,b,N+1):-b, query(b,N).
explains(pos,b,a,N+1):-a,b,c, query(a,N).
explains(pos,c,a,N+1):-a,b,c, query(a,N).
explains(neg,d,c,N+1):-c,not d, query(c,N).

% Generate query atoms for positive non- 'fact' atoms until max level is reached. Any negated atom or fact is treated as a terminal node.
query(X,N):-explains(pos,X,Y,N),level(N+1),X!=fact.

% Specify depth or 'max level' 
level(0..5).

% Initiate process with a root query 
query(a,0).

% Generate directed justification graph using the explains predicates
directedEdge(Sgn,X,Y):-explains(Sgn,X,Y,M).


% Generate full graph for the given query, while taking care of cycles.
generate_full_exp.
level(0):-generate_full_exp.

% Check for reeated edges at lower level
repeatedEdge(pos,X,Y,M):-explains(pos,X,Y,M),explains(pos,X,Y,M1),0<=M1,M1<M.

% Generate next level if not all positive atoms are facts or correspond to repeated edges
level(M+1):-explains(pos,X,Y,M),X!=fact,not repeatedEdge(pos,X,Y,M),generate_full_exp.

#Show directedEdge/3.

% This example is for a ground program, however the same method seems to work for an unground program or a program with constraints as well.



