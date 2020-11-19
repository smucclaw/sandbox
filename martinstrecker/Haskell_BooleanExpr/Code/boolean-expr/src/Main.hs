{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}

module Main where

import qualified Data.Set as Set
import Data.List
import Test.Hspec
import Test.QuickCheck


data Form
  = C Bool
  | V String
  | Not Form
  | Form `And` Form
  | Form `Or` Form
  deriving (Eq, Ord, Show, Read)


-- removing constants from a formula
removeConst :: Form -> Form
removeConst (Not (C True)) = (C False)
removeConst (Not (C False)) = (C True)

removeConst ((C True) `And` f) = f
removeConst (f `And` (C True)) = f
removeConst ((C False) `And` f) = (C False)
removeConst (f `And` (C False)) = (C False)

removeConst ((C True) `Or` f) = (C True)
removeConst (f `Or` (C True)) = (C True)
removeConst ((C False) `Or` f) = f
removeConst (f `Or` (C False)) = f

removeConst f = f

simplifyConst :: Form -> Form
simplifyConst (Not f) = removeConst (Not (simplifyConst f))
simplifyConst (f1 `And` f2) = removeConst ((simplifyConst f1) `And` (simplifyConst f2))
simplifyConst (f1 `Or` f2) = removeConst ((simplifyConst f1) `Or` (simplifyConst f2))
simplifyConst f = f

-- computing negation normal forms for constant-simplified formulas

nnf :: Form -> Form
nnf (Not (Not f)) = nnf f
nnf (Not (f1 `And` f2)) = (nnf (Not f1)) `Or` (nnf (Not f2))
nnf (Not (f1 `Or` f2)) = (nnf (Not f1)) `And` (nnf (Not f2))
nnf (f1 `And` f2) = (nnf f1) `And` (nnf f2)
nnf (f1 `Or` f2) = (nnf f1) `Or` (nnf f2)
nnf f = f

-- computing conjunctive normal form

distribOr :: Form -> Form -> Form
distribOr p (q `And` r) = (distribOr p q) `And` (distribOr p r)
distribOr (p `And` q) r = (distribOr p r) `And` (distribOr q r)
distribOr p q = p `Or` q

cnf :: Form -> Form
cnf (f1 `And` f2) = (cnf f1) `And` (cnf f2)
cnf (f1 `Or` f2) = distribOr (cnf f1) (cnf f2)
cnf f = f



-- ==================================================
-- Semantics and evaluation

fv :: Form -> Set.Set String
fv (C _) = Set.empty
fv (V vn) = Set.singleton vn
fv (Not f) = fv f
fv (f1 `And` f2) = Set.union (fv f1) (fv f2)
fv (f1 `Or` f2) = Set.union (fv f1) (fv f2)

fvList :: Form -> [String]
fvList (C _) = []
fvList (V vn) = [vn]
fvList (Not f) = fvList f
fvList (f1 `And` f2) = (fvList f1) `union` (fvList f2)
fvList (f1 `Or` f2) = (fvList f1) `union` (fvList f2)

subst :: Form -> (String, Bool) -> Form
subst (C b) (vn, s) = C b
subst (V vn') (vn, s) = if vn == vn' then (C s) else (V vn')
subst (Not f) (vn, s) = Not (subst f (vn, s))
subst (f1 `And` f2) (vn, s) = (subst f1 (vn, s)) `And` (subst f2 (vn, s))
subst (f1 `Or` f2) (vn, s) = (subst f1 (vn, s)) `Or` (subst f2 (vn, s))

substAll :: Form -> [(String, Bool)] -> Form
substAll f vl = foldl subst f vl

evalSubst :: Form -> [(String, Bool)] -> Bool
evalSubst f vl =
  case (simplifyConst (substAll f vl)) of
    (C b) -> b
    _ -> error "non-constant value"

models :: Form -> [(String, Bool)] -> [String] -> [[(String, Bool)]]
models f vl  [] = if evalSubst f vl then [vl] else []
models f vl (vn : vns) = (models f ((vn, True):vl) vns) ++ (models f ((vn, False):vl) vns)

allModels :: Form -> [[(String, Bool)]]
allModels f = models f [] (fvList f)

unsatisfiable :: Form -> Bool
unsatisfiable f = null (allModels f)

valid :: Form -> Bool
valid f = unsatisfiable (Not f)


-- ==================================================
-- Prolog program

data Rule = Rl String [String]
data Goal = Gl [String]

data Prog = Pr [Rule] Goal

implies :: Form -> Form -> Form
implies f1 f2 = (Not f1) `Or` f2

conj :: [Form] -> Form
conj fms = foldl And (C True) fms

-- Prolog programs to formulas

ruleToForm :: Rule -> Form
ruleToForm (Rl h ps) = (conj (map V ps)) `implies` (V h)

goalToForm :: Goal -> Form
goalToForm (Gl ps) = conj (map V ps)

progToForm :: Prog -> Form
progToForm (Pr rls g) = (conj (map ruleToForm rls)) `implies` (goalToForm g)


-- Run Prolog programs

solveProp :: [Rule] -> String -> Bool
solveProp rls p = any (solveGoal rls) [ps | Rl h ps <- rls, h == p ]

solveGoal :: [Rule] -> [String] -> Bool
solveGoal rls ps = all (solveProp rls) ps

runProg :: Prog -> Bool
runProg (Pr rls (Gl ps)) = solveGoal rls ps

mortalSocrates :: Prog
mortalSocrates
  = Pr
  [Rl "h" [],
   Rl "m" ["h"]
  ]
  (Gl ["m"])

immortalSocrates :: Prog
immortalSocrates
  = Pr
  [Rl "h" [],
   Rl "h" ["m"]
  ]
  (Gl ["m"])

abcdProg :: Prog
abcdProg
  = Pr
  [Rl "a" [],
   Rl "d" ["b", "c"],
   Rl "d" ["a", "c"],
   Rl "c" ["a"]
  ]
  (Gl ["d", "c"])


terminating :: Prog
terminating
  = Pr
  [Rl "h" [],
   Rl "m" ["h"],
   Rl "m" ["m", "h"]
  ]
  (Gl ["m"])

nonterminating :: Prog
nonterminating
  = Pr
  [Rl "h" [],
   Rl "m" ["m", "h"],
   Rl "m" ["h"]
  ]
  (Gl ["m"])


-- ==================================================

formGen :: Gen (Form)
formGen = do
  b <- (arbitrary :: Gen Bool)
  s <- (arbitrary :: Gen String)
  f1 <- formGen
  f2 <- formGen
  oneof [return $ C b,
         return $ V s,
         return $ Not f1,
         return $ f1 `And` f2,
         return $ f1 `Or` f2]

instance Arbitrary Form where
  arbitrary = formGen


runTest :: IO ()
runTest = hspec $ do 
    it "nnf test" $ do
      property $ \f -> nnf (nnf f) == nnf f

main :: IO ()
main = do
  putStrLn "hello world"
