module Main where

{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}
{-# LANGUAGE LambdaCase #-}

import Text.Pretty.Simple

myforms :: [Form]
myforms = [ V "a" `And` C False
          , V "a" `And` (Not (C True `Or` C False))
          , Not ( V "a" `And` ( V "b" `Or` V "c") )
          , ((V "a" `And` V "b") `Or` (V "c" `And` V "d"))
          -- i don't want to have to think of more examples by myself.
          -- we could instantiate into Arbitrary and let QuickCheck do the work.
          ]

main :: IO ()
main = mapM_ pPrint (cnf <$> myforms)

data Form = V String
          | C Bool
          | Form `Or` Form
          | Form `And` Form
          | Not Form
          deriving (Eq, Ord, Show, Read)

type Symtab = String -> Bool

reify :: Form -> Symtab -> Bool
reify f st = reify' f
  where 
    reify' (C x)       = x
    reify' (V v)       = st v
    reify' (Not x)     = not $ reify' x
    reify' (p `Or`  q) = reify' p || reify' q
    reify' (p `And` q) = reify' p && reify' q

removeConst :: Form -> Form
removeConst ((C True)  `Or` _        ) = C True
removeConst (_         `Or` (C True) ) = C True

removeConst ((C False)  `Or` form      ) = form
removeConst (form       `Or` (C False) ) = form

removeConst ((C True)  `And` form        ) = form
removeConst (form      `And` (C True)    ) = form

removeConst ((C False) `And` _    )       = C False
removeConst (_       `And` (C False) )    = C False

removeConst k = k

simplifyConst :: Form -> Form
simplifyConst (form1 `Or`  form2) = removeConst (removeConst form1 `Or` removeConst form2)
simplifyConst (form1 `And` form2) = removeConst (removeConst form1 `And` removeConst form2)
simplifyConst (Not (C False)) = (C True)
simplifyConst (Not (C True))  = (C False)
simplifyConst x = removeConst x

nnf :: Form -> Form
nnf (Not (Not x)) = nnf x
nnf (Or  form1 form2) =  Or (nnf form1) (nnf form2)
nnf (And form1 form2) = And (nnf form1) (nnf form2)
-- hello De Morgan
nnf (Not (form1  `Or` form2)) = (nnf $ Not form1) `And` (nnf $ Not form2)
nnf (Not (form1 `And` form2)) = (nnf $ Not form1)  `Or` (nnf $ Not form2)
nnf x = simplifyConst x

cnf :: Form -> Form
cnf (p `Or` (q `And` r)) = (cnf p `Or` cnf q) `And` (cnf p `Or` cnf r)
cnf ((q `And` r) `Or` p) = (cnf p `Or` cnf r) `And` (cnf p `Or` cnf q)
cnf x = nnf x
