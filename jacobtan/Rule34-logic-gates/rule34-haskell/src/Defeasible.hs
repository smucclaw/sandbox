

-- incomplete ... we'll come back to this
module Defeasible where

data Defeasor pn = Notwithstanding [pn]
                 | SubjectTo       [pn]
                 | Despite         [pn]
              deriving (Show, Eq, Read)

class Defeasible x where
  subjectTo       :: x -> x -> x
  notwithstanding :: x -> x -> x
  notwithstanding = flip subjectTo
  despite         :: x -> x -> x
  despite = notwithstanding
  normalize_1     :: [x] -> [x]
  normalize_1 = id

-- defeasibility -- evaluation
instance Defeasible Bool where
  x `subjectTo` y = not y && x

-- defeasibility -- normalization and graph transformation
-- instance Defeasible (Labeled Label MyRule) where
--   (Labeled xl xi) `subjectTo` (Labeled yl yi) = Labeled xl (xi { defeasors = (SubjectTo [yl]) : defeasors xi })

  -- in every rule x which is notwithstanding y,
  -- rewrite to say that y is subject to x
  normalize_1 = id

  -- there is an order of evaluation in the defeasors, so maybe we
  -- can't actually merge all SubjectTo etc together.
