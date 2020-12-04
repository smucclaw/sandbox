%% classic family tree tutorial

% we have the notions of:
% - children
% - parents
% - siblings
% - grandparents
% - grandchildren
% - ancestors
% - descendants

% let's have the family tree

% alice and bob are parents to carol and daniel

% amy and barbara are parents to charlie and dexter

% carol, daniel, charlie, dexter are the grandparents

% alice, bob, amy, barbara, are the children

parent_child(carol, alice).
parent_child(carol, bob).

parent_child(daniel, alice).
parent_child(daniel, bob).

parent_child(charlie, amy).
parent_child(charlie, barbara).

parent_child(dexter, amy).
parent_child(dexter, barbara).
parent_child(dexter, othello).

% amy and bob get together and have a baby
parent_child(amy, honeybooboo).
parent_child(bob, honeybooboo).

% some years later honeybooboo grows up
parent_child(honeybooboo, ladygaga).
parent_child(honeybooboo, britney).
parent_child(honeybooboo, ariana).

grandpc(GP, GC) :-
    % GP is a parent to C
    parent_child(GP,  C), % "and"

    % GC is a child of C
    parent_child(C,  GC).

%% predicates are pronounced:

% it is true that: grandpc(GP, GC)
% if                 :-
%                  GP is a parent to C
% and              C is a parent to GC


%% :- is pronounced "if"
%% ,  is pronounced "and"
%% .  is pronounced "or"

%% an old person is an ancestor to a young person
% if
% the old person is the parent of the young person.
% 2 generations.
ancestor(Old,Young) :- parent_child(Old, Young).

% recursive definition?
% any number of generations?
ancestor(Old,Young) :-
    parent_child(Old, Middle),
    ancestor(         Middle, Young).

descendants(Young,Old) :- ancestor(Old,Young).

%% two people are siblings if :-
%%         they have a parent in common.
sibling_of(S1, S2) :- parent_child(P, S1),
                      parent_child(P, S2),
                      dif(S1, S2).
                      

flight(         beijing, singapore).
flight(                  singapore, jakarta).
flight(                             jakarta,
                         singapore).
flight(                  singapore,          hongkong).

flight(adelaide,                    jakarta).

ticket(Origin, Dest) :- flight(Origin, Dest). % direct flight
ticket(Origin, Dest) :- flight(Origin, Hub), ticket(Hub, Dest).


