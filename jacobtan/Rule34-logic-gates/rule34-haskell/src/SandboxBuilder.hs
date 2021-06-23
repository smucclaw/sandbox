{-# LANGUAGE PackageImports #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE OverloadedStrings #-}

module SandboxBuilder where

import qualified "svg-builder-sandbox" AnyAll as AABuilder
                                                 ( Label (Pre, PrePost)
                                                 , Item (Leaf, Any, All)
                                                 , makeSvg
                                                 , renderItem )
import Data.Tree (Tree (Node))
import Rule34
       ( NLG
       , Label (MkLabel)
       , Inner (Compl, Any, Or, Union, UnionComma, All, Leaf)
       , Condition (MkCondition)
       , ConditionTree
       , MyRule (MyRule)
       , Predicate (Pred,Goto)
       , toEnglish )
import qualified Rule34 (rule34_1, rule34_1_Any_err)
import Data.Maybe
import Prettyprinter.Render.String (renderString)
import Prettyprinter
import Graphics.Svg
import System.IO
import qualified Data.Text.Lazy as T

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

drawItem :: Either String AABuilder.Item -> IO ()
drawItem (Left err) = hPutStr stderr . T.unpack . renderText . AABuilder.makeSvg $ (500, errorEl err)
drawItem (Right item) = putStr . T.unpack . renderText . AABuilder.makeSvg $ AABuilder.renderItem item

main :: IO ()
main = drawItem $ toAA Rule34.rule34_1
                   

mainErr :: IO ()
mainErr = drawItem $ toAA Rule34.rule34_1_Any_err

class (Show x) => AABuilder x where
  toAA :: x -> Either String AABuilder.Item

instance AABuilder MyRule where
  toAA (MyRule l defeasors p d condtree) = toAA condtree
  -- in future, add support for defeasors

instance AABuilder (ConditionTree Predicate) where
  -- l :: Label
  -- pre, post :: Maybe String
  -- All, Any, Or, Union, UnionComma, Compl, Leaf a :: Inner a
  toAA :: ConditionTree Predicate -> Either String AABuilder.Item

  -- All
  toAA (Node (MkCondition l (Just pre) All (Just post)) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.All
                             (AABuilder.PrePost
                               (ls l ++ pre ++ " all of the following")
                               post)
                             items)

  toAA (Node (MkCondition l (Just pre) All Nothing) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.All
                             (AABuilder.Pre
                               (ls l ++ pre ++ " all of the following"))
                             items)

  -- are these valid?
  toAA (Node (MkCondition l Nothing All _) children) = Left "The top-level 'All' type should have at least a pre."

  -- Any
  toAA (Node (MkCondition l (Just pre) Any (Just post)) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.Any
                             (AABuilder.PrePost
                               (ls l ++ pre ++ " any of the following")
                               post)
                             items)

  toAA (Node (MkCondition l (Just pre) Any Nothing) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.Any
                             (AABuilder.Pre
                               (ls l ++ pre ++ " any of the following"))
                             items)

  -- are these valid?
  toAA (Node (MkCondition l Nothing Any _) children) = Left "The top-level 'Any' type should have at least a pre."

  -- Or
  toAA (Node (MkCondition l (Just pre) Or (Just post)) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.Any
                             (AABuilder.PrePost
                               (ls l ++ pre ++ " any of the following")
                               post)
                             items)

  toAA (Node (MkCondition l (Just pre) Or Nothing) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.Any
                             (AABuilder.Pre
                               (ls l ++ pre ++ " any of the following"))
                             items)

  toAA (Node (MkCondition l Nothing Or (Just post)) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.Any
                             (AABuilder.PrePost
                               (ls l ++ " any of the following")
                               post)
                             items)

  toAA (Node (MkCondition l Nothing Or Nothing) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.Any
                             (AABuilder.Pre
                               (ls l ++ " any of the following"))
                             items)

  -- Union
  toAA (Node (MkCondition l (Just pre) Union (Just post)) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.Any
                             (AABuilder.PrePost
                               (ls l ++ pre ++ " any of the following")
                               post)
                             items)

  toAA (Node (MkCondition l (Just pre) Union Nothing) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.Any
                             (AABuilder.Pre
                               (ls l ++ pre ++ " any of the following"))
                             items)

  toAA (Node (MkCondition l Nothing Union (Just post)) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.Any
                             (AABuilder.PrePost
                               (ls l ++ " any of the following")
                               post)
                             items)

  toAA (Node (MkCondition l Nothing Union Nothing) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.Any
                             (AABuilder.Pre
                               (ls l ++ " any of the following"))
                             items)

  -- UnionComma
  toAA (Node (MkCondition l (Just pre) UnionComma (Just post)) children) =
      AABuilder.Any (AABuilder.PrePost
                      (ls l ++ pre ++ " any of the following")
                      post)
      <$> traverse toAA (filter relevant_aa children)

  toAA (Node (MkCondition l (Just pre) UnionComma Nothing) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.Any
                             (AABuilder.Pre
                               (ls l ++ pre ++ " any of the following"))
                             items)

  toAA (Node (MkCondition l Nothing UnionComma (Just post)) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.Any
                             (AABuilder.PrePost
                               (ls l ++ " any of the following")
                               post)
                             items)

  toAA (Node (MkCondition l Nothing UnionComma Nothing) children) =
    case traverse toAA (filter relevant_aa children) of
      Left err    -> Left err
      Right items -> Right (AABuilder.Any
                             (AABuilder.Pre
                               (ls l ++ " any of the following"))
                             items)

  -- Leaf
  toAA (Node (MkCondition l pre (Leaf b) post) []) = Right $ AABuilder.Leaf (ls l +++ ps pre <> toAAs b <> ps post)
  toAA (Node (MkCondition l pre (Leaf b) post) children) = Left ("leaf node " ++ show b ++ " should have no children " ++ show children)

  -- Compl
  toAA (Node (MkCondition l pre Compl post) children) = AABuilder.All (AABuilder.Pre (ls l ++ "....")) <$> traverse toAA (filter relevant_aa children)

toAAs :: Predicate -> String
toAAs (Pred pterm) = renderString $ layoutCompact $ toEnglish pterm
toAAs (Goto pnum)  = "See paragraph " ++ pnum

-- instance AABuilder Predicate where
--   toAA = AABuilder.Leaf . toAAs

(+++) x y
  | null x || null y = x ++ y
  | otherwise        = x ++ " " ++ y

ls :: Label -> String
ls (MkLabel (Just paraNum) predTerm pStyle) = "(" ++ paraNum ++ ")"
ls (MkLabel (Nothing) predTerm pStyle) = ""

ps :: Maybe String -> String
ps (Just x) = x
ps (Nothing) = ""

relevant_aa :: ConditionTree a -> Bool
relevant_aa (Node (MkCondition l pre Compl post) children) = True
relevant_aa _                                              = True
