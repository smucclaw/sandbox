{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Lib where

import qualified KW
import AbsL
-- base
import Control.Exception (IOException)
import qualified Control.Exception as Exception
import qualified Data.Foldable as Foldable
import qualified Data.Map as Map
import qualified Data.Tree as Tree

-- bytestring
import Data.ByteString.Lazy (ByteString)
import qualified Data.ByteString.Lazy as ByteString

import qualified Data.Csv as Cassava

-- text
-- text
import Data.Text as Text (Text, words, unwords, unpack, pack, null, dropWhile, take)
import qualified Data.Text.Encoding as Text

-- vector
import Data.Vector (Vector, (!), (!?), slice, toList)
import qualified Data.Vector as Vector
import Control.Monad
import Data.Functor ((<&>))
import Data.Maybe (fromMaybe)
import Data.Either (isRight, fromRight)

import Text.Megaparsec

type Stanza = Tree.Tree Text.Text

dummySing = ",,,,\n,EVERY,person,,\n,WHO,walks,// comment,\n,AND,runs,,\n,AND,eats,,\n,OR,drinks,light,beer\n,MUST,,,\n,->,sing,,\n"

parseCell :: Text -> Either Text (KW.Keyword Text)
parseCell "EVERY"  = Right KW.Every
parseCell "WHO"    = Right KW.Who
parseCell "WHICH"  = Right KW.Which
parseCell "AND"    = Right KW.And
parseCell "OR"     = Right KW.Or
parseCell "UNLESS" = Right KW.Unless
parseCell "MUST"   = Right KW.Must
parseCell "MAY"    = Right KW.May
parseCell "SHANT"  = Right KW.Shant
parseCell "ARROW"  = Right KW.Arrow
parseCell cell     = Right (KW.Other cell)

parseCSV instring = do
  let ddd = Cassava.decode Cassava.NoHeader instring :: Either String (Vector (Vector Text))
  vec <- case ddd of
    Left s -> error s
    Right vec -> pure vec

  mapM_ print vec
  let c = Cursored vec (0,0) Nothing
  pure $ search c (Text.words "EVERY MEANS") <&> goto c <&> getStanza

  -- then we convert the 2d stanzas into a linear stream whose tokens include location information.
  -- we could mark up the indentation into a { ... ; ... } structure the way bnfc does

someFunc :: IO ()
someFunc = do
  putStrLn "someFunc running"
  stanzas <- parseCSV dummySing
  forM_ stanzas (putStrLn . either unpack (Tree.drawTree . fmap unpack))

getStanza :: Cursored -> Either Text Stanza
getStanza c = Tree.Node "rule" <$> getStanzaLine c

getStanzaLine :: Cursored -> Either Text (Tree.Forest Text)
getStanzaLine c | lineIsEmpty c && lineIsEmpty (goD1 c) = pure []
getStanzaLine c =  do
  -- cursor is set to some cell within a stanza; return the stanza
  -- the other is to guarantee at least two blank lines above and below the stanza;
  let rl = readline
      str = head rl
      rhs = drop 1 rl
      line = Tree.Node str ((\x -> Tree.Node x []) <$> rhs)
  rest <- getStanzaLine $ goD1 c
  pure $ line : rest
  where
    readline = let row = vvt c ! (snd $ (cursor c))
               in filter (not . isCheckbox)
                  $ trim
                  $ takeWhile notComment
                  $ toList (trimT $ slice cx (length row - cx) row)
    notComment s = Text.take 2 (Text.dropWhile (==' ') s) /= "//"
    (cx, cy) = cursor c
  -- Left $ "getStanza couldn't find a stanza starting at location " <> pack (show (cursor c)) <> "\n: " <> showCursorLine c

lineIsEmpty :: Cursored -> Bool
lineIsEmpty  = maybe True (all Text.null) . currentLine

decomment :: Cursored -> Cursored
decomment c = c

isCheckbox x = x `elem` ["TRUE", "FALSE"]

skipCheckbox :: Cursored -> Cursored
skipCheckbox c = if isCheckbox (valueAt c)
                 then goR1 c
                 else c

getStanzaCurlies :: Cursored -> Cursored -> Either Text Stanza
getStanzaCurlies c _ = Left $ "getStanzaCurlies couldn't find a {}-delimited stanza starting at location " <> pack (show (cursor c))

data Direction = L | R | U | D deriving (Eq, Show)

data Bounds = Bounds Int  Int   Int Int

seekBlank :: Cursored
          -> Direction
          -> Cursored
-- i feel like we should be using `fix`
seekBlank c dir = c
--  let myactive = fromMaybe (cursor c) (active c)
--  in c

allblank :: VVT -> Bool
allblank = all (all (== ""))



trimT :: Vector Text -> Vector Text
trimT v = Vector.reverse (Vector.dropWhile (== "") (Vector.reverse v))

trim :: [Text] -> [Text]
trim v = reverse (Prelude.dropWhile (== "") (reverse v))

type VVT = Vector (Vector Text)

data Cursored = Cursored { vvt :: VVT
                         , cursor :: (Int, Int) -- x, y down from top left
                         , active :: Maybe (Int, Int, Int, Int)
                         }               -- left right top bottom
                deriving (Eq, Show)

showCursorLine :: Cursored -> Text
showCursorLine = maybe "no line" (Text.unwords . Vector.toList) . currentLine

currentLine :: Cursored -> Maybe (Vector Text)
currentLine c = vvt c !? cy
  where
    (cx, cy) = cursor c

valueAt :: Cursored -> Text
valueAt (Cursored vvt (x,y) _) = fromMaybe "" (vvt !? y >>= (!? x))

-- helper functions to navigate the strings
goto  :: Cursored -> (Int, Int) -> Cursored
goto (Cursored vvt cursor active) xy = Cursored vvt xy active

from = goto

go    :: Cursored -> (Int, Int) -> Cursored
go (Cursored vvt cursor a) xdyd = Cursored vvt (offset cursor xdyd) a

goL, goR, goU, goD   :: Cursored -> Int        -> Cursored
goL (Cursored vvt cursor a) xd = Cursored vvt (offset cursor (negate xd, 0)) a
goR (Cursored vvt cursor a) xd = Cursored vvt (offset cursor (       xd, 0)) a
goU (Cursored vvt cursor a) yd = Cursored vvt (offset cursor (0, negate yd)) a
goD (Cursored vvt cursor a) yd = Cursored vvt (offset cursor (0,        yd)) a

offset :: (Int, Int) -> (Int, Int) -> (Int, Int)
offset (x0, y0) (xd, yd) = (x0+xd, y0+yd)

getRange :: Cursored -> (Int, Int, Int, Int) -> VVT
getRange c (l, r, t, b) =
  slice l (r-l+1) <$>
  slice t (b-t+1)  $ vvt c

(←) = goL
(↑) = goU
(→) = goR
(↓) = goD

goL1, goU1, goR1, goD1 :: Cursored -> Cursored
goL1 = flip goL 1
goU1 = flip goU 1
goR1 = flip goR 1
goD1 = flip goD 1

-- usage: goWhile c ↑ (/= "") moves the cursor to the first blank line above the starting position
goWhile :: Cursored -> (Cursored -> Int -> Cursored) -> (Text -> Bool) -> Cursored
goWhile c dir f
  | f (valueAt c) = goWhile (dir c 1) dir f
  | otherwise = c

eolC :: Cursored -> Bool
eolC c =
  cy >= length (vvt c     ) ||
  cx >= length (vvt c ! cy)
  where
    (cx, cy) = cursor c

search :: Cursored -> [Text] -> [(Int, Int)]
search c wanted = [ (x, y)
                  | y <- [ 0 .. (length (vvt c    ) - 1) ]
                  , x <- [ 0 .. (length (vvt c ! y) - 1) ]
                  , vvt c ! y ! x `elem` wanted
                  ]

type Parser = Parsec Void Text

rewriteBools :: Parser Stanza
rewriteBools (Tree.Node root children) =
  -- EVERY person
  -- WHO walks
  -- AND runs
  -- AND eats
  -- OR drinks
  -- MUST
  -- -> sing
  Tree.Node root children
  where
    startKWs = Text.words "WHO WHICH IF UNLESS"
    bodyKWs  = Text.words "AND OR UNLESS"
    matchStart x = x `elem` startKWs
    matchBody  x = x `elem` bodyKWs
    
  
