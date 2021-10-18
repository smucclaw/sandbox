-- A smaller set of RGL functions and cats,
-- which will form the base of the UD application grammar

abstract BareRG =

  Extend [
    Temp, Pol, NP, Tense,
    S, ExistS, ExistNP,
    N, CompoundN -- : N -> N -> N    -- control system
  ],

  Sentence [
    S,QS,Cl,QCl,NP,Temp,Pol,VP,Imp,Adv,
    ImpVP ,      -- VP -> Imp ;                 -- walk / do not walk
    AdvS ,
    ExtAdvS
  ],

  Verb [
    VP,AdV,Adv,AP,Comp,NP,V,Tense,
    UseV      , -- V   -> VP ;             -- sleep
    --    UseComp,
    CompAP,
    CompAdv,
    CompNP,
    UseAdv,     -- Adv -> VP ;             -- be in the house ---s
    AdvVP,      -- VP -> Adv -> VP ;       -- sleep here
    AdVVP
  ],

  Noun [
    NP,CN,AP,Adv,Ord,RS,Pron,PN,Det,Numeral,N,
    DetCN     , -- Det -> CN -> NP ;       -- the man
    UsePN     , -- PN -> NP ;              -- John
    UsePron   , -- Pron -> NP ;            -- he
    MassNP    , -- CN -> NP ;              -- milk
    UseN      , -- N -> CN ;               -- house
    AdjCN,      -- AP -> CN -> CN ;        -- big house
    OrdNumeral,
    RelCN,
    AdvCN
  ],

  Adjective [
    AP,AdA,A,Ord,
    PositA    , -- A  -> AP ;              -- warm
    UseComparA,
    AdAP,
    AdjOrd
  ],

  Adverb [
    A,
    Prep,NP,Adv,Subj,S,
    PrepNP    , -- Prep -> NP -> Adv ;     -- in the house
    SubjS,
    PositAdvAdj -- A -> Adv  --- not sure if this should be used
  ],

  Conjunction,
  Relative,
  Question,
  Numeral,
  Tense ** {

  flags startcat = S ; -- TODO is this necessary?

  -- hacks and workarounds
  fun
    the_Det : Det ;
  }