{-# LANGUAGE GADTs, FlexibleInstances, KindSignatures, RankNTypes, TypeSynonymInstances #-}
module Question2AnswerGadt where

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

type GAdverbial = Tree GAdverbial_
data GAdverbial_
type GPredicate = Tree GPredicate_
data GPredicate_
type GPronoun = Tree GPronoun_
data GPronoun_
type GS = Tree GS_
data GS_
type GString = Tree GString_
data GString_
type GInt = Tree GInt_
data GInt_
type GFloat = Tree GFloat_
data GFloat_

data Tree :: * -> * where
  Gbook :: Tree GAdverbial_
  Gmagazine :: Tree GAdverbial_
  GmkAdverbial :: GAdverbial -> Tree GAdverbial_
  Goath :: Tree GAdverbial_
  GpromiseA :: Tree GAdverbial_
  GpromiseQ :: Tree GAdverbial_
  GLoyalty :: GPronoun -> GPronoun -> Tree GPredicate_
  GmkPredicate :: GPredicate -> GAdverbial -> Tree GPredicate_
  GI :: Tree GPronoun_
  Gyou :: Tree GPronoun_
  GmkAnswer :: GPredicate -> Tree GS_
  GmkQuestion :: GPredicate -> Tree GS_
  GString :: String -> Tree GString_
  GInt :: Int -> Tree GInt_
  GFloat :: Double -> Tree GFloat_

instance Eq (Tree a) where
  i == j = case (i,j) of
    (Gbook,Gbook) -> and [ ]
    (Gmagazine,Gmagazine) -> and [ ]
    (GmkAdverbial x1,GmkAdverbial y1) -> and [ x1 == y1 ]
    (Goath,Goath) -> and [ ]
    (GpromiseA,GpromiseA) -> and [ ]
    (GpromiseQ,GpromiseQ) -> and [ ]
    (GLoyalty x1 x2,GLoyalty y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GmkPredicate x1 x2,GmkPredicate y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GI,GI) -> and [ ]
    (Gyou,Gyou) -> and [ ]
    (GmkAnswer x1,GmkAnswer y1) -> and [ x1 == y1 ]
    (GmkQuestion x1,GmkQuestion y1) -> and [ x1 == y1 ]
    (GString x, GString y) -> x == y
    (GInt x, GInt y) -> x == y
    (GFloat x, GFloat y) -> x == y
    _ -> False

instance Gf GAdverbial where
  gf Gbook = mkApp (mkCId "book") []
  gf Gmagazine = mkApp (mkCId "magazine") []
  gf (GmkAdverbial x1) = mkApp (mkCId "mkAdverbial") [gf x1]
  gf Goath = mkApp (mkCId "oath") []
  gf GpromiseA = mkApp (mkCId "promiseA") []
  gf GpromiseQ = mkApp (mkCId "promiseQ") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "book" -> Gbook 
      Just (i,[]) | i == mkCId "magazine" -> Gmagazine 
      Just (i,[x1]) | i == mkCId "mkAdverbial" -> GmkAdverbial (fg x1)
      Just (i,[]) | i == mkCId "oath" -> Goath 
      Just (i,[]) | i == mkCId "promiseA" -> GpromiseA 
      Just (i,[]) | i == mkCId "promiseQ" -> GpromiseQ 


      _ -> error ("no Adverbial " ++ show t)

instance Gf GPredicate where
  gf (GLoyalty x1 x2) = mkApp (mkCId "Loyalty") [gf x1, gf x2]
  gf (GmkPredicate x1 x2) = mkApp (mkCId "mkPredicate") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Loyalty" -> GLoyalty (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "mkPredicate" -> GmkPredicate (fg x1) (fg x2)


      _ -> error ("no Predicate " ++ show t)

instance Gf GPronoun where
  gf GI = mkApp (mkCId "I") []
  gf Gyou = mkApp (mkCId "you") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "I" -> GI 
      Just (i,[]) | i == mkCId "you" -> Gyou 


      _ -> error ("no Pronoun " ++ show t)

instance Gf GS where
  gf (GmkAnswer x1) = mkApp (mkCId "mkAnswer") [gf x1]
  gf (GmkQuestion x1) = mkApp (mkCId "mkQuestion") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "mkAnswer" -> GmkAnswer (fg x1)
      Just (i,[x1]) | i == mkCId "mkQuestion" -> GmkQuestion (fg x1)


      _ -> error ("no S " ++ show t)


instance Compos Tree where
  compos r a f t = case t of
    GmkAdverbial x1 -> r GmkAdverbial `a` f x1
    GLoyalty x1 x2 -> r GLoyalty `a` f x1 `a` f x2
    GmkPredicate x1 x2 -> r GmkPredicate `a` f x1 `a` f x2
    GmkAnswer x1 -> r GmkAnswer `a` f x1
    GmkQuestion x1 -> r GmkQuestion `a` f x1
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
composOpFold z c f = unC . c  ompos (\_ -> C z) (\(C x) (C y) -> C (c x y)) (C . f)

newtype C b a = C { unC :: b }
