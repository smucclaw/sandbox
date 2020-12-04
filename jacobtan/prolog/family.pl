% alice and bob are parents to carol and daniel
% amy and barbara are parents to charlie and dexter

parent_child(carol, X) :-
  X = alice
  ; X = bob.

parent_child(daniel, X) :-
  parent_child(carol, X).

parent_child(charlie, X) :-
  X = amy
  ; X = barbara.

parent_child(dexter, X) :-
  parent_child(charlie, X).

parent_child(amy, honey).
parent_child(bob, honey).

parent_child(honey, ariana).

siblings_(X, Y) :-
  dif(X, Y),
  parent_child(P, X),
  parent_child(P, Y).

grandp_child(GP,C) :-
  parent_child(GP,P),
  parent_child(P,C).


ancestor_(A,D) :-
  parent_child(A,D).
ancestor_(A,D) :-
  parent_child(A,C),
  ancestor_(C,D).

% % version 2
% ancestor_(A,D) :-
%   parent_child(A,D)
%   ; parent_child(A,C), ancestor_(C,D).
