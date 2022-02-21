module Logics where

import Spreadsheet
import Data.List
import Data.Char (toUpper)

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

-- used in modalities: Must f means Neg (f x) -> BREACH x
breachPred :: Ind -> Prop
breachPred x = Pred "BREACH" [x]

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
  Equals s t -> Univ Universal $ \x -> Equi (uSet x s) (uSet x t)
  Neg p -> Neg (unsortProp p)
  Mod op p -> Impl (Pred op []) (unsortProp p)
    --- this modality means implication: "(a) says that p"
  _ -> prop -- nothing to convert, assuming that iota has been eliminated
 where
   uSet x set = case set of
     Union sets -> Disj (map (uSet x) (filter notUniversal sets))
     Intersection sets -> Conj (map (uSet x) (filter notUniversal sets))
     Family fun inds -> Pred fun (x:inds) -- add first argument to predicate
     Comprehension Universal pred -> pred x
     Comprehension set pred -> Exist Universal $ \x -> Conj [uSet x set, unsortProp (pred x)]
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
  CProp | CSet | CInd | CPred | CPred2 | CFun | CFam | CQuant | CNone -- none: to be ignored
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
  | Title Atom
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

  Title s -> headerBox ("#H " ++s) --- to colour as a title

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
tptpProp = prp 0 0 . unsortProp . resolveAnaphora
 where
  prp prec i prop = case prop of
    Conj ps -> parenth 2 prec $ unwords $ intersperse "&" $ map (prp 3 i) ps
    Disj ps -> parenth 2 prec $ unwords $ intersperse "|" $ map (prp 3 i) ps
    Impl p q -> parenth 1 prec $ prp 2 i p ++ " => " ++ prp 1 i q
    Equi p q -> parenth 1 prec $ prp 2 i p ++ " <=> " ++ prp 2 i q
    Neg prop -> parenth 3 prec $ "~ " ++ prp 3 i prop
    Univ _ pred -> "![" ++ tvar i ++ "]:" ++ prp 3 (i+1) (pred (Bound (var i)))
    Exist _ pred -> "?[" ++ tvar i ++ "]:" ++ prp 3 (i+1) (pred (Bound (var i)))
    Pred fun inds -> prFun fun ++ ifparenth (concat (intersperse "," (map (tptpInd i) inds)))
    Equal p q -> parenth 1 prec $ tptpInd i p ++ " = " ++ tptpInd i q
    _ -> error $ "NOT TPTP " ++ prProp prop

  tptpInd i a = case a of
    App fun inds -> prFun fun ++ ifparenth (concat (intersperse "," (map (tptpInd i) inds)))
    Bound x -> map toUpper x
    Iota set -> "ι" ++ parenth 0 6 (prSet 0 i set) ---- TODO: eliminate by anaphora resolution

  tvar x = map toUpper $ var x


-- anaphora resolution
--- a partial case, as proof of concept

resolveAnaphora :: Prop -> Prop
resolveAnaphora = resprop []
  where
    resprop context prop = case prop of
      Impl (Exist a f) b -> Univ a (\x -> Impl (resprop context (f x)) (resprop ((a, x):context) b))
      Impl b (Exist a f) -> Univ a (\x -> Impl (resprop ((a, x):context) b) (resprop context (f x)))
      Univ a f -> Univ a (\x -> resprop context (f x)) ---- TODO: resolve in a, if comprehension
      Exist a f -> Exist a (\x -> resprop context (f x))
      Conj ps -> Conj (map (resprop context) ps)
      Disj ps -> Disj (map (resprop context) ps)
      Impl p q -> Impl (resprop context p) (resprop context q)
      Pred fun xs -> Pred fun (map (resind context) xs)
      Mod m p -> Mod m (resprop context p)
      Neg p -> Neg (resprop context p)
      _ -> prop
    resind context ind = case ind of
      Iota set -> case set of
        Universal -> use ind context
        Family f [] -> use ind [(a, x) | a@(Family g [], x) <- context, g==f]
        _ -> ind ---- TODO: other sets than atomic
      App fun xs -> App fun [resind context x | x <- xs]
      _ -> ind

    use ind context = case context of
      (_, x):_ -> x ---- TODO: ambiguous referent
      _ -> ind ---- TODO: non-existent referent

        
      



--- to test
fex1 = Univ (Family "N" []) (\x -> Disj [Pred "Even" [x], Pred "Odd" [x]])
fex2 = Univ (Family "N" []) (\x -> Exist (Family "N" []) (\u -> Conj [Pred "Gt" [u, x], Pred "Prime" [u]]))

testProp p = do
  putStrLn $ prProp p
  putStrLn $ prProp $ unsortProp p
  putStrLn $ tptpProp p
  

