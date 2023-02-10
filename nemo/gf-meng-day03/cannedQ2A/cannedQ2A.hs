module cannedQ2A where

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

data GAnswer =
   GNo 
 | GYes 
  deriving Show

data GObject = GNumber GInt 
  deriving Show

data GQuestion =
   GEven GObject 
 | GOdd GObject 
 | GPrime GObject 
  deriving Show


instance Gf GAnswer where
  gf GNo = mkApp (mkCId "No") []
  gf GYes = mkApp (mkCId "Yes") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "No" -> GNo 
      Just (i,[]) | i == mkCId "Yes" -> GYes 


      _ -> error ("no Answer " ++ show t)

instance Gf GObject where
  gf (GNumber x1) = mkApp (mkCId "Number") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Number" -> GNumber (fg x1)


      _ -> error ("no Object " ++ show t)

instance Gf GQuestion where
  gf (GEven x1) = mkApp (mkCId "Even") [gf x1]
  gf (GOdd x1) = mkApp (mkCId "Odd") [gf x1]
  gf (GPrime x1) = mkApp (mkCId "Prime") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Even" -> GEven (fg x1)
      Just (i,[x1]) | i == mkCId "Odd" -> GOdd (fg x1)
      Just (i,[x1]) | i == mkCId "Prime" -> GPrime (fg x1)


      _ -> error ("no Question " ++ show t)


