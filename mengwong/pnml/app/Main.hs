{-# LANGUAGE DeriveGeneric, DeriveFunctor #-}

module Main where

import Lib
import Data.Graph.Inductive.Graph
import Control.Monad.State
import Text.Pretty.Simple

main :: IO ()
main = do
  pPrint $ runState petri1 0
  pPrint $ runState petri2 0

type NodeLabel  = String          -- ^ nodes in a Petri Net are labeled with strings.
type Box        = LNode NodeLabel -- ^ those nodes are themselves identified for fgl and graphviz purposes with integer node ids
type ArcLabel   = Int             -- ^ the arcs between nodes can also be labeled. In the trivial case each arc is labeled with 1.

-- | NetP is a Petri Net, starting and ending with places.
data NetP
  = P Box                   -- ^ The simplest petri net is a single place.
  | NetT :->@ (ArcLabel,[NetP]) -- ^ More often it is some fragment of a net ending with a transition, which we arc to a place.
  deriving (Show, Eq)

-- | NetT is a fragment of a Petri Net ending in a transition.
data NetT
  = T Box                     -- ^ By symmetry, the simplest such fragment is a single transition
  | NetP :-># (ArcLabel,[NetT]) -- ^ More often it is some fragment of a net ending with a place, which we arc to a transition.
  deriving (Show, Eq)

-- Haskell is all about the combinators
infixl 4 :->#, :->@, ->#, ->@, ->##, ->@@
x ->## y = x  -># [y]
x ->@@ y = x  ->@ [y]
x ->#  y = x :-># (1,y)
x ->@  y = x :->@ (1,y)
  
-- We use the state monad to keep track of node ids, which fgl and GraphViz require.
-- Without node IDs we wouldn't be able to distinguish multiple nodes with the same string labels.
mkP :: String -> State Node NetP
mkP = mk' P

mkT :: String -> State Node NetT
mkT = mk' T

mk' :: (Box -> a)   -- NetT / NetP constructor
    -> NodeLabel    -- label string
    -> State Node a -- max node number, NetT / NetP
mk' mk lbl = do
  c <- get
  put (c+1)
  return $ mk (c+1, lbl)

petri1 = do
  startNode  <- mkP "start"
  middleNode <- mkT "middle"
  endNode    <- mkP "end"
  return $ startNode ->## middleNode ->@@ endNode

petri2 = do
  startNode    <- mkP "start"
  split        <- mkT "split"

  leftInit     <- mkP "left thread init"
  leftA        <- mkP "left A"
  leftB        <- mkP "left B"
  leftDecision <- mkT "left decision"
  leftJoin     <- mkT "left join"
  leftFinish   <- mkP "left finish"
  let leftThread = leftInit
                   ->## leftDecision
                   ->@ [leftA, leftB]
                   ->## leftJoin
                   ->@@ leftFinish

  rightInit     <- mkP "right thread init"
  rightA        <- mkP "right A"
  rightB        <- mkP "right B"
  rightDecision <- mkT "right decision"
  rightJoin     <- mkT "right join"
  rightFinish   <- mkP "right finish"
  let rightThread = rightInit
                   ->## rightDecision
                   ->@ [rightA, rightB]
                   ->## rightJoin
                   ->@@ rightFinish

  join       <- mkT "join"
  endNode    <- mkP "end"
  return $ startNode ->## split ->@ [leftThread, rightThread] ->## join ->@@ endNode

-- -- next: Petri net as an Applicative
-- data PetriFunctor a
--   = PF (LNode a)
--   | TF (LNode a)
--   deriving (Show, Eq, Functor)
--   -- in future see idiomatic deriving

-- instance Applicative PetriFunctor where
--   pure = PF . LNode
--   (<*>) (PF x) (TF y) = _

-- mkPF, mkTF :: a -> PetriFunctor a
-- mkPF lbl = PF (0,lbl)
-- mkTF lbl = TF (0,lbl)
-- petri3 = mkPF "start" <> mkTF "middle" <> mkPF "end"

-- -- next: Petri net as a monad under StateT

-- data PetriMonad a
--   = PM (LNode a)
--   | TM (LNode a)
-- mkPM lbl = PM (0,lbl)

-- instance Monad PetriMonad where
--   x >>= y = x <> y

-- petri4 = do
--   mkPM "start"
--   mkTM "middle"
--   mkPM "end"


