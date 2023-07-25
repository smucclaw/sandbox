concrete SchoolLexEng of SchoolLex = CatEng [A, N, CN, V, VV, V2, PN, N2, AdA, Adv, Prep, Pron] **
  open ParadigmsEng, Prelude, SyntaxEng, IrregEng, ExtraEng in {

  lin
    s_he_Pron = she_Pron ** {s = \\_ => "s/he"} ;
    _foreign_A = mkA "foreign" ;
    _parent_N = mkN "parent" ;
    _part_of_N2 = mkN2 (mkN "part") possess_Prep ;
    _recipient_of_N2 = mkN2 (mkN "recipient") possess_Prep ;
    _criterion_N2 = mkN2 (mkN "criterion" "criteria") noPrep ;
    _foreign_student_N = mkN "foreign_student" ;
    _obtain_V2 = mkV2 "obtain" ;
    _specific_etnia_PN = mkPN "specific_etnia" ;
    _student_N = mkN "student" ;
    _procedure_N = mkN "procedure" ;
    _purpose_N = mkN "purpose" ;
    _diversity_N = mkN "diversity" ;
    _of_Prep = mkPrep "of" ;
    _specific_A = mkA "specific" ;
    _family_N = mkN "family" ;
    _promote_V2 = mkV2 "promote" ;
    _specific_etnia_N = mkN "specific_etnia" ;
    _discriminate_V2 = mkV2 (mkV "discriminate") (mkPrep "based on") ;
    _race_N = mkN "race" ;
    _school_place_N = mkN "school place" ;
    _common_A = mkA "common" ;
    _sibling_N = mkN "sibling" ;
    _evidence_N = mkN "evidence" ;
    _RMI_N = mkN "RMI" ;
    _etnia_N = mkN "etnia" ;
    _to_Prep = mkPrep "to" ;
    _belong_to_V2 = mkV2 (mkV "belong") to_Prep ;
    _on_Prep = mkPrep "on" ;
    _meet_V2 = mkV2 (mkV "meet" "met" "met") ;
    _requirement_N = mkN "requirement" ;
    _follow_V2 = mkV2 "follow" ;
    _large_A = mkA "large" ;
    _disability_status_N = mkN "disability status" ;
    _illegal_A = mkA "illegal" ;
    _may_VV = ExtraEng.may_VV ;
}