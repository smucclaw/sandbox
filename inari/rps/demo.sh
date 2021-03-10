#/usr/bin/bash


read -p 'Player 1: ' a
read -p 'Player 2: ' c
read -p 'Name of the game: ' b
echo ''


a_wins_b="Wins \"$a\" \"$b\""
a_c_players="Players \"$a\" \"$c\""
b_game="IsGame \"$b\""
a_c_participants="Participants \"$a\" \"$c\" \"$b\""

a_rock="ThrowRock \"$a\""
c_rock="ThrowRock \"$c\""
a_paper="ThrowPaper \"$a\""
c_paper="ThrowPaper \"$c\""
a_scissors="ThrowScissors \"$a\""
c_scissors="ThrowScissors \"$c\""

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
