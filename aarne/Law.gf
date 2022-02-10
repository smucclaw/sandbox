abstract Law = {

flags startcat = LabLine ;

cat A ;
cat A2 ;
cat AP ;
cat CN ;
cat Comp ;
cat Conj ;
cat ConjCN ;
cat ConjCop ;
cat ConjItem ;
cat ConjN2 ;
cat ConjNP ;
cat ConjPP ;
cat ConjPPart ;
cat ConjVP2 ;
cat Cop ;
cat Date ;
cat Item ;
cat LabLine ;
cat Line ;
cat N2 ;
cat NP ;
cat Num ;
cat PP ;
cat PP2 ;
cat PPart ;
cat QCN ;
cat RS ;
cat Ref ;
cat S ;
cat SeqPP ;
cat Time ;
cat Title ;
cat VP ;
cat VP2 ;

fun A_affected : A ;
fun A_notifiable : A ;
fun A_other : A ;
fun A_prescribed : A ;
fun A_technological : A ;
fun A_written : A ;

fun A2_affected_by :  A2 ;
fun A2_affecting :  A2 ;
fun A2_applicable_to :  A2 ;
fun A2_in_relation_to :  A2 ;
fun A2_including :  A2 ;
fun A2_mentioned_in :  A2 ;
fun A2_on_behalf_of_and_for_the_purposes_of :  A2 ;
fun A2_other_than : A2 ;
fun A2_processing :  A2 ;
fun A2_under :  A2 ;

fun AP_A2_NP : A2 -> NP -> AP ;

fun CN_A_CN : A -> CN -> CN ;
fun CN_CN__AP_ : CN -> AP -> CN ;
fun CN_CN_AP : CN -> AP -> CN ;
fun CN_CN_ConjPP : CN -> ConjPP -> CN ;
fun CN_CN_RS : CN -> RS -> CN ;
fun CN_Commission : CN ;
fun CN_ConjCN_relating_to_NP : ConjCN -> NP -> CN ;
fun CN_N2_of_NP : N2 -> NP -> CN ;
fun CN_action : CN ;
fun CN_assessment : CN ;
fun CN_assessment_of_whether_S : S -> CN ;
fun CN_circumstances : CN ;
fun CN_class_of_personal_data : CN ;
fun CN_contract : CN ;
fun CN_data_breach : CN ;
fun CN_data_intermediary : CN ;
fun CN_device : CN ;
fun CN_duty : CN ;
fun CN_individual : CN ;
fun CN_individuals : CN ;
fun CN_information : CN ;
fun CN_law : CN ;
fun CN_law_enforcement_agency : CN ;
fun CN_measure : CN ;
fun CN_notification : CN ;
fun CN_number_of_CN : CN -> CN ;
fun CN_obligation : CN ;
fun CN_obligation_of_NP_to_VP : NP -> VP -> CN ;
fun CN_organisation : CN ;
fun CN_person : CN ;
fun CN_personal_data : CN ;
fun CN_professional_conduct : CN ;
fun CN_public_agency : CN ;
fun CN_purpose : CN ;
fun CN_requirement_to_VP : VP -> CN ;
fun CN_requirements : CN ;
fun CN_restriction_on_NP : NP -> CN ;
fun CN_secrecy : CN ;
fun CN_significant_harm_to_NP : NP -> CN ;
fun CN_storage_medium : CN ;

fun Comp_of_a_significant_scale : Comp ;

fun ConjCN_CN_Conj_CN : CN -> Conj -> CN -> ConjCN ;

fun ConjCop_Cop__Conj_Cop_ : Cop -> Conj -> Cop -> ConjCop ;

fun ConjItem_Item__ConjItem : Item -> ConjItem -> ConjItem ;
fun ConjItem_Item_Conj_Item : Item -> Conj -> Item -> ConjItem ;

fun ConjN2_N2__ConjN2 : N2 -> ConjN2 -> ConjN2 ;
fun ConjN2_N2_Conj_N2 : N2 -> Conj -> N2 -> ConjN2 ;

fun ConjNP_NP_Conj_NP : NP -> Conj -> NP -> ConjNP ;

fun ConjPP_PP_Conj_PP : PP -> Conj -> PP -> ConjPP ;

fun ConjPPart_PPart_Conj_PPart : PPart -> Conj -> PPart -> ConjPPart ;

fun ConjVP2_VP2__Conj_VP2_ : VP2 -> Conj -> VP2 -> ConjVP2 ;

fun Conj_and : Conj ;
fun Conj_or : Conj ;

fun Cop_is : Cop ;
fun Cop_is_likely_to_be : Cop ;

fun Date_1_February_2021 : Date ;

fun Item_1 : Item ;
fun Item_2 : Item ;
fun Item_3 : Item ;
fun Item_3b : Item ;
fun Item_4 : Item ;
fun Item_5 : Item ;
fun Item_6 : Item ;
fun Item_7 : Item ;
fun Item_8 : Item ;
fun Item_9 : Item ;
fun Item_a : Item ;
fun Item_b : Item ;
fun Item_1a : Item ;
fun Item_1b : Item ;
fun Item_26A : Item ;
fun Item_26B : Item ;
fun Item_26B1a : Item ;
fun Item_26C : Item ;
fun Item_26D : Item ;
fun Item_26E : Item ;


fun LabLine_Item_Line : Item -> Line -> LabLine ;
fun LabLine_Item__Line : Item -> Line -> LabLine ;
fun LabLine_Item__Item_Line : Item -> Item -> Line -> LabLine ;
fun LabLine_Line : Line -> LabLine ;
fun LabLine_Ref : Ref -> LabLine ;
fun LabLine_Title : Title -> LabLine ;

fun Line_NP_ : NP -> Line ;
fun Line_NP__Conj : NP -> Conj -> Line ; -- + in block
fun Line_S_ : S -> Line ;
fun Line_S_cont : S -> Line ;  -- ++
fun Line_S__Conj : S -> Conj -> Line ;  -- +
fun Line_S_if_ : S -> Line ; -- ++
fun Line_S_if_NP_ : S -> NP -> Line ;  -- ++ starts block
fun Line_VP__Conj : VP -> Conj -> Line ; -- +
fun Line_VP_c : VP -> Line ;  -- +
fun Line_VP_p : VP -> Line ;
fun Line_an_CN_is_not__PP__to_be_regarded_as_NP_of_ : CN -> PP -> NP -> Line ; -- ++
fun Line_if_S__Conj : S -> Conj -> Line ; -- +
fun Line_if_S_Conj : S -> Conj -> Line ; -- +
fun Line_in_other_prescribed_circumstances_ : Line ;
fun Line_other_prescribed_circumstances_ : Line ;
fun Line_where_S_ : S -> Line ; -- ++
fun Line_where_S__S_ : S -> S -> Line ;
fun Line_PP__Line : PP -> Line -> Line ; -- * recurs to line
fun Line_QCN__PP__means_ : QCN -> PP -> Line ;
fun Line_QCN_means_NP_ : QCN -> NP -> Line ;
fun Line_PP__unless_S_ : PP -> S -> Line ; -- ++
fun Line_where_an_CN_ : CN -> Line ; -- ++

fun N2_access : N2 ;
fun N2_collection : N2 ;
fun N2_copying : N2 ;
fun N2_disclosure : N2 ;
fun N2_disposal : N2 ;
fun N2_modification : N2 ;
fun N2_occurrence : N2 ;
fun N2_rule : N2 ;
fun N2_use : N2 ;

fun NP_CN : CN -> NP ;
fun NP_NP__Conj_NP__PP : NP -> Conj -> NP -> PP -> NP ;
fun NP_a_CN : CN -> NP ;
fun NP_all_the_CN_RS : CN -> RS -> NP ;
fun NP_an_CN : CN -> NP ;
fun NP_another_CN : CN -> NP ;
fun NP_any_CN : CN -> NP ;
fun NP_any_ConjCN : ConjCN -> NP ;
fun NP_being_in_breach : NP ;
fun NP_each_CN : CN -> NP ;
fun NP_it : NP ;
fun NP_not_fewer_than_NP : NP -> NP ;
fun NP_notifying_ConjNP : ConjNP -> NP ;
fun NP_section_Item : Item -> NP ;
fun NP_subsection_Item : Item -> NP ;
fun NP_subsection_ConjItem : ConjItem -> NP ;
fun NP_subsections_ConjItem : ConjItem -> NP ;
fun NP_that_CN : CN -> NP ;
fun NP_the_CN : CN -> NP ;
fun NP_the_loss_of_any_ConjCN_RS : ConjCN -> RS -> NP ;
fun NP_the_unauthorised_ConjN2_of_NP : ConjN2 -> NP -> NP ;
fun NP_this_CN : CN -> NP ;
fun NP_this_section : NP ;

fun Num_3 : Num ;

fun PP_PP__but_in_any_case_PP : PP -> PP -> PP ;
fun PP_PP2_NP : PP2 -> NP -> PP ;
fun PP_Time : Time -> PP ;
fun PP_as_soon_as_is_practicable : PP ;
fun PP_as_to_ConjNP : ConjNP -> PP ;
fun PP_in_a_reasonable_and_expeditious_manner : PP ;
fun PP_in_accordance_with_section_Ref : Ref -> PP ;
fun PP_in_any_manner_that_is_reasonable_in_the_circumstances : PP ;
fun PP_in_its_possession : PP ;
fun PP_in_this_Part : PP ;
fun PP_no_later_than_Num_calendar_days_after_the_day_S : Num -> S -> PP ;
fun PP_subject_to_any_conditions_that_the_Commission_thinks_fit : PP ;
fun PP_at_the_time_NP_notifies_ConjNP : NP -> ConjNP -> PP ;
fun PP__as_the_case_may_be_ : PP ;
fun PP_under_its_control : PP ;
fun PP_without_undue_delay : PP ;

fun PP2_by_reason_only_of : PP2 ;
fun PP2_despite : PP2 ;
fun PP2_in_accordance_with : PP2 ;
fun PP2_in_relation_to : PP2 ;
fun PP2_on_behalf_of_and_for_the_purposes_of : PP2 ;
fun PP2_on_the_written_application_of : PP2 ;
fun PP2_only_within : PP2 ;
fun PP2_prior_to_the_occurrence_of : PP2 ;
fun PP2_relating_to : PP2 ;
fun PP2_subject_to : PP2 ;
fun PP2_to_the_best_of_the_knowledge_and_belief_of : PP2 ;
fun PP2_upon_notification_by : PP2 ;
fun PP2_without_limiting : PP2 ;

fun PPart_made_in_the_form : PPart ;
fun PPart_submitted_in_the_manner_required_by_the_Commission : PPart ;

fun QCN__CN_ : CN -> QCN ;

fun RS_on_which_S : S -> RS ;
fun RS_that_NP_VP : NP -> VP -> RS ;
fun RS_that_VP : VP -> RS ;
fun RS_to_whom_NP_VP : NP -> VP -> RS ;
fun RS_where_S : S -> RS ;

fun Ref_402020 : Ref ;

fun S_NP_VP : NP -> VP -> S ;
fun S_the_context_otherwise_requires : S ;

fun SeqPP_PP : PP -> SeqPP ;
fun SeqPP_PP_SeqPP : PP -> SeqPP -> SeqPP ;

fun Time_on_or_after_assessing_that_S : S -> Time ;
fun Time_on_or_after_notifying_the_Commission_under_subsection_Item : Item -> Time ;

fun Title_Duty_to_conduct_assessment_of_data_breach : Title ;
fun Title_Duty_to_notify_occurrence_of_notifiable_data_breach : Title ;
fun Title_Interpretation_of_this_Part : Title ;
fun Title_NOTIFICATION_OF_DATA_BREACHES : Title ;
fun Title_Notifiable_data_breaches : Title ;
fun Title_PART_6A : Title ;
fun Title_obligations_of_data_intermediary_of_public_agency : Title ;

fun VP_ConjCop_Comp : ConjCop -> Comp -> VP ;
fun VP_ConjVP2_NP : ConjVP2 -> NP -> VP ;
fun VP_VP2_NP : VP2 -> NP -> VP ;
fun VP_VP2__SeqPP__NP : VP2 -> SeqPP -> NP -> VP ;
fun VP_VP__Conj_to_VP : VP -> Conj -> VP -> VP ;
fun VP_VP_PP : VP -> PP -> VP ;
fun VP_assesses__PP__that_S : PP -> S -> VP ;
fun VP_be_ConjPPart : ConjPPart -> VP ;
fun VP_be_a_CN : CN -> VP ;
fun VP_be_of_a_significant_scale : VP ;
fun VP_believe_that_S : S -> VP ;
fun VP_had_implemented__PP__NP : PP -> NP -> VP ;
fun VP_has_occurred : VP ;
fun VP_has_reason_to_VP : VP -> VP ;
fun VP_is_a_CN : CN -> VP ;
fun VP_is_deemed_not_to_VP : VP -> VP ;
fun VP_is_deemed_to_VP : VP -> VP ;
fun VP_is_likely_to_occur : VP ;
fun VP_is_processing_PP : PP -> VP ;
fun VP_may__SeqPP__VP : SeqPP -> VP -> VP ;
fun VP_must__SeqPP__VP : SeqPP -> VP -> VP ;
fun VP_must_VP : VP -> VP ;
fun VP_must_also_VP : VP -> VP ;
fun VP_must_not_VP : VP -> VP ;
fun VP_notify_NP_of_NP : NP -> NP -> VP ;
fun VP_occurs_on_or_after_Date : Date -> VP ;
fun VP_relates : VP ;
fun VP_renders_it_unlikely_that_S : S -> VP ;
fun VP_so_VP : VP -> VP ;
fun VP_takes_NP__PP__RS : NP -> PP -> RS -> VP ;
fun VP_directs : VP ;
fun VP_instructs : VP ;

fun VP2_conduct : VP2 ;
fun VP2_contain : VP2 ;
fun VP2_is_likely_to_result_in : VP2 ;
fun VP2_result_in : VP2 ;
fun VP2_results_in : VP2 ;
fun VP2_affects : VP2 ;
fun VP2_applies_to : VP2 ;
fun VP2_apply_concurrently_with : VP2 ;
fun VP2_carry_out : VP2 ;
fun VP2_conduct : VP2 ;
fun VP2_does_not_apply_to : VP2 ;
fun VP2_is_in_relation_to : VP2 ;
fun VP2_is_prescribed_for : VP2 ;
fun VP2_is_stored_in : VP2 ;
fun VP2_makes : VP2 ;
fun VP2_notify : VP2 ;
fun VP2_provide : VP2 ;
fun VP2_relates_to : VP2 ;
fun VP2_waive : VP2 ;
fun VP2_will_result_in : VP2 ;


}
