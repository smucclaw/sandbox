abstract RockPaperScissors = {
  flags startcat = Statement ;
  cat
    Statement ;
    [Statement]{2} ;
    Var ;
    [Var]{2} ;
    Arg ;
    [Arg]{2} ;
    Conjunction ;
    Atom ;

  fun
    -- Direct translation from s(CASP)
    Pred1 : Atom -> Arg -> Statement ;
    Pred2 : Atom -> (x, y : Arg) -> Statement ;

    game, player, 
    winner, participant_in, beats,
    player_throw, rock, paper, scissors : Atom ;

    AAtom : Atom -> Arg ;
    AVar : Var -> Arg ;
    SVar : String -> Var ;

    -- Aggregation functions, manually written
    -- Transformations from the direct s(CASP) functions to these need to be manually written in Haskell
    Players : [Arg] -> Statement ;             -- A and C are players
    ParticipantsIn : [Arg] -> Atom -> Statement ; -- A and C are participants in B

    IfThen : Statement -> Statement -> Statement ; -- A wins B if …

    ConjStatementInline : Conjunction -> [Statement] -> Statement ;
    ConjStatementBullets : Conjunction -> [Statement] -> Statement ;

    And, Or : Conjunction ;
}
