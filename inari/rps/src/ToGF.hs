{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies #-}

module ToGF where

import qualified GF
import PGF ( readPGF, showExpr, linearizeAll, PGF )
import Text.Printf (printf)
import RockPaperScissors
import SCaspAbsSyn
  ( SKind (..),
    Tree (A, AAtom, AVar, EApp, MExps, V),
  )
import qualified SCaspAbsSyn as SC
import System.Environment (withArgs)

type family SKind2GF (k :: SKind) :: * where
  SKind2GF KModel = GStatement
  SKind2GF KExp = GStatement
  SKind2GF KArg = GArg
  SKind2GF KVar = GVar
  SKind2GF KAtom = GAtom

toGF :: SC.Tree a -> SKind2GF a
toGF (MExps ss) = GConjStatementBullets GAnd (GListStatement $ toGF <$> ss)
toGF (EApp f [x]) = GPred1 (toGF f) (toGF x)
toGF (EApp f [x, y]) = GPred2 (toGF f) (toGF x) (toGF y)
toGF (AAtom tk) = GAAtom (toGF tk)
toGF (AVar tk) = GAVar (toGF tk)
toGF (A str) = LexAtom str
toGF (V str) = GSVar (GString str)
toGF _ = undefined

----------------------------------------------------------------------
-- Make it print etc.

nlg :: (Gf (SKind2GF a)) => SC.Tree a -> IO ()
nlg model = do
  gr <- createPGF
  let pgfExpr = gf $ toGF model
  putStrLn $ showExpr [] pgfExpr
  mapM_ (putStrLn . postprocess) (linearizeAll gr pgfExpr)

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
