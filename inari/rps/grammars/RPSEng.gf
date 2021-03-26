concrete RPSEng of RPS = open 
  SyntaxEng, (S=SyntaxEng), (P=ParadigmsEng), (C=ConjunctionEng), SymbolicEng, ExtendEng, Prelude in {
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
    AggregateSubj1 isplayer players =
      App1 isplayer (mkNP and_Conj players) ;

    -- : Atom -> Arg -> [Arg] -> Statement ; -- A and B are participants in C
    AggregateSubj2 throws rock players =
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
    AggregatePred12 p1 p2 obj subjs =
      let subj : NP = mkNP and_Conj subjs 
       in case <p1.atype, p2.atype> of {
            <ACN, AN2> => 
              let comp : CN = mkCN p2.n2 obj ;
               in mkS (mkCl subj (mkVP (C.ConjCN and_Conj (C.BaseCN p1.cn comp)))) ;
            <AN2, ACN> => 
              let comp : CN = mkCN p1.n2 obj ;
               in mkS (mkCl subj (mkVP (C.ConjCN and_Conj (C.BaseCN p2.cn comp)))) ;
            _ => case <isTransitive p1, isTransitive p2> of {
                <True,True> => AggregatePred22 p1 p2 obj obj subjs ;
                <True,False> => let vps1 = myVPS (pred1 p2) ; -- flip order: p1 is actually the transitive one, p2 is intransitive
                                    vps2 = myVPS (pred2 p1 obj) ;
                                 in PredVPS subj (ConjVPS and_Conj (BaseVPS vps1 vps2)) ;
                _ => let vps1 = myVPS (pred1 p1) ;
                         vps2 = myVPS (pred2 p2 obj) ;
                      in PredVPS subj (ConjVPS and_Conj (BaseVPS vps1 vps2)) 
       }} ;

    -- : (a1, a2 : Atom) -> (obj1, obj2, subj : Arg) -> Statement ;
    AggregatePred22 p q obj1 obj2 subjs =
      let vps1 = myVPS (pred2 p obj1) ;
          vps2 = myVPS (pred2 q obj2) ;
          subj : NP = mkNP and_Conj subjs 
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

    isTransitive : LinAtom -> Bool = \atom -> case atom.atype of {
      AN2|AV2 => True ;
      _ => False
    } ;

    if_Conj = and_Conj ** {s2 = "if"} ;

    addBullet : S -> S = \s -> s ** {s = "\\*" ++ s.s} ;

    LinAtom : Type = {
      n2 : N2 ; 
      cn : CN ; 
      v  : S.V ; 
      v2 : V2 ; 
      atype : AType
      } ; 
    dummyAtom : LinAtom = let dummyN2 : N2 = P.mkN2 (P.mkN "dummy") in {
      cn = mkCN dummyN2 ; 
      v  = P.mkV "dummy" ;
      v2 = P.mkV2 "dummy" ;
      n2 = dummyN2 ; 
      atype = ACN
      } ;
    mkAtom = overload {
      mkAtom : CN  -> LinAtom = \cn -> dummyAtom ** {cn = cn ; atype = ACN} ;
      mkAtom : N   -> LinAtom = \n  -> dummyAtom ** {cn = mkCN n ; atype = ACN} ;
      mkAtom : S.V -> LinAtom = \v  -> dummyAtom ** {v  = v ; atype = AV} ;
      mkAtom : V2  -> LinAtom = \v2 -> dummyAtom ** {v2 = v2 ; atype = AV2} ;
      mkAtom : N2  -> LinAtom = \n2 -> dummyAtom ** {n2 = n2 ; atype = AN2} ;
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
