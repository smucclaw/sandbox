{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -Wall -Wno-unticked-promoted-constructors #-}

module ToGF where

import Data.List.Extra (partition, splitOn)
import qualified Data.Set as S
import qualified GF
import PGF (PGF, linearizeAll, readPGF, showExpr)
import Prettyprinter
import Prettyprinter.Render.Text (hPutDoc)
import RockPaperScissors
import qualified RockPaperScissors as RPS
import SCasp
  ( AtomWithArity (AA),
    Model,
    SKind (..),
    Tree (A, AAtom, AVar, EApp, MExps, V),
    getAtoms,
  )
import qualified SCasp as SC
import System.Environment (withArgs)
import System.IO (IOMode (WriteMode), withFile)
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
toGF (V str) = GV (GString str)
toGF _ = undefined

-- temporary hack, to get something nice to print and get back the list
peel :: GStatement -> [GStatement]
peel (GConjStatement _ (GListStatement ss)) = ss
peel s = [s]

unpeel :: [GStatement] -> GStatement
unpeel = wrap GBullets

wrap :: GTypography -> [GStatement] -> GStatement
wrap t ss = case ss of
  [] -> error "wrap: empty list"
  [x] -> x
  _ -> GConjStatement t $ GListStatement ss

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
  _ -> error $ "getSubj applied to a complex tree " ++ show (gf s)

ignoreSubj :: RPS.Tree a -> RPS.Tree a
ignoreSubj s = case s of
  GApp1 pr _ -> GApp1 pr dummyArg
  GApp2 pr _ obj -> GApp2 pr dummyArg obj
  _ -> composOp ignoreSubj s
  where
    dummyArg :: GArg
    dummyArg = GAVar (GV (GString "dummy"))

----------------------------------------------------------------------
-- Make it print etc.

topGrName :: String
topGrName = "RPSTop"

nlg :: SC.Model -> IO ()
nlg model = do
  createGF model
  gr <- createPGF
  let printGF expr = do
        --putStrLn $ showExpr [] $ gf expr
        mapM_ (putStrLn . postprocess) (linearizeAll gr (gf expr))
  let gfModel = toGF model
  putStrLn "\nRaw translation of the model"
  printGF gfModel
  let aggr@(f : rest) = aggregate $ peel gfModel
  putStrLn "\nFirst step: aggregation"
  printGF $ unpeel aggr
  let caus = GIfThen f (unpeel rest)
  putStrLn "\nAdded causality (relying on the original order)\n"
  printGF caus

createPGF :: IO PGF.PGF
createPGF = do
  withArgs
    [ "-make",
      "--output-dir=/tmp",
      "--gfo-dir=/tmp",
      "-v=0",
      printf "grammars/%sEng.gf" topGrName
    ]
    GF.main
  PGF.readPGF $ printf "/tmp/%s.pgf" topGrName

postprocess :: String -> String
postprocess = map (\c -> if c == '\\' then '\n' else c)

-- from https://mail.haskell.org/pipermail/haskell-cafe/2014-March/113271.html
groupBy' :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy' _ [] = []
groupBy' f (a : rest) = (a : as) : groupBy' f bs
  where
    (as, bs) = partition (f a) rest

----------------------------------------------------------------------
-- Generate GF code

createGF :: Model -> IO ()
createGF model = do
  let (absS, cncS) = mkLexicon model
  let absLex = "grammars/RPSLexicon.gf"
  let absTop = printf "grammars/%s.gf" topGrName
  let cncLex = "grammars/RPSLexiconEng.gf"
  let cncTop = printf "grammars/%sEng.gf" topGrName
  writeDoc absLex absS
  writeDoc cncLex cncS
  writeDoc absTop $ "abstract " <> pretty topGrName <> " = RockPaperScissors, RPSLexicon ;"
  writeDoc cncTop $ "concrete " <> pretty topGrName <> "Eng of " <> pretty topGrName <> " = RockPaperScissorsEng, RPSLexiconEng ;"

writeDoc :: FilePath -> Doc () -> IO ()
writeDoc name doc = withFile name WriteMode $ \h -> hPutDoc h doc

mkLexicon :: SC.Tree s -> (Doc (), Doc ())
mkLexicon model = (abstractLexicon lexicon, concreteLexicon lexicon)
  where
    lexicon = guessPOS <$> S.toList (getAtoms model)

concreteLexicon :: [POS] -> Doc ()
concreteLexicon poses =
  vsep
    [ "concrete RPSLexiconEng of RPSLexicon = RockPaperScissorsEng ** open SyntaxEng, (P=ParadigmsEng) in {",
      "lin",
      (indent 4 . vsep) (concrEntry <$> poses),
      "}"
    ]

abstractLexicon :: [POS] -> Doc ()
abstractLexicon poses =
  vsep
    [ "abstract RPSLexicon = RockPaperScissors ** {",
      "fun",
      indent 4 . sep . punctuate "," . map (pretty . origName) $ poses,
      indent 4 ": Atom ;",
      "}"
    ]

concrEntry :: POS -> Doc ()
concrEntry (POS name p) = hsep [pretty name, "=", "mkAtom", parens $ innerLex p, ";"]
  where
    innerLex :: InnerPOS -> Doc ()
    innerLex (PN2 n pr) =
      "P.mkN2" <+> parens (innerLex (PN n))
        <+> maybe "possess" pretty pr <> "_Prep"
    innerLex (PN n) = "P.mkN" <+> viaShow n
    innerLex (PV2 v pr) = "P.mkV2" <+> parens (innerLex (PV v))
      <+> case pr of
        Nothing -> ""
        Just prep -> pretty prep <> "_Prep"
    innerLex (PV v) = "P.mkV" <+> viaShow v

type Prep = Maybe String

data POS = POS {origName :: String, pos :: InnerPOS}

data InnerPOS = PN2 String Prep | PN String | PV2 String Prep | PV String

guessPOS :: AtomWithArity -> POS
guessPOS aa@(AA str int) = POS str $ case (int, splitOn "_" str) of
  (0, [noun]) -> PN noun
  (_, ["is", noun, prep]) -> PN2 noun (Just prep)
  (_, ["is", noun]) -> PN noun
  (1, [verb]) -> PV verb
  (2, [verb]) -> PV2 verb Nothing
  (2, [verb, prep]) -> PV2 verb (Just prep)
  _ -> error $ "guessPOS: unexpected output " ++ show aa