#/usr/bin/bash

read -p 'Player 1: ' a
read -p 'Player 2: ' c
read -p 'Name of the game: ' b
echo ''


a_wins_b="App2 winner (AVar (SVar \"$a\")) (AVar (SVar \"$b\"))"
a_c_players="Aggregate1 player (BaseArg (AVar (SVar \"$a\")) (AVar (SVar \"$c\")))"
b_game="App1 game (AVar (SVar \"$b\"))"
a_c_participants="Aggregate2 participant_in (AVar (SVar \"$b\")) (BaseArg (AVar (SVar \"$a\")) (AVar (SVar \"$c\")))"

a_rock="App2 player_throw (AVar (SVar \"$a\"))     (AAtom rock)"
c_rock="App2 player_throw (AVar (SVar \"$c\"))     (AAtom rock)"
a_paper="App2 player_throw (AVar (SVar \"$a\"))    (AAtom paper)"
c_paper="App2 player_throw (AVar (SVar \"$c\"))    (AAtom paper)"
a_scissors="App2 player_throw (AVar (SVar \"$a\")) (AAtom scissors)"
c_scissors="App2 player_throw (AVar (SVar \"$c\")) (AAtom scissors)"

a_rock_c_scissors="ConjStatement Inline And (BaseStatement ($a_rock) ($c_scissors))"
a_paper_c_rock="ConjStatement Inline And (BaseStatement ($a_paper) ($c_rock))"
a_scissors_c_paper="ConjStatement Inline  And (BaseStatement ($a_scissors) ($c_paper))"

a_wins="ConjStatement Bullets
          Or
          (ConsStatement ($a_rock_c_scissors)
                         (BaseStatement ($a_paper_c_rock) ($a_scissors_c_paper)))"

winning_conditions="ConjStatement Inline
                      And
                      (ConsStatement ($a_c_players)
                                     (ConsStatement ($b_game)
                                                   (BaseStatement ($a_c_participants) ($a_wins))))"

final="l IfThen ($a_wins_b) ($winning_conditions)"


gflin() {
    gf --run RPSEng.gf | tr '\' '\n'
}


echo $final | gflin
