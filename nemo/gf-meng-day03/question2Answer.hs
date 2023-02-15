module Question2Answer where

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

data GAdverbial =
   Gbook 
 | Goath 
 | GpromiseA 
 | GpromiseQ 
  deriving Show

data GPredicate =
   GLoyalty GPronoun GPronoun 
 | GmkPredicate GPredicate GAdverbial 
  deriving Show

data GPronoun =
   GI 
 | Gyou 
  deriving Show

data GS =
   GmkAnswer GPredicate 
 | GmkQuestion GPredicate 
  deriving Show


instance Gf GAdverbial where
  gf Gbook = mkApp (mkCId "book") []
  gf Goath = mkApp (mkCId "oath") []
  gf GpromiseA = mkApp (mkCId "promiseA") []
  gf GpromiseQ = mkApp (mkCId "promiseQ") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "book" -> Gbook 
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


