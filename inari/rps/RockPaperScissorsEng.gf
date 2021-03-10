concrete RockPaperScissorsEng of RockPaperScissors = open SyntaxEng, (P=ParadigmsEng), SymbolicEng, Prelude in {
  lincat
    Statement = S ;
    [Statement] = BulletsOrComma => ListS ;
    Conjunction = Conj ;

  param
    BulletsOrComma = Bullets | Comma ;

  lin
    -- : String -> Statement ;                 -- B is a game
    IsGame s = mkS (mkCl (symb s) (mkNP a_Det game_N)) ;

    -- : (winner, game : String) -> Statement ;  -- A wins B
    Wins w g = mkS (mkCl (symb w) win_V2 (symb g)) ;

    -- : (a,b,c : String) -> Statement ; -- A and B are participants in C
    Participants a b c =
      let AandB : NP = mkNP and_Conj (symb a) (symb b) ;
          inC : Adv = mkAdv in_Prep (symb c) ;
          participant_in_C : CN = mkCN participant_N inC ;
      in mkS (mkCl AandB (mkNP aPl_Det participant_in_C)) ;

    Players a b =
      let AandB : NP = mkNP and_Conj (symb a) (symb b) ;
      in mkS (mkCl AandB (mkNP aPl_Det player_N)) ;

    -- : String -> Statement ; -- A throws {rock,paper,scissors}
    ThrowRock = throw (mkNP rock_N) ;
    ThrowPaper = throw (mkNP paper_N) ;
    ThrowScissors = throw (mkNP aPl_Det scissor_N) ;

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

    throw : NP -> SS -> S = \np,string ->
      mkS (mkCl (symb string) throw_V2 np) ;

    addBullet : S -> S = \s -> s ** {
      s = "\\*" ++ s.s
      } ;
 }
