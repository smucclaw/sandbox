
concrete ParseEng of Parse =
  NounEng - [PPartNP, UseN2, RelNP, DetNP, AdvNP, PossNP, PartNP, CountNP],
  VerbEng - [PassV2, ReflVP, ComplVV, SlashV2V, SlashVV, SlashV2VNP, UseCopula, VPSlashPrep, AdvVPSlash],
  AdjectiveEng - [ReflA2,CAdvAP, AdvAP],
  AdverbEng - [ComparAdvAdj,ComparAdvAdjS,AdnCAdv],
  SentenceEng - [UseCl, EmbedVP],
  QuestionEng,
  RelativeEng - [IdRP],
  ConjunctionEng,
  PhraseEng - [UttAP, UttVP],
  IdiomEng,
  NumeralEng,
  TenseX - [Pol,PPos,PNeg,SC,CAdv],
--  ParseExtendEng - [num],
--  WordNetEng, -- TODO replace with WordNet that has no sense ids, just one entry per word
  ConstructionEng,
  DocumentationEng ** open ResEng, ExtraEng, (V=VerbEng), (P=ParadigmsEng), SyntaxEng, Prelude in {

flags
  case_sensitive = off;

  lin
    CnNum cn card = mkCN cn (mkNP (mkDet card)) ;


lin
  PPos = {s = [] ; p = CPos} ;
  PNeg = {s = [] ; p = CNeg (variants {True; False})} ; -- contracted: don't

  UseCl = variants {SentenceEng.UseCl; ExtraEng.ContractedUseCl} ;

  IdRP = which_who_RP ;

-- INJECT
  lincat
    Predicate = MyAgr => Cl ;
    FullPredicate = Utt ;

    AgrTAM = {t : Temp ; a : MyAgr} ; -- Agreement is redundant in all but present
    Polarity = {p : Pol} ;
  param
    MyAgr = MySg | MyPl ;
    -- MyTense = MyPres | MyPast | MyPPart ;
    -- MyTam = Ind MyTense | Gerund | Imperative ;
    lin

    -- SgAgr = {a = MySg} ;
    -- PlAgr = {a = MyPl} ;

    PosPol = {p = positivePol} ;
    NegPol = {p = negativePol} ;

    PresIndSg = {t = mkTemp presentTense simultaneousAnt ; a = MySg} ;
    PresIndPl = {t = mkTemp presentTense simultaneousAnt ; a = MyPl} ;
    PastInd = {t = mkTemp pastTense simultaneousAnt ; a = MySg} ;
    PPartInd = {t = mkTemp presentTense anteriorAnt ; a = MySg} ;
    -- TODO
    -- Gerund = {t = Gerund} ;
    -- Imperative = {t = Imperative} ;

    FullPred agrtam pol pred = mkUtt (mkS agrtam.t pol.p (pred ! agrtam.a)) ;

  lin
    --  : NP -> Predicate ; -- Owner, LegalOwner
    ComplNP np = headlessVP np ;
    -- : NP -> Prep -> Predicate ; -- OwnerOf (argument)
    ComplNP2 np prep = headlessVP np prep ;

    -- : AP -> Predicate ; -- Legal, AuthorizedToPracticeLaw
    ComplAP ap = headlessVP ap ;

    -- : AP -> Prep -> Predicate ; -- AuthorizedToPracticeLawIn (argument)
    ComplAP2 ap prep = headlessVP ap prep ;
--    ComplAdv : Adverbial -> Predicate ; --

    -- : VP -> Predicate ; --
    ComplVP vp = headlessVP vp ;

    -- ComplVPSlash : VPSlash -> Predicate ;

    -- : NP -> VP -> Predicate ; -- JurisdictionIsSingapore
    ComplSentence np vp = \\_ => mkCl np vp ;

  oper



    headlessVP = overload {
      headlessVP : AP -> MyAgr => Cl = \np -> \\agr => mkCl (dummyNP ! agr) np ;
      headlessVP : NP -> MyAgr => Cl = \np -> \\agr => mkCl (dummyNP ! agr) np ;
      headlessVP : NP -> Prep -> MyAgr => Cl = \np,prep -> \\agr => mkCl (dummyNP ! agr) (mkVP (vpSlash np prep) (dummyNP ! agr)) ;
      headlessVP : AP -> Prep -> MyAgr => Cl = \np,prep -> \\agr => mkCl (dummyNP ! agr) (mkVP (vpSlash np prep) (dummyNP ! agr)) ;
      headlessVP : VP -> MyAgr => Cl = \vp -> \\agr => mkCl (dummyNP ! agr) vp

      } ;

    dummyNP : MyAgr => NP = table {
      MySg => it_NP ** {s = \\_ => []} ;
      MyPl => they_NP ** {s = \\_ => []}
      } ;

    vpSlash = overload {

      vpSlash : NP -> Prep -> VPSlash = \np,prep -> V.VPSlashPrep (mkVP np) prep ;
      vpSlash : AP -> Prep -> VPSlash = \ap,prep -> V.VPSlashPrep (mkVP ap) prep ;
      vpSlash : VP -> Prep -> VPSlash = V.VPSlashPrep
      } ;
} ;
