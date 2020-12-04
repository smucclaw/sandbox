% to use if/3
:- expects_dialect(sicstus).
% to use string as list of chars
:- set_prolog_flag(double_quotes, chars). 

% Base case
list_without_([], _, []).

% Recursive case: all 3 versions work; just choose one of them.

% % Version 1
% list_without_([X|Xs], E, Ys) :-
%   X = E,
%   list_without_(Xs, E, Ys).
% list_without_([X|Xs], E, [X|Ys]) :-
%   dif(X,E),
%   list_without_(Xs, E, Ys).

% % Version 2
% list_without_([X|Xs], E, Ys) :-
%   ( X=E, Ys = Ls
%   ; dif(X,E), Ys = [X|Ls]
%   ),
%   list_without_(Xs, E, Ls).
 
% Version 3 (official version)
list_without_([X|Xs], E, Ys) :-
  if(X=E, Ys = Ls, Ys = [X|Ls]),
  list_without_(Xs, E, Ls).
