{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TupleSections #-}
module Rule34_SMT_gen where

import Data.Text (Text)
import qualified Data.Text as Text

import Data.Graph.Inductive hiding ((&))
import Text.Casing as Casing

import Utils
import Encoding ( GateType(..) )
import Rule34_jacob
import Data.IntSet (IntSet, member, Key, insert)
import Control.Monad.RWS.Strict

-- | use this to generate the SMT code
rule34_SMT_gen :: IO ()
rule34_SMT_gen = mapM_ (putStrLn . Text.unpack) smtGen

smtGen :: [SMT]
smtGen = snd $ execRWS
  (rwsBulb (findNodeByLabel r34 (Bulb, "Must Not (bulb)"))
    >> rwsBulb (findNodeByLabel r34 (Bulb, "May (bulb)")))
  r34 mempty
        

r34 :: Gr (GateType, Text) Text
r34 = makeGraph rule34_text


findNodeByLabel :: (Graph gr, Eq a, Show a) => gr a b -> a -> (Node, a)
findNodeByLabel graph label =
  fromMaybe (error $ "cannot find node by the label: " ++ show label) $
    ufold
      (\(_,n,l,_) r -> if l == label then Just (n, l) else r)
      Nothing graph

nodeDescrToIdentifier :: Text -> Text
nodeDescrToIdentifier = ("p_" <>) .
    Text.pack . Casing.toQuietSnake . Casing.fromWords
    . map (\c -> if elem @[] c ".,-[]()" then ' ' else c) -- strip illegal chars
    . Text.unpack
-- >>> nodeDescrToIdentifier " My. - Gate. - Description. "
-- "p_my_gate_description"

nodeLabelToIdentifier :: (GateType, Text) -> Text
nodeLabelToIdentifier = nodeDescrToIdentifier . snd

type SMT = Text

-- RWS Monad

rwsPreds :: [(Node, (GateType, Text))]
  -> RWS (Gr (GateType, Text) Text) [SMT] IntSet ()
rwsPreds lnodes = mapM_ handle lnodes
  where
    handle ln@(node, _) = do
      writtenNodes <- get
      unless (member node writtenNodes) (writeNode ln)
    writeNode ln@(_, (gateType, _)) =
      let writer = case gateType of
            NOT -> rwsNOT
            AND -> rwsAND
            OR -> rwsOR
            NOR -> rwsNOR
            Bulb -> rwsBulb
            Switch -> rwsSwitch
            Buffer -> rwsBuffer
            in writer ln

rwsNOT :: (Node, (GateType, Text))
  -> RWS (Gr (GateType, Text) Text) [SMT] IntSet ()
rwsNOT (node, (gateType, descr)) = do
  graph <- ask
  writtenNodes <- get
  let lpreds = pre graph node <&> (\x -> (x, fromMaybe undefined $ lab graph x))
  rwsPreds lpreds
  tell . (:[]) $ "let" <+> nodeDescrToIdentifier descr <+> "= sNot"
    <> foldl' (<+>) "" (map (nodeDescrToIdentifier . snd . snd) lpreds)
  state (((),) . insert node)

rwsAND :: (Node, (GateType, Text))
  -> RWS (Gr (GateType, Text) Text) [SMT] IntSet ()
rwsAND (node, (gateType, descr)) = do
  graph <- ask
  writtenNodes <- get
  let lpreds = pre graph node <&> (\x -> (x, fromMaybe undefined $ lab graph x))
  rwsPreds lpreds
  tell . (:[]) $ "let" <+> nodeDescrToIdentifier descr <+> "= sAnd ["
    <> foldl1' (\x y -> x <> ", " <> y) (map (nodeDescrToIdentifier . snd . snd) lpreds) <+> "]"
  state (((),) . insert node)

rwsOR :: (Node, (GateType, Text))
  -> RWS (Gr (GateType, Text) Text) [SMT] IntSet ()
rwsOR (node, (gateType, descr)) = do
  graph <- ask
  writtenNodes <- get
  let lpreds = pre graph node <&> (\x -> (x, fromMaybe undefined $ lab graph x))
  rwsPreds lpreds
  tell . (:[]) $ "let" <+> nodeDescrToIdentifier descr <+> "= sOr ["
    <> foldl1' (\x y -> x <> ", " <> y) (map (nodeDescrToIdentifier . snd . snd) lpreds) <+> "]"
  state (((),) . insert node)

rwsNOR :: (Node, (GateType, Text))
  -> RWS (Gr (GateType, Text) Text) [SMT] IntSet ()
rwsNOR (node, (gateType, descr)) = do
  graph <- ask
  writtenNodes <- get
  let lpreds = pre graph node <&> (\x -> (x, fromMaybe undefined $ lab graph x))
  rwsPreds lpreds
  tell . (:[]) $ "let" <+> nodeDescrToIdentifier descr <+> "= sNot . sOr $ ["
    <> foldl1' (\x y -> x <> ", " <> y) (map (nodeDescrToIdentifier . snd . snd) lpreds) <+> "]"
  state (((),) . insert node)

rwsBulb :: (Node, (GateType, Text))
  -> RWS (Gr (GateType, Text) Text) [SMT] IntSet ()
rwsBulb (node, (gateType, descr)) = do
  graph <- ask
  writtenNodes <- get
  let lpreds = pre graph node <&> (\x -> (x, fromMaybe undefined $ lab graph x))
  rwsPreds lpreds
  tell . (:[]) $ "let" <+> nodeDescrToIdentifier descr <+> "="
    <> foldl' (<+>) "" (map (nodeDescrToIdentifier . snd . snd) lpreds)
  state (((),) . insert node)

rwsSwitch :: (Node, (GateType, Text))
  -> RWS (Gr (GateType, Text) Text) [SMT] IntSet ()
rwsSwitch (node, (gateType, descr)) = do
  graph <- ask
  writtenNodes <- get
  let lpreds = pre graph node <&> (\x -> (x, fromMaybe undefined $ lab graph x))
  -- rwsPreds lpreds -- Switch should have no predecessors
  tell . (:[]) $ nodeDescrToIdentifier descr <+> "<- sBool"
    <+> "\"" <> descr <> "\""
  state (((),) . insert node)

-- Buffer seems to be unused
rwsBuffer :: (Node, (GateType, Text))
  -> RWS (Gr (GateType, Text) Text) [SMT] IntSet ()
rwsBuffer (node, (gateType, descr)) = do
  graph <- ask
  writtenNodes <- get
  let lpreds = pre graph node <&> (\x -> (x, fromMaybe undefined $ lab graph x))
  rwsPreds lpreds
  tell . (:[]) $ "let" <+> nodeDescrToIdentifier descr <+> "="
    <+> foldl' (<+>) "" (map (nodeDescrToIdentifier . snd . snd) lpreds)
  state (((),) . insert node)
