{-# OPTIONS_GHC -Wincomplete-patterns #-}

module Main where

import Data.Ord (Ordering(LT,EQ,GT), compare)
import Data.Function (on)
import Data.List (nub, nubBy, intersect, sort, sortBy, sortOn, partition, subsequences, intercalate, elemIndex)
import Data.List.Split
import qualified Data.List.NonEmpty as NE
import           Data.List.NonEmpty (NonEmpty((:|)))
import Data.Maybe (catMaybes)
import Control.Applicative (liftA2)
import Debug.Trace
import Data.Char (isLetter)

data TimePoint = A | B | C | D | E | F deriving (Show, Read, Eq, Ord)

-- a plain old timeline with N timepoints and N-1 ordering relations between them
data Linear4 = Lin4 TimePoint Ordering TimePoint Ordering TimePoint Ordering TimePoint
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

-- every possible combination of 3 intervals; this allows us to derive Allen's table of compositions between 2 intervals.
allLin6s = [ Lin6 tp1 o2 tp3 o4 tp5 o6 tp7 o8 tp9 o10 tp11
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
      showotl [] = ""
      showotl ((o, tp) : rest) = sho o ++ show tp ++ showotl rest

sho LT = "<"
sho GT = ">"
sho EQ = "="

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
mychain4 = mkChain4 mylin4
mychain6 = mkChain6 mylin6
-- try: putStrLn $ drawLocations $ locate $ mychain6

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

-- exclude [C,D] A=C<D=E<B<F ==> A<E<B<F
-- exclude [C,D] A=C<D=E<B=F ==> A<E<B=F
-- exclude [C,D] A=C<D=E<F<B ==> A<E<F<B
-- exclude [A,B] A=C<D=E<F<B ==> C<D=E<F

exclude :: [TimePoint] -> Chain -> Chain
exclude exs (Chain tp1 otps) = let excluded = exclude' exs ((EQ,tp1):(NE.toList otps))
                               in Chain (snd $ head excluded) (NE.fromList $ tail excluded)
  where
    exclude' :: [TimePoint] -> [(Ordering, TimePoint)] -> [(Ordering, TimePoint)]
    exclude' exs ((o0,tp1):(o2,tp3):otps)
      | tp1 `elem` exs =           exclude' exs $ (min o0 o2, tp3):otps -- the trick is to preserve a < even when deleting its associated timepoint
      | otherwise      = (o0,tp1):(exclude' exs $        (o2, tp3):otps)
    exclude' exs orig@[(o0,tp1)]
      | tp1 `elem` exs = []
      | otherwise      = orig
    exclude' exs [] = []
                            
allChain4s = mkChain4 <$> allLin4s -- length 192
allChain6s = mkChain6 <$> allLin6s -- length 23,040

-- we know that Allen's X = A<B and Y = C<D, so we filter for those
legalAB line = orderBetween (A,B) line == LT
legalCD line = orderBetween (C,D) line == LT
legalEF line = orderBetween (E,F) line == LT
legal4       = filter legalAB . filter legalCD
legal6       = legal4         . filter legalEF

legalChain4s = chainSort <$> legal4 allChain4s -- length 22
legalChain6s = chainSort <$> legal6 allChain6s -- length 1254
cs2cl cs     = sortOn snd $ c2cl <$> cs
c2cl  c      = (c, locate c)
legalLocation4s = cs2cl $ nub $ legalChain4s -- length 13
legalLocation6s = cs2cl $ nub $ legalChain6s -- length 409
showLoc4 (chain,loc) =
  let showchain = allenSquash (show chain)
      (symbol, english) = allenName showchain
  in ((symbol ++ ": ") ++) <$> (filter (not . null) $
     (show chain ++ ": " ++ english)
     : (lines (drawLocations loc)))
showLocs locs = showLoc4  <$> locs
showChain   c  = unlines [ show c , drawLocations (locate c) ]
showChains  cs =  showLocs $ cs2cl cs -- this one adds a sortOn snd
printChains cs = printlocs $ cs2cl cs

-- conceptually, we want to see what happens when we compose a given XY with a given YZ.
-- this produces the Figure 4 of http://cse.unl.edu/~choueiry/Documents/Allen-CACM1983.pdf
-- in practice, we cluster all the legalChain6s by identical AB/CD signatures.
-- a signature is a unique combination of relations between AB, AC, AD, BC, BD, CD.
data Signature = Sig [Ordering] -- we'll park the relations in a list of orderings, always in the above sequence.
  deriving (Show, Read, Eq, Ord)

sigABCD, sigCDEF :: Chain -> Signature
sigABCD c = Sig ((flip orderBetween c) <$> [(A,B), (A,C), (A,D), (B,C), (B,D), (C,D)])
sigCDEF c = Sig ((flip orderBetween c) <$> [(C,D), (C,E), (C,F), (D,E), (D,F), (E,F)])

sigABCD2str :: Signature -> String -- suitable for allenName
sigABCD2str (Sig [ab, ac, ad, bc, bd, cd]) = concat [ '1' : sho ab
                                                    , '2' : sho bc
                                                    , '3' : sho cd
                                                    , '4' : "" ]
sigABCD2str otherwise = error "a signature should always have six edge elements!"

-- let's find all 6chains which match a given 6chain -- matching means the ABCD and CDEF elements are in the same relation
comps :: [Chain] -> Chain -> ((String,String),(String,String),[((String,String),Chain)])
comps cs c = let wanted = sigs c
                 matching = nub $ filter ((wanted ==) . sigs) cs
                 -- then for each matching chain,
                 -- we give a name to the ABCD   part by excluding the EF piece
                 -- we give a name to the   CDEF part by excluding the AB piece
                 -- we give a name to the AB  EF part by excluding the CD piece
                 -- we return the name and the overall chain
                 abcd  =        allenName . allenSquash . show $ exclude [E,F] c
                 cdef  =        allenName . allenSquash . show $ exclude [A,B] c
                 abefs = nub [ (allenName . allenSquash . show $ exclude [C,D] m, m) | m <- matching ]
             in (abcd, cdef, abefs)
  where
    sigs x = (sigABCD x, sigCDEF x)

showComps (abcd, cdef, abefs) = 
  unlines ((unwords [ "composition of", fst abcd, "with", fst cdef, "produces", intercalate ", " (nub $ fst . fst <$> abefs) ])
            : concat ((\((label,english),chain) -> ((label ++ ": ") ++) <$> lines (show chain ++ "\n" ++ drawLocations (locate chain))) <$> abefs))

countComps cs = length (nub $ (comps cs) <$> cs)

printComps cs = putStr $ intercalate "\n" $ showComps <$> (nub $ (comps cs) <$> cs)

allenSquash :: String -> String
allenSquash str
  | "123456" `allIn` nsquashed = nsquashed
  | "1234"   `allIn` nsquashed = nsquashed
  | "1256"   `allIn` nsquashed = replace   "56"   "34" nsquashed
  | "3456"   `allIn` nsquashed = replace "3456" "1234" nsquashed
  | otherwise                  = nsquashed
  where
    nsquashed = replace "ABCDEF" "123456" str
    replace t r str = [ maybe c (r !!) (elemIndex c t) | c <- str ]
    allIn s1 s2 = s1 `intersect` s2 == s1
                      
allenName "1<2=3<4" = ("m ","X meets Y")
allenName "1<2<3<4" = ("< ","X precedes Y")
allenName "1=3<2=4" = ("= ","X equals Y")
allenName "1=3<2<4" = ("s ","X starts Y")
allenName "1=3<4<2" = ("si","Y starts X")
allenName "1<3<2=4" = ("fi","Y finishes X")
allenName "1<3<2<4" = ("o ","X overlaps with Y")
allenName "1<3<4<2" = ("di","Y during X")
allenName "3<1<2=4" = ("f ","X finishes Y")
allenName "3<1<2<4" = ("d ","X during Y")
allenName "3<1=4<2" = ("mi","Y meets X")
allenName "3<1<4<2" = ("oi","Y overlaps with X")
allenName "3<4<1<2" = ("> ","Y precedes X")

allenName otherwise = ("? ","UNKNOWN")


-- pretty-printer code follows.
main = showLegal4s >> putStrLn "\n--------------- composition -- see Figure 4\n" >> printComps legalChain6s
showLegal4s = printlocs legalLocation4s
showLegal6s = printlocs legalLocation6s
printlocs xs = putStr $ (intercalate "\n" $ unlines <$> showLocs xs)
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

-- if A<B=D=C<F=E we reorder the B=D=C to B=C=D
chainSort :: Chain -> Chain
chainSort = s2c . c2s

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

