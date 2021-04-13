{- The corpus to be parsed:

    DescribedInSection1: Boolean
    DetractsFromDignityOfLegalProfession: Boolean
    IncompatibleWithDignityOfLegalProfession: Boolean
    DerogatesFromDignityOfLegalProfession: Boolean
    Unfair: Boolean
    DescribedInFirstSchedule: Boolean
    Prohibited: Boolean
    InvolvesSharingFeesForLegalWorkByUnauthoirzedPersonsPerformedByTheLegalPractitioner: Boolean
    InvolvesPaymentOfCommissionsForLegalWorkByUnauthorizedPersonsPerformedByTheLegalPractioner: Boolean

    AssociatedWith: Business -> Boolean
    MateriallyInterferesWithAvailability: LegalPractitioner -> Boolean
    MateriallyInterferesWithPracticingAsLawyer: LegalPractitioner -> Boolean
    MateriallyInterferesWithRepresentation: LegalPractitioner -> Boolean

    Position: Position
    Provides: Service -> Boolean

    ListedInThirdSchedule: Boolean

    Legal: Boolean

    HeldAsRepresentativeOf: Organization -> Boolean
    EntitlesHolder: Boolean
    NonExecutiveDirector: Boolean
    IndependentDirector: Boolean

    MustNotAccept: Appointment -> Boolean
    MayAccept: Appointment -> Boolean
    PrimaryOccupationIsPracticingAsLawyer: Boolean
    LocumSolicitor: Boolean

    AuthorizedToPracticeLaw: Boolean
    Awesome: Boolean
    Cool: Boolean

    Owner: Person
    LegalOwner: Person
    BeneficialOwner: Person
    Partner: Person
    SoleProprietor: Person
    Director: Person
    JurisdictionIsSingapore: Boolean
    Member: LegalPractitioner

     -}

abstract Parse =
  Noun - [PPartNP, UseN2, RelNP, DetNP, AdvNP, PossNP, PartNP, CountNP],
  Verb - [PassV2, ReflVP, ComplVV, SlashVV, SlashV2V, SlashV2VNP, VPSlashPrep],
  Adjective - [ReflA2, CAdvAP, AdvAP],
  Adverb - [AdnCAdv, ComparAdvAdj, ComparAdvAdjS],
  Sentence - [EmbedVP],
  Question,
  Relative,
  Conjunction,
  Phrase - [UttAP, UttVP],
  Idiom,
  Numeral,
  Tense,
  Construction,
  WordNet,
  Documentation ** {

flags
  startcat = FullPredicate ;

  fun CnNum : CN -> Card -> CN ; -- Section 1


  cat
    Predicate ;
    FullPredicate ;
  fun
    ComplNP : NP -> Predicate ; -- Owner, LegalOwner
    ComplNP2 : NP -> Prep -> Predicate ; -- OwnerOf (argument)

    ComplAP : AP -> Predicate ; -- Legal, AuthorizedToPracticeLaw
    ComplAP2 : AP -> Prep -> Predicate ; -- AuthorizedToPracticeLawIn (argument)
    ComplAdv : Adv -> Predicate ; --

    ComplVP : VP -> Predicate ; --
    ComplVPSlash : VPSlash -> Predicate ;

    ComplSentence : NP -> VP -> Predicate ; -- JurisdictionIsSingapore


  cat
    AgrTAM ;
    Polarity ;

  fun
--    SgAgr, PlAgr : Agreement ; -- simplify: don't really need persons here. TODO: revisit if need reflexive?

    PosPol, NegPol : Polarity ;

    PresIndSg, PresInsPl,
      PastInd, PPartInd, Gerund, Imperative : AgrTAM ; -- TODO see if need e.g. conditional

    FullPred : AgrTAM -> Polarity -> Predicate -> FullPredicate ;

}
