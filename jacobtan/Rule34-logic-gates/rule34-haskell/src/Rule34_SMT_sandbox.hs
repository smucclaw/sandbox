module Rule34_SMT_sandbox where

import Data.SBV

gates = do

--- | generated code starts here

  p_34_1a_undignified <- sBool "34.1a undignified"
  p_34_1c_unfairly_attractive <- sBool "34.1c unfairly attractive"
  p_34_1d_fee_sharing <- sBool "34.1d fee sharing"
  p_34_1e_goto_1st_schedule <- sBool "34.1e GOTO 1st Schedule"
  p_34_1f_otherwise_prohibited <- sBool "34.1f otherwise prohibited"
  p_34_1b_materially_interferes <- sBool "34.1b materially interferes"
  p_business_entity_not_law_related <- sBool "business entity, not law-related"
  p_2nd_schedule <- sBool "2nd schedule"
  p_is_locum <- sBool "is locum"
  let p_34_5 = sAnd [p_business_entity_not_law_related, p_2nd_schedule, p_is_locum ]
  let p_34_1a_34_1c_f = sOr [p_34_1a_undignified, p_34_1c_unfairly_attractive, p_34_1d_fee_sharing, p_34_1e_goto_1st_schedule, p_34_1f_otherwise_prohibited ]
  let p_p345_subject_to_p341a'p341c_tif = sNot p_34_1a_34_1c_f
  let p_p345_with_defeasibility = sAnd [p_34_5, p_p345_subject_to_p341a'p341c_tif ]
  let p_p345_despite_p341b = sNot p_p345_with_defeasibility
  let p_p341b_with_defeasibility = sAnd [p_34_1b_materially_interferes, p_p345_despite_p341b ]
  let p_34_1_associated_with_bad_business = sOr [p_34_1a_undignified, p_34_1c_unfairly_attractive, p_34_1d_fee_sharing, p_34_1e_goto_1st_schedule, p_34_1f_otherwise_prohibited, p_p341b_with_defeasibility ]
  p_34_2_connected_see_sub_conditions <- sBool "34.2 connected [see sub conditions]"
  let p_p342_subject_to_p341 = sNot p_34_1_associated_with_bad_business
  let p_p342_with_defeasibility = sAnd [p_34_2_connected_see_sub_conditions, p_p342_subject_to_p341 ]
  p_34_3_law_related_i_e_4th_schedule <- sBool "34.3 Law-related, i.e. 4th schedule"
  let p_p343_subject_to_p341 = sNot p_34_1_associated_with_bad_business
  let p_p343_with_defeasibility = sAnd [p_34_3_law_related_i_e_4th_schedule, p_p343_subject_to_p341 ]
  p_not_locum <- sBool "not locum"
  let p_34_4 = sAnd [p_not_locum, p_business_entity_not_law_related, p_2nd_schedule ]
  let p_p344_subject_to_p341 = sNot p_34_1_associated_with_bad_business
  let p_p344_with_defeasibility = sAnd [p_34_4, p_p344_subject_to_p341 ]
  let p_34_6 = sNot . sOr $ [p_p342_with_defeasibility, p_p343_with_defeasibility, p_p344_with_defeasibility, p_p345_with_defeasibility ]
  let p_must_not = sOr [p_34_1_associated_with_bad_business, p_34_6 ]
  p_3rd_schedule <- sBool "3rd schedule"
  let p_34_7 =  p_3rd_schedule
  let p_p347_despite_pmustnot = sNot p_34_7
  let p_pmustnot_with_defeasibility = sAnd [p_must_not, p_p347_despite_pmustnot ]
  let p_must_not_bulb = p_pmustnot_with_defeasibility
  let p_may = sOr [p_34_7, p_p342_with_defeasibility, p_p343_with_defeasibility, p_p344_with_defeasibility, p_p345_with_defeasibility ]
  let p_may_bulb = p_may

--- | generated code ends here

  --- | Constraint based on common sense and definitions in Rule34.
  constrain $ sNot $ p_not_locum .&& p_is_locum -- cannot both be true
  constrain $ sNot p_is_locum .|| p_business_entity_not_law_related -- IsLocum implies BusinessEntity'NotLawRelated
  constrain $ sNot p_not_locum .|| p_business_entity_not_law_related -- NotLocum implies BusinessEntity'NotLawRelated
  constrain $ pbAtMost [p_p342_with_defeasibility, p_p343_with_defeasibility, p_business_entity_not_law_related, p_3rd_schedule] 1
  --- ^ mutually exclusive: 34.2 connected to Singapore law practice,
  ---                       34.3 business entity (law-related)
  ---                       34.4 34.5 business entity (not law-related)
  ---                       34.7 in 3rd schedule

  --- ^ The above constraints are optional.
  --    Prevents SMT from producing absurd models.

  constrain $ pbAtMost [p_34_1a_undignified, p_34_1c_unfairly_attractive, p_34_1d_fee_sharing, p_34_1e_goto_1st_schedule, p_34_1f_otherwise_prohibited] 1
  constrain $ sNot p_2nd_schedule .|| p_business_entity_not_law_related -- 2ndSchedule implies BusinessEntity'NotLawRelated
  constrain $ p_3rd_schedule .== sFalse
  --- ^ just to reduce unnecessary models returned by SMT
  
  --- | Usage: uncomment one of the lines below, and comment out the rest
  return $ sNot p_must_not_bulb .&& p_may_bulb -- (not MustNot) && (May)
  -- return $ p_must_not_bulb .&& p_may_bulb -- MustNot && May (unsatisfiable)
  -- return $ sNot p_must_not_bulb .&& sNot p_may_bulb -- (not MustNot) && (not May) (unsatisfiable)


rule34_SMT_sandbox :: IO ()
rule34_SMT_sandbox = sat gates >>= print

main :: IO ()
main = rule34_SMT_sandbox

-- | If without constraints, long wait and many solutions.
mainAllSat :: IO ()
mainAllSat = allSat gates >>= print
