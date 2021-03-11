#/usr/bin/bash


# Build GF grammar, if needed
if [ -n "$(ls -la | grep pgf)" ]
then
    echo GF grammar found, proceeding with demo
else
    echo Building the GF grammar...

    gf -make -f haskell --haskell=gadt RockPaperScissorsEng.gf

    echo GF grammar built, proceeding with demo
    echo ''
fi



read -p 'Player 1: ' a
read -p 'Player 2: ' c
read -p 'Name of the game: ' b
echo ''


a_wins_b="winner (SVar \"$a\") (SVar \"$b\")"
a_c_players="Players (BaseVar (SVar \"$a\") (SVar \"$c\"))"
b_game="game (SVar \"$b\")"
a_c_participants="ParticipantsIn (BaseVar (SVar \"$a\") (SVar \"$c\")) (SVar \"$b\")"

a_rock="throw (SVar \"$a\") rock"
c_rock="throw (SVar \"$c\") rock"
a_paper="throw (SVar \"$a\") paper"
c_paper="throw (SVar \"$c\") paper"
a_scissors="throw (SVar \"$a\") scissors"
c_scissors="throw (SVar \"$c\") scissors"

a_rock_c_scissors="ConjStatementInline And (BaseStatement ($a_rock) ($c_scissors))"
a_paper_c_rock="ConjStatementInline And (BaseStatement ($a_paper) ($c_rock))"
a_scissors_c_paper="ConjStatementInline  And (BaseStatement ($a_scissors) ($c_paper))"

a_wins="ConjStatementBullets
          Or
          (ConsStatement ($a_rock_c_scissors)
                         (BaseStatement ($a_paper_c_rock) ($a_scissors_c_paper)))"

winning_conditions="ConjStatementInline
                      And
                      (ConsStatement ($a_c_players)
                                     (ConsStatement ($b_game)
                                                   (BaseStatement ($a_c_participants) ($a_wins))))"

final="l IfThen ($a_wins_b) ($winning_conditions)"


gflin() {
    gf --run RockPaperScissorsEng.gf | tr '\' '\n'
}


echo $final | gflin
