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
module GenericIndices2 where

import GHC.Generics
import Control.Applicative
import Data.Kind (Type)

data SimpleIndex = SL SimpleIndex | SR SimpleIndex | SPair SimpleIndex SimpleIndex | SUnit

data GIndex (a :: *) where
    L    :: GIndex (a p) -> GIndex ((a :+: b) p)
    R    :: GIndex (b p) -> GIndex ((a :+: b) p)
    Pair :: GIndex (a p) -> GIndex (b p) -> GIndex ((a :*: b) p)
    Unit :: GIndex (U1 p)
    M    :: GIndex (f p) -> GIndex (M1 i c f p)
    K    :: Index c -> GIndex (K1 i c x)
    -- Unknown :: GIndex a
    -- Unknown :: GIndex (K1 i p)

type Type1 = Type -> Type

fillHole :: GPos var root a -> var -> root a
-- fillHole Here x = x
fillHole (LS xs) x = L1 $ fillHole xs x
fillHole (RS xs) x = R1 $ fillHole xs x
fillHole (LP ba xs) x = fillHole xs x :*: ba
fillHole (RP aa xs) x = aa :*: fillHole xs x
fillHole (PMeta xs) x = M1 $ fillHole xs x
fillHole PK x = K1 x

data GPos var result p where
    -- Here :: GPos Done var var p
    -- There :: GPos (x : xs) a b
    LS :: GPos var a p -> GPos var (a :+: b) p
    RS :: GPos var b p -> GPos var (a :+: b) p
    LP :: b p -> GPos var a p -> GPos var (a :*: b) p
    RP :: a p -> GPos var b p -> GPos var (a :*: b) p
    PMeta :: GPos var a p -> GPos var (M1 i c a) p
    PK :: GPos c (K1 i c) p -- This is the hole

    -- Here :: GPos '[] root root
    -- -- There :: GPos (x : xs) a b
    -- LP :: GPos root (a p) -> GPos (SumL (b p) : xs) root ((a :+: b) p)
    -- RP :: GPos root (b p) -> GPos (SumR (b p) : xs) root ((a :+: b) p)

-- deriving instance (Show (GPos var a p)) => Show (GPos var (M1 i c a) p)

data Pos var result where
    Here' :: Pos var var
    There' :: Generic inner => GPos inner (Rep result) p -> Pos var inner -> Pos var result

fillHole' :: (Generic root, Generic var) => Pos var root -> var -> root
fillHole' Here' x = x
fillHole' (There' p ps) x = to $ fillHole p $ fillHole' ps x

-- to $ fillHole ((PMeta $ PMeta $ PMeta PK)) (True) :: (Identity Bool)
-- to $ fillHole ((PMeta $ RS $ PMeta $ PMeta PK)) (True) :: (Maybe Bool)


data Index a where
    Unknown :: Index a
    Constr :: GIndex (Rep a ()) -> Index a

deriving instance Show (GIndex a)
deriving instance Show (GIndex (Rep a ())) => Show (Index a)

-- errorUnkown = error "Encountered an Unknown"

data SomePos r = forall a. (AsIndex a, Generic a) => SomePos (Pos a r)

data SomeGPos r p = forall a. (AsIndex a, Generic a) => SomeGPos (GPos a r p)

wrapSomePos :: SomeGPos (Rep r) p -> SomePos r
wrapSomePos (SomeGPos p) = SomePos (There' p Here')

mapSomeGPos :: (forall a. GPos a r p -> GPos a r' p') -> SomeGPos r p -> SomeGPos r' p'
mapSomeGPos f (SomeGPos p) = SomeGPos (f p)

class AsIndex a where
    toIdx :: a -> Index a
    fromIdx :: Index a -> a
    mkUnknown :: [Index a]
    mkHoles :: a -> [SomePos a]

    default toIdx :: (Generic a, GAsIndex (Rep a ())) => a -> Index a
    toIdx = Constr . gToIdx . from
    default fromIdx :: (Generic a, GAsIndex (Rep a ())) => Index a -> a
    fromIdx Unknown = error "Encountered an Unknown"
    fromIdx (Constr gi) = to . gFromIdx $ gi
    default mkUnknown :: (Generic a, GAsIndex (Rep a ())) => [Index a]
    mkUnknown = fmap Constr gMkUnknown
    default mkHoles :: (Generic a, GAsPos (Rep a)) => a -> [SomePos a]
    mkHoles = fmap wrapSomePos . gMkHoles . from

instance AsIndex Bool
instance (AsIndex a, Generic a) => AsIndex (Maybe a)
instance (AsIndex a, Generic a) => AsIndex ([] a)

class GAsIndex (a ()) => GAsPos a where
  gMkHoles :: a () -> [SomeGPos a ()]

mmap :: (forall a. GPos a r p -> GPos a r' p') -> [SomeGPos r p] -> [SomeGPos r' p']
mmap f = fmap $ mapSomeGPos f

instance GAsPos U1 where
  gMkHoles _ = []

instance (GAsPos f , GAsPos g) => GAsPos (f :*: g) where
  -- gMkHoles (fx :*: gx) = _ (gMkHoles fx)
  gMkHoles (fx :*: gx) = mmap (LP gx) (gMkHoles fx) <|> mmap (RP fx) (gMkHoles gx)

instance (GAsPos f, GAsPos g) => GAsPos (f :+: g) where
  gMkHoles (L1 x) = mmap LS (gMkHoles x)
  gMkHoles (R1 x) = mmap RS (gMkHoles x)

instance (AsIndex c, Generic c) => GAsPos (K1 i c) where
  gMkHoles (K1 x) = [SomeGPos PK]

instance GAsPos f => GAsPos (M1 i c f) where
  gMkHoles (M1 x) = mmap PMeta (gMkHoles x)


class GAsIndex a where
    gToIdx :: a -> GIndex a
    gFromIdx :: GIndex a -> a
    gMkUnknown :: [GIndex a]
    -- gMkHoles :: (a ~ k p) => a -> [SomeGPos k p]

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
  gMkUnknown = [K Unknown]

instance GAsIndex (f p) => GAsIndex (M1 i c f p) where
  gToIdx (M1 fx) = M $ gToIdx fx
  gFromIdx (M gf) = M1 $ gFromIdx gf
  gMkUnknown = M <$> gMkUnknown