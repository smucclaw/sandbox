%% to run this, you need swipl installed.

%% for background, see https://www.metalevel.at/prolog/

%% this program answers the question: https://adventofcode.com/2020/day/1#part2

:- use_module(library(clpfd)).
:- use_module(library(readutil)).
:- use_module(library(lists)).

readFile(Filename, Content) :-
    read_file_to_string(Filename, In, []),
    split_string(In,"\n", "\n", InStrings),
    maplist(number_string, Content, InStrings).

%% We know this works:
solve2(Filename, Sum, Answer, Product) :-
    readFile(Filename, Numbers),
    member(Num1, Numbers),
    member(Num2, Numbers),
    Num1 + Num2 #= Sum,
    Num1 #< Num2,
    Answer = [Num1, Num2],
    Product is Num1 * Num2.
%% ?- solve2("short.txt", 2020, Answer, Product).
%% Answer = [277, 1743],
%% Product = 482811 ;
%% false.

%% Let's generalize to any cardinality of answer!
solveC(Filename, Sum, Cardinality, Answer) :-
    readFile(Filename, Input),
    length(Answer, Cardinality),        % we can say if we want 2 or 3
    maplist(flip_member(Input),Answer), % Answer is a subset of Input
    sum(Answer, #=, Sum).               % they sum to the goal

%% Let's assume you're asking for Answer as [X,Y]:
solveN(Filename, Sum, Answer) :-
    readFile(Filename, Input),
    maplist(flip_member(Input),Answer), % Answer is a subset of Input
    sum(Answer, #=, Sum).               % they sum to the goal
%   sort(Answer,Answer).                % optional, to dedup output

flip_member(X,Y) :- member(Y,X).        % needed for maplist

% ?- solveN("input.txt", 2020, [X,Y]), Product is X*Y.
% X = 277,
% Y = 1743,
% Product = 482811 .
% 
% ?- solveN("input.txt", 2020, [X,Y,Z]), Product is X*Y*Z.
% X = 262,
% Y = 691,
% Z = 1067,
% Product = 193171814 .




%% disappointment:
%% sum_list isn't smart enough to compute sum_list([1,2,X],6).
%% let's write our own!

mysum(X,Y,Z) :- X + Y #= Z. %% the CLP(FD) version of "Z is X + Y"
mysumlist(List, Sum) :- foldl(mysum, List, 0, Sum).
mymul(X,Y,Z) :- X * Y #= Z.
mymullist(List, Mul) :- foldl(mymul, List, 1, Mul).
%% yes, this is good old Sum and Product monoid
%% https://hackage.haskell.org/package/base-4.14.0.0/docs/Data-Monoid.html

