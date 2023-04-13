module Diff where

import PGF hiding (Tree)

----------------------------------------------------
-- automatic translation from GF to Haskell
----------------------------------------------------

class Gf a where
  gf :: a -> Expr
  fg :: Expr -> a

newtype GString = GString String deriving Show

instance Gf GString where
  gf (GString x) = mkStr x
  fg t =
    case unStr t of
      Just x  ->  GString x
      Nothing -> error ("no GString " ++ show t)

newtype GInt = GInt Int deriving Show

instance Gf GInt where
  gf (GInt x) = mkInt x
  fg t =
    case unInt t of
      Just x  ->  GInt x
      Nothing -> error ("no GInt " ++ show t)

newtype GFloat = GFloat Double deriving Show

instance Gf GFloat where
  gf (GFloat x) = mkFloat x
  fg t =
    case unFloat t of
      Just x  ->  GFloat x
      Nothing -> error ("no GFloat " ++ show t)

----------------------------------------------------
-- below this line machine-generated
----------------------------------------------------

newtype GListS = GListS [GS] deriving Show

data GS =
   GMEANS GString GString 
 | G_ GString 
 | G__ GListS 
  deriving Show


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
  gf (GMEANS x1 x2) = mkApp (mkCId "MEANS") [gf x1, gf x2]
  gf (G_ x1) = mkApp (mkCId "_") [gf x1]
  gf (G__ x1) = mkApp (mkCId "__") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "MEANS" -> GMEANS (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "_" -> G_ (fg x1)
      Just (i,[x1]) | i == mkCId "__" -> G__ (fg x1)


      _ -> error ("no S " ++ show t)


