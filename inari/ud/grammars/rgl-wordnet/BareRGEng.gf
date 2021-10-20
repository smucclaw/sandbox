concrete BareRGEng of BareRG =

  ExtendEng [
  Temp, Pol, NP, Tense,
  S, ExistS, ExistNP,
  N, CompoundN

  ],

  SentenceEng [
  S,QS,Cl,QCl,NP,Tense,Temp,Pol,VP,Imp,Adv,
  ImpVP ,      -- VP -> Imp ;                 -- walk / do not walk
  AdvS ,
  ExtAdvS
  ],

  VerbEng [
  VP,AdV,Adv,AP,Comp,NP,V,Tense,
  UseV      , -- V   -> VP ;             -- sleep
  --    UseComp,
  -- CompAP,
  -- CompAdv,
  -- CompNP,
  AdvVP    , -- VP -> Adv -> VP ;       -- sleep here
  AdVVP
  ],

  NounEng - [
      CountNP,
      PartNP,
      ApposCN
   ],
  --  [
  -- NP,CN,AP,Adv,Ord,RS,Pron,PN,Det,Numeral,N,
  -- DetCN     , -- Det -> CN -> NP ;       -- the man
  -- UsePN     , -- PN -> NP ;              -- John
  -- UsePron   , -- Pron -> NP ;            -- he
  -- MassNP    , -- CN -> NP ;              -- milk
  -- UseN      , -- N -> CN ;               -- house
  -- AdjCN,       -- AP -> CN -> CN ;        -- big house
  -- OrdNumeral,
  -- RelCN,
  -- AdvCN,
  -- AdvNP,
  -- IndefArt,DefArt,NumSg,NumPl
  -- ],

  AdjectiveEng [
  AP,AdA,A,Ord,
  PositA    , -- A  -> AP ;              -- warm
  UseComparA,
  AdAP,
  AdjOrd
  ],

  AdverbEng [
  A,Prep,NP,Adv,Subj,S,
  PrepNP    , -- Prep -> NP -> Adv ;     -- in the house
  SubjS,
  PositAdvAdj -- A -> Adv  --- not sure if this should be used
  ],

  ConjunctionEng,
  RelativeEng,
  QuestionEng,
  NumeralEng,
  TenseX - [CAdv,Pol, PPos, PNeg] ** open StructuralEng in {

  lin
    theSg_Det = DetQuant DefArt NumSg ;
    thePl_Det = DetQuant DefArt NumPl ;
    aSg_Det = DetQuant IndefArt NumSg ;
    aPl_Det = DetQuant IndefArt NumPl ;
}