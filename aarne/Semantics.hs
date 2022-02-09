{-# OPTIONS_GHC -fglasgow-exts #-}
{-# LANGUAGE GADTs #-}

module Semantics where

import Law
import Spreadsheet

import PGF (Expr)

import Data.Char (toUpper)
import Data.Maybe (isJust)

-- the logic

type Modality = String
type Atom = String

data Formula =
    Modal Modality Formula
  | Atomic Atom
  | Conjunction [Formula]
  | Disjunction [Formula]
  | Implication Formula Formula
  | Negation Formula
  | Application Formula Formula  -- the f of x
  | Predication Formula Formula
  | Action Formula Formula
  | Modification Formula Formula   -- A which is B
  | Relation Formula Formula
  | Qualification String Formula ---
  | Quantification String Formula ---
  | Sequence [Formula] --- just a sequence one on top of another
  | Means Formula Formula -- definition
   deriving Show


-- from logic to spreadsheet (two-dimensional "box")

formula2box :: Formula -> Box
formula2box formula = case formula of
  Modal m f -> addHeader m (formula2box f)
  Atomic a  -> atomBox a
  Conjunction fs -> andBox (map formula2box fs)
  Disjunction fs -> orBox (map formula2box fs)
  Implication f g -> ifBox [formula2box f] [formula2box g]
  Negation f -> notBox (formula2box f)
  Application f x -> ofBox [formula2box f] [formula2box x]
  Predication x f -> nodoubleLeftsideBox "SUBJECT" [formula2box x] "PREDICATE" [formula2box f]
  Action f x -> nodoubleLeftsideBox "ACTING" [formula2box f] "ON" [formula2box x]
  Modification a p -> nodoubleLeftsideBox "ENTITY" [formula2box a] "WITH PROPERTIES" [formula2box p]
  Relation f x -> nodoubleLeftsideBox "HAVING RELATION" [formula2box f] "TO" [formula2box x]
  Qualification s f -> leftsideBox s [formula2box f]
  Quantification s f -> leftsideBox s [formula2box f]
  Sequence fs -> seqBox (map formula2box fs) ----
  Means f g -> meansBox (formula2box f) (formula2box g)


-- interpretation of Law in the logic
-- assuming a linearization from Tree to atoms or modalities
-- the interpretation takes a list of lines

data Env = Env {
  lin :: Expr -> String -- for the rendering of unanalysed parts
  }

-- to collect lines that belong together - under a common heading
paragraphs :: [GLabLine] -> [[GLabLine]]
paragraphs = reverse . collect [] where
  collect ps ls = case ls of
    lline:llines -> case lineOfLabLine lline of
      Nothing -> collect ([lline] : ps) llines
      Just line -> case lineStartsBlock line of
        False -> collect ([lline] : ps) llines
        _ -> let (llines1, llines2) = getPara llines
             in collect ((lline:llines1) : ps) llines2
    _ -> ps
  getPara = inBlock []
  inBlock block llines = case llines of
    lline:llines2 -> case lineOfLabLine lline of
      Just line | lineIsInBlock line -> inBlock (block ++ [lline]) llines2
      Just line | lineStartsBlock line -> (block, llines) ---- no blocks in block
      Just line -> inBlock (block ++ [lline]) llines2
      _ -> (block, llines)
    _ -> (block, [])

lineOfLabLine :: GLabLine -> Maybe GLine
lineOfLabLine lline = case lline of
  GLabLine_Item_Line _ line -> Just line
  GLabLine_Item__Line _ line -> Just line
  GLabLine_Item__Item_Line _ _ line -> Just line
  GLabLine_Line line -> Just line
  _ -> Nothing

lineStartsBlock :: GLine -> Bool
lineStartsBlock line = case line of
  GLine_S_cont _ -> True
  GLine_S_if_ _ -> True
  GLine_S_if_NP_ _ _ -> True
  GLine_an_CN_is_not__PP__to_be_regarded_as_NP_of_ _ _ _ -> True
  GLine_where_S_ _ -> True
  GLine_QCN__PP__means_ _ _ -> True
  GLine_PP__unless_S_ _ _ -> True
  GLine_where_an_CN_ _ -> True
  _ -> False

lineIsInBlock :: GLine -> Bool
lineIsInBlock line = isJust $ conjOfLine line

conjOfLine :: GLine -> Maybe GConj
conjOfLine line = case line of
  GLine_NP__Conj _ conj -> Just conj
  GLine_S__Conj _ conj -> Just conj
  GLine_VP__Conj _ conj -> Just conj
----  GLine_VP_c
  GLine_if_S__Conj _ conj -> Just conj
  GLine_if_S_Conj _ conj -> Just conj
  _ -> Nothing

labOfLabLine :: Env -> GLabLine -> Formula -> Formula
labOfLabLine env lline f = case lline of
  GLabLine_Item_Line item _ -> Modal (iItem env item) f
  GLabLine_Item__Line item _ -> Modal (iItem env item) f
  GLabLine_Item__Item_Line item item2 _ -> Modal (iItem env item ++ "." ++ iItem env item2) f
  _ -> f

conjOfLabLines :: Env -> [GLabLine] -> [Formula] -> Formula
conjOfLabLines env llines fs =
  case [c | ll <- llines, Just l <- [lineOfLabLine ll], Just c <- [conjOfLine l]] of
    conj:_ -> iConj env conj fs  ---- if many different conjs?
    _ -> Sequence fs


iLabLines :: Env -> [GLabLine] -> Formula
iLabLines env ls = case ls of
  t : ts -> case lineOfLabLine t of  ---- labOfLabLine env t $
    Just (GLine_QCN__PP__means_ qcn pp) ->
       Means (Modification (iQCN env qcn) (iPP env pp))
         (conjOfLabLines env ts (map (iLabLine env) ts))
    Just (GLine_S_if_NP_ s np) ->
       Means (iS env s)
         (Qualification "THAT"
           (Predication (iNP env np) (conjOfLabLines env ts (map (iLabLine env) ts))))
    _ -> Sequence (map (iLabLine env) ls)

iLabLine :: Env -> GLabLine -> Formula
iLabLine env line = case line of
  GLabLine_Item_Line item li -> Modal (iItem env item) (iLine env li)
  GLabLine_Line li -> iLine env li
  GLabLine_Ref r -> Atomic (iRef env r)
  GLabLine_Title t -> iTitle env t
  _ -> Atomic (lin env (gf line))

iLine :: Env -> GLine -> Formula
iLine env line = case line of
  GLine_NP_ np -> iNP env np
  GLine_NP__Conj np conj -> iConj env conj [iNP env np] ----
  GLine_S_ s -> iS env s
  GLine_S_ s -> iS env s
  GLine_S__Conj s conj -> iConj env conj [iS env s]
  GLine_PP__Line pp line2 -> Modal (lin env (gf pp)) (iLine env line2)
  GLine_QCN_means_NP_ qcn np -> Means (iQCN env qcn) (iNP env np)
  GLine_where_S__S_ s s2 -> Implication (iS env s) (iS env s2)
  _ -> Atomic (lin env (gf line))


iA :: Env -> GA -> Formula
iA env a = Atomic (lin env (gf a))

iA2 :: Env -> GA2 -> Formula
iA2 env a2 = Atomic (lin env (gf a2))

iAP :: Env -> GAP -> Formula
iAP env ap = case ap of
  GAP_A2_NP a2 np -> Sequence [iA2 env a2, iNP env np] ---

iCN :: Env -> GCN -> Formula
iCN env cn = case cn of
  GCN_A_CN a n -> let (ms, bn) = mods cn in Modification bn (Conjunction ms)
  GCN_CN_AP n ap -> let (ms, bn) = mods cn in Modification bn (Conjunction ms)
  GCN_CN_RS cn rs -> Sequence [iCN env cn, iRS env rs] ---
  _ -> Atomic (lin env (gf cn))
 where
   mods cn = case cn of
     GCN_A_CN a n -> let (ms, bn) = mods n in (iA env a : ms, bn)
     GCN_CN_AP n ap -> let (ms, bn) = mods n in (iAP env ap : ms, bn)
     _ -> ([], iCN env cn)

iComp :: Env -> GComp -> Formula
iComp env comp = Atomic (lin env (gf comp))

iConjCN :: Env -> GConjCN -> Formula
iConjCN env cc = case cc of
  GConjCN_CN_Conj_CN cn1 conj cn2 -> iConj env conj (map (iCN env) [cn1, cn2])

iConjCop :: Env -> GConjCop -> Formula
iConjCop env cc = case cc of
  GConjCop_Cop__Conj_Cop_ cn1 conj cn2 -> iConj env conj (map (iCop env) [cn1, cn2])

iConjItem :: Env -> GConjItem -> Modality
iConjItem env conjn2 = lin env (gf conjn2)

iConjN2 :: Env -> GConjN2 -> Formula
iConjN2 env conjn2 = conj fs where
  (conj, fs) = iconj conjn2
  iconj conjn2 = case conjn2 of
    GConjN2_N2__ConjN2 n2 conj2 -> let (conj, fs) = iconj conj2 in (conj, (iN2 env n2):fs)
    GConjN2_N2_Conj_N2 n1 conj n2 -> (iConj env conj, [iN2 env n1, iN2 env n2])

iConjNP :: Env -> GConjNP -> Formula
iConjNP env cc = case cc of
  GConjNP_NP_Conj_NP cn1 conj cn2 -> iConj env conj (map (iNP env) [cn1, cn2])

iConjPP :: Env -> GConjPP -> Formula
iConjPP env cc = case cc of
  GConjPP_PP_Conj_PP cn1 conj cn2 -> iConj env conj (map (iPP env) [cn1, cn2])

iConjPPart :: Env -> GConjPPart -> Formula
iConjPPart env cc = case cc of
  GConjPPart_PPart_Conj_PPart cn1 conj cn2 -> iConj env conj (map (iPPart env) [cn1, cn2])

iConjVP2 :: Env -> GConjVP2 -> Formula
iConjVP2 env cc = case cc of
  GConjVP2_VP2__Conj_VP2_ cn1 conj cn2 -> iConj env conj (map (iVP2 env) [cn1, cn2])

iConj :: Env -> GConj -> ([Formula] -> Formula)
iConj env conj = case conj of
  GConj_and -> Conjunction
  GConj_or -> Disjunction

iCop :: Env -> GCop -> Formula
iCop env item = Atomic (lin env (gf item))

iDate :: Env -> GDate -> Formula
iDate env item = Atomic (lin env (gf item))

iItem :: Env -> GItem -> Modality
iItem env item = lin env (gf item)

-- iLine on top level before all other categories

iN2 :: Env -> GN2 -> Formula
iN2 env n2 = Atomic (lin env (gf n2))

iNP :: Env -> GNP -> Formula
iNP env np = case np of
  GNP_the_unauthorised_ConjN2_of_NP conjn2 np ->
    Application (Modal "unauthorized" (iConjN2 env conjn2)) (iNP env np)

  GNP_the_loss_of_any_ConjCN_RS conjcn rs ->
    Application (Atomic "loss") (Modal "ANY" (Sequence [(iConjCN env conjcn), (iRS env rs)]))

  GNP_CN cn -> iCN env cn

  GNP_a_CN cn -> Quantification "A" (iCN env cn)
  GNP_an_CN cn -> Quantification "AN" (iCN env cn)
  GNP_any_CN cn -> Quantification "ANY" (iCN env cn)
  GNP_each_CN cn -> Quantification "EACH" (iCN env cn)
  GNP_that_CN cn -> Quantification "THAT" (iCN env cn)
  GNP_this_CN cn -> Quantification "THIS" (iCN env cn)


  _ -> Atomic (lin env (gf np)) ----

iNum :: Env -> GNum -> Formula
iNum env n2 = Atomic (lin env (gf n2))

iPP :: Env -> GPP -> Formula
iPP env pp = case pp of
  GPP_PP2_NP pp2 np -> Qualification (iPP2 env pp2) (iNP env np)
  __ -> Atomic (lin env (gf pp))

iPP2 :: Env -> GPP2 -> Modality
iPP2 env n2 = map toUpper (lin env (gf n2))

iPPart :: Env -> GPPart -> Formula
iPPart env n2 = Atomic (lin env (gf n2))

iQCN :: Env -> GQCN -> Formula
iQCN env n2 = Atomic (lin env (gf n2))

iRS :: Env -> GRS -> Formula
iRS env rs = case rs of
  GRS_on_which_S s -> Qualification "ON WHICH" (iS env s)
  GRS_where_S s -> Qualification "WHERE" (iS env s)
  GRS_that_VP vp -> Qualification "THAT" (iVP env vp)
  _ -> Atomic (lin env (gf rs)) ----

iRef :: Env -> GRef -> Modality
iRef env n2 = lin env (gf n2)

iS :: Env -> GS -> Formula
iS env s = case s of
  GS_NP_VP np vp ->
    Predication (iNP env np) (iVP env vp)
  _ -> Atomic (lin env (gf s)) ----

iSeqPP :: Env -> GSeqPP -> Formula
iSeqPP env n2 = Atomic (lin env (gf n2)) ----

iTitle :: Env -> GTitle -> Formula
iTitle env n2 = Atomic (lin env (gf n2))

iVP :: Env -> GVP -> Formula
iVP env vp = case vp of
  GVP_VP_PP vp pp -> Modification (iVP env vp) (iPP env pp)
  GVP_VP2_NP vp2 np -> Action (iVP2 env vp2) (iNP env np)
  GVP_ConjVP2_NP vp2 np -> Action (iConjVP2 env vp2) (iNP env np)
  _ -> Atomic (lin env (gf vp)) ----

iVP2 :: Env -> GVP2 -> Formula
iVP2 env n2 = Atomic (lin env (gf n2))
