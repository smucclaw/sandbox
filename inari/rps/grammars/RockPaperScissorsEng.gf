concrete RockPaperScissorsEng of RockPaperScissors = open SyntaxEng, (P=ParadigmsEng), SymbolicEng, Predef in {
  lincat
    Statement = S ;
    [Statement] = BulletsOrComma => ListS ;
    Var, Arg = NP ;
    Atom = LinAtom ; -- Multiple options
    [Var], [Arg] = ListNP ;
    Conjunction = Conj ;

  param
    BulletsOrComma = Bullets | Comma ;
    AType = AN2 | ANP | AV | AV2 ;
  oper
    LinAtom : Type = {n2 : N2 ; np : NP ; v : V ; v2 : V2 ; atype : AType} ;
    dummyV : V = P.mkV "dummy" ;
    dummyV2 : V2 = P.mkV2 "dummy" ;
    dummyN2 : N2 = P.mkN2 (P.mkN "dummy") ;
    dummyAtom : LinAtom = {np = nothing_NP ; v = dummyV ; v2 = dummyV2 ; n2 = dummyN2 ; atype = ANP};
    mkAtom = overload {
      mkAtom : NP -> LinAtom = \np -> dummyAtom ** {np = np ; atype = ANP} ;
      mkAtom : N -> LinAtom = \n -> dummyAtom ** {np = mkNP n ; atype = ANP} ;
      mkAtom : V -> LinAtom = \v -> dummyAtom ** {v = v ; atype = AV} ;
      mkAtom : V2 -> LinAtom = \v2 -> dummyAtom ** {v2 = v2 ; atype = AV2} ;
      mkAtom : N2 -> LinAtom = \n2 -> dummyAtom ** {n2 = n2 ; atype = AN2} ;
    } ;

  lin
    game = mkAtom (mkNP a_Det game_N);
    player = mkAtom (mkNP a_Det player_N) ;
    winner = mkAtom win_V2 ;
    participant_in = mkAtom (P.mkN2 participant_N in_Prep) ;
    player_throw = mkAtom throw_V2 ;
    rock = mkAtom rock_N ;
    paper = mkAtom paper_N ;
    scissors = mkAtom (mkNP aPl_Det scissor_N) ;
    beats = mkAtom beat_V2 ;

    -- Coercions to Arg
    AVar v = v ;
    AAtom atom = case atom.atype of {
      ANP => atom.np ;
      _ => nothing_NP --Predef.error "AAtom: trying to make predicate into argument"
    } ;

    -- Atom -> Arg -> Statement ;
    Pred1 atom arg =
      let pred : VP = case atom.atype of {
                        AV  => mkVP atom.v ;
                        ANP => mkVP atom.np ;
                        AN2 => mkVP (mkNP a_Det (mkCN atom.n2)) ;
                        AV2 => mkVP atom.v2 something_NP } 
       in mkS (mkCl arg pred) ;

    -- : Atom -> (x, y : Arg) -> Statement ;
    Pred2 atom subj obj =
      let pred : VP = case atom.atype of {
                        AV  => mkVP (mkVP atom.v) (mkAdv with_Prep obj) ;
                        ANP => mkVP (mkVP atom.np) (mkAdv with_Prep obj) ;
                        AN2 => mkVP (mkNP a_Det (mkCN atom.n2 obj)) ;
                        AV2 => mkVP atom.v2 obj } 
       in mkS (mkCl subj pred) ;

    -- : String -> Var
    SVar = symb ;

    -- Aggregation functions

    -- : [Var] -> Atom -> Statement ; -- A and B are participants in C
    ParticipantsIn ps game = participantIn aPl_Det (mkNP and_Conj ps) game.np ;

    -- : [Var] -> Statement
    Players ps =
      mkS (mkCl
             (mkNP and_Conj ps)
             (mkNP aPl_Det player_N)) ;

    -- : Statement -> Statement -> Statement ; -- A wins B if …
    IfThen = mkS if_Conj ;

    -- : Statement -> Statement -> [Statement]
    BaseStatement s1 s2 = table {
      Comma => mkListS s1 s2 ;
      Bullets => mkListS (addBullet s1) (addBullet s2)
      } ;

    -- : Statement -> [Statement] -> [Statement]
    ConsStatement s ss = table {
      Comma => mkListS s (ss ! Comma) ;
      Bullets => mkListS (addBullet s) (ss ! Bullets)
      } ;

    -- : Conjunction -> [Statement] -> Statement ;
    ConjStatementInline c ss = mkS c (ss ! Comma) ;
    ConjStatementBullets c ss = mkS c (ss ! Bullets) ;

    BaseVar = mkListNP ;
    ConsVar = mkListNP ;

    -- : Conjunction ;
    And = and_Conj ;
    Or = or_Conj ;

  oper
    -- Can also open WordNet or other multilingual lexicon and get the lexicon from there
    game_N        = P.mkN "game" ;
    win_V2        = P.mkV2 "win" ;
    beat_V2       = P.mkV2 "beat" ;
    winner_N      = P.mkN "winner" ;
    participant_N = P.mkN "participant" ;
    player_N      = P.mkN "player" ;
    throw_V2      = P.mkV2 "throw" ;
    rock_N        = P.mkN "rock" ;
    paper_N       = P.mkN "paper" ;
    scissor_N     = P.mkN "scissor" ;
    if_Conj       = and_Conj ** {s2 = "if"} ;


    addBullet : S -> S = \s -> s ** {
      s = "\\*" ++ s.s
      } ;


    participantIn : Det -> (player, game : NP) -> S = \det,p,g ->
      let inGame : Adv = mkAdv in_Prep g ;          -- first, build adverbial
          pIG_CN : CN = mkCN participant_N inGame ; -- adv modifies CN
          pIG_NP : NP = mkNP det pIG_CN ;       -- CN is quantified into singular or plular NP
      in mkS (mkCl p pIG_NP) ;

}
