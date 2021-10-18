%This does not go into an infinite loop
%a(X1):-X1#=X+1,time(X),a(X).
%d(X):-not a(X),time(X).

%?- d(1).

%This goes into an infinite loop
%a(X1):-X1#=X+1,a(X),time(X).
%d(X):-not a(X),time(X).

%?- d(1).


%This works
%p:-p.
%q:-not p.

%?- q.

%Both queries below stall.
%a(X1):-X#<5,X1#=X+1,a(X).
%d(X):-not a(X).
%?- d(1).

b(0).
b(1).
b(2).
a(X1):-X1#=X+1,X#<5,a(X).
d(X):-b(X),not a(X).
?- d(1).
