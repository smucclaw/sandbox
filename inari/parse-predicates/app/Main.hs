module Main where

import ParsePred ( parsePred )
import Paths_parse_predicates
import PGF (readPGF)


-- $setup
-- >>> pgf <- getDataFileName "ParseGF.pgf"
-- >>> gr <- readPGF pgf

-- | Test
-- >>> parsePred gr "AnIndependentDirector"
-- IndependentDirector
-- arity 0
-- parses
-- PredNP PosPol (MassNP (AdjCN (PositA independent_A) (UseN director_N)))
-- PredNP PosPol (MassNP (ApposCN (UseN independent_N) (MassNP (UseN director_N))))
-- <BLANKLINE>
-- (FullPredicate:623 (NP:619 (CN:596 independent (N:535 director))))
main :: IO ()
main = do
    pgf <- getDataFileName "ParseGF.pgf"
    gr <- readPGF pgf
    mapM_ (print . parsePred gr) corpus

corpus :: [String]
corpus = [
    "DescribedInSection1: Business -> Boolean"
    ,"DetractsFromDignityOfLegalProfession: Business -> Boolean"
    ,"IncompatibleWithDignityOfLegalProfession: Business -> Boolean"
    ,"DerogatesFromDignityOfLegalProfession: Business -> Boolean"
    ,"Unfair: Business -> Boolean"
    ,"DescribedInFirstSchedule: Business -> Boolean"
    ,"Prohibited: Business -> Boolean"
    ,"InvolvesSharingFeesWithUnauthorizedPersonsForLegalWorkPerformedByTheLegalPractitioner: Business -> Boolean"
    ,"InvolvesPaymentOfCommissionsForLegalWorkByUnauthorizedPersonsPerformedByTheLegalPractioner: Business -> Boolean"
    ,"AssociatedWith: ExecutiveAppointment -> Business -> Boolean"
    ,"JurisdictionIsSingapore : Business -> Boolean"
    ,"MateriallyInterferesWithAvailability: ExecutiveAppointment -> LegalPractitioner -> Boolean"
    ,"MateriallyInterferesWithPracticingAsLawyer: ExecutiveAppointment -> LegalPractitioner -> Boolean"
    ,"MateriallyInterferesWithRepresentation: ExecutiveAppointment -> LegalPractitioner -> Boolean"
    ,"Position: Organization -> Position"
    ,"Provides: Organization -> Service"
    ,"ListedInThirdSchedule: Institution -> Boolean"
    ,"Legal : Service -> Boolean"
    ,"HeldAsRepresentativeOf: Position -> Organization"
    ,"EntitlesHolder: Position -> Boolean"
    ,"NonExecutiveDirector: Position -> Boolean"
    ,"IndependentDirector: Position -> Boolean"
    ,"MustNotAccept: LegalPractitioner -> Appointment"
    ,"MayAccept: LegalPractitioner -> Appointment"
    ,"PrimaryOccupationIsPracticingAsLawyer: LegalPractitioner -> Boolean"
    ,"LocumSolicitor: LegalPractitioner -> Boolean"
    ,"AuthorizedToPracticeLaw: Person -> Boolean"
    ,"Awesome: Person -> Boolean"
    ,"Cool: Person -> Boolean"
    ,"Owner: LawPractice -> Person"
    ,"LegalOwner: LawPractice -> Person"
    ,"BeneficialOwner: LawPractice -> Person"
    ,"Partner: LawPractice -> Person"
    ,"SoleProprietor: LawPractice -> Person"
    ,"Director: LawPractice -> Person"
    ,"JurisdictionIsSingapore: LawPractice -> Boolean"
    ,"Member: LawPractice -> LegalPractitioner"
    ,"OwnerDriven : LawPractice -> Bool"]

{-

* Ask about structure/part of speech
   * Is 'sharing' noun or verb?
   * (LATER) Is the fee being shared, or is it a sharing fee, as in parking fee?


* Introduce WordNet synsets: for every content word, ask which WN synset it is.
  If user chose noun, ask for the following
     sharing
        * if it is a noun
            - [biology] using or enjoying something jointly with others
            - [biology] having in common; "the sharing of electrons creates molecules"
            - sharing thoughts and feelings
            - [economy] a distribution in shares
        * if it is a verb
            - use jointly or in common
            - give out as one's portion or share
            - have in common; "Our children share a love of music"; "The two countries share a long border"
            - use jointly or in common
            - have, give, or receive a share of; "We shared the cake"
            - give out as one's portion or share
            - communicate; "I'd like to share this idea with you"

The predicates could also look like this, with a docstring for the whole thing:

    UnauthorizedSharing : Business -> Boolean
        """involves sharing fees with unauthorized persons for legal work performed by the legal practitioner"""

* Attachment questions
  What is being performed
    - sharing performed by …
    - fees performed by …
    - persons performed by …
    - work performed by …

-}
