{-# OPTIONS_GHC -Wincomplete-patterns #-}

module Main where

import Data.Ord (Ordering(LT,EQ,GT), compare)
import Data.Function (on)
import Data.List (nub, nubBy, intersect, sort, sortBy, sortOn, partition, subsequences, intercalate)
import qualified Data.List.NonEmpty as NE
import           Data.List.NonEmpty (NonEmpty((:|)))
import Data.Maybe (catMaybes)
import Control.Applicative (liftA2)
import Debug.Trace

data TimePoint = A | B | C | D deriving (Show, Eq, Ord)

-- a plain old timeline with four timepoints and three ordering relations between them
data Linear = Lin TimePoint Ordering TimePoint Ordering TimePoint Ordering TimePoint
  deriving (Show, Eq, Ord)

-- every possible timeline; there are 192 of them.
allLins =  [ Lin tp1 o2 tp3 o4 tp5 o6 tp7
           | tp1 <- [ A, B, C, D ]
           , tp3 <- [ A, B, C, D ], tp3 /= tp1
           , tp5 <- [ A, B, C, D ], tp5 /= tp1, tp5 /= tp3
           , tp7 <- [ A, B, C, D ], tp7 /= tp1, tp7 /= tp3, tp7 /= tp5
           ,  o2 <- [ LT, EQ ]
           ,  o4 <- [ LT, EQ ]
           ,  o6 <- [ LT, EQ ]
           ]

-- perhaps a little overengineered, but we represent a timeline as a leftmost point followed by a nonempty list of (Ordering, TimePoint) pairs.
-- the NonEmpty representation makes certain other processing steps easier.
-- in practice the Chains are always the same size.
type OTList = NE.NonEmpty (Ordering, TimePoint)
data Chain = Chain TimePoint OTList deriving (Eq, Ord)

instance Show Chain where
  show (Chain tp1 otlist) = show tp1 ++ showotl (NE.toList otlist)
    where
      sho LT = "<"
      sho GT = ">"
      sho EQ = "="
      showotl [] = ""
      showotl ((o, tp) : rest) = sho o ++ show tp ++ showotl rest

mkChain :: Linear -> Chain
mkChain (Lin tp1 o2 tp3 o4 tp5 o6 tp7) = Chain tp1 ((o2, tp3) :| [(o4, tp5), (o6, tp7)])

mylin = Lin A LT B EQ C LT D -- some dummy data
mychain = mkChain mylin
-- try: putStrLn $ drawLocations $ locate $ mychain

-- given any two timepoints, what is their relative ordering?
-- we need this to exclude the non A<B, C<D cases.
-- orderBetween (a,c) False (Lin A < B = C < D) = LT
-- orderBetween (b,c) False (Lin A < B = C < D) = EQ
-- orderBetween (b,d) False (Lin A < B = C < D) = LT
-- orderBetween (d,a) False (Lin A < B = C < D) = GT
orderBetween :: (TimePoint, TimePoint) -> Chain -> Ordering
-- base case, let's hope whatever's in the chain matches what we're looking for
orderBetween se@(start,end) (Chain tp1 ((o2, tp3) :| []))
  | start ==        end        = EQ -- shrug
  | start == tp1,   end == tp3 = o2
  |   end == tp1, start == tp3 = if o2 == LT then GT else o2 -- if the search terms show up backwards we need to reverse LT to GT
  | otherwise = error $ unwords [ "unable to glean order between", show (start,end), ": ran out of chain at", show tp1, show tp3 ]
-- inductive case: there's more chain tail to process
orderBetween se@(start,end) (Chain tp1 ((o2, tp3) :| (o4, tp5):otps))
  | start == tp1 &&   end == tp3
  ||  end == tp1 && start == tp3 = orderBetween se $ Chain tp1 $ (o2,        tp3) :| []   -- discard tail, proceed to base case
  | start == tp1
  ||  end == tp1                 = orderBetween se $ Chain tp1 $ (min o2 o4, tp5) :| otps -- discard intermediate (o2, tp3), replace o2
  | otherwise                    = orderBetween se $ Chain tp3 $ (       o4, tp5) :| otps -- discard head

allChains = mkChain <$> allLins -- length 192

-- we know that Allen's X = A<B and Y = C<D, so we filter for those
legalAB line = orderBetween (A,B) line == LT
legalCD line = orderBetween (C,D) line == LT
legalChains = filter legalAB $ filter legalCD $ allChains -- length 22
legalLocations = sortOn snd $ (\x -> (x, locate x)) <$> legalChains
uniqLegals = nubBy ((==) `on` ((\ls -> drop 3 <$> tail ls))) -- uniq by the ascii artwork itself; length 13
  [ ((symbol ++ ": ") ++) <$>
    (show chain ++ ": " ++ english)
    : (lines (drawLocations loc))
  | (chain,loc) <- legalLocations
  , let (symbol, english) = allenName (show chain) ]

-- pretty-printer code follows.
main = showLegals
showLegals = putStr $ (intercalate "\n" $ unlines <$> uniqLegals)

type Locations = [(TimePoint, Int)]
locate :: Chain -> Locations
locate orig@(Chain tp1 t@((o2, tp3) :| otps)) =
  let startpos = 1 -- indentation
  in [(tp1,startpos)] <> locate' (startpos + tab o2) (Chain tp3 $ NE.fromList otps)

tab EQ = 0
tab LT = 1
tab GT = error "GT encountered"

locate' :: Int -> Chain -> Locations
locate' pos orig@(Chain tp3 t@((o4, tp5) :| opts)) =
  [(tp3,pos)] ++ if null opts
                 then [(tp5,pos + tab o4)]
                 else locate' (pos + tab o4) (Chain tp5 $ NE.fromList opts)

drawLocations :: Locations -> String
drawLocations locs = dP [A,B] ++ dP [C,D]
  where dP wanted =
          drawPoints (sortOn snd $ filter (\(tp,pos) -> tp `elem` wanted) locs) 0 ' '

-- draw the A---B C---D graphics
drawPoints :: Locations -> Int -> Char -> String
drawPoints [] _ _ = "\n"
drawPoints ((tp,pos):locs) current fill = 
  rep (4 * (pos - current) - (length $ show tp)) fill ++ show tp ++ drawPoints locs pos '-'
  where rep n x = take n $ repeat x

allenName "A<B=C<D" = ("m ","AB meets CD")
allenName "A<B<C<D" = ("< ","AB precedes CD")
allenName "A=C<B=D" = ("= ","AB equals CD")
allenName "A=C<B<D" = ("s ","AB starts CD")
allenName "A=C<D<B" = ("si","CD starts AB")
allenName "A<C<B=D" = ("fi","CD finishes AB")
allenName "A<C<B<D" = ("o ","AB overlaps with CD")
allenName "A<C<D<B" = ("di","CD during AB")
allenName "C<A<B=D" = ("f ","AB finishes CD")
allenName "C<A<B<D" = ("d ","AB during CD")
allenName "C<A=D<B" = ("mi","CD meets AB")
allenName "C<A<D<B" = ("oi","CD overlaps with AB")
allenName "C<D<A<B" = ("> ","CD precedes AB")

allenName otherwise = ("? ","UNKNOWN")
