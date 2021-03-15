{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -Wall -Wno-unticked-promoted-constructors #-}

module ToGF where

import Data.List (partition)
import qualified GF
import PGF (PGF, linearizeAll, readPGF, showExpr)
import RockPaperScissors
import qualified RockPaperScissors as RPS
import SCasp
  ( SKind (..),
    Tree (A, AAtom, AVar, EApp, MExps, V),
  )
import qualified SCasp as SC
import System.Environment (withArgs)
import Text.Printf (printf)

-- 1) This is a data family that translates SKind to GF types
type family SKind2GF (k :: SKind) :: * where
  SKind2GF KModel = GStatement
  SKind2GF KExp = GStatement
  SKind2GF KArg = GArg
  SKind2GF KVar = GVar
  SKind2GF KAtom = GAtom

-- 2) All sCASP trees are of type Tree a: fewer functions needed
toGF :: SC.Tree a -> SKind2GF a
toGF (MExps ss) = unpeel $ toGF <$> ss
toGF (EApp f [x]) = GApp1 (toGF f) (toGF x)
toGF (EApp f [x, y]) = GApp2 (toGF f) (toGF x) (toGF y)
toGF (AAtom tk) = GAAtom (toGF tk)
toGF (AVar tk) = GAVar (toGF tk)
toGF (A str) = LexAtom str
toGF (V str) = GSVar (GString str)
toGF _ = undefined

-- temporary hack, to get something nice to print and get back the list
peel :: GStatement -> [GStatement]
peel (GConjStatement _ _ (GListStatement ss)) = ss
peel s = [s]

unpeel :: [GStatement] -> GStatement
unpeel = wrap GBullets

wrap :: GTypography -> [GStatement] -> GStatement
wrap t ss = case ss of
  [] -> error "wrap: empty list"
  [x] -> x
  _ -> GConjStatement t GAnd $ GListStatement ss

----------------------------------------------------------------------
-- GF tree transformations

aggregate :: [GStatement] -> [GStatement]
aggregate statements =
  [ case grp of 
      [] -> error "aggregate: empty list"
      [x] -> x
      x : _ -> aggregateSubj (map getSubj grp) x
    | grp <- groupBy' samePred statements
  ]

aggregateSubj :: [GArg] -> GStatement -> GStatement
aggregateSubj subjs (GApp1 pr _subj) = GAggregate1 pr (GListArg subjs)
aggregateSubj subjs (GApp2 pr _subj obj) = GAggregate2 pr obj (GListArg subjs)
aggregateSubj _ x = x

samePred :: RPS.Tree a -> RPS.Tree a -> Bool
samePred s1 s2 = ignoreSubj s1 == ignoreSubj s2

getSubj :: GStatement -> GArg
getSubj s = case s of
  GApp1 _ subj -> subj
  GApp2 _ subj _ -> subj
  _ -> error $ "getSubj applied to a complex tree " ++ show s

ignoreSubj :: RPS.Tree a -> RPS.Tree a
ignoreSubj s = case s of
  GApp1 pr _ -> GApp1 pr dummyArg
  GApp2 pr _ obj -> GApp2 pr dummyArg obj
  _ -> composOp ignoreSubj s
  where
    dummyArg :: GArg
    dummyArg = GAVar (GSVar (GString "dummy"))

----------------------------------------------------------------------
-- Make it print etc.

nlg :: SC.Model -> IO ()
nlg model = do
  gr <- createPGF
  let printGF expr = do
--        putStrLn $ showExpr [] $ gf expr
        mapM_ (putStrLn . postprocess) (linearizeAll gr (gf expr))

  let gfModel = toGF model
  putStrLn "\nRaw translation of the model"
  printGF gfModel

  let aggr@(f:rest) = aggregate $ peel gfModel
  putStrLn "\nFirst step: aggregation"
  printGF $ unpeel aggr

  let caus = GIfThen f (unpeel rest)
  putStrLn "\nAdded causality (relying on the original order)\n"
  printGF caus

createPGF :: IO PGF.PGF
createPGF = do
  let grName = "RockPaperScissors"
  withArgs
    [ "-make",
      "--output-dir=/tmp",
      "--gfo-dir=/tmp",
      "-v=0",
      printf "grammars/%sEng.gf" grName
    ]
    GF.main
  PGF.readPGF $ printf "/tmp/%s.pgf" grName

postprocess :: String -> String
postprocess = map (\c -> if c == '\\' then '\n' else c)

-- from https://mail.haskell.org/pipermail/haskell-cafe/2014-March/113271.html
groupBy' :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy' _ [] = []
groupBy' f (a:rest) = (a:as) : groupBy' f bs
    where (as,bs) = partition (f a) rest