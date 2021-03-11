abstract RockPaperScissors = {
  flags startcat = Statement ;
  cat
    Statement ;
    [Statement]{2} ;
    Var ;
    [Var]{2} ;
    ThrowItem ;
    Conjunction ;

  fun
    -- Direct translation from s(CASP)
    game : Var -> Statement ;                     -- B is a game
    player : Var -> Statement ;                   -- A is a player
    winner : (winner, game : Var) -> Statement ;  -- A wins B
    participant_in : (player, game : Var) -> Statement ;  -- A is a participant in B

    throw : Var -> ThrowItem -> Statement ;  -- A throws {rock,paper,scissors}
    rock, paper, scissors : ThrowItem ;

    SVar : String -> Var ;

    -- Aggregation functions, manually written
    -- Also transformations from the direct s(CASP) functions need to be manually
    Players : [Var] -> Statement ;             -- A and C are players
    ParticipantsIn : [Var] -> Var -> Statement ; -- A and C are participants in B

    IfThen : Statement -> Statement -> Statement ; -- A wins B if …

    ConjStatementInline : Conjunction -> [Statement] -> Statement ;
    ConjStatementBullets : Conjunction -> [Statement] -> Statement ;

    And, Or : Conjunction ;
}
