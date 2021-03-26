-- From: https://www.youtube.com/watch?v=EshxZVMURt4&t=25m57s
--   Sarah Lawsky: Formal Methods and the Law

{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Defeasible3 where

data IsPersonal = Personal | NotPersonal
data IsQri = Qri | NotQri
data IsDeductible = Deductible | NotDeductible
data IsDeductible' (r :: IsDeductible)
data Interest (a :: IsPersonal) (b :: IsQri)
data Other

class BDeductible (r :: IsDeductible) where
  bDeductible :: Bool
instance BDeductible Deductible where
  bDeductible = True
instance BDeductible NotDeductible where
  bDeductible = False

class BDeductible r => CDeductible a (r :: IsDeductible) | a -> r where
  deductible :: Bool
  deductible = bDeductible @r
  deductibleT :: IsDeductible' r
  deductibleT = undefined 

instance {-# OVERLAPS #-} r ~ Deductible => CDeductible (Interest a b) r where
  -- deductible = True

instance {-# OVERLAPS #-} r ~ NotDeductible => CDeductible (Interest Personal b) r where
  -- deductible = False

instance {-# OVERLAPS #-} r ~ Deductible => CDeductible (Interest Personal Qri) r where
  -- deductible = True

instance r ~ NotDeductible => CDeductible Other r where
  -- deductible = False

x = deductible @(Interest NotPersonal _)
y = deductible @(Interest Personal NotQri)
z = deductible @(Interest Personal Qri)

xT = deductibleT @(Interest NotPersonal _)
yT = deductibleT @(Interest Personal NotQri)
zT = deductibleT @(Interest Personal Qri)

main :: IO ()
main = do
  print x
  print y
  print z