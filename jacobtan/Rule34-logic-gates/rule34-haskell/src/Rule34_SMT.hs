module Rule34_SMT where

import Data.SBV

p341a' = id
p341b' = id

pMustNot' x y = p341a' x .|| p341b' y :: SBool

example = do
  p341a' <- sBool "34.1a"
  p341b' <- sBool "34.1b"
  return $ p341a' .|| p341b'


gates = do
  p341a <- sBool "34.1a undignified"
  p341c <- sBool "34.1c unfairly attractive"
  p341d <- sBool "34.1d fee sharing"
  p341e <- sBool "34.1e GOTO 1st Schedule"
  p341f <- sBool "34.1f otherwise prohibited"

  pNotLocum <- sBool "not locum"
  pBusinessEntity'NotLawRelated <- sBool "business entity - not law-related"
  p2ndSchedule <- sBool "2nd schedule"
  pIsLocum <- sBool "is locum"
  let p341a'p341c_to_f = sOr [p341a, p341c, p341d, p341e, p341f]

  let p344 = sAnd [pNotLocum, pBusinessEntity'NotLawRelated, p2ndSchedule]
      p345 = sAnd [pBusinessEntity'NotLawRelated, p2ndSchedule, pIsLocum]
      p345'SubjectTo'p341a'p341c_to_f = sNot p341a'p341c_to_f

  let p345'defeas = (.&&) p345 p345'SubjectTo'p341a'p341c_to_f

  p341b <- sBool "34.1b materially interferes"
  let p345'despite'p341b = sNot p345'defeas

  let p341b'defeas = (.&&) p341b p345'despite'p341b

  let p341 = sOr [p341a, p341b'defeas, p341c, p341d, p341e, p341f]

  p3rdSchedule <- sBool "3rd schedule"
  let p344'SubjectTo'p341 = sNot p341
      p342'SubjectTo'P341 = sNot p341
  p342 <- sBool "34.2 connected [see sub conditions]"
  let p343'SubjectTo'P341 = sNot p341
  p343 <- sBool "34.3 Law-related - i.e. 4th schedule"

  let p347 = p3rdSchedule
      p344'defeas = (.&&) p344 p344'SubjectTo'p341
      p342'defeas = (.&&) p342'SubjectTo'P341 p342
      p343'defeas = (.&&) p343'SubjectTo'P341 p343

  let pMay = sOr [p342'defeas, p343'defeas, p344'defeas, p345'defeas, p347]
      p346 = sNot . sOr $ [p342'defeas, p343'defeas, p344'defeas, p345'defeas]

  let p347'despite'pMustNot = sNot p347
      pMay'Bulb = pMay
      pMustNot = (.||) p346 p341

  let pMustNot'defeas = (.&&) p347'despite'pMustNot pMustNot

  let pMustNot'Bulb = pMustNot'defeas

  --- | Constraint based on common sense and definitions in Rule34.
  constrain $ sNot $ pNotLocum .&& pIsLocum -- cannot both be true
  constrain $ sNot pIsLocum .|| pBusinessEntity'NotLawRelated -- IsLocum implies BusinessEntity'NotLawRelated
  constrain $ sNot pNotLocum .|| pBusinessEntity'NotLawRelated -- NotLocum implies BusinessEntity'NotLawRelated
  constrain $ pbAtMost [p342, p343, pBusinessEntity'NotLawRelated, p3rdSchedule] 1
  --- ^ mutually exclusive: 34.2 connected to Singapore law practice,
  ---                       34.3 business entity (law-related)
  ---                       34.4 34.5 business entity (not law-related)
  ---                       34.7 in 3rd schedule

  --- ^ The above constraints are optional.
  --    Prevents SMT from producing absurd models.

  constrain $ pbAtMost [p341a, p341c, p341d, p341e, p341f] 1
  constrain $ sNot p2ndSchedule .|| pBusinessEntity'NotLawRelated -- 2ndSchedule implies BusinessEntity'NotLawRelated
  constrain $ p3rdSchedule .== sFalse
  --- ^ just to reduce unnecessary models returned by SMT
  
  return $ sNot pMustNot'Bulb .&& pMay'Bulb -- (not MustNot) && (May)
  -- return $ pMustNot'Bulb .&& pMay'Bulb -- MustNot && May (unsatisfiable)
  -- return $ sNot pMustNot'Bulb .&& sNot pMay'Bulb -- (not MustNot) && (not May) (unsatisfiable)

rule34_SMT_main :: IO ()
rule34_SMT_main = sat gates >>= print

main = rule34_SMT_main