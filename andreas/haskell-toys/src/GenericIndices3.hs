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


data GIndex r (a :: * -> *) where
    L    :: GIndex r a -> GIndex r (a :+: b)
    R    :: GIndex r b -> GIndex r (a :+: b)
    Pair :: GIndex r a -> GIndex r b -> GIndex r (a :*: b)
    Unit :: GIndex r U1
    M    :: GIndex r f -> GIndex r (M1 i c f)
    K    :: Index r c -> GIndex r (K1 i c)
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
    Constr :: GIndex r (Rep a) -> Index r a

deriving instance Show (GIndex r a)
deriving instance Show (GIndex r (Rep a)) => Show (Index r a)

-- errorUnkown = error "Encountered an Unknown"

class AsIndex a where
    toIdx :: a -> Index r a
    fromIdx :: Index r a -> a
    -- mkUnknown :: Pos a r -> [Index r a]
    mkUnknown :: (forall a0. AsIndex a0 => Pos a0 a -> Pos a0 r) -> [Index r a]

    default toIdx :: (Generic a, GAsIndex (Rep a)) => a -> Index r a
    toIdx = Constr . gToIdx . from
    default fromIdx :: (Generic a, GAsIndex (Rep a)) => Index r a -> a
    fromIdx (Unknown pos) = error "Encountered an Unknown"
    fromIdx (Constr gi) = to . gFromIdx $ gi
    -- default mkUnknown :: (Generic a, GAsIndex (Rep a ())) => Pos a r -> [Index r a]
    -- mkUnknown = fmap Constr . gMkUnknown . _
    default mkUnknown :: (Generic a, GAsIndex (Rep a)) => (forall a0. AsIndex a0 => Pos a0 a -> Pos a0 r) -> [Index r a]
    mkUnknown f = Constr <$> gMkUnknown (f . (`There` Here))

instance AsIndex Bool
instance AsIndex a => AsIndex (Maybe a)

class GAsIndex a where
    gToIdx :: a p -> GIndex r a
    gFromIdx :: GIndex r a -> a p
    gMkUnknown :: (forall a0. AsIndex a0 => GPos a0 a p -> Pos a0 r) -> [GIndex r a]

instance GAsIndex U1 where
  gToIdx _ = Unit
  gFromIdx Unit = U1
  gMkUnknown _ = [Unit]

instance (GAsIndex f, GAsIndex g) => GAsIndex (f :*: g) where
  gToIdx (fx :*: gx) = Pair (gToIdx fx) (gToIdx gx)
  gFromIdx (Pair ia ib) = gFromIdx ia :*: gFromIdx ib
  gMkUnknown f = Pair <$> gMkUnknown (f . LP) <*> gMkUnknown (f . RP)

instance (GAsIndex f, GAsIndex g) => GAsIndex (f :+: g) where
  gToIdx (L1 fx) = L (gToIdx fx)
  gToIdx (R1 gx) = R (gToIdx gx)
  gFromIdx (L ia) = L1 (gFromIdx ia)
  gFromIdx (R ib) = R1 (gFromIdx ib)
  gMkUnknown f = L <$> gMkUnknown (f . LS) <|> R <$> gMkUnknown (f . RS)

instance AsIndex c => GAsIndex (K1 i c) where
  gToIdx (K1 c) = K $ toIdx c
  gFromIdx (K x) = K1 $ fromIdx x
  gMkUnknown f = [K (Unknown (f PK))]


instance GAsIndex f => GAsIndex (M1 i c f) where
  gToIdx (M1 fx) = M $ gToIdx fx
  gFromIdx (M gf) = M1 $ gFromIdx gf
  gMkUnknown f = M <$> gMkUnknown (f . PMeta)
