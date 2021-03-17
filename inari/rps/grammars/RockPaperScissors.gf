abstract RockPaperScissors = {
  flags startcat = Statement ;
  cat
    Statement ;
    [Statement]{2} ;
    Var ;
    Arg ;
    [Arg]{2} ;
    Atom ;
    Typography ;

  fun
    -- Direct translation from s(CASP)
    App1 : Atom -> Arg -> Statement ;
    App2 : Atom -> (x, y : Arg) -> Statement ;

    AAtom : Atom -> Arg ;
    AVar : Var -> Arg ;
    
    V : String -> Var ;

    -- Aggregation functions, manually written
    -- Transformations from the direct s(CASP) functions to these need to be manually written in Haskell
    Aggregate1 : Atom -> [Arg] -> Statement ;        -- A and C are players
    Aggregate2 : Atom -> Arg -> [Arg] -> Statement ; -- A and C are participants in B

    IfThen : Statement -> Statement -> Statement ; -- A wins B if …

    ConjStatement : Typography -> [Statement] -> Statement ;

    Inline, Bullets : Typography ;

    dummyAtom : Atom ;
    
}
