concrete LawEng of Law =
  open
    (S=SyntaxEng),
    SyntaxEng,
    (P=ParadigmsEng),
    ParadigmsEng,
    SymbolicEng,
    MarkupEng,
    (G=GrammarEng),
    (E=ExtendEng),
    (X=ExtraEng), --- that_RP
    (Mk=MakeStructuralEng),
    (I=IrregEng)
  in {

lincat A = S.A ;
lincat A2 = S.A2 ;
lincat AP = S.AP ;
lincat CN = S.CN ;
lincat Comp = S.Comp ;
lincat Conj = S.Conj ;
lincat ConjCN = S.CN ;
lincat ConjCop = Str ; --- G.VPS ; 
lincat ConjItem = Str ;
lincat ConjN2 = S.CN ;
lincat ConjNP = S.NP ;
lincat ConjPP = S.Adv ;
lincat ConjPPart = Str ;
lincat ConjVP2 = E.VPS2 ;
lincat Cop = Str ; --- G.VP ; -- UseCopula
lincat Date = Str ;
lincat Item = Str ;
lincat LabLine = Str ;
lincat Line = Str ;
lincat N2 = S.N2 ;
lincat NP = S.NP ;
lincat Num = S.Card ;
lincat PP = S.Adv ;
lincat PP2 = S.Prep ;
lincat PPart = Str ;
lincat QCN = S.CN ;
lincat RS = S.RS ;
lincat Ref = Str ;
lincat S = S.Cl ;
lincat SeqPP = S.Adv ;
lincat Time = Str ;
lincat Title = Str ;
lincat VP = E.VP ;
lincat VP2 = VPSlash ;

oper parenth = overload {
    parenth : S.AP -> S.AP = \ap -> MarkupAP (myMark "(" ")") ap ;
    } ;
oper str = overload {
    str : S.Adv -> Str = \x -> (mkUtt x).s ;
    str : S.Conj -> Str = \conj -> conj.s2 ;
    str : S.NP -> Str = \x -> (mkUtt x).s ;
    str : S.Cl -> Str = \x -> (mkUtt (mkS x)).s ;
    str : S.VP -> Str = \x -> (mkUtt x).s ; ----
    } ;

myMark : Str -> Str -> Mark = \b,e -> lin Mark {begin = b ; end = e} ;
oper enclose = overload {
    enclose : (b,e : Str) -> S.Adv -> S.Adv = \b,e,np -> MarkupAdv (myMark b e) np ;
    enclose : (b,e : Str) -> S.NP -> S.NP = \b,e,np -> MarkupNP (myMark b e) np ;
    } ;

--- to work around an overload resolution failure
oper prefixCommaAdvVP : S.Adv -> S.VP-> S.VP = \adv, vp ->
  mkVP (lin AdV (MarkupAdv (myMark "," ",") adv)) vp ;

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
lin CN_ConjCN_relating_to_NP conjcn np = mkCN conjcn (S.mkAdv (mkPrep "relating to") np) ;
lin CN_N2_of_NP n2 np = mkCN n2 np ;
lin CN_action = mkCN (mkN "action") ;
lin CN_assessment = mkCN (mkN "assessment") ;
lin CN_assessment_of_whether_S s = mkCN (mkN "assessment") (S.mkAdv (lin Subj {s = "of whether"}) (mkS s)) ;  --- really: CN of QS
lin CN_circumstances = mkCN (mkN "circumstance") ; ----
lin CN_class_of_personal_data = mkCN (mkN "class") (S.mkAdv possess_Prep (mkNP (mkCN (mkA "personal") (mkN "data")))) ;
lin CN_contract = mkCN (mkN "contract") ;
lin CN_data_breach = mkCN (mkN "data breach") ;
lin CN_data_intermediary = mkCN (mkN "data intermediary") ;
lin CN_device = mkCN (mkN "device") ;
lin CN_duty = mkCN (mkN "duty") ;
lin CN_individual = mkCN (mkN "individual") ;
--lin CN_individuals = mkCN (mkN "individual") ; ---- redundant
lin CN_information = mkCN (mkN "information") ;
lin CN_law = mkCN (mkN "law") ;
lin CN_law_enforcement_agency = mkCN (mkN "law enforcement agency") ;
lin CN_measure = mkCN (mkN "measure") ;
lin CN_notification = mkCN (mkN "notification") ;
lin CN_number_of_CN cn = mkCN (mkN "number") (S.mkAdv possess_Prep (mkNP aPl_Det cn)) ;
lin CN_obligation = mkCN (mkN "obligation") ;
lin CN_obligation_of_NP_to_VP np vp = mkCN (mkCN (mkN2 (mkN "obligation")) np) vp ;
lin CN_organisation = mkCN (mkN "organisation") ;
lin CN_person = mkCN (mkN "person") ;
lin CN_personal_data = mkCN (mkA "personal") (mkN "data") ;
lin CN_professional_conduct = mkCN (mkA "professional") (mkN "conduct") ;
lin CN_public_agency = mkCN (mkA "public") (mkN "agency") ;
lin CN_purpose = mkCN (mkN "purpose") ;
lin CN_requirement_to_VP vp = mkCN (mkCN (mkN "requirement")) vp ;
lin CN_requirements = mkCN (mkN "requirement") ; ---- change fun name
lin CN_restriction_on_NP np = mkCN (mkN "restriction") (S.mkAdv on_Prep np) ;
lin CN_secrecy = mkCN (mkN "secrecy") ;
lin CN_significant_harm_to_NP np = mkCN (mkCN (mkA "significant") (mkN "harm")) (S.mkAdv to_Prep np) ;
lin CN_storage_medium = mkCN (mkN "storage medium" "storage media") ;

lin Comp_of_a_significant_scale = mkComp (S.mkAdv possess_Prep (mkNP a_Det (mkCN (mkA "significant") (mkN "scale")))) ;

lin ConjCN_CN_Conj_CN cn conj cn2 = G.ConjCN conj (G.BaseCN cn cn2) ;
lin ConjCop_Cop__Conj_Cop_ cop1 conj cop2 = cop1 ++ "," ++ str conj ++ cop2 ++ "," ;
lin ConjItem_Item__ConjItem item conjitem = item ++ "," ++ conjitem ;
lin ConjItem_Item_Conj_Item item conj item2 = item ++ str conj ++ item2 ;
lin ConjN2_N2__ConjN2 n2 conjn2 = G.ConjCN (mkConj ",") (G.BaseCN (mkCN n2) conjn2) ; --- a hack, should use proper ListCN
lin ConjN2_N2_Conj_N2 n2 conj n22 = G.ConjCN conj (G.BaseCN (mkCN n2) (mkCN n22)) ;
lin ConjNP_NP_Conj_NP np conj np2 = mkNP conj np np2 ;
lin ConjPP_PP_Conj_PP pp conj pp2 = S.mkAdv conj pp pp2 ;
lin ConjPPart_PPart_Conj_PPart ppart conj ppart2 = ppart ++ str conj ++ ppart2 ;
----lin ConjVP2_VP2__Conj_VP2_ vp21 conj vp22 = vp21 ++ "," ++ conj ++ vp22 ++ "," ;
lin Conj_and = and_Conj ;
lin Conj_or = or_Conj ;
lin Cop_is = "is" ; --- G.UseCopula ;
lin Cop_is_likely_to_be = "is likely to be" ; --- mkVP (mkAP (mkAP (mkA "likely")) (mkSC G.UseCopula)) ;
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

lin NP_CN cn = mkNP cn ; ---- TODO: both Sg and Pl
lin NP_NP__Conj_NP__PP np conj np2 pp = mkNP (mkNP conj np (enclose "," "," np2)) pp ;
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
lin NP_notifying_ConjNP conjnp = mkNP (mkCN (mkN "notifying") (S.mkAdv noPrep conjnp)) ; --- hack, should be gerund construction
lin NP_section_Item item = mkNP (mkCN (mkN "section") <symb (mkSymb item) : NP>) ; 
lin NP_subsection_Item item = mkNP (mkCN (mkN "subsection") <symb (mkSymb item) : NP>) ; 
lin NP_subsection_ConjItem items = mkNP (mkCN (mkN "subsection") <symb (mkSymb items) : NP>) ; 
lin NP_subsections_ConjItem items = mkNP (mkCN (mkN "subsections") <symb (mkSymb items) : NP>) ; 
lin NP_that_CN cn = mkNP that_Det cn ;
lin NP_the_CN cn = mkNP the_Det cn ; ---- both Sg and Pl ?
lin NP_the_Commission = mkNP the_Det (mkN "Commission") ;
lin NP_the_loss_of_any_ConjCN_RS conjcn rs = mkNP the_Det (mkCN (mkN2 (mkN "loss")) (mkNP (Mk.mkDet "any") (mkCN conjcn rs))) ;
lin NP_the_unauthorised_ConjN2_of_NP conjn2 np = mkNP (mkCN (mkCN (mkA "unauthorised") conjn2) (S.mkAdv possess_Prep np)) ;
lin NP_this_CN cn = mkNP this_Det cn ;
lin NP_this_section = mkNP this_Det (mkN "section") ;

lin Num_3 = mkCard "3" ;

lin PP_PP__but_in_any_case_PP pp pp2 = lin Adv {s = pp.s ++ ", but in any case" ++ pp2.s} ; ---
lin PP_PP2_NP pp2 np = S.mkAdv pp2 np ; 
lin PP_Time time = P.mkAdv time ;
lin PP_as_soon_as_is_practicable = P.mkAdv "as soon as is practicable" ;
lin PP_as_to_ConjNP conjnp = S.mkAdv (mkPrep "as to") conjnp ;
lin PP_in_a_reasonable_and_expeditious_manner = P.mkAdv ("in a reasonable and expeditious manner") ;
lin PP_in_any_manner_that_is_reasonable_in_the_circumstances = P.mkAdv"in any manner that is reasonable in the circumstances" ;
lin PP_in_its_possession = P.mkAdv "in its possession" ;
lin PP_in_this_Part = P.mkAdv "in this Part" ;
lin PP_no_later_than_Num_calendar_days_after_the_day_S num s = S.mkAdv (mkPrep "no later than") (mkNP (mkNP num (mkN "calendar day")) (S.mkAdv (lin Subj {s = "after the day"}) (mkS s))) ;
lin PP_subject_to_any_conditions_that_the_Commission_thinks_fit = P.mkAdv "subject to any conditions that the Commission thinks fit" ;
lin PP_at_the_time_NP_notifies_ConjNP np conjnp = S.mkAdv (lin Subj {s = "at the time"}) (mkS (mkCl np (mkV2 "notify") conjnp)) ;
lin PP__as_the_case_may_be_ = P.mkAdv "( as the case may be )";
lin PP_under_its_control = P.mkAdv "under its control" ;
lin PP_without_undue_delay = P.mkAdv "without undue delay" ;

lin PPart_made_in_the_form = "made in the form" ;
lin PPart_submitted_in_the_manner_required_by_the_Commission = "submitted in the manner required by the Commission" ;

lin PP2_by_reason_only_of = mkPrep "by reason only of" ;
lin PP2_despite = mkPrep "despite" ;
lin PP2_in_accordance_with = mkPrep "in accordance with" ;
lin PP2_in_relation_to = mkPrep "in relation to" ;
lin PP2_on_behalf_of_and_for_the_purposes_of = mkPrep "on behalf of and for the purposes of" ;
lin PP2_on_the_written_application_of = mkPrep "on the written application of" ;
lin PP2_only_within = mkPrep "only within" ;
lin PP2_prior_to_the_occurrence_of = mkPrep "prior to the occurrence of" ;
lin PP2_relating_to = mkPrep "relating to" ;
lin PP2_subject_to = mkPrep "subject to" ;
lin PP2_to_the_best_of_the_knowledge_and_belief_of = mkPrep "to the best of the knowledge and belief of" ;
lin PP2_upon_notification_by = mkPrep "upon notification by" ;
lin PP2_without_limiting = mkPrep "without limiting" ;

lin QCN__CN_ cn = MarkupCN (myMark "“" "”") cn ;

lin RS_on_which_S s = mkRS (mkRCl which_RP (mkClSlash s on_Prep)) ;
lin RS_that_NP_VP np vp = mkRS (mkRCl X.that_RP (mkClSlash (mkCl np vp) noPrep)) ; ---
lin RS_that_VP vp = mkRS (mkRCl X.that_RP vp) ;
lin RS_to_whom_NP_VP np vp = lin RS {s = \\_ => "to whom" ++ (mkS (mkCl np vp)).s ; c = nominative} ; --- hack, because the form "whom" is not accessible in the RGL
lin RS_where_S s = lin RS {s = \\_ => "where" ++ (mkS s).s ; c = nominative} ; --- might be OK as RS, although "where" is not an RP

lin Ref_402020 = "[40/2020]" ;

lin S_NP_VP np vp = mkCl np vp ;
lin S_the_context_otherwise_requires = mkCl (mkNP the_Det (mkN "context")) (mkVP (mkAdV "otherwise") (mkVP (mkV "require"))) ;

lin SeqPP_PP pp = pp ;
lin SeqPP_PP_SeqPP pp seqpp = lin Adv {s = pp.s ++ seqpp.s} ;

lin Time_on_or_after_assessing_that_S s = "on or after assessing that" ++ str s ;
lin Time_on_or_after_notifying_the_Commission_under_subsection_Item item = "on or after notifying the Commission under subsection" ++ item ;

lin Title_Duty_to_conduct_assessment_of_data_breach = "Duty to conduct assessment of data breach" ;
lin Title_Duty_to_notify_occurrence_of_notifiable_data_breach = "Duty to notify occurrence of notifiable data breach" ;
lin Title_Interpretation_of_this_Part = "Interpretation of this Part" ;
lin Title_NOTIFICATION_OF_DATA_BREACHES = "NOTIFICATION OF DATA BREACHES" ;
lin Title_Notifiable_data_breaches = "Notifiable data breaches" ;
lin Title_PART_6A = "PART 6A" ;
lin Title_obligations_of_data_intermediary_of_public_agency = "obligations of data intermediary of public agency" ;

----lin VP_ConjCop_Comp conjcop comp = conjcop ++ comp ;
---lin VP_ConjVP2_NP conjvp2 np = E.ComplVPS2 conjvp2 np ; --- does not give VP but VPS
lin VP_VP2_NP vp2 np = mkVP vp2 np ;
lin VP_VP2__SeqPP__NP v2 seqpp np = mkVP (G.AdvVPSlash v2 (enclose "," "," seqpp)) np ;
----lin VP_VP__Conj_to_VP vp conj vp2 = vp ++ "," ++ conj ++ "to" ++ vp2 ; --- VPI
lin VP_VP_PP vp pp = mkVP vp pp ;
lin VP_assesses__PP__that_S pp s = mkVP (mkVP (mkVP (mkV "assess")) (enclose "," "," pp)) (S.mkAdv that_Subj (mkS s)) ;
lin VP_be_ConjPPart conjppart = mkVP (lin Adv {s = conjppart}) ; ----
lin VP_be_a_CN cn = mkVP cn ;
lin VP_be_of_a_significant_scale = mkVP (S.mkAdv possess_Prep (mkNP a_Det (mkCN (mkA "significant") (mkN "scale")))) ;
lin VP_believe_that_S s = mkVP (mkVS (mkV "believe")) (mkS s) ;
----lin VP_had_implemented__PP__NP pp np = "had implemented ," ++ pp ++ "," ++ np ;
lin VP_has_occurred = mkVP (mkV "occur") ; ---- perfect tense to do
lin VP_has_reason_to_VP vp = mkVP have_V2 (mkNP (mkCN (mkN "reason") vp)) ;
--lin VP_is_a_CN cn = mkVP cn ; ---- already redundant
----lin VP_is_deemed_not_to_VP vp = "is deemed not to" ++ vp ; ---- to be made redundant
lin VP_is_deemed_to_VP vp = mkVP (mkAP (mkAP (mkA "deemed")) (mkSC vp)) ;
lin VP_is_likely_to_occur = mkVP (mkAP (mkAP (mkA "likely")) (mkSC (mkVP (mkV "occur")))) ;
lin VP_is_processing_PP pp = progressiveVP (mkVP (mkVP (mkV "process")) pp) ; ---- generalize progressive
lin VP_may__SeqPP__VP seqpp vp = mkVP X.may_VV (prefixCommaAdvVP seqpp vp) ;
lin VP_must__SeqPP__VP seqpp vp = mkVP must_VV (prefixCommaAdvVP seqpp vp) ;
lin VP_must_VP vp = mkVP must_VV vp ;
lin VP_must_also_VP vp = mkVP must_VV (mkVP (mkAdV "also") vp) ;
----lin VP_must_not_VP vp = "must not" ++ vp ; ---- will be redundant
lin VP_notify_NP_of_NP np np2 = mkVP (mkVP (mkV2 (mkV "notify")) np) (S.mkAdv possess_Prep np2) ;
lin VP_occurs_on_or_after_Date date = mkVP (mkVP (mkV "occur")) (S.mkAdv (mkPrep "on or after") <symb date : NP>) ;
lin VP_relates = mkVP (mkV "relate") ;
lin VP_renders_it_unlikely_that_S s = mkVP (mkV2A (mkV "render")) it_NP (mkAP (mkAP (mkA "unlikely")) (mkSC (mkS s))) ;
lin VP_so_VP vp = mkVP (mkAdV "so") vp ;
lin VP_takes_NP__PP__RS np pp rs = mkVP (mkV2 I.take_V) (mkNP (mkNP np (enclose "," "" pp)) rs) ; --- a second "," would result in two subsequent commas
lin VP_directs = mkVP (mkV "direct") ;
lin VP_instructs = mkVP (mkV "instruct") ;

lin VP2_conduct = mkVPSlash (mkV2 "conduct") ;
lin VP2_contain = mkVPSlash (mkV2 "contain") ;
lin VP2_is_likely_to_result_in = G.VPSlashPrep (mkVP (mkAP (mkAP (mkA "likely")) (mkSC (mkVP (mkV "result"))))) in_Prep ; 
lin VP2_result_in = mkVPSlash (mkV2 (mkV "result") in_Prep) ;
--lin VP2_results_in = mkVPSlash (mkV2 (mkV "result") in_Prep) ; ---- redundant

lin VP2_affects = mkVPSlash (mkV2 "affect") ;
lin VP2_applies_to = mkVPSlash (mkV2 (mkV "apply") to_Prep) ;
lin VP2_apply_concurrently_with = mkVPSlash (mkV2 (mkV "apply") (mkPrep "concurrently with")) ;
lin VP2_carry_out = mkVPSlash (mkV2 (partV (mkV "carry") "out")) ;
lin VP2_conduct = mkVPSlash (mkV2 "conduct") ;
----lin VP2_does_not_apply_to = "does not apply to" ; ---- to be made redundant
lin VP2_is_in_relation_to = G.VPSlashPrep (mkVP (P.mkAdv "in relation")) to_Prep ; --- not in API
lin VP2_is_prescribed_for = G.VPSlashPrep (mkVP (mkA "prescribed")) for_Prep ; --- not in API
lin VP2_is_stored_in = G.VPSlashPrep (mkVP (mkA "stored")) in_Prep ; --- not in API
lin VP2_makes = mkVPSlash (mkV2 I.make_V) ;
lin VP2_notify = mkVPSlash (mkV2 "notify") ;
lin VP2_provide = mkVPSlash (mkV2 "provide") ;
lin VP2_relates_to = mkVPSlash (mkV2 (mkV "relate") to_Prep) ;
lin VP2_waive = mkVPSlash (mkV2 "waive") ;
----lin VP2_will_result_in = "will result in" ; ---- to be made redundant

------------------------------
-- for other uses than parsing the original text
------------------------------

lin Line_if_S__S a b = str (S.mkAdv if_Subj (mkS a)) ++ "," ++ str b ;
lin VP_be_AP ap = mkVP ap ;
lin VP_be_A a = mkVP a ;
lin NP_every_CN cn = mkNP every_Det cn ;
lin NP_the_CN_s cn = mkNP thePl_Det cn ;
lin NP_CN_s cn = mkNP aPl_Det cn ;

lincat Utt = S.Utt ;
lincat QS = S.QCl ;

lin Utt_S s = mkUtt (mkS s) ;
lin Utt_QS s = mkUtt (mkQS s) ;
lin QS_S s = mkQCl s ;

lin Utt_demo_S s = mkUtt (mkQS (mkQCl s)) | mkUtt (mkS s) ;

}
