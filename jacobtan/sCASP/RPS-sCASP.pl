#abducible player(X).
#abducible game(X).
#abducible participates_in(X,Y).
#abducible throws(X,Y).

sign(rock).
sign(paper).
sign(scissors).
beats(rock,scissors).
beats(scissors,paper).
beats(paper,rock).

winner(Player,Game) :-
    game(Game),
    player(Player),
    player(Other_Player),
    participates_in(Game,Player),
    participates_in(Game,Other_Player),
    throws(Sign,Player),
    throws(Other_Sign,Other_Player),
    beats(Sign,Other_Sign),
    Player \= Other_Player.

?- winner(tom,myGame).
