{-# LANGUAGE GADTs, FlexibleInstances, KindSignatures, RankNTypes, TypeSynonymInstances #-}
module Diff where

import Control.Monad.Identity
import Data.Monoid
import PGF hiding (Tree)

----------------------------------------------------
-- automatic translation from GF to Haskell
----------------------------------------------------

class Gf a where
  gf :: a -> Expr
  fg :: Expr -> a

instance Gf GString where
  gf (GString x) = mkStr x
  fg t =
    case unStr t of
      Just x  ->  GString x
      Nothing -> error ("no GString " ++ show t)

instance Gf GInt where
  gf (GInt x) = mkInt x
  fg t =
    case unInt t of
      Just x  ->  GInt x
      Nothing -> error ("no GInt " ++ show t)

instance Gf GFloat where
  gf (GFloat x) = mkFloat x
  fg t =
    case unFloat t of
      Just x  ->  GFloat x
      Nothing -> error ("no GFloat " ++ show t)

----------------------------------------------------
-- below this line machine-generated
----------------------------------------------------

type GListS = Tree GListS_
data GListS_
type GS = Tree GS_
data GS_
type GString = Tree GString_
data GString_
type GInt = Tree GInt_
data GInt_
type GFloat = Tree GFloat_
data GFloat_

data Tree :: * -> * where
  GListS :: [GS] -> Tree GListS_
  GBUT_DOES_NOT_INCLUDE :: GString -> Tree GS_
  GConjS :: GListS -> Tree GS_
  GINCLUDES :: GString -> GString -> Tree GS_
  GMEANS :: GString -> GString -> Tree GS_
  GMEANS_EXCEPT :: GS -> GS -> Tree GS_
  GMEANS_EXCEPT_ :: GListS -> GListS -> Tree GS_
  GmkS :: GString -> Tree GS_
  GString :: String -> Tree GString_
  GInt :: Int -> Tree GInt_
  GFloat :: Double -> Tree GFloat_

instance Eq (Tree a) where
  i == j = case (i,j) of
    (GListS x1,GListS y1) -> and [x == y | (x,y) <- zip x1 y1]
    (GBUT_DOES_NOT_INCLUDE x1,GBUT_DOES_NOT_INCLUDE y1) -> and [ x1 == y1 ]
    (GConjS x1,GConjS y1) -> and [ x1 == y1 ]
    (GINCLUDES x1 x2,GINCLUDES y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GMEANS x1 x2,GMEANS y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GMEANS_EXCEPT x1 x2,GMEANS_EXCEPT y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GMEANS_EXCEPT_ x1 x2,GMEANS_EXCEPT_ y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GmkS x1,GmkS y1) -> and [ x1 == y1 ]
    (GString x, GString y) -> x == y
    (GInt x, GInt y) -> x == y
    (GFloat x, GFloat y) -> x == y
    _ -> False

instance Gf GListS where
  gf (GListS [x1,x2]) = mkApp (mkCId "BaseS") [gf x1, gf x2]
  gf (GListS (x:xs)) = mkApp (mkCId "ConsS") [gf x, gf (GListS xs)]
  fg t =
    GListS (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseS" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsS" -> fg x1 : fgs x2


      _ -> error ("no ListS " ++ show t)

instance Gf GS where
  gf (GBUT_DOES_NOT_INCLUDE x1) = mkApp (mkCId "BUT_DOES_NOT_INCLUDE") [gf x1]
  gf (GConjS x1) = mkApp (mkCId "ConjS") [gf x1]
  gf (GINCLUDES x1 x2) = mkApp (mkCId "INCLUDES") [gf x1, gf x2]
  gf (GMEANS x1 x2) = mkApp (mkCId "MEANS") [gf x1, gf x2]
  gf (GMEANS_EXCEPT x1 x2) = mkApp (mkCId "MEANS_EXCEPT") [gf x1, gf x2]
  gf (GMEANS_EXCEPT_ x1 x2) = mkApp (mkCId "MEANS_EXCEPT_") [gf x1, gf x2]
  gf (GmkS x1) = mkApp (mkCId "mkS") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "BUT_DOES_NOT_INCLUDE" -> GBUT_DOES_NOT_INCLUDE (fg x1)
      Just (i,[x1]) | i == mkCId "ConjS" -> GConjS (fg x1)
      Just (i,[x1,x2]) | i == mkCId "INCLUDES" -> GINCLUDES (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "MEANS" -> GMEANS (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "MEANS_EXCEPT" -> GMEANS_EXCEPT (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "MEANS_EXCEPT_" -> GMEANS_EXCEPT_ (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "mkS" -> GmkS (fg x1)


      _ -> error ("no S " ++ show t)


instance Compos Tree where
  compos r a f t = case t of
    GBUT_DOES_NOT_INCLUDE x1 -> r GBUT_DOES_NOT_INCLUDE `a` f x1
    GConjS x1 -> r GConjS `a` f x1
    GINCLUDES x1 x2 -> r GINCLUDES `a` f x1 `a` f x2
    GMEANS x1 x2 -> r GMEANS `a` f x1 `a` f x2
    GMEANS_EXCEPT x1 x2 -> r GMEANS_EXCEPT `a` f x1 `a` f x2
    GMEANS_EXCEPT_ x1 x2 -> r GMEANS_EXCEPT_ `a` f x1 `a` f x2
    GmkS x1 -> r GmkS `a` f x1
    GListS x1 -> r GListS `a` foldr (a . a (r (:)) . f) (r []) x1
    _ -> r t

class Compos t where
  compos :: (forall a. a -> m a) -> (forall a b. m (a -> b) -> m a -> m b)
         -> (forall a. t a -> m (t a)) -> t c -> m (t c)

composOp :: Compos t => (forall a. t a -> t a) -> t c -> t c
composOp f = runIdentity . composOpM (Identity . f)

composOpM :: (Compos t, Monad m) => (forall a. t a -> m (t a)) -> t c -> m (t c)
composOpM = compos return ap

composOpM_ :: (Compos t, Monad m) => (forall a. t a -> m ()) -> t c -> m ()
composOpM_ = composOpFold (return ()) (>>)

composOpMonoid :: (Compos t, Monoid m) => (forall a. t a -> m) -> t c -> m
composOpMonoid = composOpFold mempty mappend

composOpMPlus :: (Compos t, MonadPlus m) => (forall a. t a -> m b) -> t c -> m b
composOpMPlus = composOpFold mzero mplus

composOpFold :: Compos t => b -> (b -> b -> b) -> (forall a. t a -> b) -> t c -> b
composOpFold z c f = unC . compos (\_ -> C z) (\(C x) (C y) -> C (c x y)) (C . f)

newtype C b a = C { unC :: b }
