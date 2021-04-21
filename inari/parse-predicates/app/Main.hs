module Main where

import ParsePred

main :: IO ()
main = do
    gr <- createPGF
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
* Introduce WordNet synsets
-}