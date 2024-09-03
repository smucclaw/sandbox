{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE LambdaCase #-}

module MyLib where

import Text.HTML.TagSoup
    ( Tag(TagClose, TagOpen), parseTags, (~/=), innerText, renderTags )

import Data.Text (Text)
import qualified Data.Text.Lazy as TL
import qualified Data.Text as T
import Data.List.Split (split, whenElt, keepDelimsL, dropInitBlank, dropInnerBlanks)
import Data.List.Extra (concatUnzip)
import Data.Char (isSpace)
import Data.Maybe (mapMaybe, catMaybes, fromMaybe)
import Data.Void (Void)
import Data.Either (fromRight)


import Debug.Trace (trace, traceShow, traceM)
import Text.Pretty.Simple (pShow)
import Debug.Pretty.Simple (pTraceShow)

import Control.Monad (when, unless)
import Control.Monad.Except

do_debug :: Bool
do_debug = False

debugTrace :: String -> a -> a
debugTrace msg x = if do_debug then trace msg x else x

debugTraceM :: Monad m => String -> m ()
debugTraceM msg = when do_debug (traceM msg)

-- | basically Prolog.
-- 
-- See also https://hackage.haskell.org/package/prolog-0.3.2/docs/Language-Prolog.html
-- And https://documentation.custhelp.com/euf/assets/devdocs/cloud19b/PolicyAutomation/en/Default.htm#Guides/Policy_Modeling_User_Guide/Work_with_rules/Rule_types.htm
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

-- | top-level OPM parser returns a Program
parseOPM :: Text -> Either String Program
parseOPM input = 
    case parseTags input of
        [] -> Left "tagsoup failed to parse tags"
        tags -> do
          (cs, gs) <-parseLevel 0 $ getRelevantTags tags
          if  | null gs  -> Right cs
              | length gs == 1 &&
                or [ g == Leaf thead -- the returned goal is the head of a top-level clause
                   | g <- gs
                   , (thead :- _) <- cs ]   -> Right cs
              | otherwise -> Left $ "parseOPM: [ERROR] parseLevel 0 returned unexpected top-level goals:\n" ++ show gs ++ "\n\npredicates: " ++ show cs

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
- OPM-level1: and
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

[TODO] adjust the number of leading asterisks to match the parseLevel n depth

-}

parseLevel :: Int -> [Tag Text] -> Either String ([Clause], [Goal])
parseLevel n tags = do
    debugTraceM ("\n****** parseLevel input: " ++ show n ++ ": tags: " ++ show tags)
    let startNoise = takeWhile (not . isLevel n) tags
        signal     = dropWhile (not . isLevel n) tags
    unless (null startNoise) $
        debugTraceM ("\n****** parseLevel " ++ show n ++ ": [ERROR] ignoring startNoise: " ++ show startNoise)
    
    let currentLevelChunks :: [[Tag Text]]
        currentLevelChunks = split (keepDelimsL . dropInitBlank . dropInnerBlanks $ whenElt (isLevel n)) $
                             debugTrace ("\n****** parseLevel " ++ show n ++ ": signal: " ++ T.unpack (renderTags signal))
                             signal

    debugTraceM ("\n****** parseLevel " ++ show n ++ " level chunks:\n" ++ T.unpack( T.unlines [ "- " <> -- (myInnerText $ takeWhile (~/= TagClose p_) levelChunk)
                                                                                            renderTags levelChunk
                                                                                            | levelChunk <- currentLevelChunks]))

    concatUnzip <$> mapM eachChunk (zip [1..] currentLevelChunks)

    where
      eachChunk :: (Int, [Tag Text]) -> Either String ([Clause], [Goal])
      eachChunk (chunkN, tts) = do
        children <- parseLevel (n+1) $ dropWhile (not . isLevel (n+1)) tts
        let clauseHead = p (T.unpack $ (\t -> fromMaybe t (T.stripSuffix " if" t)) $ myInnerText $ takeWhile (~/= TagClose p_) tts) []
            endsInAnd = any (T.isSuffixOf " and") . mapMaybe goal2text . snd
            endsInOr  = any (T.isSuffixOf " or")  . mapMaybe goal2text . snd
            childrenJoined :: Either [Goal] Goal
            childrenJoined = 
              if | endsInAnd children -> debugTrace ("parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": endsInAnd") $ pure . All $ map (stripSuffix " and") (snd children)
                 | endsInOr children  -> debugTrace ("parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": endsInOr")  $ pure . Any $ map (stripSuffix " or" ) (snd children)
                 | (_, [All gs])      <- children -> debugTrace ("parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": children destructured to All") $ pure (All gs)
                 | (_, [Any gs])      <- children -> debugTrace ("parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": children destructured to Any") $ pure (Any gs)
                 | otherwise          -> debugTrace ("\n****** parseLevel " ++ show n ++ "/" ++ show chunkN ++
                                                     ": [WARNING] children lack and/or guidance, will defer to an upper combinator:\n" ++
                                                     TL.unpack (pShow (snd children))) >>
                                         throwError $ snd children
        toreturn <- do
          debugTraceM ("\n****** parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": children: " ++ show children)
          debugTraceM ("\n****** parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": clauseHead: " ++ show clauseHead)
          if  | P "both"   [] <- clauseHead -> debugTraceM ("parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": P \"both\" []")   >>  pure (fst children, [allify childrenJoined])
              | P "all"    [] <- clauseHead -> debugTraceM ("parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": P \"all\" []")    >>  pure (fst children, [allify childrenJoined])
              | P "either" [] <- clauseHead -> debugTraceM ("parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": P \"either\" []") >>  pure (fst children, [anyify childrenJoined])
              | P "any"    [] <- clauseHead -> debugTraceM ("parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": P \"any\" []")    >>  pure (fst children, [anyify childrenJoined])
              | P "both"   _  <- clauseHead -> throwError $ "parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": unexpected both arguments: "   ++ show clauseHead
              | P "all"    _  <- clauseHead -> throwError $ "parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": unexpected all arguments: "    ++ show clauseHead
              | P "either" _  <- clauseHead -> throwError $ "parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": unexpected either arguments: " ++ show clauseHead
              | P "any"    _  <- clauseHead -> throwError $ "parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": unexpected any arguments: "    ++ show clauseHead
              | null (fst children) &&
                null (snd children)    -> debugTraceM ("parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": [WARNING] empty children, returning clause head as goal: " ++ show clauseHead)
                                          >> pure ([], [Leaf clauseHead])
              | otherwise     -> case childrenJoined of
                                   Left x  -> throwError $ "parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": [ERROR] children without any obvious and/or any/all combination.\n" ++ show x
                                   Right x -> pure ( [clauseHead :- x], [Leaf clauseHead])

        debugTraceM ("\n****** parseLevel " ++ show n ++ "/" ++ show chunkN ++ ": output:\n#+BEGIN_SRC haskell\n" ++ TL.unpack (pShow toreturn) ++ "\n#+END_SRC")
        return toreturn

      allify :: Either [Goal] Goal -> Goal
      allify = \case
        Right (Any xs) -> error $ "parseLevel " ++ show n ++ ": [ERROR] expected an Any child, got All: " ++ show xs
        Right  x       -> x
        Left goals     -> -- debugTrace ("parseLevel " ++ show n ++ ": resolved to All") $
                          All goals

      anyify :: Either [Goal] Goal -> Goal
      anyify = \case
        Right (All xs) -> error $ "parseLevel " ++ show n ++ ": [ERROR] expected an Any group, got All: " ++ show xs
        Right  x       -> x
        Left goals     -> -- debugTrace ("parseLevel " ++ show n ++ ": resolved to Any") $
                          Any goals


      goal2text :: Goal -> Maybe Text
      goal2text (Leaf (P atom _terms))             = return $ T.strip $ T.pack atom
      goal2text (Leaf (Var (VariableName _n str))) = return $ T.strip $ T.pack str
      goal2text (Leaf Wildcard)                    = return T.empty
      goal2text x = -- debugTrace ("goal2text: not a leaf: " ++ show x)
                    Nothing

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
myInnerText = replaceMultipleWhitespace . T.strip . innerText
  where
    replaceMultipleWhitespace = T.unwords . T.words

isLevel :: Int -> Tag Text -> Bool
isLevel n tt = case n of
   0 -> go "OPM-conclusion"
   _ -> go ("OPM-level" <> T.pack (show n))
   where
     go level
       | tt == TagOpen "p" [("class",level)] =
         -- debugTrace ("\nisLevel " ++ show n ++ ": true on " ++ show tt)
          True
       | otherwise =
         -- debugTrace ("\nisLevel " ++ show n ++ ": false on " ++ show tt)
          False

div_ :: Text
div_ = "div"
p_  :: Text
p_   = "p"

