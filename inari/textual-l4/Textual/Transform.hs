-- File generated by the BNF Converter (bnfc 2.9.5).

-- Templates for pattern matching on abstract syntax

{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- module Textual.Transform where
module Textual.Transform where

import Prelude (($),(<$>), (.), Either(..), String, (++), Show, show, Bool(..), Maybe(..))
import qualified Textual.Abs as TL4
import LS.Rule
import LS.Types
import AnyAll (BoolStruct(..), Label(..))
import Data.Text qualified as Text


transText :: TL4.Text -> Text.Text
transText (TL4.Text string) = Text.pack string


transRule :: TL4.Rule -> Rule
transRule x = case x of
  TL4.RegSimple text deont action ->
    defaultReg {
      subj = mkLeafPT (transText text)
    , deontic = transDeontic deont
    , action = mkLeafPT $ bsr2text $ transBoolStructR action
    }
  TL4.RegWho text who deontic action ->
    let simple = transRule $ TL4.RegSimple text deontic action
    in simple {who = Just $ transWho who }
  TL4.RegWhoInline text who hlike deontic action ->
    let simple = transRule $ TL4.RegWho text who deontic action
    in simple {wwhere = [transInlineHornlike who hlike]}
  TL4.Hornlike text bsr ->
    defaultHorn {
      clauses = [
        HC (bsr2rp text bsr) Nothing
      ]
    }

bsr2rp :: TL4.Text -> TL4.BoolStructR -> RelationalPredicate
bsr2rp text bsr = RPBoolStructR [MTT $ transText text] RPis (transBoolStructR bsr)

bsr2tl4text :: TL4.BoolStructR -> TL4.Text
bsr2tl4text = TL4.Text . Text.unpack . bsr2text . transBoolStructR

transDeontic :: TL4.Deontic -> Deontic
transDeontic x = case x of
  TL4.Deontic_MUST -> DMust
  TL4.Deontic_MAY -> DMay
  TL4.Deontic_SHANT -> DShant

transWho :: TL4.Who -> BoolStructR
transWho x = case x of
  TL4.WhoSimple bsr -> transBoolStructR bsr

transInlineHornlike :: TL4.Who -> TL4.InlineHornlike -> Rule
transInlineHornlike (TL4.WhoSimple whoBSR) (TL4.MeansInline meansBSR) =
  transRule $ TL4.Hornlike (bsr2tl4text whoBSR) meansBSR

transRelationalPredicate :: TL4.RelationalPredicate -> RelationalPredicate
transRelationalPredicate x = case x of
  TL4.RPMT mtes
    -> RPMT (transMTExpr <$> mtes)
  TL4.RPBoolStructR xs rprel (TL4.Leaf (TL4.RPMT ys))
    -> RPConstraint (transMTExpr <$> xs) (transRPRel rprel) (transMTExpr <$> ys)
  TL4.RPBoolStructR mtes rprel bsr
    -> RPBoolStructR (transMTExpr <$> mtes) (transRPRel rprel) (transBoolStructR bsr)


transMTExpr :: TL4.MTExpr -> MTExpr
transMTExpr x = case x of
  TL4.MTT text -> MTT $ transText text
  TL4.MTI integer -> MTI integer
  TL4.MTF double -> MTF double
  TL4.MTB bool -> MTB $ transBool bool

transBool :: TL4.Bool -> Bool
transBool x = case x of
  TL4.Bool_True -> True
  TL4.Bool_False -> False

transBoolStructR :: TL4.BoolStructR -> BoolStructR
transBoolStructR x = case x of
  TL4.Any bsrs
    -> Any Nothing (transBoolStructR <$> bsrs)
  TL4.AnyPre text bsrs
    -> Any (Just $ Pre $ transText text) (transBoolStructR <$> bsrs)
  TL4.AnyPrePost pr bsrs pst
    -> Any (Just $ PrePost (transText pr) (transText pst)) (transBoolStructR <$> bsrs)
  TL4.All bsrs
    -> Any Nothing (transBoolStructR <$> bsrs)
  TL4.Not bsr -> Not $ transBoolStructR bsr
  TL4.Leaf rp -> Leaf $ transRelationalPredicate rp

transRPRel :: TL4.RPRel -> RPRel
transRPRel x = case x of
  TL4.RPis -> RPis
  TL4.RPhas -> RPhas
  TL4.RPeq -> RPeq
  TL4.RPlt -> RPlt
  TL4.RPlte -> RPlte
  TL4.RPgt -> RPgt
  TL4.RPgte -> RPgte
  TL4.RPelem -> RPelem
  TL4.RPnotElem -> RPnotElem
  TL4.RPnot -> RPnot
  TL4.RPand -> RPand
  TL4.RPor -> RPor
  TL4.RPsum -> RPsum
  TL4.RPproduct -> RPproduct
  TL4.RPminus -> RPminus
  TL4.RPdivide -> RPdivide
  TL4.RPmodulo -> RPmodulo
  TL4.RPsubjectTo -> RPsubjectTo
  TL4.RPmin -> RPmin
  TL4.RPmax -> RPmax
  TL4.RPmap -> RPmap
  TL4.RPTC tc -> RPTC $ transTComparison tc

transTComparison :: TL4.TComparison -> TComparison
transTComparison x = case x of
  TL4.TBefore -> TBefore
  TL4.TAfter -> TAfter
  TL4.TBy -> TBy
  TL4.TOn -> TOn
  TL4.TVague -> TVague