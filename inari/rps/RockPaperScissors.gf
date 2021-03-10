abstract RockPaperScissors = {
  flags startcat = Statement ;
  cat
    Statement ;
    [Statement]{2} ;
    Conjunction ;

  fun
    IsGame : String -> Statement ;                 -- B is a game
    Wins : (winner, game : String) -> Statement ;  -- A wins B
    Players : (a,c : String) -> Statement ;        -- A and C are players
    Participants : (a,b,c : String) -> Statement ; -- A and C are participants in B

    ThrowRock,
      ThrowPaper,
      ThrowScissors : String -> Statement ; -- A throws {rock,paper,scissors}

    IfThen : Statement -> Statement -> Statement ; -- A wins B if …


    ConjStatementInline : Conjunction -> [Statement] -> Statement ;
    ConjStatementBullets : Conjunction -> [Statement] -> Statement ;


    And, Or : Conjunction ;
}
