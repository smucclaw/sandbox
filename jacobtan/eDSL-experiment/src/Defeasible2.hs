-- From: https://www.youtube.com/watch?v=EshxZVMURt4&t=25m57s
--   Sarah Lawsky: Formal Methods and the Law

{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

module Defeasible2 where

data IsPersonal = Personal | NotPersonal
data IsQri = Qri | NotQri
data IsDeductible = Deductible | NotDeductible
data IsDeductible' (r :: IsDeductible)

class Interest (a :: IsPersonal) (b :: IsQri) (r :: IsDeductible) where
  deductible :: Bool
  deductibleT :: IsDeductible' r
  deductibleT = undefined

instance {-# OVERLAPS #-} r ~ Deductible => Interest a b r where
  deductible = True

instance {-# OVERLAPS #-} r ~ NotDeductible => Interest Personal b r where
  deductible = False

instance {-# OVERLAPS #-} r ~ Deductible => Interest Personal Qri r where
  deductible = True

x = deductible @NotPersonal
y = deductible @Personal @NotQri
z = deductible @Personal @Qri

xT = deductibleT @NotPersonal
yT = deductibleT @Personal @NotQri
zT = deductibleT @Personal @Qri

main :: IO ()
main = do
  print x
  print y
  print z