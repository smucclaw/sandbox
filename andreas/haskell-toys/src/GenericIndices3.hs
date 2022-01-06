{-# LANGUAGE GADTs #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}
-- {-# LANGUAGE KindSignatures #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE StandaloneDeriving #-}
module GenericIndices3 where

import GHC.Generics
import Control.Applicative
import Data.Kind (Type)


data GIndex r (a :: *) where
    L    :: GIndex r (a p) -> GIndex r ((a :+: b) p)
    R    :: GIndex r (b p) -> GIndex r ((a :+: b) p)
    Pair :: GIndex r (a p) -> GIndex r (b p) -> GIndex r ((a :*: b) p)
    Unit :: GIndex r (U1 p)
    M    :: GIndex r (f p) -> GIndex r (M1 i c f p)
    K    :: Index r c -> GIndex r (K1 i c x)
    -- Unknown :: GIndex r a
    -- Unknown :: GIndex r (K1 i p)

type Type1 = Type -> Type

gFillHole :: GPos var root a -> (var -> var) -> root a -> root a
-- gFillHole Here x = x
gFillHole (LS xs) x (L1 s) = L1 $ gFillHole xs x s
gFillHole (RS xs) x (R1 s) = R1 $ gFillHole xs x s
gFillHole (LP xs) x (s :*: ba) = gFillHole xs x s :*: ba
gFillHole (RP xs) x (aa :*: s) = aa :*: gFillHole xs x s
gFillHole (PMeta xs) x (M1 s) = M1 $ gFillHole xs x s
gFillHole PK f (K1 s) = K1 (f s)
gFillHole _ x s = error "FillHole: Not matching constructors"

data GPos var result p where
    -- Here :: GPos Done var var p
    -- There :: GPos (x : xs) a b
    LS :: GPos var a p -> GPos var (a :+: b) p
    RS :: GPos var b p -> GPos var (a :+: b) p
    LP :: GPos var a p -> GPos var (a :*: b) p
    RP :: GPos var b p -> GPos var (a :*: b) p
    PMeta :: GPos var a p -> GPos var (M1 i c a) p
    PK :: GPos c (K1 i c) p -- This is the hole

    -- Here :: GPos '[] root root
    -- -- There :: GPos (x : xs) a b
    -- LP :: GPos root (a p) -> GPos (SumL (b p) : xs) root ((a :+: b) p)
    -- RP :: GPos root (b p) -> GPos (SumR (b p) : xs) root ((a :+: b) p)

deriving instance Show (GPos var result p)

data Pos' var result where
    Here' :: Pos' var var
    There' :: Generic inner => GPos inner (Rep result) p -> Pos' var inner -> Pos' var result

fillHole' :: (Generic root, Generic var) => Pos' var root -> var -> root -> root
fillHole' Here' x _ = x
fillHole' (There' p ps) x root = to $ gFillHole p (fillHole' ps x) $ from root

-- to $ gFillHole ((PMeta $ PMeta $ PMeta PK)) (True) :: (Identity Bool)
-- to $ gFillHole ((PMeta $ RS $ PMeta $ PMeta PK)) (True) :: (Maybe Bool)

data Pos var result where
    Here :: Pos var var
    There :: AsIndex inner => GPos inner (Rep result) p -> Pos var inner -> Pos var result

deriving instance Show (Pos var result)

data Index r a where
    Unknown :: Pos a r -> Index r a
    Constr :: GIndex r (Rep a ()) -> Index r a

deriving instance Show (GIndex r a)
deriving instance Show (GIndex r (Rep a ())) => Show (Index r a)

-- errorUnkown = error "Encountered an Unknown"

class AsIndex a where
    toIdx :: a -> Index r a
    fromIdx :: Index r a -> a
    mkUnknown :: [Index r a]

    default toIdx :: (Generic a, GAsIndex (Rep a ())) => a -> Index r a
    toIdx = Constr . gToIdx . from
    default fromIdx :: (Generic a, GAsIndex (Rep a ())) => Index r a -> a
    fromIdx (Unknown pos) = error "Encountered an Unknown"
    fromIdx (Constr gi) = to . gFromIdx $ gi
    default mkUnknown :: (Generic a, GAsIndex (Rep a ())) => [Index r a]
    mkUnknown = fmap Constr gMkUnknown

instance AsIndex Bool
instance AsIndex a => AsIndex (Maybe a)

class GAsIndex a where
    gToIdx :: a -> GIndex r a
    gFromIdx :: GIndex r a -> a
    gMkUnknown :: [GIndex r a]

instance GAsIndex (U1 p) where
  gToIdx _ = Unit
  gFromIdx Unit = U1
  gMkUnknown = [Unit]

instance (GAsIndex (f p), GAsIndex (g p)) => GAsIndex ((f :*: g) p) where
  gToIdx (fx :*: gx) = Pair (gToIdx fx) (gToIdx gx)
  gFromIdx (Pair ia ib) = gFromIdx ia :*: gFromIdx ib
  gMkUnknown = Pair <$> gMkUnknown <*> gMkUnknown

instance (GAsIndex (f p), GAsIndex (g p)) => GAsIndex ((f :+: g) p) where
  gToIdx (L1 fx) = L (gToIdx fx)
  gToIdx (R1 gx) = R (gToIdx gx)
  gFromIdx (L ia) = L1 (gFromIdx ia)
  gFromIdx (R ib) = R1 (gFromIdx ib)
  gMkUnknown = L <$> gMkUnknown <|> R <$> gMkUnknown

instance AsIndex c => GAsIndex (K1 i c p) where
  gToIdx (K1 c) = K $ toIdx c
  gFromIdx (K x) = K1 $ fromIdx x
  gMkUnknown = [K (Unknown _)]

instance GAsIndex (f p) => GAsIndex (M1 i c f p) where
  gToIdx (M1 fx) = M $ gToIdx fx
  gFromIdx (M gf) = M1 $ gFromIdx gf
  gMkUnknown = M <$> gMkUnknown
