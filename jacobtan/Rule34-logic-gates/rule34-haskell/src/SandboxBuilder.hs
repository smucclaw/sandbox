{-# LANGUAGE PackageImports #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE OverloadedStrings #-}

module SandboxBuilder where

import qualified "svg-builder-sandbox" AnyAll as AA
                                                 ( Label (Pre, PrePost)
                                                 , Item (Leaf, Any, All)
                                                 , makeSvg
                                                 , renderItem )
import Data.Tree (Tree (Node))
import Rule34
       ( Label (MkLabel)
       , Inner (Compl, Any, Or, Union, UnionComma, All, Leaf)
       , Condition (MkCondition)
       , ConditionTree
       , MyRule (MyRule)
       , Predicate (Pred, Goto)
       , toEnglish
       , rule34_1
       , rule34_1_Any_err )
import Prettyprinter.Render.String (renderString)
import Prettyprinter
import Graphics.Svg
import System.IO
import qualified Data.Text.Lazy as T
import qualified Data.List as L
import qualified Data.Maybe as M

errorEl :: String -> Element
errorEl msg =
     image_ [ XlinkHref_ <<- "https://media.giphy.com/media/wrCicfORd8f7AFkrCs/giphy.gif"
            , Height_ <<- "200"
            , Width_ <<- "200"
            , X_ <<- "200"
            , Y_ <<- "100" ]
  <> text_ [ X_ <<- "200", Y_ <<- "300", Fill_ <<- "gray", Font_family_ <<- "sans-serif" ]
       (  tspan_ [ X_ <<- "200", Dy_ <<- "20", Font_weight_ <<- "bold" ] "Looks like something went wrong!"
       <> tspan_ [ X_ <<- "200", Dy_ <<- "20", Font_weight_ <<- "lighter" ] (toElement msg))

drawItem :: Either String AA.Item -> IO ()
drawItem (Left err) = hPutStr stderr . T.unpack . renderText . AA.makeSvg $ (500, errorEl err)
drawItem (Right item) = putStr . T.unpack . renderText . AA.makeSvg $ AA.renderItem item

main :: IO ()
main = drawItem $ toAA rule34_1
                   
-- main :: IO ()
-- main = drawItem $ toAA rule34_1_Any_err

class (Show x) => AA x where
  toAA :: x -> Either String AA.Item

instance AA MyRule where
  toAA (MyRule _ _ _ _ condtree) = toAA condtree
  -- MyRule l defeasors p d condtree
  -- in future, add support for defeasors

instance AA (ConditionTree Predicate) where
  -- l :: Label
  -- pre, post :: Maybe String
  -- All, Any, Or, Union, UnionComma, Compl, Leaf a :: Inner a
  toAA :: ConditionTree Predicate -> Either String AA.Item

  -- All
  toAA (Node (MkCondition _ Nothing All _) _) =
    Left "The top-level 'All' type should have at least a pre."

  -- a ~ ConditionTree Predicate
  -- traverse :: (a -> Either String Item) -> [a] -> Either String [Item]
  toAA (Node (MkCondition l (Just pre) All post) children) =
    build . terminate . glom <$> traverse toAA children
    where
      terminate = termItems "."
      glom = glomItems ";" Nothing
      preStr = unwords' [ls l, pre, "all of the following"]
      build = AA.All
            $ M.maybe (AA.Pre preStr) (AA.PrePost preStr) post

  -- Any
  toAA (Node (MkCondition _ Nothing Any _) _) =
    Left "The top-level 'Any' type should have at least a pre."

  toAA (Node (MkCondition l (Just pre) Any post) children) =
    build . terminate . glom <$> traverse toAA children
    where
      terminate = termItems "."
      glom = glomItems ";" Nothing
      preStr = unwords' [ls l, pre, "any of the following"]
      build = AA.Any
            $ M.maybe (AA.Pre preStr) (AA.PrePost preStr) post

  -- Or
  toAA (Node (MkCondition l pre Or post) children) =
    build . glom <$> traverse toAA children
    where
      glom = glomItems ";" (Just "or")
      preStr = unwords' [ls l, M.fromMaybe "" pre, "any of the following"]
      build = AA.Any
            $ M.maybe (AA.Pre preStr) (AA.PrePost preStr) post

  -- Union
  toAA (Node (MkCondition l pre Union post) children) =
    build . glom <$> traverse toAA children
    where
      glom = glomItems ";" (Just "and")
      preStr = unwords' [ls l, M.fromMaybe "" pre]
      build = AA.Any
            $ M.maybe (AA.Pre preStr) (AA.PrePost preStr) post

  -- UnionComma
  toAA (Node (MkCondition l pre UnionComma post) children) =
    build . glom <$> traverse toAA children
    where
      glom = glomItems "," (Just "and")
      preStr = unwords' [ls l, M.fromMaybe "" pre]
      build = AA.Any
            $ M.maybe (AA.Pre preStr) (AA.PrePost preStr) post

  -- Leaf
  toAA (Node (MkCondition l pre (Leaf b) post) []) =
    Right (AA.Leaf (unwords' [ ls l
                             , M.fromMaybe "" pre
                             , toAAs b
                             , M.fromMaybe "" post ]))
  toAA (Node (MkCondition _ _ (Leaf b) _) children) =
    Left ("leaf node " ++ show b ++ " should have no children " ++ show children)

  -- Compl
  toAA (Node (MkCondition l _ Compl _) children) =
    build . glom <$> traverse toAA children
    where
      glom = glomItems "" Nothing
      build = AA.All (AA.Pre (ls l ++ "...."))

toAAs :: Predicate -> String
toAAs (Pred pterm) = renderString $ layoutCompact $ toEnglish pterm
toAAs (Goto pnum)  = "See paragraph " ++ pnum

-- instance AA Predicate where
--   toAA = AA.Leaf . toAAs

-- (+++) :: String -> String -> String
-- (+++) x y
--   | null x || null y = x ++ y
--   | otherwise        = x ++ " " ++ y

unwords' :: [String] -> String
unwords' = unwords . filter (/= "")

ls :: Label -> String
ls (MkLabel (Just paraNum) _ _) = "(" ++ paraNum ++ ")"
ls (MkLabel Nothing _ _) = ""

-- ps :: Maybe String -> String
-- ps (Just x) = x
-- ps (Nothing) = ""

-- relevant_aa :: ConditionTree a -> Bool
-- relevant_aa (Node (MkCondition l pre Compl post) children) = True
-- relevant_aa _                                              = True


-- adds conjunctions
type Sep = String
type SWord = String

glomItems :: Sep -> Maybe SWord -> [AA.Item] -> [AA.Item]
glomItems _ _ []                 = []
glomItems _ _ [item]             = [item]
glomItems sepr Nothing [x1, x2]  = [glomItem (Just sepr) Nothing x1, x2]
glomItems _ (Just word) [x1, x2] = [glomItem Nothing (Just word) x1, x2]
glomItems sepr mword xs =
  let ys = map (glomItem (Just sepr) Nothing) (L.init xs)
  in L.init ys ++ [glomItem Nothing mword (L.last ys)] ++ [L.last xs]

-- determines placement of separators
glomItem :: Maybe Sep -> Maybe SWord -> AA.Item -> AA.Item
glomItem msep mword item =
  case item of
    -- e.g. (Leaf "hello;") , (Leaf "hello or")
    AA.Leaf l -> AA.Leaf (l ++ M.fromMaybe "" msep ++ M.maybe "" (" " ++) mword)

    AA.Any label items -> go AA.Any label items
    AA.All label items -> go AA.All label items

    where
      -- e.g. (PrePost "before" "after;") , (PrePost "before" "after or")
      go aa (AA.PrePost pre post) children =
        aa
          (AA.PrePost pre (post ++ (M.fromMaybe "" msep ++ M.maybe "" (" " ++) mword)))
          children

      -- when only pre is given, sep/word is glommed to last child
      go aa pre children =
        aa
          pre
          (L.init children ++ [glomItem msep mword (L.last children)])


-- adds terminator
type Ter = String

termItems :: Ter -> [AA.Item] -> [AA.Item]
termItems _ []       = []
termItems ter [item] = [termItem ter item]
termItems ter xs     = L.init xs ++ [termItem ter (L.last xs)]

termItem :: Ter -> AA.Item -> AA.Item
termItem ter item =
  case item of
    AA.Leaf l          -> AA.Leaf (l ++ ter)
    AA.Any label items -> go AA.Any label items
    AA.All label items -> go AA.All label items
    where
      go aa (AA.PrePost pre post) children =
        aa
          (AA.PrePost pre (post ++ ter))
          children
      go aa pre children =
        aa
          pre
          (L.init children ++ [termItem ter (L.last children)])
