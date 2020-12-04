{-# OPTIONS_GHC -Wincomplete-patterns #-}

module Main where

import Data.Ord (Ordering(LT,EQ,GT), compare)
import Data.Function (on)
import Data.List (nub, nubBy, intersect, sort, sortBy, sortOn, partition, subsequences, intercalate)
import Data.List.Split
import qualified Data.List.NonEmpty as NE
import           Data.List.NonEmpty (NonEmpty((:|)))
import Data.Maybe (catMaybes)
import Control.Applicative (liftA2)
import Debug.Trace
import Data.Char (isLetter)

<<<<<<< HEAD
data TimePoint = A | B | C | D | E | F deriving (Show, Eq, Ord)

-- a plain old timeline with four timepoints and three ordering relations between them
data Linear = Lin TimePoint Ordering TimePoint Ordering TimePoint Ordering TimePoint Ordering TimePoint Ordering TimePoint
=======
data TimePoint = A | B | C | D | E | F deriving (Show, Read, Eq, Ord)

-- a plain old timeline with N timepoints and N-1 ordering relations between them
data Linear4 = Lin4 TimePoint Ordering TimePoint Ordering TimePoint Ordering TimePoint
>>>>>>> support both XY and XYZ intervals; next, compose and assess
  deriving (Show, Eq, Ord)
data Linear6 = Lin6 TimePoint Ordering TimePoint Ordering TimePoint Ordering TimePoint Ordering TimePoint Ordering TimePoint
  deriving (Show, Eq, Ord)

-- every possible combination of 2 intervals; there are 192 of them.
allLin4s = [ Lin4 tp1 o2 tp3 o4 tp5 o6 tp7
           | tp1  <- [ A, B, C, D ]
           , tp3  <- [ A, B, C, D ], tp3 /= tp1
           , tp5  <- [ A, B, C, D ], tp5 /= tp1, tp5 /= tp3
           , tp7  <- [ A, B, C, D ], tp7 /= tp1, tp7 /= tp3, tp7 /= tp5
           ,  o2 <- [ LT, EQ ]
           ,  o4 <- [ LT, EQ ]
           ,  o6 <- [ LT, EQ ]
           ]

<<<<<<< HEAD
-- every possible timeline; there are 192 of them.
allLins =  [ Lin tp1 o2 tp3 o4 tp5 o6 tp7 o8 tp9 o10 tp11
=======
-- every possible combination of 3 intervals; this allows us to derive Allen's table of compositions between 2 intervals.
allLin6s = [ Lin6 tp1 o2 tp3 o4 tp5 o6 tp7 o8 tp9 o10 tp11
>>>>>>> support both XY and XYZ intervals; next, compose and assess
           | tp1  <- [ A, B, C, D, E, F ]
           , tp3  <- [ A, B, C, D, E, F ], tp3 /= tp1
           , tp5  <- [ A, B, C, D, E, F ], tp5 /= tp1, tp5 /= tp3
           , tp7  <- [ A, B, C, D, E, F ], tp7 /= tp1, tp7 /= tp3, tp7 /= tp5
           , tp9  <- [ A, B, C, D, E, F ], tp9 /= tp1, tp9 /= tp3, tp9 /= tp5, tp9 /= tp7
           , tp11 <- [ A, B, C, D, E, F ], tp11/= tp1, tp11/= tp3, tp11/= tp5, tp11/= tp7, tp11/= tp9
           ,  o2 <- [ LT, EQ ]
           ,  o4 <- [ LT, EQ ]
           ,  o6 <- [ LT, EQ ]
           ,  o8 <- [ LT, EQ ]
           , o10 <- [ LT, EQ ]
           ]

-- perhaps a little overengineered, but we represent a timeline as a leftmost point followed by a nonempty list of (Ordering, TimePoint) pairs.
-- the NonEmpty representation makes certain other processing steps easier.
-- well, it turns out that with the 4 vs 6, this turned out to not be overengineering after all.
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

<<<<<<< HEAD
mkChain :: Linear -> Chain
mkChain (Lin tp1 o2 tp3 o4 tp5 o6 tp7 o8 tp9 o10 tp11) = Chain tp1 ((o2, tp3) :| [(o4, tp5), (o6, tp7), (o8, tp9), (o10, tp11)])

mylin = Lin A LT B EQ C LT D EQ E LT F -- some dummy data
mychain = mkChain mylin
-- try: putStrLn $ drawLocations $ locate $ mychain
=======
char2cmp '<' = LT
char2cmp '>' = GT
char2cmp '=' = EQ
char2cmp x   = error $ "cannot char2cmp '" ++ [x] ++ "'"

mkChain4 :: Linear4 -> Chain
mkChain4 (Lin4 tp1 o2 tp3 o4 tp5 o6 tp7) = Chain tp1 ((o2, tp3) :| [(o4, tp5), (o6, tp7)])

mkChain6 :: Linear6 -> Chain
mkChain6 (Lin6 tp1 o2 tp3 o4 tp5 o6 tp7 o8 tp9 o10 tp11) = Chain tp1 ((o2, tp3) :| [(o4, tp5), (o6, tp7), (o8, tp9), (o10, tp11)])

chain2lin4 (Chain tp1 ((o2, tp3) :| [(o4, tp5), (o6, tp7)]))                         = Lin4 tp1 o2 tp3 o4 tp5 o6 tp7
chain2lin4 otherwise = error "chain2lin4 given a chain that doesn't have 4 timepoints"
chain2lin6 (Chain tp1 ((o2, tp3) :| [(o4, tp5), (o6, tp7), (o8, tp9), (o10, tp11)])) = Lin6 tp1 o2 tp3 o4 tp5 o6 tp7 o8 tp9 o10 tp11
chain2lin6 otherwise = error "chain2lin6 given a chain that doesn't have 6 timepoints"

mylin4 = Lin4 A LT B EQ C LT D
mylin6 = Lin6 A LT B EQ C LT D EQ F LT E -- some dummy data
mychain6 = mkChain6 mylin6
-- try: putStrLn $ drawLocations $ locate $ mychain6
>>>>>>> support both XY and XYZ intervals; next, compose and assess

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

allChain4s = mkChain4 <$> allLin4s -- length 192
allChain6s = mkChain6 <$> allLin6s

-- we know that Allen's X = A<B and Y = C<D, so we filter for those
legalAB line = orderBetween (A,B) line == LT
legalCD line = orderBetween (C,D) line == LT
legalEF line = orderBetween (E,F) line == LT
<<<<<<< HEAD
legalChains = filter legalAB $ filter legalCD $ allChains -- length 22
legalLocations = sortOn snd $ (\x -> (x, locate x)) <$> legalChains
uniqLegals = nubBy ((==) `on` ((\ls -> drop 3 <$> tail ls))) -- uniq by the ascii artwork itself; length 13
=======
legal4       = filter legalAB . filter legalCD
legal6       = legal4         . filter legalEF

legalChain4s = chainSort <$> legal4 allChain4s -- length 22
legalChain6s = chainSort <$> legal6 allChain6s -- length 1254
legalLocation4s = sortOn snd $ (\x -> (x, locate x)) <$> nub legalChain4s -- length 13
legalLocation6s = sortOn snd $ (\x -> (x, locate x)) <$> nub legalChain6s -- length 409
uniqLegals locs = 
>>>>>>> support both XY and XYZ intervals; next, compose and assess
  [ ((symbol ++ ": ") ++) <$>
    (show chain) -- ++ ": " ++ english)
    : (lines (drawLocations loc))
  | (chain,loc) <- locs
  , let (symbol, english) = allenName (show chain) ]

-- TODO: compose AB/CD with CD/EF; ignoring CD, see what relationships AB and EF have with each other; identify the allenName for that.

-- pretty-printer code follows.
main = showLegal4s >> showLegal6s >> showCompositions
showLegal4s = putStr $ (intercalate "\n" $ unlines <$> uniqLegals legalLocation4s)
showLegal6s = putStr $ (intercalate "\n" $ unlines <$> uniqLegals legalLocation6s)
showCompositions = putStrLn "TBD" -- "¯\_(ツ)_/¯"

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
drawLocations locs = dP [A,B] ++ dP [C,D] ++ dP [E,F]
  where dP wanted =
          drawPoints (sortOn snd $ filter (\(tp,pos) -> tp `elem` wanted) locs) 0 ' '

-- draw the A---B C---D graphics
drawPoints :: Locations -> Int -> Char -> String
drawPoints [] _ _ = "\n"
drawPoints ((tp,pos):locs) current fill = 
  rep (4 * (pos - current) - (length $ show tp)) fill ++ show tp ++ drawPoints locs pos '-'
  where rep n x = take n $ repeat x

s2ot :: [(Ordering,TimePoint)] -> String -> [(Ordering,TimePoint)]
s2ot sofar "" = sofar
s2ot sofar (s:tring) = let (op,tp,rest) = if   isLetter s then (EQ,         s,     tring)
                                          else         (char2cmp s,head tring,tail tring)
                       in s2ot (sofar <> [(op, read [tp])]) rest

s2c :: String -> Chain
s2c (s:tring) = Chain (read [s]) $ NE.fromList (s2ot [] tring)
s2c "" = error "s2c needs to be called on a string with at least two timepoints"
                
c2s :: Chain -> String
c2s c = concat $ 
        (\(skip, tps) -> if skip then tps else sort tps) <$>
        (zip (cycle [False, True]) $ split (whenElt (not . isLetter)) $ filter (/= '=') $ show c)

-- if A<B=D=C<F=E we reorder the B=D=C to B=C=D
chainSort :: Chain -> Chain
chainSort = s2c . c2s

-- TODO: make this agnostic as to AB CD vs AB EF
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
