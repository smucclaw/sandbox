abstract Parse =
  Noun - [PPartNP, UseN2, RelNP, DetNP, AdvNP, PossNP, PartNP, CountNP],
  Verb - [PassV2, ReflVP, ComplVV, SlashVV, SlashV2V, SlashV2VNP, AdvVP],
  Adjective - [ReflA2, CAdvAP, UseA2], --AdvAP],
  Adverb - [AdnCAdv, ComparAdvAdj, ComparAdvAdjS],
  Sentence - [EmbedVP],
  Question,
  Relative,
  Conjunction,
  Phrase - [UttAP, UttVP],
  Idiom,
  Numeral,
  Tense,
  Extend [GerundCN,PresPartAP,PastPartAP,PastPartAgentAP],
  Construction,
  ReducedWordNet - [in_N, in_A],
  Documentation ** {

flags
  startcat = FullPredicate ;

  fun
    -- Very specialised things
 
    CnNum : CN -> Card -> CN ; -- Section 1
    V2PartAdv : Polarity -> V2 -> Adv -> FullPredicate ;

  cat
    Predicate ;
    FullPredicate ;
  fun
    PredNP : Polarity -> NP -> FullPredicate ; -- Owner, LegalOwner
    PredNP2 : Polarity -> NP -> Prep -> FullPredicate ; -- OwnerOf (argument)

    PredAP : Polarity -> AP -> FullPredicate ; -- Legal, AuthorizedToPracticeLaw
    PredAP2 : Polarity -> AP -> Prep -> FullPredicate ; -- AuthorizedToPracticeLawIn (argument)
--    PredAPAdv

    ComplV2V : V2V -> NP -> Predicate ; -- EntitlesHolder

    ComplNP : NP -> Predicate ; -- IsOwner,
    ComplNP2 : NP -> Prep -> Predicate ; -- IsOwnerOf (argument)

    ComplAP : AP -> Predicate ; -- IsAuthorizedToPracticeLaw
    ComplAP2 : AP -> Prep -> Predicate ; -- IsAuthorizedToPracticeLawIn (argument)
    ComplAdv : Adv -> Predicate ; --

    ComplVP : VP -> Predicate ; -- MateriallyInterferesWithPracticingAsLawyer
    ComplVP2 : VP -> Prep -> Predicate ; -- HeldAsRepresentativeOf
    ComplVPSlash : VPSlash -> Predicate ; -- DescribedInSection1

    AdvVVP : Adv -> VP -> VP ; -- allow Adv to be used like AdV

    MkN2 : N -> Prep -> N2 ;
    MkV2 : V -> Prep -> V2 ;
    MkA2 : A -> Prep -> A2 ;


  cat
    AgrTAM ;
    Polarity ;

  fun
--    SgAgr, PlAgr : Agreement ; -- simplify: don't really need persons here. TODO: revisit if need reflexive?

    PosPol, NegPol : Polarity ;

    PresIndSg, PresIndPl,
      --PastInd,
      PPartInd,
      Gerund, Imperative : AgrTAM ; -- TODO see if need e.g. conditional

    FullPred : AgrTAM -> Polarity -> Predicate -> FullPredicate ;

    May,Must,Shall : Polarity -> VPSlash -> FullPredicate ;

    ComplSentence : Polarity -> NP -> VP -> FullPredicate ; -- JurisdictionIsSingapore

}
