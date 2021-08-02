% Generating justification graph ,un-ground example

g(1,2).
time(0..3).
a(X+1):-a(X),time(X+1).
a(X):-g(X,Y).
b(X+1):-a(X).
d(X):-not b(X),a(X).

explains(pos,fact,g(1,2),N+1):-g(1,2), query(g(1,2),N).
explains(pos,fact,time(0),N+1):-time(0), query(time(0),N).
explains(pos,fact,time(1),N+1):-time(1), query(time(1),N).
explains(pos,fact,time(2),N+1):-time(2), query(time(2),N).
explains(pos,fact,time(3),N+1):-time(3), query(time(3),N).


explains(pos,a(X),a(X+1),N+1):-a(X+1),a(X),time(X+1), query(a(X+1),N).
explains(pos,time(X+1),a(X+1),N+1):-a(X+1),a(X),time(X+1), query(a(X+1),N).


explains(pos,g(X,Y),a(X),N+1):-a(X),g(X,Y),query(a(X),N).
explains(pos,a(X),b(X+1),N+1):-a(X),b(X+1),query(b(X+1),N).


explains(pos,a(X),d(X),N+1):-d(X),not b(X),a(X), query(d(X),N).
explains(neg,b(X),d(X),N+1):-d(X),not b(X),a(X), query(d(X),N).



query(X,N):-explains(pos,X,Y,N),level(N+1),X!=fact.
directedEdge(Sgn,X,Y):-explains(Sgn,X,Y,M).

level(0..6).
query(d(1),0).
#show directedEdge/3.
