abstract RPS = {
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
    App1 : Atom               -> (subj:Arg) -> Statement ; -- A is a player
    App2 : Atom -> (obj:Arg)  -> (subj:Arg) -> Statement ; -- A is a participant in RPS

    AAtom : Atom -> Arg ;
    AVar : Var -> Arg ;
    
    V : String -> Var ;


    -- Aggregation functions, manually written
    -- Transformations from the direct s(CASP) functions to these need to be manually written in Haskell
                     -- sleep          -> [A,C]       
    AggregateSubj1 : Atom              -> (subjs:[Arg]) -> Statement ; -- A and C are players
    AggregateSubj2 : Atom -> (obj:Arg) -> (subjs:[Arg]) -> Statement ; -- A and C are participants in RPS

  cat

    Pred ;

  fun
    
    TransPred : Atom -> Arg -> Pred ;
    IntransPred : Atom -> Pred ;

    AggregatePred : Pred -> Pred -> (subjs : [Arg]) -> Statement ;

    IfThen : Statement -> Statement -> Statement ; -- A wins B if …

    ConjStatement : Typography -> [Statement] -> Statement ;

    DisjStatement : Typography -> [Statement] -> Statement ;

    Inline, Bullets : Typography ;

    dummyAtom : Atom ;
    
}

