

person(alice).
person(bob).
person(charlie).
person(debbie).

friend(alice, bob).
friend(bob, charlie).
friend(charlie, debbie).

everyPersonHasAFriend :- forall(person(X), (friend(X, _) ; friend(_, X))).

bff(alice, bob).
bff(bob, charlie).
bff(charlie, alice).

everyPersonHasABFF    :- forall(person(X), (bff(X, _)    ; bff(_, X))).

% it is written that every person has a daemon.

hasDaemon(X, _) :- person(X).

everyPersonHasDaemon :- forall(person(X), hasDaemon(X, _)).

%% ?- hasDaemon(alice, _).
%% true.
