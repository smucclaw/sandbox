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
    AggregateSubj1 : Atom              -> (subjs:[Arg]) -> Statement ; -- A and C are players
    AggregateSubj2 : Atom -> (obj:Arg) -> (subjs:[Arg]) -> Statement ; -- A and C are participants in RPS

    --                  sleep -> walk  -> [A,C] -> "A and C sleep and walk" 
    AggregatePred11 :  Atom   -> Atom  -> (subjs:[Arg]) -> Statement ; 

    --               sleep (intrans. v) -> eat (transitive v) -> pizza       -> [A,C]         -> "A and C sleep and eat pizza"
    AggregatePred12 : Atom              -> Atom               -> (obj:Arg)   -> (subjs:[Arg]) -> Statement ;
    AggregatePred22 : Atom              -> Atom      -> (obj1, obj2 : Arg)   -> (subjs: [Arg]) -> Statement ;

    IfThen : Statement -> Statement -> Statement ; -- A wins B if …

    ConjStatement : Typography -> [Statement] -> Statement ;

    DisjStatement : Typography -> [Statement] -> Statement ;

    Inline, Bullets : Typography ;

    dummyAtom : Atom ;
    
}

