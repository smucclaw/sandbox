% Stock code

query(C,0):-generate_q(C).
query(C1,0):-generate_q(C),opposes(C,C1).
query(C1,0):-according_to(R,C),opposes(C,C1).

gen_graph(defeated(R,C)):-defeated(R,C).
gen_graph(legally_holds(C)):-generate_q(C).




:-generate_q(C),not legally_holds(C),const(N),not opp_const(N+1).


:-generate_q(C),legally_holds(C),opp_const(N),not const(N+1).





defeated(R2,C2):-overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2).
opposes(C1,C2):-opposes(C2,C1).
legally_enforces(R,C):-according_to(R,C),not defeated(R,C).
legally_holds(C):-legally_enforces(R,C).
:-opposes(C1,C2),legally_holds(C1),legally_holds(C2).



query(X,N):-explains(X,Y,N),q_level(N).
%q_level(N+1):-query(X,N).
q_level(N+1):-query(X,N),max_query_lvl(M),N<M.


not_leaf(X):-explains(X,Y,N),explains(Z,X,N+1).
abducible(leaf,X,N):-explains(X,Y,N),not not_leaf(X).
abducible(nleaf,X,N):-explains(X,Y,N),not_leaf(X).



ask(X,N):-abducible(leaf,X,N).
ask(X,N):-abducible(nleaf,X,N),N>M,min_q_level(M).


max_q_level(N):-not q_level(N+1),q_level(N),N>0.


% Integrate with main program

:-legally_holds(X),change(X),user_input(pos,X).
legally_holds(X):-user_input(neg,X),change(X).
legally_holds(X):-abducible(leaf,X,N),not user_input(pos,X),change(X).
:-legally_holds(X),not change(X),user_input(neg,X).
legally_holds(X):-user_input(pos,X),not change(X).
{change(X)}:-user_input(Y,X).
{change(X)}:-abducible(leaf,X,N).

asserted(X):-user_input(neg,X),change(X).
asserted(X):-abducible(leaf,X,N),not user_input(pos,X),change(X).
asserted(X):-user_input(pos,X),not change(X).
:~change(X).[1@1,X]
%:-change(X),change_const(0).



caused_by(pos,overrides(R1,R2),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).
caused_by(pos,according_to(R2,C2),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).
caused_by(pos,legally_enforces(R1,C1),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).
caused_by(pos,opposes(C1,C2),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).


caused_by(pos,according_to(R,C),legally_enforces(R,C),N+1):-legally_enforces(R,C),according_to(R,C),not defeated(R,C),justify(legally_enforces(R,C),N).
caused_by(neg,defeated(R,C),legally_enforces(R,C),N+1):-legally_enforces(R,C),according_to(R,C),not defeated(R,C),justify(legally_enforces(R,C),N).


caused_by(pos,legally_enforces(R,C),legally_holds(C),N+1):-legally_holds(C),legally_enforces(R,C),not asserted(C), justify(legally_holds(C),N).

caused_by(pos,user_input(pos,C),legally_holds(C),N+1):-legally_holds(C), user_input(pos,C), not change(C),asserted(C), justify(legally_holds(C),N).

caused_by(pos,change(C),legally_holds(C),N+1):-legally_holds(C), not user_input(pos,C), change(C),asserted(C), justify(legally_holds(C),N).
justify(X,N):-caused_by(pos,X,Y,N),graph_level(N+1), not asserted(X).

directedEdge(Sgn,X,Y):-caused_by(Sgn,X,Y,M).

graph_level(0..N):-max_graph_level(N).

justify(X,0):-gen_graph(X).

%Generate partial graphs as well
justify(X,0):-explains(X,Y,M).
