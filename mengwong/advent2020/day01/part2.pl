%% to run this, you need swipl installed.

%% for background, see https://www.metalevel.at/prolog/

%% this program answers the question: https://adventofcode.com/2020/day/1#part2

:- use_module(library(clpfd)).
:- use_module(library(readutil)).
:- use_module(library(yall)).
:- use_module(library(lists)).

readFile(Filename, Content) :-
    read_file_to_string(Filename, In, []),
    split_string(In,"\n", "\n", InStrings),
    maplist(number_string, Content, InStrings).

%% We know this works:
solution2(Filename, Sum, Answer, Product) :-
    readFile(Filename, Numbers),
    member(Num1, Numbers),
    member(Num2, Numbers),
    Num1 + Num2 #= Sum,
    Num1 #< Num2,
    Answer = [Num1, Num2],
    Product is Num1 * Num2.
%% ?- solution2("short.txt", 2020, Answer, Product).
%% Answer = [277, 1743],
%% Product = 482811 ;
%% false.

%% Let's generalize to any cardinality of answer!
solutionN(Filename, Sum, Cardinality, Answer) :-
    readFile(Filename, Input), length(Answer, Cardinality), maplist([X]>>member(X,Input),Answer), sum(Answer, #=, Sum), sort(Answer,Answer).

%% disappointment 1.
%% it works in the REPL but not when run against the program.
%% ?- Filename="input.txt", Sum=2020, readFile(Filename, Input), length(Answer, Cardinality), maplist([X]>>member(X,Input),Answer), sum(Answer, #=, Sum), sort(Answer,Answer).
%% Filename = "input.txt",
%% Sum = 2020,
%% Input = [1714, 1960, 1256, 1597, 1853, 1609, 1936, 2003, 1648|...],
%% Answer = [277, 1743],
%% Cardinality = 2 ;
%% Filename = "input.txt",
%% Sum = 2020,
%% Input = [1714, 1960, 1256, 1597, 1853, 1609, 1936, 2003, 1648|...],
%% Answer = [262, 691, 1067],
%% Cardinality = 3 ;

%% ?- solutionN("input.txt", 2020, 2, Answer).
%% Answer = [_19396, _19402],
%% _19396+_19402#=2020 .
%%
%% ?- solutionN("input.txt", 2020, 2, Answer), label(Answer).
%% ERROR: Arguments are not sufficiently instantiated
%% ERROR: In:
%% ERROR:   [16] throw(error(instantiation_error,_20266))
%% ERROR:   [13] clpfd:'__aux_maplist/2_must_be_finite_fdvar+0'([_20300,_20306]) at /nix/store/azwn6sh9q163b4039y5p10rwrcj0x5j6-swi-prolog-8.1.15/lib/swipl/library/clp/clpfd.pl:1745
%% ERROR:   [12] clpfd:labeling([],[_20344,_20350]) at /nix/store/azwn6sh9q163b4039y5p10rwrcj0x5j6-swi-prolog-8.1.15/lib/swipl/library/clp/clpfd.pl:1748
%% ERROR:   [10] '<meta-call>'(user:(...,...)) <foreign>
%% ERROR:    [9] <user>
%% ERROR:
%% ERROR: Note: some frames are missing due to last-call optimization.
%% ERROR: Re-run your program in debug mode (:- debug.) to get more detail.


%% disappointment 2.
%% sum_list isn't smart enough to compute sum_list([1,2,X],6).
%% let's write our own!

mysum(X,Y,Z) :- X + Y #= Z. %% the CLP(FD) version of "Z is X + Y"
mymul(X,Y,Z) :- X * Y #= Z.
mysumlist(List, Sum) :- foldl(mysum, List, 0, Sum).
mymullist(List, Mul) :- foldl(mymul, List, 1, Mul).
%% yes, this is good old Sum and Product monoid
%% https://hackage.haskell.org/package/base-4.14.0.0/docs/Data-Monoid.html


%% disappointment 3.
%% the native subset doesn't work in both directions:
%%    ?- subset([X],[1,2,3,4]).
%%    X = 1.
%%    why doesn't it find more solutions?
%%    so we use have to use maplist(...member) instead.
mysubset(Subset, Set) :- maplist([X]>>member(X,Set), Subset).

%% disappointment 4.
%% defining mysubset seems to behave differently vs just putting maplist in the REPL.

%% erf.
