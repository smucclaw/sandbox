
%% X is a mortal if X is human.
%% you can think of :-
%% as basically a left arrow <--

%% all Humans are Mortal === human(X) -> mortal(X)
%% and we just write it the opposite way
%% because then we get to call it a Horn Clause.
%% one step closer to your PhD!

mortal(X) :- human(X).
mortal(Y) :- dog(Y).

human(socrates).
human(ruslan).

dog(wolfie).


