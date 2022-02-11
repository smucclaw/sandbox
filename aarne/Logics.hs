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
  | Equal Ind Ind
  | Equals Set Set

data Set =
    Union [Set]
  | Intersection [Set]
  | Family Fun [Ind]
  | Comprehension Set (Ind -> Prop)
  | Universal -- used in iota U

data Ind =
    App Fun [Ind]
  | Bound Var
  | Iota Set  -- definite description, Principia notation (binding can happen inside set)
    
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
prProp = prp 0 0

prp prec i p = case p of
    Conj ps -> parenth 2 prec $ unwords $ intersperse "&" $ map (prp 3 i) ps
    Disj ps -> parenth 2 prec $ unwords $ intersperse "∨" $ map (prp 3 i) ps
    Impl p q -> parenth 1 prec $ prp 2 i p ++ " ⊃ " ++ prp 1 i q
    Equi p q -> parenth 1 prec $ prp 2 i p ++ " ≡ " ++ prp 2 i q
    Neg prop -> parenth 3 prec $ "~ " ++ prp 3 i prop
    Univ set pred -> parenth 0 6 ("∀" ++ var i ++ " : " ++ prSet 0 (i+1) set) ++ prp 3 (i+1) (pred (Bound (var i)))
    Exist set pred -> parenth 0 6 ("∃" ++ var i ++ " : " ++ prSet 0 (i+1) set) ++ prp 3 (i+1) (pred (Bound (var i)))
    Mod oper prop -> parenth prec 3 $ oper ++ " " ++ prp 3 i prop
    Pred fun inds -> prFun fun ++ ifparenth (concat (intersperse "," (map (prInd i) inds)))
    Equal p q -> parenth 1 prec $ prInd i p ++ " ≡ " ++ prInd i q  --- overloading ≡
    Equals p q -> parenth 1 prec $ prSet 2 i p ++ " ≡ " ++ prSet 2 i q

prInd i a = case a of
    App fun inds -> prFun fun ++ ifparenth (concat (intersperse "," (map (prInd i) inds)))
    Bound x -> x
    Iota set -> "ι" ++ parenth 0 6 (prSet 0 i set)


prSet prec i s = case s of
   Union ps -> parenth 2 prec $ unwords $ intersperse "∪" $ map (prSet 3 i) ps
   Intersection ps -> parenth 2 prec $ unwords $ intersperse "∩" $ map (prSet 3 i) ps
   Family fun inds -> prFun fun ++ ifparenth (concat (intersperse "," (map (prInd i) inds)))
   Comprehension set pred -> "{" ++ var i ++ " : " ++ prSet 0 (i+1) set ++ " | " ++ prp 0 (i+1) (pred (Bound (var i))) ++"}"
   Universal -> "U"

parenth giv exp s = if giv < exp then "(" ++ s ++ ")" else s
ifparenth s = if null s then "" else parenth 0 6 s

prFun fun = concat $ intersperse "_" $ words fun ---

var i = (["x", "y", "z"] ++ ["x" ++ show i | i <- [4..]]) !! i

--- to test
fex1 = Univ (Family "N" []) (\x -> Conj [Pred "Even" [x], Pred "Odd" [x]])
fex2 = Univ (Family "N" []) (\x -> Exist (Family "N" []) (\y -> Conj [Pred "Gt" [x, y], Pred "Prime" [y]]))

-- from assembly logic to real logic. The result can be any of the three:

data PropCat = PProp Prop | PSet Set | PInd Ind

formula2prop :: Formula -> Either String PropCat
formula2prop formula = case formula of
  Modal m f -> do
    p <- f2prop f
    return $ PProp $ Mod m p
  Atomic c a  -> case c of
    CProp -> return $ PProp $ Pred a []
    CSet -> return $ PSet $ Family a []
    CInd -> return $ PInd $ App a []
    CPred -> return $ PProp $ Pred a []
    _ -> Left $ "no Prop, Set, or Ind from " ++ show formula
  Conjunction c fs -> case c of
    CProp -> do
      pfs <- mapM f2prop fs
      return $ PProp $ Conj pfs
    CSet -> do
      pfs <- mapM f2set fs
      return $ PSet $ Intersection pfs
    _ -> Left $ "expected Prop or Set, found"  ++ show formula

  Disjunction c fs -> case c of
    CProp -> do
      pfs <- mapM f2prop fs
      return $ PProp $ Disj pfs
    CSet -> do
      pfs <- mapM f2set fs
      return $ PSet $ Union pfs
    _ -> Left $ "expected Prop or Set, found"  ++ show formula


  Implication f g -> do
    pf <- f2prop f
    pg <- f2prop g
    return $ PProp $ Impl pf pg
  Conditional a b -> formula2prop (Implication b a)
  Negation f -> do
    pf <- f2prop f
    return $ PProp $ Neg pf

  Application c f x -> case c of
    CPred -> do
      sf <- f2pred f
      px <- formula2prop x
      case px of
        PSet sx -> return $ PSet $ Comprehension sx (\x -> sf x)
        _ -> Left $ "expacted Set, found: " ++ prPropCat px
    _ -> Left $ "unsupported Application: " ++ show formula
  


  Predication q f -> do
    pq <- f2quant q
    pf <- f2pred f
    return $ PProp $ pq pf

----  Assignment r x f -> 
----  Action f x -> 
  Modification c a p -> case c of
    CSet -> do
      sa <- f2set a
      pp <- f2pred p
      return $ PSet $ Comprehension sa pp
  
----  Relation f x -> 
----  Qualification _ s f -> 
----  Modalization s f -> 



  Sequence c fs -> formula2prop $ Conjunction c fs ----
  Means c a b -> do
    pa <- formula2prop a
    pb <- formula2prop b
    case (pa, pb) of
      (PProp aa, PProp ab) -> return $ PProp $ Equi aa ab
      (PSet aa, PSet ab) -> return $ PProp $ Equals aa ab
      (PInd aa, PInd ab) -> return $ PProp $ Equal aa ab
      _ -> Left $ "common type expected in: " ++ show formula


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

   f2quant :: Formula -> Either String ((Ind -> Prop) -> Prop) 
   f2quant formula = case formula of
     Quantification s f -> do
       pf <- f2set f
       case s of
         _ | elem s ["A", "AN", "ANY"]  -> return $ \pred -> Exist pf (\x -> pred x)
         "EACH" -> return $ \pred -> Univ  pf (\x -> pred x)
     _ -> do
       px <- f2ind formula
       return $ \pred -> pred px

   f2pred :: Formula -> Either String (Ind -> Prop) 
   f2pred formula = case formula of
     Atomic CPred f -> return $ \x -> Pred f [x]
     Conjunction cat_ fs -> do
       pfs <- mapM f2pred fs
       return $ \x -> Conj [f x | f <- pfs]
     Disjunction cat_ fs -> do
       pfs <- mapM f2pred fs
       return $ \x -> Disj [f x | f <- pfs]
     Qualification CPred s a -> do
       fa <- formula2prop a
       case fa of
         PSet sa -> return $ \x -> Exist sa (\y -> Pred s [x, y])
         PInd ia -> return $ \x -> Pred s [x, ia]
         _ -> Left $ "expected Set or Ind in Qualification, found " ++ prPropCat fa
       
     _ -> Left $ "no predicate from: " ++ show formula

prPropCat pc = case pc of
  PProp prop -> prProp prop
  PSet set -> prSet 0 0 set
  PInd ind -> prInd 0 ind

formula1 = Predication (Quantification "EACH" (Atomic CSet "N")) (Atomic CPred "Even")
formula2 =
  Predication (Quantification "EACH" (Atomic CSet "N"))
    (Disjunction CPred [(Atomic CPred "Even"), (Atomic CPred "Odd")])

testTrans formula = do
  let Right (PProp p) = formula2prop formula
  putStrLn $ prProp p

