abstract School =
    Numeral
  , Grammar [
          N, N2, CN, UseN, NP, Det, Quant, DetCN, MassNP, UsePron
        , V, VV, V2, V2, VS, VP, ComplVV, PassV2
        , A, A2, AP, AdjCN, PositA, SC, SentCN, ComplN2
        , Comp, Adv, VP, UseComp, CompNP, CompAP, CompAdv -- is a public agency
        , Prep, PrepNP, AdvVP
        , AdA, AdAdv
        , ListAdv, BaseAdv, ConsAdv, ConjAdv
        , ListAP, BaseAP, ConsAP, ConjAP
        , ListNP, BaseNP, ConsNP, ConjNP
        , ListS, BaseS, ConsS, ConjS
        , S, QS, Conj, UseCl
        , Cl, ExistNP
        ]
  , Structural [
        Conj, or_Conj, and_Conj, Prep, to_Prep, for_Prep, from_Prep, on_Prep, before_Prep, after_Prep, possess_Prep
        , VV, must_VV, Quant, no_Quant, V2, have_V2
        ]
  , Extend [
        VPS, MkVPS, ListVPS, BaseVPS, ConsVPS, ConjVPS
        , VPI, MkVPI --, [VPI], BaseVPI, ConsVPI, ConjVPI
        , VP, Tense, Ant, Temp, Pol, Conj -- for VPS
    --      , GenRP -- nice to have in the future?
        , ByVP
        , Cl, CN, ExistCN
        , S, PredVPS
        , NP, GerundNP
        ]
  , SchoolLex ** {


  flags startcat = S ;

-----------------------------------------------------------------------------
-- Domain-specific constructions

  fun
    NoEvidenceThat : SC -> S ;
    BecauseS : S -> S -> S ;

    NoEvidenceThat_ : [S] -> S ;
-----------------------------------------------------------------------------
-- Misc shortcuts and extensions to RGL
  fun
    ComplV2 : V2 -> NP -> VP ;

    EmbedSC : NP -> VPS -> SC ;

    condition,
    and,
    fullStop : S -> S ;

    because_Conj : Conj ;

    presAnt,   -- has occurred
    presSimul, -- occurs
    pastSimul  -- occurred
    : Temp ;

    POS : Pol ;
    NEG : Pol ;

    theSg : Det ;
    thePl : Det ;
    aSg : Det ;
    your : Det ;

    about_Prep : Prep ;
}
