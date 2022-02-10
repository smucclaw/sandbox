concrete LawEng of Law =
  open
    (S=SyntaxEng),
    SyntaxEng,
    ParadigmsEng,
    SymbolicEng,
    MarkupEng,
    (G=GrammarEng),
    (E=ExtendEng),
    (Mk=MakeStructuralEng)
  in {

lincat A = S.A ;
lincat A2 = S.A2 ;
lincat AP = S.AP ;
lincat CN = S.CN ;
lincat Comp = S.Comp ;
lincat Conj = S.Conj ;
lincat ConjCN = S.CN ;
lincat ConjCop = Str ;
lincat ConjItem = Str ;
lincat ConjN2 = S.CN ;
lincat ConjNP = S.NP ;
lincat ConjPP = S.Adv ;
lincat ConjPPart = Str ;
lincat ConjVP2 = E.VPS2 ;
lincat Cop = Str ;
lincat Date = Str ;
lincat Item = Str ;
lincat LabLine = Str ;
lincat Line = Str ;
lincat N2 = S.N2 ;
lincat NP = S.NP ;
lincat Num = Str ;
lincat PP = S.Adv ;
lincat PP2 = S.Prep ;
lincat PPart = Str ;
lincat QCN = S.CN ;
lincat RS = S.RS ;
lincat Ref = Str ;
lincat S = S.S ;
lincat SeqPP = S.Adv ;
lincat Time = Str ;
lincat Title = Str ;
lincat VP = E.VP ;
lincat VP2 = E.VPS2 ;

oper parenth = overload {
    parenth : S.AP -> S.AP = \ap -> MarkupAP (mkMark "(" ")") ap ;
    } ;
oper str = overload {
    str : S.Adv -> Str = \x -> (mkUtt x).s ;
    str : S.Conj -> Str = \conj -> conj.s2 ;
    str : S.NP -> Str = \x -> (mkUtt x).s ;
    str : S.S -> Str = \x -> (mkUtt x).s ;
    str : S.VP -> Str = \x -> (mkUtt x).s ; ----
    } ;


lin A_affected = mkA "affected" ;
lin A_notifiable = mkA "notifiable" ;
lin A_other = mkA "other" ;
lin A_prescribed = mkA "prescribed" ;
lin A_technological = mkA "technological" ;
lin A_written = mkA "written" ;

lin A2_affected_by = mkA2 (mkA "affected") by8means_Prep ;
lin A2_affecting = mkA2 (mkA "affecting") noPrep ;
lin A2_applicable_to = mkA2 (mkA "applicable") to_Prep ;
lin A2_in_relation_to = mkA2 (mkA "in relation") to_Prep ; ---
lin A2_including = mkA2 (mkA "including") noPrep ;
lin A2_mentioned_in = mkA2 (mkA "mentioned") in_Prep ;
lin A2_on_behalf_of_and_for_the_purposes_of = mkA2 (mkA "on behalf of and for the purposes") possess_Prep ; ---
lin A2_other_than = mkA2 (mkA "other") (mkPrep "than") ;
lin A2_processing = mkA2 (mkA "processing") noPrep ;
lin A2_under = mkA2 (mkA "under") noPrep ; ---

lin AP_A2_NP a2 np = mkAP a2 np ;

lin CN_A_CN a cn = mkCN a cn ;
lin CN_CN__AP_ cn ap = mkCN (parenth ap) cn ;
lin CN_CN_AP cn ap = mkCN ap cn ;
lin CN_CN_ConjPP cn conjpp = mkCN cn conjpp ;
lin CN_CN_RS cn rs = mkCN cn rs ;
lin CN_Commission = mkCN (mkN "Commission") ;
lin CN_ConjCN_relating_to_NP conjcn np = mkCN conjcn (S.mkAdv (mkPrep "relating to") np) ;
lin CN_N2_of_NP n2 np = mkCN n2 np ;
lin CN_action = mkCN (mkN "action") ;
lin CN_assessment = mkCN (mkN "assessment") ;
----lin CN_assessment_of_whether_S s = "assessment" ++ "of" ++ "whether" ++ s ;
lin CN_circumstances = mkCN (mkN "circumstance") ; ----
lin CN_class_of_personal_data = mkCN (mkN "class") (S.mkAdv possess_Prep (mkNP (mkCN (mkA "personal") (mkN "data")))) ;
lin CN_contract = mkCN (mkN "contract") ;
lin CN_data_breach = mkCN (mkN "data breach") ;
lin CN_data_intermediary = mkCN (mkN "data intermediary") ;
lin CN_device = mkCN (mkN "device") ;
lin CN_duty = mkCN (mkN "duty") ;
lin CN_individual = mkCN (mkN "individual") ;
lin CN_individuals = mkCN (mkN "individual") ; ---- 
lin CN_information = mkCN (mkN "information") ;
lin CN_law = mkCN (mkN "law") ;
lin CN_law_enforcement_agency = mkCN (mkN "law enforcement agency") ;
lin CN_measure = mkCN (mkN "measure") ;
lin CN_notification = mkCN (mkN "notification") ;
lin CN_number_of_CN cn = mkCN (mkN "number") (S.mkAdv possess_Prep (mkNP aPl_Det cn)) ;
lin CN_obligation = mkCN (mkN "obligation") ;
----lin CN_obligation_of_NP_to_VP np vp = "obligation of" ++ np ++ "to" ++ vp ;
lin CN_organisation = mkCN (mkN "organisation") ;
lin CN_person = mkCN (mkN "person") ;
lin CN_personal_data = mkCN (mkA "personal") (mkN "data") ;
lin CN_professional_conduct = mkCN (mkA "professional") (mkN "conduct") ;
lin CN_public_agency = mkCN (mkA "public") (mkN "agency") ;
lin CN_purpose = mkCN (mkN "purpose") ;
----lin CN_requirement_to_VP vp = "requirement to" ++ vp ;
lin CN_requirements = mkCN (mkN "requirements") ; ----
lin CN_restriction_on_NP np = mkCN (mkN "restriction") (S.mkAdv on_Prep np) ;
lin CN_secrecy = mkCN (mkN "secrecy") ;
lin CN_significant_harm_to_NP np = mkCN (mkCN (mkA "significant") (mkN "harm")) (S.mkAdv to_Prep np) ;
lin CN_storage_medium = mkCN (mkN "storage medium" "storage media") ;

lin Comp_of_a_significant_scale = mkComp (S.mkAdv possess_Prep (mkNP a_Det (mkCN (mkA "significant") (mkN "scale")))) ;
lin ConjCN_CN_Conj_CN cn conj cn2 = G.ConjCN conj (G.BaseCN cn cn2) ;
lin ConjCop_Cop__Conj_Cop_ cop1 conj cop2 = cop1 ++ "," ++ str conj ++ cop2 ++ "," ;
lin ConjItem_Item__ConjItem item conjitem = item ++ "," ++ conjitem ;
lin ConjItem_Item_Conj_Item item conj item2 = item ++ str conj ++ item2 ;
----lin ConjN2_N2__ConjN2 n2 conjn2 = n2 ++ "," ++ conjn2 ;
----lin ConjN2_N2_Conj_N2 n2 conj n22 = n2 ++ str conj ++ n22 ;
lin ConjNP_NP_Conj_NP np conj np2 = mkNP conj np np2 ;
lin ConjPP_PP_Conj_PP pp conj pp2 = S.mkAdv conj pp pp2 ;
lin ConjPPart_PPart_Conj_PPart ppart conj ppart2 = ppart ++ str conj ++ ppart2 ;
----lin ConjVP2_VP2__Conj_VP2_ vp21 conj vp22 = vp21 ++ "," ++ conj ++ vp22 ++ "," ;
lin Conj_and = and_Conj ;
lin Conj_or = or_Conj ;
lin Cop_is = "is" ;
lin Cop_is_likely_to_be = "is likely to be" ;
lin Date_1_February_2021 = "1 February 2021" ;

lin Item_1 = "(1)" ;
lin Item_2 = "(2)" ;
lin Item_3 = "(3)" ;
lin Item_3b = "(3)(b)" ;
lin Item_4 = "(4)" ;
lin Item_5 = "(5)" ;
lin Item_6 = "(6)" ;
lin Item_7 = "(7)" ;
lin Item_8 = "(8)" ;
lin Item_9 = "(9)" ;
lin Item_a = "(a)" ;
lin Item_b = "(b)" ;
lin Item_1a = "(1)(a)" ;
lin Item_1b = "(1)(b)" ;
lin Item_26A = "26A" ;
lin Item_26B = "26B" ;
lin Item_26B1a = "26B(1)(a)" ;
lin Item_26C = "26C" ;
lin Item_26D = "26D" ;
lin Item_26E = "26E" ;

lin LabLine_Item_Line item line = item ++ line ;
lin LabLine_Item__Line item line = item ++ "." ++ line ;
lin LabLine_Item__Item_Line ref item line = ref ++ ". —" ++ item ++ line ;
lin LabLine_Line line = line ;
lin LabLine_Ref ref = ref ;
lin LabLine_Title title = title ;

lin Line_NP_ np = str np ++ "." ;
lin Line_NP__Conj np conj = str np ++ ";" ++ str conj ;
lin Line_S_ s = str s ++ "." ;
lin Line_S_cont s = str s ++ "—" ;
lin Line_S__Conj s conj = str s ++ ";" ++ str conj ;
lin Line_S_if_ s = str s ++ "if —" ;
lin Line_S_if_NP_ s np = str s ++ "if" ++ str np ++ "—" ;
lin Line_VP_c vp = str vp ++ "," ; ----
lin Line_VP_p vp = str vp ++ "." ; ----
lin Line_VP__Conj vp conj = str vp ++ ";" ++ str conj ;
lin Line_an_CN_is_not__PP__to_be_regarded_as_NP_of_ cn pp np = str (mkNP a_Det cn) ++ "is not ," ++ str pp ++ ", to be regarded as" ++ str np ++ "of —" ;
lin Line_if_S__Conj s conj = "if" ++ str s ++ ";" ++ str conj ;
lin Line_if_S_Conj s conj = "if" ++ str s ++ str conj ;
lin Line_in_other_prescribed_circumstances_ = "in other prescribed circumstances ." ;
lin Line_other_prescribed_circumstances_ = "other prescribed circumstances ." ;
lin Line_where_S_ s = "where" ++ str s ++ "—" ;
lin Line_where_S__S_ s s2 = "where" ++ str s ++ "," ++ str s2 ++ "." ;
lin Line_PP__Line pp line = str pp ++ "," ++ line ;
lin Line_QCN__PP__means_ qcn pp = str (mkNP qcn) ++ "," ++ str pp ++ ", means —" ;
lin Line_QCN_means_NP_ qcn np = str (mkNP qcn) ++ "means" ++ str np ++ ";" ;
lin Line_PP__unless_S_ loc s = str loc ++ ", unless" ++ str s ++ "—" ;
lin Line_where_an_CN_ cn = "where" ++ str (mkNP a_Det cn) ++ "—" ;

lin N2_access = mkN2 (mkN "access") ;
lin N2_collection = mkN2 (mkN "collection") ;
lin N2_copying = mkN2 (mkN "copying") ;
lin N2_disclosure = mkN2 (mkN "disclosure") ;
lin N2_disposal = mkN2 (mkN "disposal") ;
lin N2_modification = mkN2 (mkN "modification") ;
lin N2_occurrence = mkN2 (mkN "occurrence") ;
lin N2_rule = mkN2 (mkN "rule") ;
lin N2_use = mkN2 (mkN "use") ;

lin NP_CN cn = mkNP cn ; ---- both Sg and Pl
----lin NP_NP__Conj_NP__PP np conj np2 pp = np ++ "," ++ conj ++ np2 ++ "," ++ pp ;
lin NP_a_CN cn = mkNP a_Det cn ;
lin NP_all_the_CN_RS cn rs = mkNP all_Predet (mkNP thePl_Det (mkCN cn rs)) ;
lin NP_an_CN cn = mkNP a_Det cn ; ---- remove
lin NP_another_CN cn = mkNP (Mk.mkDet "another") cn ;
lin NP_any_CN cn = mkNP (Mk.mkDet "any") cn ; ---- also plural?
lin NP_any_ConjCN conjcn = mkNP (Mk.mkDet "any") conjcn ;
lin NP_being_in_breach = mkNP (mkPN "being in breach") ; ---
lin NP_each_CN cn = mkNP (Mk.mkDet "each") cn ;
lin NP_it = it_NP ;
lin NP_not_fewer_than_NP np = mkNP (lin Predet {s = "not fewer than"}) np ;
----lin NP_notifying_ConjNP conjnp = "notifying" ++ conjnp ;
lin NP_section_Item item = mkNP (mkCN (mkN "section") <symb (mkSymb item) : NP>) ; 
lin NP_subsection_Item item = mkNP (mkCN (mkN "subsection") <symb (mkSymb item) : NP>) ; 
lin NP_subsection_ConjItem items = mkNP (mkCN (mkN "subsection") <symb (mkSymb items) : NP>) ; 
lin NP_subsections_ConjItem items = mkNP (mkCN (mkN "subsections") <symb (mkSymb items) : NP>) ; 
lin NP_that_CN cn = mkNP that_Det cn ;
lin NP_the_CN cn = mkNP the_Det cn ; ---- both Sg and Pl ?
----lin NP_the_loss_of_any_ConjCN_RS conjcn rs = "the loss of any" ++ conjcn ++ rs ;
----lin NP_the_unauthorised_ConjN2_of_NP conjn2 np = "the unauthorised" ++ conjn2 ++ "of" ++ np ;
lin NP_this_CN cn = mkNP this_Det cn ;
lin NP_this_section = mkNP this_Det (mkN "section") ;

lin Num_3 = "3" ;
{-
lin PP_PP__but_in_any_case_PP pp pp2 = pp ++ ", but in any case" ++ pp2 ;
lin PP_PP2_NP pp2 np = pp2 ++ np ;
lin PP_Time time = time ;
lin PP_as_soon_as_is_practicable = "as soon as is practicable" ;
lin PP_as_to_ConjNP conjnp = "as to" ++ conjnp ;
lin PP_in_a_reasonable_and_expeditious_manner = "in a reasonable and expeditious manner" ;
lin PP_in_accordance_with_section_Ref ref = "in accordance with section" ++ ref ;
lin PP_in_any_manner_that_is_reasonable_in_the_circumstances = "in any manner that is reasonable in the circumstances" ;
lin PP_in_its_possession = "in its possession" ;
lin PP_in_this_Part = "in this Part" ;
lin PP_no_later_than_Num_calendar_days_after_the_day_S num s = "no later than" ++ num ++ "calendar days after the day" ++ s ;
lin PP_subject_to_any_conditions_that_the_Commission_thinks_fit = "subject to any conditions that the Commission thinks fit" ;
lin PP_at_the_time_NP_notifies_ConjNP np conjnp = "at the time" ++ np ++ "notifies" ++ conjnp ;
lin PP__as_the_case_may_be_ = "( as the case may be )";
lin PP_under_its_control = "under its control" ;
lin PP_without_undue_delay = "without undue delay" ;
lin PPart_made_in_the_form = "made in the form" ;
lin PPart_submitted_in_the_manner_required_by_the_Commission = "submitted in the manner required by the Commission" ;

lin PP2_by_reason_only_of = "by reason only of" ;
lin PP2_despite = "despite" ;
lin PP2_in_accordance_with = "in accordance with" ;
lin PP2_in_relation_to = "in relation to" ;
lin PP2_on_behalf_of_and_for_the_purposes_of = "on behalf of and for the purposes of" ;
lin PP2_on_the_written_application_of = "on the written application of" ;
lin PP2_only_within = "only within" ;
lin PP2_prior_to_the_occurrence_of = "prior to the occurrence of" ;
lin PP2_relating_to = "relating to" ;
lin PP2_subject_to = "subject to" ;
lin PP2_to_the_best_of_the_knowledge_and_belief_of = "to the best of the knowledge and belief of" ;
lin PP2_upon_notification_by = "upon notification by" ;
lin PP2_without_limiting = "without limiting" ;

lin QCN__CN_ cn = "“" ++ cn ++ "”" ;

lin RS_on_which_S s = "on which" ++ s ;
lin RS_that_NP_VP np vp = "that" ++ np ++ vp ;
lin RS_that_VP vp = "that" ++ vp ;
lin RS_to_whom_NP_VP np vp = "to whom" ++ np ++ vp ;
lin RS_where_S s = "where" ++ s ;

lin Ref_402020 = "[40/2020]" ;

lin S_NP_VP np vp = np ++ vp ;
---lin S_personal_data_is_stored_in_circumstances_RS rs = "personal data is stored in circumstances" ++ rs ;
lin S_the_context_otherwise_requires = "the context otherwise requires" ;

lin SeqPP_PP pp = pp ;
lin SeqPP_PP_SeqPP pp seqpp = pp ++ seqpp ;

lin Time_on_or_after_assessing_that_S s = "on or after assessing that" ++ s ;
lin Time_on_or_after_notifying_the_Commission_under_subsection_Item item = "on or after notifying the Commission under subsection" ++ item ;

lin Title_Duty_to_conduct_assessment_of_data_breach = "Duty to conduct assessment of data breach" ;
lin Title_Duty_to_notify_occurrence_of_notifiable_data_breach = "Duty to notify occurrence of notifiable data breach" ;
lin Title_Interpretation_of_this_Part = "Interpretation of this Part" ;
lin Title_NOTIFICATION_OF_DATA_BREACHES = "NOTIFICATION OF DATA BREACHES" ;
lin Title_Notifiable_data_breaches = "Notifiable data breaches" ;
lin Title_PART_6A = "PART 6A" ;
lin Title_obligations_of_data_intermediary_of_public_agency = "obligations of data intermediary of public agency" ;

lin VP_ConjCop_Comp conjcop comp = conjcop ++ comp ;
lin VP_ConjVP2_NP conjvp2 np = conjvp2 ++ np ;
lin VP_VP2_NP vp2 np = vp2 ++ np ;
lin VP_VP2__SeqPP__NP v2 seqpp np = v2 ++ "," ++ seqpp ++ "," ++ np ;
lin VP_VP__Conj_to_VP vp conj vp2 = vp ++ "," ++ conj ++ "to" ++ vp2 ;
lin VP_VP_PP vp pp = vp ++ pp ;
lin VP_assesses__PP__that_S pp s = "assesses ," ++ pp ++ ", that" ++ s ;
lin VP_be_ConjPPart conjppart = "be" ++ conjppart ;
lin VP_be_a_CN cn = "be a" ++ cn ;
lin VP_be_of_a_significant_scale = "be of a significant scale" ;
lin VP_believe_that_S s = "believe that" ++ s ;
lin VP_had_implemented__PP__NP pp np = "had implemented ," ++ pp ++ "," ++ np ;
lin VP_has_occurred = "has occurred" ;
lin VP_has_reason_to_VP vp = "has reason to" ++ vp ;
lin VP_is_a_CN cn = "is a" ++ cn ;
lin VP_is_deemed_not_to_VP vp = "is deemed not to" ++ vp ;
lin VP_is_deemed_to_VP vp = "is deemed to" ++ vp ;
lin VP_is_likely_to_occur = "is likely to occur" ;
lin VP_is_processing_PP pp = "is processing" ++ pp ;
lin VP_may__SeqPP__VP seqpp vp = "may ," ++ seqpp ++ "," ++ vp ;
lin VP_must__SeqPP__VP seqpp vp = "must ," ++ seqpp ++ "," ++ vp ;
lin VP_must_VP vp = "must" ++ vp ;
lin VP_must_also_VP vp = "must also" ++ vp ;
lin VP_must_not_VP vp = "must not" ++ vp ;
lin VP_notify_NP_of_NP np np2 = "notify" ++ np ++ "of" ++ np2 ;
lin VP_occurs_on_or_after_Date date = "occurs on or after" ++ date ;
lin VP_relates = "relates" ;
lin VP_renders_it_unlikely_that_S s = "renders it unlikely that" ++ s ;
lin VP_so_VP v = "so" ++ v ;
lin VP_takes_NP__PP__RS np pp rs = "takes" ++ np ++ "," ++ pp ++ "," ++ rs ;
lin VP_directs = "directs" ;
lin VP_instructs = "instructs" ;

lin VP2_conduct = "conduct" ;
lin VP2_contain = "contain" ;
lin VP2_is_likely_to_result_in = "is likely to result in" ;
lin VP2_result_in = "result in" ;
lin VP2_results_in = "results in" ;

lin VP2_affects = "affects" ;
lin VP2_applies_to = "applies to" ;
lin VP2_apply_concurrently_with = "apply concurrently with" ;
lin VP2_carry_out = "carry out" ;
lin VP2_conduct = "conduct" ;
lin VP2_does_not_apply_to = "does not apply to" ;
lin VP2_is_in_relation_to = "is in relation to" ;
lin VP2_is_prescribed_for = "is prescribed for" ;
lin VP2_is_stored_in = "is stored in" ;
lin VP2_makes = "makes" ;
lin VP2_notify = "notify" ;
lin VP2_provide = "provide" ;
lin VP2_relates_to = "relates to" ;
lin VP2_waive = "waive" ;
lin VP2_will_result_in = "will result in" ;
-}
}
