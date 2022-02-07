{-# OPTIONS_GHC -fglasgow-exts #-}
{-# LANGUAGE GADTs #-}

module Semantics where

import Law
import Spreadsheet

import PGF (Expr)

-- the logic

type Modality = String
type Atom = String

data Formula =
    Modal Modality Formula
  | Atomic Atom
  | Conjunction [Formula]
  | Disjunction [Formula]
  | Implication Formula Formula
  | Application Formula Formula  -- the f of x
  | Predication Formula Formula
  | Modified Formula Formula   -- A which is B
  | Negation Formula
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
  Application f x -> ofBox [formula2box f] [formula2box x]
  Predication x f -> doubleLeftsideBox "WHO" [formula2box x] "WHAT" [formula2box f]
  Modified f x -> modBox (formula2box f) [formula2box x]
  Negation f -> notBox (formula2box f)
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
paragraphs = reverse . collect [] [] where
  collect ps ts ls = case ls of
    t@(GLabLine_Ref _) : ll | not (null ts) -> collect (reverse ts : ps) [t] ll
    t : ll -> collect ps (t:ts) ll
    _ -> reverse ts : ps
  

iLabLines :: Env -> [GLabLine] -> Formula
iLabLines env ls = case ls of
  t@(GLabLine_Ref r) : ts -> Modal (iRef env r) (iLabLines env ts)
----  GLine_QCN__in_relation_to_NP__means_ qcn np : ts ->
----      Modal (iNP env np) (Means (iQCN env qcn) ()) 
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
  GLine_NP__Conj np conj -> iConj env conj [iNP env np]
  GLine_S_ s -> iS env s
  GLine_S_ s -> iS env s
  GLine_S__Conj s conj -> iConj env conj [iS env s]

----  GLine_QCN__PP__means_ qcn pp ->  Means (Modal (lin env (gf pp)) (iQCN env qcn)) (iNP env np)
  GLine_QCN_means_NP_ qcn np -> Means (iQCN env qcn) (iNP env np) 
  _ -> Atomic (lin env (gf line))


iA :: Env -> GA -> Formula
iA env a = Atomic (lin env (gf a))

iA2 :: Env -> GA2 -> Formula
iA2 env a2 = Atomic (lin env (gf a2))

iAP :: Env -> GAP -> Formula
iAP env ap = case ap of
  GAP_A2_NP a2 np -> Application (iA2 env a2) (iNP env np)

iCN :: Env -> GCN -> Formula
iCN env cn = case cn of
  GCN_A_CN a n -> let (ms, bn) = mods cn in Modified bn (Conjunction ms)
  GCN_CN_AP n ap -> let (ms, bn) = mods cn in Modified bn (Conjunction ms)
  _ -> Atomic (lin env (gf cn))
 where
   mods cn = case cn of
     GCN_A_CN a n -> let (ms, bn) = mods n in (iA env a : ms, bn)
     GCN_CN_AP n ap -> let (ms, bn) = mods n in (iAP env ap : ms, bn)

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
    Modal "the loss of any" (Modified (iConjCN env conjcn) (iRS env rs))
  
  GNP_CN cn -> iCN env cn
  _ -> Atomic (lin env (gf np)) ----

iNum :: Env -> GNum -> Formula
iNum env n2 = Atomic (lin env (gf n2))

iPP :: Env -> GPP -> Formula
iPP env n2 = Atomic (lin env (gf n2)) ----

iPPart :: Env -> GPPart -> Formula
iPPart env n2 = Atomic (lin env (gf n2))

iQCN :: Env -> GQCN -> Formula
iQCN env n2 = Atomic (lin env (gf n2))

iRS :: Env -> GRS -> Formula
iRS env rs = case rs of
  GRS_on_which_S s -> Modal "ON WHICH" (iS env s)
  GRS_where_S s -> Modal "WHERE" (iS env s)
  _ -> Atomic (lin env (gf rs)) ----

iRef :: Env -> GRef -> Modality
iRef env n2 = lin env (gf n2)

iS :: Env -> GS -> Formula
iS env s = case s of
  GS_personal_data_is_stored_in_circumstances_RS rs ->
    Modified (Atomic "personal data is stored in circumstances") (iRS env rs)
  GS_NP_is_likely_to_occur np ->
    Predication (iNP env np) (Atomic "is likely to occur")
  _ -> Atomic (lin env (gf s)) ----

iSeqPP :: Env -> GSeqPP -> Formula
iSeqPP env n2 = Atomic (lin env (gf n2)) ----

iTitle :: Env -> GTitle -> Formula
iTitle env n2 = Atomic (lin env (gf n2))

iV2 :: Env -> GV2 -> Formula
iV2 env n2 = Atomic (lin env (gf n2))

iVP2 :: Env -> GVP2 -> Formula
iVP2 env n2 = Atomic (lin env (gf n2)) 

iVP :: Env -> GVP -> Formula
iVP env n2 = Atomic (lin env (gf n2)) ----

iV :: Env -> GV -> Formula
iV env n2 = Atomic (lin env (gf n2))

{-

OK: 26A .  in this Part , unless the context otherwise requires —
Line_Ref__PP__unless_S_ Ref_26A PP_in_this_Part S_the_context_otherwise_requires

OK: “affected individual” means any individual to whom any personal data affected by a data breach relates ;
Line_QCN_means_any_CN_ QCN_affected_individual (CN_CN_RS CN_individual (RS_to_whom_NP_VP (NP_any_CN (CN_CN_AP CN_personal_data (AP_affected_by_NP (NP_a_CN CN_data_breach)))) VP_relates))

OK: “data breach” , in relation to personal data , means —
Line_QCN__in_relation_to_NP__means_ QCN_data_breach (NP_CN CN_personal_data)

OK: (a)	the unauthorised access , collection , use , disclosure , copying , modification or disposal of personal data ; or
Line_Item_NP__Conj Item_a (NP_the_unauthorised_ConjN2_of_NP (ConjN2_N2__ConjN2 N2_access (ConjN2_N2__ConjN2 N2_collection (ConjN2_N2__ConjN2 N2_use (ConjN2_N2__ConjN2 N2_disclosure (ConjN2_N2__ConjN2 N2_copying (ConjN2_N2_Conj_N2 N2_modification Conj_or N2_disposal)))))) (NP_CN CN_personal_data)) Conj_or

OK: (b)	the loss of any storage medium or device on which personal data is stored in circumstances where the unauthorised access , collection , use , disclosure , copying , modification or disposal of the personal data is likely to occur .
Line_Item_NP_ Item_b (NP_the_loss_of_any_ConjCN_RS (ConjCN_CN_Conj_CN CN_storage_medium Conj_or CN_device) (RS_on_which_S (S_personal_data_is_stored_in_circumstances_RS (RS_where_S (S_NP_is_likely_to_occur (NP_the_unauthorised_ConjN2_of_NP (ConjN2_N2__ConjN2 N2_access (ConjN2_N2__ConjN2 N2_collection (ConjN2_N2__ConjN2 N2_use (ConjN2_N2__ConjN2 N2_disclosure (ConjN2_N2__ConjN2 N2_copying (ConjN2_N2_Conj_N2 N2_modification Conj_or N2_disposal)))))) (NP_the_CN CN_personal_data)))))))
-}
