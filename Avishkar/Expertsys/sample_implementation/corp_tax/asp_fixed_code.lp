% Stock code

query(C,0):-generate_q(C).
%query(C1,0):-generate_q(C),opposes(C,C1).
%query(C1,0):-according_to(R,C),opposes(C,C1).

gen_graph(defeated(R,C)):-defeated(R,C).
gen_graph(legally_holds(C)):-generate_q(C).
query(C1,N):-query(C,N),opposes(C,C1).



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



not_leaf(X):-query(X,N),explains(Z,X,N+1).
abducible(leaf,X,N):-query(X,N),not not_leaf(X).
abducible(nleaf,X,N):-query(X,N),not_leaf(X).



ask(X,N):-abducible(leaf,X,N).
ask(X,N):-abducible(nleaf,X,N),N>=M,min_q_level(M).


max_q_level(N):-not q_level(N+1),q_level(N),N>0.


% Integrate with main program

{choose(X,N-M)}:-ask(X,M),max_q_level(N).
legally_holds(X):-choose(X,K).
ask_user(X):-choose(X,M).
legally_holds(X):-user_input(pos,X).
:-user_input(neg,X),legally_holds(X).

:~choose(X,M).[1@M,X,M]

caused_by(pos,overrides(R1,R2),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).
caused_by(pos,according_to(R2,C2),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).
caused_by(pos,legally_enforces(R1,C1),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).
caused_by(pos,opposes(C1,C2),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).


caused_by(pos,according_to(R,C),legally_enforces(R,C),N+1):-legally_enforces(R,C),according_to(R,C),not defeated(R,C),justify(legally_enforces(R,C),N).
caused_by(neg,defeated(R,C),legally_enforces(R,C),N+1):-legally_enforces(R,C),according_to(R,C),not defeated(R,C),justify(legally_enforces(R,C),N).


caused_by(pos,legally_enforces(R,C),legally_holds(C),N+1):-legally_holds(C),legally_enforces(R,C),not user_input(pos,C), justify(legally_holds(C),N).

caused_by(pos,user_input(pos,C),legally_holds(C),N+1):-legally_holds(C), user_input(pos,C), justify(legally_holds(C),N).

justify(X,N):-caused_by(pos,X,Y,N),graph_level(N+1), not user_input(pos,X).
directedEdge(Sgn,X,Y):-caused_by(Sgn,X,Y,M).

graph_level(0..N):-max_graph_level(N).

justify(X,0):-gen_graph(X).
