{-# LANGUAGE GADTs #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
module GenericIndices2 where

import GHC.Generics
import Control.Applicative
import Data.Kind (Type)

data SimpleIndex = SL SimpleIndex | SR SimpleIndex | SPair SimpleIndex SimpleIndex | SUnit

data GIndex (a :: *) where
    L    :: GIndex (a p) -> GIndex ((a :+: b) p)
    R    :: GIndex (b p) -> GIndex ((a :+: b) p)
    Pair :: GIndex (a p) -> GIndex (b p) -> GIndex ((a :*: b) p)
    Unit :: GIndex (U1 p)
    M    :: GIndex (f p) -> GIndex (M1 i c f p)
    K    :: Index c -> GIndex (K1 i c x)
    -- Unknown :: GIndex a
    -- Unknown :: GIndex (K1 i p)

type HolyType = [PartialType]

data PartialType = SumL Type | SumR Type
-- data PartialType where
--     SumL :: Type -> PartialType

type Type1 = Type -> Type

data HoledType
    = SumL' HoledType Type1
    | SumR' Type1 HoledType
    | ProdL HoledType Type1
    | ProdR Type1 HoledType
    | Done

type family FillHole (h :: HoledType) (t :: Type1) where
    FillHole (SumL' xs b) t = FillHole xs t :+: b
    FillHole (SumR' a xs) t = a :+: FillHole xs t
    FillHole (ProdL xs b) t = FillHole xs t :*: b
    FillHole (ProdR a xs) t = a :+: FillHole xs t
    FillHole  Done        t = t

fillHole :: Pos path var root a -> var a -> root a
fillHole Here x = x
fillHole (LS xs) x = L1 $ fillHole xs x
fillHole (RS xs) x = R1 $ fillHole xs x
fillHole (LP ba xs) x = fillHole xs x :*: ba
fillHole (RP aa xs) x = aa :*: fillHole xs x

data Pos (path :: HoledType) var result p where
    Here :: Pos Done var var p
    -- There :: Pos (x : xs) a b
    LS :: Pos xs var a p -> Pos (SumL' xs b) var (a :+: b) p
    RS :: Pos xs var b p -> Pos (SumR' b xs) var (a :+: b) p
    LP :: b p -> Pos xs var a p -> Pos (ProdL xs b) var (a :*: b) p
    RP :: a p -> Pos xs var b p -> Pos (ProdR b xs) var (a :*: b) p

    -- Here :: Pos '[] root root
    -- -- There :: Pos (x : xs) a b
    -- LP :: Pos xs root (a p) -> Pos (SumL (b p) : xs) root ((a :+: b) p)
    -- RP :: Pos xs root (b p) -> Pos (SumR (b p) : xs) root ((a :+: b) p)


data Index a where
    Unknown :: Index a
    Constr :: GIndex (Rep a x) -> Index a

-- errorUnkown = error "Encountered an Unknown"

class AsIndex a where
    toIdx :: a -> Index a
    fromIdx :: Index a -> a

class GAsIndex a where
    gToIdx :: a -> GIndex a
    gFromIdx :: GIndex a -> a

instance GAsIndex (U1 p) where
  gToIdx _ = Unit
  gFromIdx Unit = U1
--   gFromIdx Unknown = errorUnkown
instance (GAsIndex (f p), GAsIndex (g p)) => GAsIndex ((f :*: g) p) where
  gToIdx (fx :*: gx) = Pair (gToIdx fx) (gToIdx gx)
  gFromIdx (Pair ia ib) = gFromIdx ia :*: gFromIdx ib
--   gFromIdx Unknown = errorUnkown
instance (GAsIndex (f p), GAsIndex (g p)) => GAsIndex ((f :+: g) p) where
  gToIdx (L1 fx) = L (gToIdx fx)
  gToIdx (R1 gx) = R (gToIdx gx)
  gFromIdx (L ia) = L1 (gFromIdx ia)
  gFromIdx (R ib) = R1 (gFromIdx ib)

instance AsIndex c => GAsIndex (K1 i c p) where
  gToIdx (K1 c) = K $ toIdx c
  gFromIdx (K x) = K1 $ fromIdx x

instance GAsIndex (f p) => GAsIndex (M1 i c f p) where
  gToIdx (M1 fx) = M $ gToIdx fx
  gFromIdx (M gf) = M1 $ gFromIdx gf
