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
{-# LANGUAGE DefaultSignatures #-}
module GenericIndices where

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
    K    :: AsIndex c => Index c -> GIndex (K1 i c x)
    -- Unknown :: GIndex a
    -- Unknown :: GIndex (K1 i p)
    -- GUnknown :: GIndex a

followPath :: (Functor f, AsIndex a) => Pos -> (forall b. AsIndex b => Index b -> f (Index b)) -> Index a -> f (Index a)
followPath Here f a@Unknown{} = f a
followPath p f (Constr grax) = Constr <$> gFollowPath p f grax
followPath p f a = error "Position doesn't exist"

gFollowPath :: Functor f => Pos -> (forall b. AsIndex b => Index b -> f (Index b)) -> GIndex a -> f (GIndex a)
gFollowPath p f (L gap) = L <$> gFollowPath p f gap
gFollowPath p f (R gbp) = R <$> gFollowPath p f gbp
gFollowPath (LP p4) f (Pair gap gbp) = (`Pair` gbp) <$> gFollowPath p4 f gap
gFollowPath (RP p4) f (Pair gap gbp) = Pair gap <$> gFollowPath p4 f gbp
gFollowPath Here f (Pair gap gbp) = error "Path stopped too soon"
gFollowPath _ _ Unit = error "Path lead to Unit"
gFollowPath p f (M gfp) = M <$> gFollowPath p f gfp
gFollowPath p f (K ic) = K <$> followPath p f ic
-- gfollowPath

data Pos
    = LP Pos
    | RP Pos
    | Here

data Index a where
    Unknown :: Pos -> Index a
    Constr :: GIndex (Rep a ()) -> Index a
    Known :: a -> Index a

-- errorUnkown = error "Encountered an Unknown"

class AsIndex a where
    toIdx :: a -> Index a
    default toIdx :: (Generic a, GAsIndex (Rep a ())) => a -> Index a
    toIdx = Constr . gToIdx . from
    fromIdx :: Index a -> a
    default fromIdx :: (Generic a, GAsIndex (Rep a ())) => Index a -> a
    fromIdx = _

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


-- class (Generic a, GAlternating q (Rep a)) => Alternating q a where
--   alternate :: Alternative f => p q -> (forall b. q b => f b) -> f a

-- instance (Generic a, GAlternating q (Rep a)) => Alternating q a  where
--   alternate p q = to <$> galternate p q

-- class GAlternating q t where
--   galternate :: Alternative f => p q -> (forall b. q b => f b) -> f (t a)

-- instance GAlternating q U1 where
--   galternate _ _ = pure U1

-- instance GAlternating q V1 where
--   galternate _ _ = empty

-- instance (GAlternating q f, GAlternating q g) => GAlternating q (f :*: g) where
--   galternate p q = (:*:) <$> galternate p q <*> galternate p q

-- instance (GAlternating q f, GAlternating q g) => GAlternating q (f :+: g) where
--   galternate p q = L1 <$> galternate p q <|> R1 <$> galternate p q

-- instance q p => GAlternating q (K1 i p) where
--   galternate _ q = fmap K1 q

-- instance GAlternating q f => GAlternating q (M1 i c f) where
--   galternate p q = fmap M1 (galternate p q)
