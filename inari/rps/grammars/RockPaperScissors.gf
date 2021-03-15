abstract RockPaperScissors = {
  flags startcat = Statement ;
  cat
    Statement ;
    [Statement]{2} ;
    Var ;
    Arg ;
    [Arg]{2} ;
    Conjunction ;
    Atom ;
    Typography ;

  fun
    -- Direct translation from s(CASP) asdafsf
    App1 : Atom -> Arg -> Statement ;
    App2 : Atom -> (x, y : Arg) -> Statement ;

    game, player, 
    winner, participant_in, beats,
    player_throw, rock, paper, scissors : Atom ;

    AAtom : Atom -> Arg ;
    AVar : Var -> Arg ;
    SVar : String -> Var ;

    -- Aggregation functions, manually written
    -- Transformations from the direct s(CASP) functions to these need to be manually written in Haskell
    Aggregate1 : Atom -> [Arg] -> Statement ;        -- A and C are players
    Aggregate2 : Atom -> Arg -> [Arg] -> Statement ; -- A and C are participants in B

    IfThen : Statement -> Statement -> Statement ; -- A wins B if …

    ConjStatement : Typography -> Conjunction -> [Statement] -> Statement ;

    And, Or : Conjunction ;
    Inline, Bullets : Typography ;
}
