concrete RockPaperScissorsEng of RockPaperScissors = open 
  SyntaxEng, (P=ParadigmsEng), (C=ConjunctionEng), SymbolicEng, ExtendEng in {
  lincat
    Statement = S ;
    [Statement] = BulletsOrInline => ListS ;
    Var, Arg = NP ;
    Atom = LinAtom ; -- Multiple options
    [Arg] = ListNP ;

  lin

    -- Coercions to Arg
    AVar v = v ;
    AAtom atom = case atom.atype of {
      ACN => mkNP atom.cn ;
      _ => nothing_NP --Predef.error "AAtom: trying to make predicate into argument"
    } ;

    -- Atom -> Arg -> Statement ;
    App1 atom arg = mkS (mkCl arg (pred1 atom)) ;

    -- : Atom -> (x, y : Arg) -> Statement ;
    App2 atom subj obj = mkS (mkCl subj (pred2 atom obj)) ;

    -- : String -> Var
    V = symb ;

    -- Aggregation functions

    -- : Atom -> Arg -> [Arg] -> Statement ; -- A and B are participants in C
    Aggregate1 isplayer players =
      App1 isplayer (mkNP and_Conj players) ;

    -- : Atom -> Arg -> [Arg] -> Statement ; -- A and B are participants in C
    Aggregate2 throws rock players =
      App2 throws (mkNP and_Conj players) rock ;

    -- : (a1, a2 : Atom) -> (subj : [Arg]) -> Statement ;
    AggregatePred11 p q subjs = 
      let subj : NP = mkNP and_Conj subjs 
       in case <p.atype, q.atype> of {
            <ACN, ACN> => mkS (mkCl subj (mkVP (C.ConjCN and_Conj (C.BaseCN p.cn q.cn)))) ;
            _ => let vps1 = myVPS (pred1 p) ;
                     vps2 = myVPS (pred1 q) ;
                  in PredVPS subj (ConjVPS and_Conj (BaseVPS vps1 vps2)) 
          } ;

    -- : (a1, a2 : Atom) -> (obj : Arg) -> (subjs : [Arg]) -> Statement ;
    AggregatePred12 p q obj subjs =
      let subj : NP = mkNP and_Conj subjs 
       in case <p.atype, q.atype> of {
            <ACN, AN2> => 
              let comp : CN = mkCN q.n2 obj ;
               in mkS (mkCl subj (mkVP (C.ConjCN and_Conj (C.BaseCN p.cn comp)))) ;
            <AN2, ACN> => 
              let comp : CN = mkCN p.n2 obj ;
               in mkS (mkCl subj (mkVP (C.ConjCN and_Conj (C.BaseCN q.cn comp)))) ;
            _ => let vps1 = myVPS (pred1 p) ;
                     vps2 = myVPS (pred2 q obj) ;
                  in PredVPS subj (ConjVPS and_Conj (BaseVPS vps1 vps2)) 
          } ;

    -- : (a1, a2 : Atom) -> (obj1, obj2, subj : Arg) -> Statement ;
    AggregatePred22 p q obj1 obj2 subj =
      let vps1 = myVPS (pred2 p obj1) ;
          vps2 = myVPS (pred2 q obj2) ;
       in PredVPS subj (ConjVPS and_Conj (BaseVPS vps1 vps2)) ;

    -- : Statement -> Statement -> Statement ; -- A wins B if …
    IfThen = mkS if_Conj ;

    -- : Statement -> Statement -> [Statement]
    BaseStatement s1 s2 = table {
      TInline => mkListS s1 s2 ;
      TBullets => mkListS (addBullet s1) (addBullet s2)
      } ;

    -- : Statement -> [Statement] -> [Statement]
    ConsStatement s ss = table {
      TInline => mkListS s (ss ! TInline) ;
      TBullets => mkListS (addBullet s) (ss ! TBullets)
      } ;

    -- : Typography -> [Statement] -> Statement ;
    ConjStatement t ss = mkS and_Conj (ss ! t.t) ;
    DisjStatement t ss = mkS or_Conj (ss ! t.t) ;

    BaseArg = mkListNP ;
    ConsArg = mkListNP ;

    -- : Typography
  lincat
    Typography = {t : BulletsOrInline} ;
  lin
    Inline = {t = TInline} ;
    Bullets = {t = TBullets} ;

  param
    BulletsOrInline = TBullets | TInline ;
    AType = AN2 | ACN | AV | AV2 ;

  oper
    if_Conj = and_Conj ** {s2 = "if"} ;

    addBullet : S -> S = \s -> s ** {s = "\\*" ++ s.s} ;

    LinAtom : Type = {n2 : N2 ; cn : CN ; v : SyntaxEng.V ; v2 : V2 ; atype : AType} ;
    dummyV : SyntaxEng.V = P.mkV "dummy" ;
    dummyV2 : V2 = P.mkV2 "dummy" ;
    dummyN2 : N2 = P.mkN2 (P.mkN "dummy") ;
    dummyCN : CN = mkCN dummyN2 ;
    dummyAtom : LinAtom = {cn = dummyCN ; v = dummyV ; v2 = dummyV2 ; n2 = dummyN2 ; atype = ACN};
    mkAtom = overload {
      mkAtom : CN -> LinAtom = \cn -> dummyAtom ** {cn = cn ; atype = ACN} ;
      mkAtom : N -> LinAtom = \n -> dummyAtom ** {cn = mkCN n ; atype = ACN} ;
      mkAtom : SyntaxEng.V -> LinAtom = \v -> dummyAtom ** {v = v ; atype = AV} ;
      mkAtom : V2 -> LinAtom = \v2 -> dummyAtom ** {v2 = v2 ; atype = AV2} ;
      mkAtom : N2 -> LinAtom = \n2 -> dummyAtom ** {n2 = n2 ; atype = AN2} ;
    } ;

    pred1 : LinAtom -> VP = \atom -> case atom.atype of {
      AV  => mkVP atom.v ;
      ACN => mkVP atom.cn ;
      AN2 => mkVP (mkCN atom.n2) ;
      AV2 => mkVP atom.v2 something_NP } ;

    pred2 : LinAtom -> NP -> VP = \atom,obj -> 
      let objAdv = mkAdv possess_Prep obj ;
       in case atom.atype of {
            AV  => mkVP (mkVP atom.v) objAdv ;
            ACN => mkVP (mkVP atom.cn) objAdv ;
            AN2 => mkVP (mkCN atom.n2 obj) ;
            AV2 => mkVP atom.v2  obj } ; -- throws rock

    myVPS : VP -> VPS = \vp -> MkVPS (mkTemp presentTense simultaneousAnt) positivePol vp ;
}
