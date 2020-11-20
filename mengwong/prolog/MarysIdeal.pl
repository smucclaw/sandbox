%% to run this, you need swipl installed.

%% for background, see https://www.metalevel.at/prolog/

% ┌─[mengwong@venice4] - [~/src/smucclaw/sandbox/mengwong/prolog] - [2020-10-15 03:10:47]
% └─[2] <git:(default 2baaee5✈) > swipl -g 'solution(X), writeln(X), halt' marymen.pl

:- use_module(library(clpfd)).

%% see also the alloy solution in sandbox/joeylim/MarysIdeal.als

%% (From Summers 1968, puzzle 5).
%% Mary's ideal man is tall, dark, and handsome. She knows four men: Alec, Bill, Carl, and Dave. 
%% Only one of the four men has all of the characteristics Mary requires.
%% Only three of the men are tall, only two are dark, and only one is handsome.
%% Each of the four men has at least one of the required traits.
%% Alec and Bill have the same complexion.
%% Bill and Carl are the same height.
%% Carl and Dave are not both tall.
%% Which one of the four men satisfies all of Mary's requirements?

solution(IdealManName) :-
    %% Mary's ideal man is tall, dark, and handsome.
    IdealMan = man{looks:1, comp:1, height:1, name:IdealManName},

    %% She knows four men: Alec, Bill, Carl, and Dave. 
    Men     = [Alec, Bill, Carl, Dave],
    Alec = man{looks:AL, comp:AC, height: AH, name:alec},
    Bill = man{looks:BL, comp:BC, height: BH, name:bill},
    Carl = man{looks:CL, comp:CC, height: CH, name:carl},
    Dave = man{looks:DL, comp:DC, height: DH, name:dave},
    [AL, BL, CL, DL] ins 0..1,
    [AC, BC, CC, DC] ins 0..1,
    [AH, BH, CH, DH] ins 0..1,

    %% Only one of the four men has all of the characteristics Mary requires.
    member(IdealMan, Men),

    %% Only three of the men are tall, only two are dark, and only one is handsome.
    AH + BH + CH + DH #= 3,
    AC + BC + CC + DC #= 2,
    AL + BL + CL + DL #= 1,

    %% Each of the four men has at least one of the required traits.
    AL + AC + AH #>= 1,
    BL + BC + BH #>= 1,
    CL + CC + CH #>= 1,
    DL + DC + DH #>= 1,

    %% Alec and Bill have the same complexion.
    AC #= BC,

    %% Bill and Carl are the same height.
    BH #= CH,

    %% Carl and Dave are not both tall.
    CH + DH #=< 1.

    %% Which one of the four men satisfies all of Mary's requirements?

% ┌─[mengwong@venice4] - [~/src/smucclaw/sandbox/mengwong/prolog] - [2020-10-15 03:10:47]
% └─[2] <git:(default 2baaee5✈) > swipl -g 'solution(X), writeln(X), halt' MarysIdeal.pl
% carl
