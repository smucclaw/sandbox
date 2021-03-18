{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -Wall -Wno-unticked-promoted-constructors #-}

module ToGF where

import Data.List.Extra (groupBy, partition, splitOn)
import qualified Data.Set as S
import qualified GF
import GHC.Exts (the)
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
    dumpModels,
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
aggregate statements = secondAggr
  where
    firstAggr =
      [ case grp of
          [] -> error "aggregate: empty list"
          [x] -> x
          x : _ -> aggregateSubj (map getSubj grp) x
        | grp <- groupBy' samePred statements
      ]
    secondAggr =
      concat
        [ case grp of
            [] -> error "aggregate: empty list"
            [x] -> [x]
            x : _ ->
              case aggregatePred (map getPred grp) x of
                y
                  | x == y -> grp
                  | otherwise -> [y]
          | grp <- groupBy sameSubj firstAggr --NB. this is the standard groupBy! We know that "A and C" statements are already next to each other
        ]

aggregateSubj :: [GArg] -> GStatement -> GStatement
aggregateSubj subjs (GApp1 pr _subj) = GAggregate1 pr (GListArg subjs)
aggregateSubj subjs (GApp2 pr _subj obj) = GAggregate2 pr obj (GListArg subjs)
aggregateSubj _ x = x

aggregatePred :: [GAtom] -> GStatement -> GStatement
aggregatePred [pr1, pr2] (GAggregate1 _pr subjs) = GAggregatePred11 pr1 pr2 subjs
aggregatePred [pr1, pr2] (GAggregate2 _pr obj subjs) = GAggregatePred12 pr1 pr2 obj subjs
aggregatePred _ x = x

samePred :: RPS.Tree a -> RPS.Tree a -> Bool
samePred s1 s2 = ignoreSubj s1 == ignoreSubj s2

sameSubj :: RPS.Tree a -> RPS.Tree a -> Bool
sameSubj s1 s2 = ignorePred s1 == ignorePred s2

getSubj :: GStatement -> GArg
getSubj s = case s of
  GApp1 _ subj -> subj
  GApp2 _ subj _ -> subj
  _ -> error $ "getSubj applied to a complex tree " ++ showExpr [] (gf s)

ignoreSubj :: RPS.Tree a -> RPS.Tree a
ignoreSubj s = case s of
  GApp1 pr _ -> GApp1 pr dummyArg
  GApp2 pr _ obj -> GApp2 pr dummyArg obj
  _ -> composOp ignoreSubj s

getPred :: GStatement -> GAtom
getPred s = case s of
  GApp1 pr _ -> pr
  GApp2 pr _ _ -> pr
  GAggregate1 pr _ -> pr
  GAggregate2 pr _ _ -> pr
  _ -> error $ "getPred applied to a complex tree " ++ showExpr [] (gf s)

ignorePred :: RPS.Tree a -> RPS.Tree a
ignorePred s = case s of
  GApp1 _ subj -> GApp2 dummyAtom subj dummyArg
  GApp2 _ subj _ -> GApp2 dummyAtom subj dummyArg
  GAggregate1 _ subjs -> GAggregate2 dummyAtom dummyArg subjs
  GAggregate2 _ _ subjs -> GAggregate2 dummyAtom dummyArg subjs
  _ -> composOp ignorePred s

dummyAtom :: GAtom
dummyAtom = LexAtom "dummy"

dummyArg :: GArg
dummyArg = GAVar (GV (GString "dummy"))

-- from https://mail.haskell.org/pipermail/haskell-cafe/2014-March/113271.html
groupBy' :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy' _ [] = []
groupBy' f (a : rest) = (a : as) : groupBy' f bs
  where
    (as, bs) = partition (f a) rest

----------------------------------------------------------------------
-- Generate GF code

grName, lexName :: Doc () --String
grName = "RPSTop"
lexName = "RPSLexicon"

mkAbsName, mkCncName, mkPGFName :: Doc () -> String
mkAbsName d = printf "grammars/%s.gf" (show d)
mkCncName d = printf "grammars/%sEng.gf" (show d)
mkPGFName d = printf "/tmp/%s.pgf" (show d)

createPGF :: IO PGF.PGF
createPGF = do
  withArgs
    [ "-make",
      "--output-dir=/tmp",
      "--gfo-dir=/tmp",
      "-v=0",
      mkCncName grName
    ]
    GF.main
  PGF.readPGF $ mkPGFName grName

createGF :: Model -> IO ()
createGF model = do
  let (absS, cncS) = mkLexicon model
  writeDoc (mkAbsName lexName) absS
  writeDoc (mkCncName lexName) cncS
  writeDoc (mkAbsName grName) $ "abstract " <>  grName <> " = RockPaperScissors," <+> lexName <+> ";"
  writeDoc (mkCncName grName) $ "concrete " <>  grName <> "Eng of " <> grName <> " = RockPaperScissorsEng, RPSLexiconEng ;"

writeDoc :: FilePath -> Doc () -> IO ()
writeDoc name doc = withFile name WriteMode $ \h -> hPutDoc h doc

mkLexicon :: SC.Tree s -> (Doc (), Doc ())
mkLexicon model = (abstractLexicon lexicon, concreteLexicon lexicon)
  where
    lexicon = guessPOS <$> S.toList (getAtoms model)

concreteLexicon :: [POS] -> Doc ()
concreteLexicon poses =
  vsep
    [ "concrete" <+> lexName <> "Eng of" <+> lexName <+> "= RockPaperScissorsEng ** open SyntaxEng, ParadigmsEng in {",
      "lin",
      (indent 4 . vsep) (concrEntry <$> poses),
      "}"
    ]

abstractLexicon :: [POS] -> Doc ()
abstractLexicon poses =
  vsep
    [ "abstract" <+> lexName <+> "= RockPaperScissors ** {",
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
      "mkN2" <+> parens (innerLex (PN n))
        <+> maybe "possess" pretty pr <> "_Prep"
    innerLex (PN n) = "mkN" <+> viaShow n
    innerLex (PV2 v pr) = "mkV2" <+> parens (innerLex (PV v))
      <+> case pr of
        Nothing -> ""
        Just prep -> pretty prep <> "_Prep"
    innerLex (PV v) = "mkV" <+> viaShow v

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

----------------------------------------------------------------------
-- print etc.

postprocess :: String -> String
postprocess = map (\c -> if c == '\\' then '\n' else c)

printGF :: Gf a => PGF -> a -> IO ()
printGF gr expr = do
  --putStrLn $ showExpr [] $ gf expr
  mapM_ (putStrLn . postprocess) (linearizeAll gr (gf expr))

nlgModels :: [Model] -> IO ()
nlgModels [] = error "nlgModels: no models given"
nlgModels [model] = nlg model -- default to nlg for just a single model
nlgModels models = do
  createGF (dumpModels models) -- We need all models together just to create lexicon
  gr <- createPGF
  let gfModels = toGF <$> models
  -- putStrLn "\nRaw translation of the model"
  -- mapM_ (printGF gr) gfModels

  let concls_evidences =
        [ (concl, aggregate evidence)
          | gfModel <- gfModels,
            let concl : evidence = peel gfModel
        ]
  let conclusion = the $ map fst concls_evidences
  let allEvidence = concatMap snd concls_evidences
  let shared = [s | s : _ : _ <- groupBy' (==) allEvidence]
  let uniques =
        [ wrap
            GInline
            [ st
              | st <- evidence,
                st `notElem` shared
            ]
          | (_, evidence) <- concls_evidences
        ]
  ---------
  -- Final printout
  printGF gr conclusion
  putStrLn "\nif all of the following hold:"
  printGF gr $ unpeel shared
  putStrLn "\nand one of the following holds:"
  printGF gr $ GDisjStatement GBullets (GListStatement uniques)


nlg :: Model -> IO ()
nlg model = do
  createGF model
  gr <- createPGF
  let gfModel = toGF model
  putStrLn "\nRaw translation of the model"
  printGF gr gfModel
  let aggr@(f : rest) = aggregate $ peel gfModel
  -- putStrLn "\nFirst step: aggregation"
  -- printGF $ unpeel aggr

  let caus = GIfThen f (unpeel rest)
  putStrLn "\nAggregation and causality (relying on the original order)\n"
  printGF gr caus
