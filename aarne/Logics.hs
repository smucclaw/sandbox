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

-- eliminating sorts by conversion to predicates

unsortProp :: Prop -> Prop
unsortProp prop = case prop of
  Univ Universal pred -> Univ Universal $ \x -> unsortProp (pred x) 
  Exist Universal pred -> Exist Universal $ \x -> unsortProp (pred x) 
  Univ set pred -> Univ Universal $ \x -> Impl (uSet x set) (unsortProp (pred x)) 
  Exist set pred -> Exist Universal $ \x -> Conj [uSet x set, unsortProp (pred x)] 
  Conj props -> Conj (map unsortProp props)
  Disj props -> Disj (map unsortProp props)
  Impl p q -> Impl (unsortProp p) (unsortProp q)
  Equi p q -> Equi (unsortProp p) (unsortProp q)
 ---- Equals s t -> Equi (uSet s) (uSet t)
  Neg p -> Neg (unsortProp p)
  _ -> prop -- nothing to convert, assuming that iota has been eliminated
 where
   uSet x set = case set of
     Union sets -> Disj (map (uSet x) (filter notUniversal sets))
     Intersection sets -> Conj (map (uSet x) (filter notUniversal sets))
     Family fun inds -> Pred fun (x:inds) -- add first argument to predicate
     Comprehension Universal pred -> pred x
     Comprehension set pred -> Conj [uSet x set, pred x]
---     Universal -> Universal -- not converted
   notUniversal set = case set of
     Universal -> False
     _ -> True

--- needed in family applied to a quantifier, should be solved in a different way
set2prop :: Set -> Prop
set2prop set = case set of
     Union sets -> Disj (map set2prop sets)
     Intersection sets -> Conj (map set2prop sets)
     Family fun inds -> Pred fun inds
----     Comprehension Universal pred -> pred x
     Comprehension set pred -> Exist set pred -- !!
---     Universal -> Universal -- not converted
  


-- the Assembly Logic - between abstract syntax and real logic

type Modality = String
type Atom = String
type Role = String

data ConjWord = AND | OR deriving Show

-- to record the logical category in assembly logic, when derived from syntax
data Cat =
  CProp | CSet | CInd | CPred | CPred2 | CFun | CFam | CCop | CQuant | CNone -- none: to be ignored
  deriving Show

data Formula =
    Atomic Cat Atom                     -- CProp CPred CPred2 CCop CInd CFam CFun CSet
  | Conjunction Cat ConjWord [Formula]  -- CProp CSet CCop CQuant CPred CPred2 CFam
  | Implication Formula Formula         -- CProp
  | Conditional Formula Formula         -- reverse implication (notice anaphora!) -- CProp
  | Negation Cat Formula                -- CPred
  
  | Application Cat Formula Formula  -- the f of x    -- CFam CSet
  | Modification Cat Formula Formula -- A which is B  -- CSet CQuant CPred CFam
  | Qualification Cat String Formula -- CNone (can be ignored) CPred (works like abstraction)
  | Means Cat Formula Formula        -- definition    -- CSet
  
  | Predication Formula Formula      -- CProp
  | Action Formula Formula           -- CPred

  | Assignment Role Formula Formula -- oblication/duty/right of NP to VP -- CProp ?

  | Modalization Modality Formula   -- must/may/...  -- CPred
  | Modal Modality Formula          -- used after labels, to be ignored ? -- CProp ?
  | Quantification String Formula   -- CQuant 
  
  | Sequence Cat [Formula] --- just a sequence one on top of another -- CProp CPred 
   deriving Show


-- from assembly logic to spreadsheet (two-dimensional "box")

formula2box :: Formula -> Box
formula2box formula = case formula of
  Atomic _ a  -> atomBox a
  Conjunction _ cw fs -> infixLeftsideBox (show cw) (map formula2box fs)
  Implication f g -> ifBox [formula2box f] [formula2box g]
  Conditional a b -> doubleLeftsideBox "CONDITIONALLY" [formula2box a] "PROVIDED" [formula2box b]
  Negation _ f -> notBox (formula2box f)
  
  Application _ f x -> ofBox [formula2box f] [formula2box x]
  Modification _ a p -> seqBox [formula2box a, formula2box p]
  Qualification _ s f -> leftsideBox s [formula2box f]
  
  Means _ f g -> doubleLeftsideBox "THE TERM" [formula2box f] "MEANS" [formula2box g]
  
  Predication x f -> seqBox[formula2box x, formula2box f]
  Action f x -> seqBox [formula2box f, formula2box x]
    
  Assignment r x f -> seqBox [atomBox r, leftsideBox "OF" [formula2box x], leftsideBox "TO" [formula2box f]]

  Modal m f -> addHeader m (formula2box f)
  Modalization s f -> leftsideBox s [formula2box f]
  Quantification s f -> leftsideBox s [formula2box f]
  
  Sequence _ fs -> seqBox (map formula2box fs) ----


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

-- printing to tptp syntax, applying unsort first
tptpProp :: Prop -> String
tptpProp = prp 0 0 . unsortProp
 where
  prp prec i prop = case prop of
    Conj ps -> parenth 2 prec $ unwords $ intersperse "&" $ map (prp 3 i) ps
    Disj ps -> parenth 2 prec $ unwords $ intersperse "|" $ map (prp 3 i) ps
    Impl p q -> parenth 1 prec $ prp 2 i p ++ " => " ++ prp 1 i q
    Equi p q -> parenth 1 prec $ prp 2 i p ++ " <=> " ++ prp 2 i q
    Neg prop -> parenth 3 prec $ "~ " ++ prp 3 i prop
    Univ _ pred -> "![" ++ var i ++ "]:" ++ prp 3 (i+1) (pred (Bound (var i)))
    Exist _ pred -> "?[" ++ var i ++ "]:" ++ prp 3 (i+1) (pred (Bound (var i)))
 ---- Mod oper prop -> parenth prec 3 $ oper ++ " " ++ prp 3 i prop
    Pred fun inds -> prFun fun ++ ifparenth (concat (intersperse "," (map (prInd i) inds)))
    Equal p q -> parenth 1 prec $ prInd i p ++ " = " ++ prInd i q


--- to test
fex1 = Univ (Family "N" []) (\x -> Disj [Pred "Even" [x], Pred "Odd" [x]])
fex2 = Univ (Family "N" []) (\x -> Exist (Family "N" []) (\u -> Conj [Pred "Gt" [u, x], Pred "Prime" [u]]))

testProp p = do
  putStrLn $ prProp p
  putStrLn $ prProp $ unsortProp p
  putStrLn $ tptpProp p
  

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
  Conjunction c cw fs -> case c of
    CProp -> do
      pfs <- mapM f2prop fs
      return $ PProp $ (fst (iConjWord cw)) pfs
    CSet -> do
      pfs <- mapM f2set fs
      return $ PSet $ (snd (iConjWord cw)) pfs
    _ -> Left $ "expected Prop or Set, found"  ++ show formula

  Implication f g -> do
    pf <- f2prop f
    pg <- f2prop g
    return $ PProp $ Impl pf pg
  Conditional a b -> formula2prop (Implication b a)
  Negation CProp f -> do
    pf <- f2prop f
    return $ PProp $ Neg pf

  Application c f q -> case c of
    CSet -> do
      pf <- f2fam f
      pq <- f2quant q
      return $ PProp $ pq $ \x -> set2prop (pf x) ----
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
    _ -> Left $ "set expected for Modification, found: " ++ show formula
  
  Qualification CNone _ f -> formula2prop f 
----  Modalization s f -> 



  Sequence c fs -> formula2prop $ Conjunction c AND fs ----
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
     Modification CQuant np rs -> do
       quant <- f2quant np
       pred  <- f2pred rs
       return $ \p -> quant (\x -> Conj [p x, pred x])
     _ -> do
       px <- f2ind formula
       return $ \pred -> pred px

   f2pred :: Formula -> Either String (Ind -> Prop) 
   f2pred formula = case formula of
     Atomic CPred f -> return $ \x -> Pred f [x]
     Conjunction cat_ cw fs -> do
       pfs <- mapM f2pred fs
       return $ \x -> fst (iConjWord cw) [f x | f <- pfs]
     Qualification CPred s a -> do
       fa <- f2prop a
       return $ \x -> fa ---- there should be an argument place for x
     Qualification CNone _ a -> f2pred a
     Modification CPred f rs -> do
         pf <- f2pred f
         prs <- f2pred rs
         return $ \x -> Conj [pf x, prs x]
     Action f q -> do
         pf <- f2pred2 f
         pq <- f2quant q
         return $ \x -> pq (\y -> pf x y)

     _ -> Left $ "no predicate from: " ++ show formula

   f2pred2 :: Formula -> Either String (Ind -> Ind -> Prop) 
   f2pred2 formula = case formula of
     Atomic CPred2 f -> return $ \x y -> Pred f [x, y]
     Conjunction cat_ cw fs -> do
       pfs <- mapM f2pred2 fs
       return $ \x y -> fst (iConjWord cw) [pf x y | pf <- pfs]
     _ -> Left $ "no 2-place predicate from: " ++ show formula

   f2fam :: Formula -> Either String (Ind -> Set)
   f2fam formula = case formula of
     Atomic CFam a -> return $ \x -> Family a [x]
     Conjunction CFam cw fs -> do
       pfs <- mapM f2fam fs
       return $ \x -> snd (iConjWord cw) [pf x | pf <- pfs]
     Modification CFam mo fam -> do
       pmo <- f2pred mo
       pfam <- f2fam fam
       return $ \x -> Comprehension (pfam x) (\y -> pmo y)
     _ -> Left $ "no family from: " ++ show formula


   iConjWord cw = case cw of
     AND -> (Conj, Intersection)
     OR -> (Disj, Union)

prPropCat pc = case pc of
  PProp prop -> prProp prop
  PSet set -> prSet 0 0 set
  PInd ind -> prInd 0 ind

formula1 = Predication (Quantification "EACH" (Atomic CSet "N")) (Atomic CPred "Even")
formula2 =
  Predication (Quantification "EACH" (Atomic CSet "N"))
    (Conjunction CPred OR [(Atomic CPred "Even"), (Atomic CPred "Odd")])

testTrans formula = do
  let Right (PProp p) = formula2prop formula
  putStrLn $ prProp p
  putStrLn $ tptpProp p

