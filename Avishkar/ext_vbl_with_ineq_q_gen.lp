%Original rule
% a(X):-b(X,Y),c(X,Y),X>Y.
holds(a(X)):-holds(b(X,Y)),holds(c(X,Y)),holds(ineq(X,Y)).
{ask_user(b(X,ext_vbl(X)))}:-query(a(X)).
{ask_user(c(X,ext_vbl(X)))}:-query(a(X)).
{ask_user(ineq(X,ext_vbl(X)))}:-query(a(X)).
holds(C):-user_input(pos,C).
holds(X):-ask_user(X).
holds(ineq(X,Y)):-holds(b(X,Y)),holds(c(X,Y)),X<Y.
:-user_input(pos,ineq(X,Y)).
:-query(a(X)),not holds(a(X)).
:~ask_user(X).[1@1,X]

query(a(2)).
user_input(pos,b(2,3)).
user_input(pos,c(2,3)).


#show ask_user/1.










%Original rule
% a(X):-b(X,Y),c(X,Y),X>Y.
holds(a(X)):-holds(b(X,Y)),holds(c(X,Y)),holds(ineq(X,Y)).
{ask_user(b(X,vbl(X)))}:-query(a(X)).
{ask_user(c(X,vbl(X)))}:-query(a(X)).
{ask_user(ineq(X,vbl(X)))}:-query(a(X)).
holds(C):-user_input(pos,C).
holds(X):-ask_user(X).
holds(ineq(X,Y)):-holds(b(X,Y)),holds(c(X,Y)),X>Y.
:-user_input(pos,ineq(X,Y)).
:-query(a(X)),not holds(a(X)).
:~ask_user(X).[1@1,X]

query(a(2)).
user_input(pos,b(2,0)).
user_input(pos,c(2,0)).

directedEdge(pos,holds(b(X,Y)),holds(a(X))):-holds(b(X,Y)),holds(c(X,Y)),holds(ineq(X,Y)).
directedEdge(pos,holds(c(X,Y)),holds(a(X))):-holds(b(X,Y)),holds(c(X,Y)),holds(ineq(X,Y)).
directedEdge(pos,holds(ineq(X,Y)),holds(a(X))):-holds(b(X,Y)),holds(c(X,Y)),holds(ineq(X,Y)).
#show ask_user/1.
#show directedEdge/3.











%Original rule
% a(X,Y):-b(X,Y),c(X,Y),X>Y.
holds(a(X,Y)):-holds(b(X,Y)),holds(c(X,Y)),X>Y.
{ask_user(b(X,Y))}:-query(a(X,Y)).
{ask_user(c(X,Y))}:-query(a(X,Y)).

holds(C):-user_input(pos,C).
holds(X):-ask_user(X).

:-user_input(pos,ineq(X,Y)).
:-query(a(X,Y)),not holds(a(X,Y)).
:~ask_user(X).[1@1,X]

query(a(2,3)).
%user_input(pos,b(2,3)).
%user_input(pos,c(2,3)).

directedEdge(pos,holds(b(X,Y)),holds(a(X,Y))):-holds(b(X,Y)),holds(c(X,Y)),X>Y.
directedEdge(pos,holds(c(X,Y)),holds(a(X,Y))):-holds(b(X,Y)),holds(c(X,Y)),X>Y.

#show ask_user/1.
%#show directedEdge/3.












according_to(s64_4, exceedsPrescrNumberOfIndividuals(Db)) :- legally_holds(numberOfAffectedIndividuals(Db,N)),legally_holds(ineq(Db,N)).

caused_by(pos, legally_holds(numberOfAffectedIndividuals(Db,N)), according_to(s64_4, exceedsPrescrNumberOfIndividuals(Db)), _N+1) :- according_to(s64_4, exceedsPrescrNumberOfIndividuals(Db)), legally_holds(numberOfAffectedIndividuals(Db,N)),legally_holds(ineq(DB,N)), justify(according_to(s64_4, exceedsPrescrNumberOfIndividuals(Db)), _N).
caused_by(pos, legally_holds(ineq(Db,N)), according_to(s64_4, exceedsPrescrNumberOfIndividuals(Db)), _N+1) :- according_to(s64_4, exceedsPrescrNumberOfIndividuals(Db)), legally_holds(numberOfAffectedIndividuals(Db,N)),legally_holds(ineq(DB,N)), justify(according_to(s64_4, exceedsPrescrNumberOfIndividuals(Db)), _N).

explains(numberOfAffectedIndividuals(Db,ext_vbl_1_1(Db)) , exceedsPrescrNumberOfIndividuals(Db), _N+1) :- query(exceedsPrescrNumberOfIndividuals(Db), _N).
explains(ineq(Db,ext_vbl_1_1(Db)) , exceedsPrescrNumberOfIndividuals(Db), _N+1) :- query(exceedsPrescrNumberOfIndividuals(Db), _N).

legally_holds(ineq(Db,N)):-legally_holds(numberOfAffectedIndividuals(Db,N)),N>=500.
