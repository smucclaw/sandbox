module Logics where

import Spreadsheet
import Data.List

-- real logic - a many-sorted modal logic

data Prop =
    Conj [Prop]
  | Disj [Prop]
  | Impl Prop Prop
  | Equi Prop Prop
  | Neg Prop
  | Univ Set (Ind -> Prop)
  | Exist Set (Ind -> Prop)
  | Mod Oper Prop
  | Pred Fun [Ind]

data Set =
    Union [Set]
  | Intersection [Set]
  | Family Fun [Set]
  | Comprehension Set (Ind -> Prop)

data Ind =
    App Fun [Ind]
  | Bound Var
    
type Var = String
type Oper = String
type Fun = String


-- the Assembly Logic - between abstract syntax and real logic

type Modality = String
type Atom = String
type Role = String

-- to record the logical category in assembly logic, when derived from syntax
data Cat =
  CProp | CSet | CInd | CPred | CFun | CFam | CCop | CQuant | CNone -- none: to be ignored
  deriving Show

data Formula =
    Modal Modality Formula
  | Atomic Cat Atom
  | Conjunction Cat [Formula]
  | Disjunction Cat [Formula]
  | Implication Formula Formula
  | Conditional Formula Formula -- reverse implication (notice anaphora!)
  | Negation Formula
  | Application Cat Formula Formula  -- the f of x
  | Predication Formula Formula
  | Assignment Role Formula Formula -- oblication/duty/right of NP to VP
  | Action Formula Formula
  | Modification Cat Formula Formula   -- A which is B
  | Relation Formula Formula
  | Qualification Cat String Formula ---
  | Modalization Modality Formula -- of a predicate
  | Quantification String Formula ---
  | Sequence Cat [Formula] --- just a sequence one on top of another
  | Means Cat Formula Formula -- definition
   deriving Show


-- from assembly logic to spreadsheet (two-dimensional "box")

formula2box :: Formula -> Box
formula2box formula = case formula of
  Modal m f -> addHeader m (formula2box f)
  Atomic _ a  -> atomBox a
  Conjunction _ fs -> andBox (map formula2box fs)
  Disjunction _ fs -> orBox (map formula2box fs)
  Implication f g -> ifBox [formula2box f] [formula2box g]
  Conditional a b -> doubleLeftsideBox "CONDITIONALLY" [formula2box a] "PROVIDED" [formula2box b]
  Negation f -> notBox (formula2box f)
  Application _ f x -> ofBox [formula2box f] [formula2box x]
  Predication x f -> nodoubleLeftsideBox "SUBJECT" [formula2box x] "PREDICATE" [formula2box f]
  Assignment r x f -> seqBox [atomBox r, leftsideBox "OF" [formula2box x], leftsideBox "TO" [formula2box f]]
  Action f x -> nodoubleLeftsideBox "ACTING" [formula2box f] "ON" [formula2box x]
  Modification _ a p -> nodoubleLeftsideBox "ENTITY" [formula2box a] "WITH PROPERTIES" [formula2box p]
  Relation f x -> nodoubleLeftsideBox "HAVING RELATION" [formula2box f] "TO" [formula2box x]
  Qualification _ s f -> leftsideBox s [formula2box f]
  Modalization s f -> leftsideBox s [formula2box f]
  Quantification s f -> leftsideBox s [formula2box f]
  Sequence _ fs -> seqBox (map formula2box fs) ----
  Means _ f g -> meansBox (formula2box f) (formula2box g)

-- from real logic to printed formulas
prProp :: Prop -> String
prProp = prp 0 0 where
  prp prec i p = case p of
    Conj ps -> parenth 2 prec $ unwords $ intersperse "&" $ map (prp 3 i) ps
    Disj ps -> parenth 2 prec $ unwords $ intersperse "∨" $ map (prp 3 i) ps
    Impl p q -> parenth 1 prec $ prp 2 i p ++ " ⊃ " ++ prp 1 i q
    Equi p q -> parenth 1 prec $ prp 2 i p ++ " ≡ " ++ prp 2 i q
    Neg prop -> parenth 3 prec $ "~ " ++ prp 3 i prop
    Univ set pred -> parenth 0 6 ("∀" ++ var i ++ " : " ++ prs 0 (i+1) set) ++ prp 3 (i+1) (pred (Bound (var i)))
    Exist set pred -> parenth 0 6 ("∃" ++ var i ++ " : " ++ prs 0 (i+1) set) ++ prp 3 (i+1) (pred (Bound (var i)))
    Mod oper prop -> parenth prec 3 $ oper ++ " " ++ prp 3 i prop
    Pred fun inds -> fun ++ ifparenth (concat (intersperse "," (map pri inds)))

  pri a = case a of
    App fun inds -> fun ++ ifparenth (concat (intersperse "," (map pri inds)))
    Bound x -> x

  prs prec i s = case s of
--    Union [Set]
--  | Intersection [Set]
   Family fun sets -> fun ++ ifparenth (concat (intersperse "," (map (prs 0 i) sets)))
--  | Comprehension Set (Ind -> Prop)

  parenth giv exp s = if giv < exp then "(" ++ s ++ ")" else s
  ifparenth s = if null s then "" else parenth 0 6 s

  var i = (["x", "y", "z"] ++ ["x" ++ show i | i <- [4..]]) !! i

--- to test
fex1 = Univ (Family "N" []) (\x -> Conj [Pred "Even" [x], Pred "Odd" [x]])
fex2 = Univ (Family "N" []) (\x -> Exist (Family "N" []) (\y -> Conj [Pred "Gt" [x, y], Pred "Prime" [y]]))

-- from assembly logic to real logic

data PropCat = PProp Prop | PSet Set | PInd Ind | PFun (Ind -> PropCat)

formula2prop :: Formula -> Either String PropCat
formula2prop formula = case formula of
  Modal m f -> do
    p <- f2prop f
    return $ PProp $ Mod m p
  Atomic c a  -> case c of
    CProp -> return $ PProp $ Pred a []
    CSet -> return $ PSet $ Family a []
    CInd -> return $ PInd $ App a []
    _ -> Left $ "no Prop, Set, or Ind from " ++ show formula
  Conjunction c fs -> case c of
    CProp -> do
      pfs <- mapM f2prop fs
      return $ PProp $ Conj pfs
    CSet -> do
      pfs <- mapM f2set fs
      return $ PSet $ Intersection pfs
    _ -> Left $ "expected Prop or Set, found"  ++ show formula

--  Disjunction _ fs ->


  Implication f g -> do
    pf <- f2prop f
    pg <- f2prop g
    return $ PProp $ Impl pf pg
  Conditional a b -> formula2prop (Implication b a)
  Negation f -> do
    pf <- f2prop f
    return $ PProp $ Neg pf
{-
  Application _ f x -> 
  Predication x f -> 
  Assignment r x f -> 
  Action f x -> 
  Modification _ a p -> 
  Relation f x -> 
  Qualification _ s f -> 
  Modalization s f -> 
  Quantification s f -> 
  Sequence _ fs -> 
  Means _ f g ->
-}
  _ -> Left $ "not yet: " ++ show formula
 where
   f2prop f =  do
     pf <- formula2prop f
     case pf of
       PProp p -> return p
       _ -> Left $ "no Prop from " ++ show f
   f2set f =  do
     pf <- formula2prop f
     case pf of
       PSet p -> return p
       _ -> Left $ "no Set from " ++ show f
   f2ind f =  do
     pf <- formula2prop f
     case pf of
       PInd p -> return p
       _ -> Left $ "no Ind from " ++ show f


