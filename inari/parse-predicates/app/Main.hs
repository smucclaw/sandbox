module Main where

import ParsePred

main :: IO ()
main = do
    gr <- createPGF
    mapM_ (print . parsePred gr) corpus

corpus :: [String]
corpus = [
    "MateriallyInterferesWithAvailability : ExecutiveAppointment -> LegalPractitioner -> Boolean"
    ,"DescribedInSection1: Business -> Boolean"
    ,"DetractsFromDignityOfLegalProfession: Business -> Boolean"
    ,"IncompatibleWithDignityOfLegalProfession: Business -> Boolean"
    ,"DerogatesFromDignityOfLegalProfession: Business -> Boolean"
    ,"Unfair: Business -> Boolean"
    ,"DescribedInFirstSchedule: Business -> Boolean"
    ,"Prohibited: Business -> Boolean"
    ,"InvolvesSharingFeesWithUnauthorizedPersonsForLegalWorkPerformedByTheLegalPractitioner: Business -> Boolean"
    ,"InvolvesPaymentOfCommissions: Business -> Boolean"
    ,"AssociatedWith: ExecutiveAppointment -> Business -> Boolean"
    ,"JurisdictionIsSingapore : Business -> Boolean"
    ,"MateriallyInterferesWithAvailability: ExecutiveAppointment -> LegalPractitioner -> Boolean"
    ,"MateriallyInterferesWithPracticingAsLawyer: ExecutiveAppointment -> LegalPractitioner -> Boolean"
    ,"MateriallyInterferesWithRepresentation: ExecutiveAppointment -> LegalPractitioner -> Boolean"
 ]
{-
class Organization {
    Position: Position
    Provides: Service
}

class Institution extends Organization {
    ListedInThirdSchedule: Boolean
}

class Service {
    Legal: Boolean
}

class Position {
    HeldAsRepresentativeOf: Organization
    EntitlesHolder: Boolean
    NonExecutiveDirector: Boolean
    IndependentDirector: Boolean
}

class LegalPractitioner extends Person {
    MustNotAccept: Appointment
    MayAccept: Appointment
    PrimaryOccupationIsPracticingAsLawyer: Boolean
    LocumSolicitor: Boolean
}

class Person {
    AuthorizedToPracticeLaw: Boolean
    Awesome: Boolean
    Cool: Boolean
}

class LawPractice extends Organization {
    Owner: Person
    LegalOwner: Person
    BeneficialOwner: Person
    Partner: Person
    SoleProprietor: Person
    Director: Person
    JurisdictionIsSingapore: Boolean
    Member: LegalPractitioner
}
-}