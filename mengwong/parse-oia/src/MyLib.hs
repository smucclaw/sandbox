{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE LambdaCase #-}

module MyLib (parseOPM) where

import Text.HTML.TagSoup
import Text.Megaparsec

import Data.Text (Text)
import qualified Data.Text.Lazy as TL
import qualified Data.Text as T
import Data.List.Split (split, whenElt, keepDelimsL, dropInitBlank, dropInnerBlanks)
import Data.List.Extra (concatUnzip)
import Data.Char (isSpace)
import Data.Maybe (mapMaybe, catMaybes, fromMaybe)
import Data.Void (Void)

import Debug.Trace (trace, traceShow, traceM)
import Text.Pretty.Simple (pShow)
import Debug.Pretty.Simple (pTraceShow)

import Control.Monad (when, unless)


-- | basically Prolog.
-- 
-- See also https://hackage.haskell.org/package/prolog-0.3.2/docs/Language-Prolog.html
-- 
-- examples:
-- 
-- @
--     isVisible(moon, Time) :- isNight(Time), \+ isCloudy(Time).
-- @
--
-- P "isVisible" [Atom "moon", Var "Time"] :- All [P "isNight" [Var "Time"], Not (P "isCloudy" [Var "Time"])]
--

data Clause = Term :- Goal
            deriving (Show, Eq)

-- and/or tree BoolStruct, slight modification from Language.Prolog
-- but is well within the syntax and semantics of Prolog, because Prolog uses semicolons for disjunction.
data Goal = Leaf Term
          | All [Goal]
          | Any [Goal]
          deriving (Show, Eq)

lhs (t :- _) = t
rhs :: Clause -> Goal
rhs (_:- g) = g

type Program = [Clause]

data Term = P   Atom [Term]   -- ^ always atom(term, ...), with parens.
          | Var  VariableName -- ^ could be lowercase for an atom or uppercase-first for a variable
          | Wildcard
      --  | Cut Int
          deriving (Show, Eq)

-- | lowercase
type Atom = String

-- | if first letter uppercase then it's a variable, otherwise an atom.
data VariableName = VariableName Int String
  deriving (Show, Eq)
var :: String -> Term
var = Var . VariableName 0

-- | l "foo" ["bar"] => Leaf (P "foo" [Var "bar"])
l :: String -> [String] -> Goal
l atom args = Leaf $ p atom args

-- | p "foo" ["bar"] => P "foo" [Var "bar"]
p :: String -> [String] -> Term
p atom args =P atom (var <$> args)

-- convert spaces to underscores
mkAtom :: String -> String
mkAtom = map (\c -> if isSpace c then '_' else c)

-- | for testing
-- @
--     fake1   :- foo(Fake_1), bar(fake_2). % comma for conjunction
--     fake2() :- foo(Fake_1); bar(fake_2). % semicolon for disjunction
-- @

fakeClause1, fakeClause2 :: Clause
fakeClause1 = var "fake1"   :- All [ l "foo" ["Fake_1"]
                                   , l "bar" ["fake_2"]]

fakeClause2 = p " fake2" [] :- Any [ l "foo" ["Fake_1"]
                                   , l "bar" ["fake_2"]]

-- need to define Tag Text as a custom input stream type, maybe consider this later or see if https://hackage.haskell.org/package/tagsoup-megaparsec is usable.
type Parser = Parsec Void (Tag Text)

-- | top-level OPM parser returns a Program
parseOPM :: Text -> Either String Program
parseOPM input = 
    case parseTags input of
        [] -> Left "tagsoup failed to parse tags"
        tags -> Right $ fst $ parseLevel 0 $ getRelevantTags tags

-- | we know the input HTML format has a bunch of tags to ignore until we get to the first div class=WordSection1.
getRelevantTags :: [Tag Text] -> [Tag Text]
getRelevantTags = takeWhile (~/= TagClose div_) .
                  dropWhile (~/= TagOpen  div_ [("class","WordSection1")])


tShow :: Show a => a -> String
tShow = T.unpack . TL.toStrict . pShow


{- | given a list of tags, return a list of clauses and a list of goals, in a tuple.

The possible structures are as follows:

Case 1:
- OPM-conclusion: clause head
- - OPM-level1: predicate and
- - OPM-level1: predicate and
- - OPM-level1: predicate and
- - OPM-level1: predicate

output:

@([CH0 :- All [ P1, P2, P3, P4 ]], [])@

Case 2:
- OPM-conclusion:  clause head
- - OPM-level1: predicate
- - OPM-level1: predicate
- - OPM-level1: predicate or
- - OPM-level1: predicate

output:
@([CH0 :- Any [ P1, P2, P3, P4 ]], [])@

Case 3:
- OPM-conclusion: clause head
- - OPM-level1: clause head
- - - OPM-level2: predicate 1
- - - OPM-level2: predicate 2 and
- - - OPM-level2: predicate 3

output:
@
    ( [CH0 :- Leaf CH1,
       CH1 :- All [ P1, P2, P3 ]]
    , [])
@

Case 4:
- OPM-conclusion: clause head
- - OPM-level1: clause head
- - - OPM-level2: predicate 1
- - OPM-level1: and
- - - OPM-level2: predicate 2
- - - OPM-level2: predicate 3
- - - OPM-level2: predicate 4 and
- - - OPM-level2: predicate 5

output:
@
([CH0 :- All [ CH1, All [ P2, P3, P4, P5 ] ],
  CH1 :- Leaf P1
], [])
@

Case 5:
- OPM-conclusion: clause head
- - OPM-level1: all
- - - OPM-level2: predicate 1
- - - OPM-level2: predicate 2 and
- - - OPM-level2: predicate 3
- - OPM-level1: or
- - OPM-level1: all
- - - OPM-level2: predicate 4
- - - OPM-level2: predicate 5

output:
@
([CH0: Any [ All [ P1, P2, P3 ], All [ P4, P5 ] ]], [])
@

Case 6:
- OPM-level1: foo and
- OPM-level1: bar

output:
@
([], And [P1, P2])
@

Case 7:
- OPM-level1: all
- - OPM-level2: bar
- - OPM-level2: baz

output:
@
([], [All [bar, baz]])
@

Case 8:
- OPM-level1: bob is a potato

output:
@
([], [Leaf is_a_potato ["bob"]])
@

Case 9:
- OPM-level2: bob is a potato
- OPM-level2: joe is a potato

output:
@
([], [Leaf is_a_potato ["bob"], Leaf is_a_potato ["joe"]])
@

Parsing Error 1:
- OPM-conclusion: clause head
- - OPM-level1: predicate and
- - OPM-level1: predicate or
- - OPM-level1: predicate and

* to do this, let's write a recursive function that can handle any level of nesting.

if we see something at a deeper level, we recurse.
if we see something at the same level, we keep going.
if we see something at a higher level, we error, because the upper levels should have dealt with it.

At this point we have grouped the levels; now we need to rearrange them to take into account the
weird nested structure enabled by "all xxx or all yyy"

| parseLevels n expects a list of tags at level n or higher, and returns a list of clauses

in the simple case, we are expecting
<p class="OPM-level1"> foo </p>

in the complex case, we are expecting
<p class="OPM-level1"> foo </p>
  <p class="OPM-level2"> foo1 </p>
  <p class="OPM-level2"> foo2 and foo3 </p>
  <p class="OPM-level2"> foo4 </p>
which we need to turn into a conjunctive list

we return two things. If the current level contains only a leaf, we return it as a goal, and no clauses. The parent will add it to the list of its goals.

If the current level contains a clause, we return it in the clause part. This is meant to support the "any" and "all" cases, and also the case where
level1 element is a clause head, and its level2 children are goals. We postprocess the children to assign All/Any as appropriate based on the last word
of the level2 children.


-}

parseLevel :: Int -> [Tag Text] -> ([Clause], [Goal])
parseLevel n tags = do
    traceM ("\n****** parseLevel " ++ show n ++ ": " ++ show tags)
    let startNoise = takeWhile (not . isLevel n) tags
        signal     = dropWhile (not . isLevel n) tags
    unless (null startNoise) $
        traceM ("\n****** parseLevel " ++ show n ++ ": [ERROR] unexpected startNoise: " ++ show startNoise)
    
    let currentLevelChunks :: [[Tag Text]]
        currentLevelChunks = split (keepDelimsL . dropInitBlank . dropInnerBlanks $ whenElt (isLevel n)) signal
    concatUnzip $ map eachChunk currentLevelChunks

    where
      eachChunk :: [Tag Text] -> ([Clause], [Goal])
      eachChunk tts =
        let _ = trace ("\n****** parseLevel " ++ show n ++ ": this should be our clause head:" ++ show (innerText $ takeWhile (~/= TagClose p_) tts)) ()
            clauseHead = p (T.unpack $ (\t -> fromMaybe t (T.stripSuffix " if" t)) $ myInnerText $ takeWhile (~/= TagClose p_) tts) []
            children = parseLevel (n+1) $ dropWhile (~/= TagClose p_) tts
            endsInAnd = any (T.isSuffixOf " and" . leaf2text) . snd
            endsInOr  = any (T.isSuffixOf " or"  . leaf2text) . snd
            childrenJoined = 
              if | endsInAnd children -> All $ map (stripSuffix " and") (snd children)
                 | endsInOr children  -> Any $ map (stripSuffix " or" ) (snd children)
                 | otherwise          -> trace ("\n****** parseLevel " ++ show n ++ ": [ERROR] unexpected children without guidance for and/or, defaulting to All: " ++ show children) $
                                         All $ snd children
        in if | P "all" [] <- clauseHead -> (fst children, [All (snd children)])
              | P "any" [] <- clauseHead -> (fst children, [Any (snd children)])
              | P "all" _  <- clauseHead -> error $ "parseLevel " ++ show n ++ ": unexpected all arguments: " ++ show clauseHead
              | P "any" _  <- clauseHead -> error $ "parseLevel " ++ show n ++ ": unexpected any arguments: " ++ show clauseHead
              | null children            -> ([], [Leaf clauseHead])
              | otherwise                -> ([clauseHead :- childrenJoined], [Leaf clauseHead])

      leaf2text :: Goal -> Text
      leaf2text (Leaf (P atom _terms)) = T.pack atom
      leaf2text (Leaf (Var (VariableName _n str))) = T.pack str
      leaf2text (Leaf Wildcard) = T.empty
      leaf2text x = error $ "leaf2text: not a leaf: " ++ show x

      stripSuffix :: Text -> Goal -> Goal
      stripSuffix suffix = \case
        Leaf term -> Leaf $ mapTerm (\case
            P atom _ -> T.stripSuffix suffix (T.pack atom)
            _        -> Nothing) term
        goal -> goal

      mapTerm :: (Term -> Maybe Text) -> Term -> Term
      mapTerm f term = case term of
          P atom args -> maybe term (\t -> P (T.unpack t) args) (f term)
          _ -> term

      termArgs :: Term -> [Term]
      termArgs (P _ args) = args
      termArgs _ = []

      atomOf :: Term -> String
      atomOf (P atom _) = atom
      atomOf _ = error "atomOf: not a predicate"

myInnerText :: [Tag Text] -> Text
myInnerText = T.replace "\r" " "
            . T.replace "\n" " "
            . T.replace "\r\n" " "
            . T.strip . innerText

isLevel :: Int -> Tag Text -> Bool
isLevel n tt = case n of
   0 -> go "OPM-conclusion"
   _ -> go ("OPM-level" <> T.pack (show n))
   where
     go level
       | tt == TagOpen "p" [("class",level)] =
         trace ("\nisLevel " ++ show n ++ ": true on " ++ show tt) True
       | otherwise =
         trace ("\nisLevel " ++ show n ++ ": false on " ++ show tt) False

isNonEmptyText :: Tag Text -> Bool
isNonEmptyText (TagText t)
  | not $ T.all (\c -> isSpace c || c == '\r' || c == '\n') t = True
  | otherwise = trace ("\nisNonEmptyText: failing on TagText " ++ show t) False
isNonEmptyText _ = False


div_ :: Text
div_ = "div"
p_  :: Text
p_   = "p"

