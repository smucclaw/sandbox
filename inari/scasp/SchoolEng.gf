concrete SchoolEng of School =
    NumeralEng
  , GrammarEng [
        N, N2, CN, UseN, NP, Det, Quant, DetCN, MassNP, UsePron
      , V, VV, V2, V2, VS, VP, ComplVV-- , PassV2
      , A, A2, AP, AdjCN, PositA, SC, ComplN2 -- , SentCN
      , Comp, Adv, VP, UseComp, CompAP, CompNP, CompAdv -- is a public agency
      , Prep, PrepNP, AdvVP
      , AdA, AdAdv -- only (within the organisation)
      , ListAdv, BaseAdv, ConsAdv, ConjAdv
      , ListAP, BaseAP, ConsAP, ConjAP
      , ListNP, BaseNP, ConsNP, ConjNP
      , ListS, BaseS, ConsS, ConjS
      , QS, Conj, S, UseCl
      , Cl, ExistNP
      ]
  , StructuralEng [
      Conj, or_Conj, Prep, to_Prep, for_Prep, from_Prep, on_Prep, before_Prep, after_Prep, possess_Prep
    , VV, must_VV, Quant, no_Quant, V2, have_V2
    ]
  , ExtendEng [
        VPS, MkVPS, mkVPS, ListVPS, BaseVPS, ConsVPS, ConjVPS, baseVPS
      , VPI, MkVPI, mkVPI --, [VPI], BaseVPI, ConsVPI, ConjVPI
      , VP, Tense, Ant, Temp, Pol, Conj -- for VPS
      , ByVP --, PassVPSlash
        , Cl, CN, ExistCN
      , S, PredVPS
      , NP, GerundNP -- by performing NDB qualification
      ]
  , SchoolLexEng
  ** open
      SyntaxEng
    , ParadigmsEng
    , ExtendEng
    , SymbolicEng
    , LexiconEng
    , (ExtraEng=ExtraEng)
    , (R=ResEng)
    , (Co=Coordination)
    , Prelude
    , Formal
    in {

-----------------------------------------------------------------------------
-- Domain-specific constructions

  lin
    NoEvidenceThat sc = UseCl presSimul NEG
                            ( ExistCN
                                ( SentCN ( UseN _evidence_N ) sc )
                            ) ;

    NoEvidenceThat_ ss = NoEvidenceThat (GrammarEng.EmbedS (ConjS (mkConj ", and") ss)) ;

    BecauseS s1 s2 = cc3 s1 (ss ", because ¶§") s2 ;

    MeetCriterion foreign_student = {
      v2 = _meet_V2 ;
      obj = let cn : CN = ComplN2 _criterion_N2 foreign_student
             in mkNP theSg cn | mkNP thePl cn ;
      } ;

    Active pred subj = EmbedSC subj (MkVPS presSimul POS (ComplV2 pred.v2 pred.obj) ) ;
    Passive pred = EmbedSC pred.obj (MkVPS presSimul POS (PassV2 pred.v2)) ;

  lincat
    MyCustomCat = {v2 : V2 ; obj : NP} ;
  oper

     pad : Str -> SS -> SS = \str -> cc2 (ss str) ;
-----------------------------------------------------------------------------
-- Misc shortcuts and extensions to RGL

 lin
    ComplV2 v2 np = mkVP <lin V2 v2 : V2> <lin NP np : NP>  ;

    EmbedSC np vps = EmbedS (PredVPS np vps) ;
    condition s = cc2 s (ss ", because") ;
    and s = cc2 s (ss ", and") ;
    fullStop s = cc2 s (ss ".") ;

    and_Conj = mkConj ", and" | GrammarEng.and_Conj ;
    because_Conj = mkConj ", because" ;


    presSimul = mkTemp presentTense simultaneousAnt ;
    presAnt = mkTemp presentTense anteriorAnt ;
    pastSimul = mkTemp pastTense simultaneousAnt ;
    POS = positivePol ;
    NEG = negativePol ;

    theSg = theSg_Det ;
    thePl = thePl_Det ;
    aSg = aSg_Det ;
    your = mkDet youSg_Pron ;

    about_Prep = ParadigmsEng.mkPrep "about" ;

  oper
    emptyCN : CN = <mkCN cat_N : CN> ** {s = \\_,_ => []} ;
    emptyNP : NP = it_NP ** {s = \\_ => []} ;
    emptyPlNP : NP = they_NP ** {s = \\_ => []} ;

    whoRP : RP = ExtraEng.who_RP ;
  linref
    MyCustomCat = \np -> np.v2.s ! R.VPres ++ np.obj.s ! R.npNom ;


}