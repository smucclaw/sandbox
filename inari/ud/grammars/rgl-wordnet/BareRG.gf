-- A smaller set of RGL functions and cats,
-- which will form the base of the UD application grammar

abstract BareRG =

  Extend [
    Temp, Pol, NP, Tense,
    S, ExistS, ExistNP,
    AP, VP, PresPartAP,
    N, CompoundN -- : N -> N -> N    -- control system
  ],

  Sentence [
    S,QS,RS,Cl,RCl,QCl,NP,Temp,Tense,Pol,VP,Imp,Adv,
    ImpVP ,      -- VP -> Imp ;                 -- walk / do not walk
    AdvS ,
    ExtAdvS
    ,UseCl, UseRCl
  ],

  Verb [
    VP,AdV,Adv,AP,Comp,NP,V,Tense,
    UseV      , -- V   -> VP ;             -- sleep
    --    UseComp,
   --  CompAP,
   --  CompAdv,
   --  CompNP,
    UseAdv,     -- Adv -> VP ;             -- be in the house ---s
    AdvVP,      -- VP -> Adv -> VP ;       -- sleep here
    AdVVP
  ],

   Noun - [
      CountNP,
      PartNP,
      ApposCN
    ---  IndefArt, DefArt
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

  Structural [Prep, possess_Prep, by8agent_Prep],
  Conjunction,
  Relative,
  Question,
  Numeral,
  Tense ** {

  flags startcat = S ; -- TODO is this necessary?

  -- hacks and workarounds
  fun
    theSg_Det,
    thePl_Det,
    aSg_Det,
    aPl_Det : Det ;

    everyone_Pron : Pron ;
    who_RP, that_RP : RP ;

  -- passives
    PassV : V -> VP ;             -- affected
    PassVAgent : V -> NP -> VP ; -- affected by the breach
    PastPartAP : VP -> AP ;       -- stored in electronic formats (Extend.PastPartAP takes a VPSlash)

  -- Domain-specifics: we care about some specific modals and want special cats and funs for them
  cat
    Deontic ;
  fun
    may_Deontic,
    must_Deontic,
    shall_Deontic,
    shant_Deontic,
    should_Deontic : Deontic ;

    PDPA_N : N ;

  }