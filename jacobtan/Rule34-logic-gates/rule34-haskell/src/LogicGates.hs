{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE LambdaCase #-}
module LogicGates where

import Utils ( (&), (<&>) )
import Data.List.Split (chunksOf)
import Text.Pretty.Simple (pPrint)

import Encoding
    ( NodeInfo(gType, gDescr),
      GateType(Buffer, NOT, AND, OR, NOR, Bulb, Switch),
      NodeRef,
      nodeInfo )
import Fgl (makeNodeLabel)
import qualified Data.Text as T

toLogicGate :: NodeRef -> [Maybe Bool] -> Maybe Bool
toLogicGate node = nodeInfo node & do -- Reader applicative
  gateType <- gType
  gateDescr <- gDescr
  return $ case gateType of
    NOT -> notGate node
    AND -> andGate
    OR -> orGate
    NOR -> fmap not . orGate
    Bulb -> bulbGate node
    Switch -> switchGate node
    Buffer -> bufferGate node

notGate :: NodeRef -> [Maybe Bool] -> Maybe Bool
notGate node inputs =
  if length inputs /= 1
  then error (
    (makeNodeLabel node & T.unpack)
    ++ ": " ++ "NOT gate can have only one input. Inputs: "
    ++ show inputs
  )
  else fmap @Maybe not . head $ inputs

bulbGate :: NodeRef -> [Maybe Bool] -> Maybe Bool
bulbGate node inputs =
  if length inputs /= 1
  then error (
    (makeNodeLabel node & T.unpack)
    ++ ": " ++ "Bulb gate can have only one input. Inputs: "
    ++ show inputs
  )
  else head inputs

switchGate :: NodeRef -> [Maybe Bool] -> Maybe Bool
switchGate node inputs =
  -- if length inputs /= 0 -- replaced with hlint suggestion
  if not (null inputs) -- hlint suggested this
  then error (
    (makeNodeLabel node & T.unpack)
    ++ ": " ++ "Switch gate can have only zero inputs. Inputs: "
    ++ show inputs
  )
  else head inputs

bufferGate :: NodeRef -> [Maybe Bool] -> Maybe Bool
bufferGate node inputs =
  if length inputs /= 1
  then error (
    (makeNodeLabel node & T.unpack)
    ++ ": " ++ "Buffer gate can have only one input. Inputs: "
    ++ show inputs
  )
  else head inputs

-- AND and OR gates are implemented according to
--   https://en.wikipedia.org/wiki/Three-valued_logic#Kleene_and_Priest_logics


-- | Uses foldr with an accumulator.
--   @hasUnknown@ is an accumulator that keeps track of whether an Nothing has been seen.
--   for the dedicated reader: https://jacob-tan-en.medium.com/haskell-foldr-with-accumulator-f4e9ea7f4574
--     *** warning *** can cause indigestion
andGate :: [Maybe Bool] -> Maybe Bool
andGate inputs =
  foldr @[] f z inputs False
    where
      -- | third param is the accumulator
      f :: Maybe Bool -> (Bool -> Maybe Bool) -> Bool -> Maybe Bool
      f x r hasUnknown = case x of
        Just False -> Just False -- short circuit when an input is "known false"
        Just True -> r hasUnknown -- pass down the accumulator as-is
        Nothing -> r True -- a Nothing is seen, so pass down the information
      -- | first param is the accumulator
      --   if an unknown is seen, output Nothing
      --   If an unknown is not seen (and it did not short-circuit),
      --     then we know everything is Just True, so output Just True.
      z :: Bool -> Maybe Bool
      z hasUnknown = if hasUnknown then Nothing else Just True

orGate :: [Maybe Bool] -> Maybe Bool
orGate inputs =
  foldr @[] f z inputs False
    where
      -- | third param is the accumulator
      f :: Maybe Bool -> (Bool -> Maybe Bool) -> Bool -> Maybe Bool
      f x r hasUnknown = case x of
        Just True -> Just True -- short circuit when an input is "known true"
        Just False -> r hasUnknown -- pass down the accumulator as-is
        Nothing -> r True -- a Nothing is seen, so pass down the information
      -- | first param is the accumulator
      --   if an unknown is seen, output Nothing
      --   If an unknown is not seen (and it did not short-circuit),
      --     then we know everything is Just False, so output Just False.
      z :: Bool -> Maybe Bool
      z hasUnknown = if hasUnknown then Nothing else Just False


-- Meng's version of AND and OR gates, using closed world assumption:

andGate' :: [Maybe Bool] -> Maybe Bool
andGate' xs = Just $ and (flattenBool <$> xs)
orGate'  xs = Just $ or  (flattenBool <$> xs)

notGate' :: Maybe Bool -> Maybe Bool
notGate' x = Just $ not (flattenBool x)

-- closed world assumption: if we don't know something is true, then we assume it's false.
flattenBool :: Maybe Bool -> Bool
flattenBool (Just True) = True
flattenBool _           = False

logicGatesMain :: IO ()
logicGatesMain = do
  -- https://en.wikipedia.org/wiki/Three-valued_logic#Kleene_and_Priest_logics
  let threeValues = [Just False, Nothing, Just True]
  pPrint $ (\x y -> [x,y]) <$> threeValues <*> threeValues <&> andGate & chunksOf 3
  print $ (\x y -> [x,y]) <$> threeValues <*> threeValues <&> andGate'
  pPrint $ (\x y -> [x,y]) <$> threeValues <*> threeValues <&> orGate & chunksOf 3
  print $ (\x y -> [x,y]) <$> threeValues <*> threeValues <&> orGate'