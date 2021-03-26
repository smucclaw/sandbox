-- From: https://www.youtube.com/watch?v=EshxZVMURt4&t=25m57s
--   Sarah Lawsky: Formal Methods and the Law

{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

module Defeasible where

data IsPersonal = Personal | NotPersonal
data IsQri = Qri | NotQri

class Interest (a :: IsPersonal) (b :: IsQri) where
  deductible :: Bool

instance {-# OVERLAPS #-} Interest a b where
  deductible = True

instance {-# OVERLAPS #-} Interest Personal b where
  deductible = False

instance {-# OVERLAPS #-} Interest Personal Qri where
  deductible = True

x = deductible @NotPersonal
y = deductible @Personal @NotQri
z = deductible @Personal @Qri

main :: IO ()
main = do
  print x
  print y
  print z