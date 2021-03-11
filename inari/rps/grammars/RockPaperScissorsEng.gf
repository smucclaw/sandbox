concrete RockPaperScissorsEng of RockPaperScissors = open SyntaxEng, (P=ParadigmsEng), SymbolicEng, Prelude in {
  lincat
    Statement = S ;
    [Statement] = BulletsOrComma => ListS ;
    Var = NP ;
    [Var] = ListNP ;
    ThrowItem = NP ;
    Conjunction = Conj ;

  param
    BulletsOrComma = Bullets | Comma ;

  lin
    -- : Var -> Statement ;                 -- B is a game
    game var = mkS (mkCl var (mkNP a_Det game_N)) ;

    -- : (winner, game : Var) -> Statement ;  -- A wins B
    winner w g = mkS (mkCl w win_V2 g) ;

    -- : (player, game : Var) -> Statement     -- A is a participant in B
    participant_in = participant a_Det ;

    -- : Var -> ThrowItem -> Statement         -- A throws {rock,paper,scissors}
    throw var item = mkS (mkCl var throw_V2 item) ;

    -- : ThrowItem
    rock = mkNP rock_N ;
    paper = mkNP paper_N ;
    scissors = mkNP aPl_Det scissor_N ;

    -- : String -> Var
    SVar = symb ;

    -- Aggregation functions

    -- : [Var] -> Var -> Statement ; -- A and B are participants in C
    ParticipantsIn ps game = participant aPl_Det (mkNP and_Conj ps) game ;

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


    participant : Det -> (player, game : NP) -> S = \det,p,g ->
      let inGame : Adv = mkAdv in_Prep g ;          -- first, build adverbial
          pIG_CN : CN = mkCN participant_N inGame ; -- adv modifies CN
          pIG_NP : NP = mkNP det pIG_CN ;       -- CN is quantified into singular or plular NP
      in mkS (mkCl p pIG_NP) ;

}
