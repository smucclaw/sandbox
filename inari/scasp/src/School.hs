{-# LANGUAGE GADTs, FlexibleInstances, KindSignatures, RankNTypes, TypeSynonymInstances #-}
module School where

import Control.Monad.Identity
import Data.Monoid
import PGF hiding (Tree)

----------------------------------------------------
-- automatic translation from GF to Haskell
----------------------------------------------------

class Gf a where
  gf :: a -> Expr
  fg :: Expr -> a

instance Gf GString where
  gf (GString x) = mkStr x
  fg t =
    case unStr t of
      Just x  ->  GString x
      Nothing -> error ("no GString " ++ show t)

instance Gf GInt where
  gf (GInt x) = mkInt x
  fg t =
    case unInt t of
      Just x  ->  GInt x
      Nothing -> error ("no GInt " ++ show t)

instance Gf GFloat where
  gf (GFloat x) = mkFloat x
  fg t =
    case unFloat t of
      Just x  ->  GFloat x
      Nothing -> error ("no GFloat " ++ show t)

----------------------------------------------------
-- below this line machine-generated
----------------------------------------------------

type GA = Tree GA_
data GA_
type GAP = Tree GAP_
data GAP_
type GAdv = Tree GAdv_
data GAdv_
type GCN = Tree GCN_
data GCN_
type GCl = Tree GCl_
data GCl_
type GComp = Tree GComp_
data GComp_
type GConj = Tree GConj_
data GConj_
type GDet = Tree GDet_
data GDet_
type GDig = Tree GDig_
data GDig_
type GDigit = Tree GDigit_
data GDigit_
type GDigits = Tree GDigits_
data GDigits_
type GListAP = Tree GListAP_
data GListAP_
type GListAdv = Tree GListAdv_
data GListAdv_
type GListNP = Tree GListNP_
data GListNP_
type GListS = Tree GListS_
data GListS_
type GListVPS = Tree GListVPS_
data GListVPS_
type GN = Tree GN_
data GN_
type GN2 = Tree GN2_
data GN2_
type GNP = Tree GNP_
data GNP_
type GNumeral = Tree GNumeral_
data GNumeral_
type GPN = Tree GPN_
data GPN_
type GPol = Tree GPol_
data GPol_
type GPrep = Tree GPrep_
data GPrep_
type GPron = Tree GPron_
data GPron_
type GQuant = Tree GQuant_
data GQuant_
type GS = Tree GS_
data GS_
type GSC = Tree GSC_
data GSC_
type GSub10 = Tree GSub10_
data GSub10_
type GSub100 = Tree GSub100_
data GSub100_
type GSub1000 = Tree GSub1000_
data GSub1000_
type GSub1000000 = Tree GSub1000000_
data GSub1000000_
type GSub1000000000 = Tree GSub1000000000_
data GSub1000000000_
type GSub1000000000000 = Tree GSub1000000000000_
data GSub1000000000000_
type GTemp = Tree GTemp_
data GTemp_
type GV2 = Tree GV2_
data GV2_
type GVP = Tree GVP_
data GVP_
type GVPI = Tree GVPI_
data GVPI_
type GVPS = Tree GVPS_
data GVPS_
type GVV = Tree GVV_
data GVV_
type GA2 = Tree GA2_
data GA2_
type GAdA = Tree GAdA_
data GAdA_
type GAnt = Tree GAnt_
data GAnt_
type GQS = Tree GQS_
data GQS_
type GTense = Tree GTense_
data GTense_
type GV = Tree GV_
data GV_
type GVS = Tree GVS_
data GVS_
type GString = Tree GString_
data GString_
type GInt = Tree GInt_
data GInt_
type GFloat = Tree GFloat_
data GFloat_

data Tree :: * -> * where
  LexA :: String -> Tree GA_
  GConjAP :: GConj -> GListAP -> Tree GAP_
  GPositA :: GA -> Tree GAP_
  GAdAdv :: GAdA -> GAdv -> Tree GAdv_
  GByVP :: GVP -> Tree GAdv_
  GConjAdv :: GConj -> GListAdv -> Tree GAdv_
  GPrepNP :: GPrep -> GNP -> Tree GAdv_
  GAdjCN :: GAP -> GCN -> Tree GCN_
  GComplN2 :: GN2 -> GNP -> Tree GCN_
  GSentCN :: GCN -> GSC -> Tree GCN_
  GUseN :: GN -> Tree GCN_
  GExistCN :: GCN -> Tree GCl_
  GExistNP :: GNP -> Tree GCl_
  GCompAP :: GAP -> Tree GComp_
  GCompAdv :: GAdv -> Tree GComp_
  GCompNP :: GNP -> Tree GComp_
  Gand_Conj :: Tree GConj_
  Gbecause_Conj :: Tree GConj_
  Gor_Conj :: Tree GConj_
  GaSg :: Tree GDet_
  GthePl :: Tree GDet_
  GtheSg :: Tree GDet_
  Gyour :: Tree GDet_
  GD_0 :: Tree GDig_
  GD_1 :: Tree GDig_
  GD_2 :: Tree GDig_
  GD_3 :: Tree GDig_
  GD_4 :: Tree GDig_
  GD_5 :: Tree GDig_
  GD_6 :: Tree GDig_
  GD_7 :: Tree GDig_
  GD_8 :: Tree GDig_
  GD_9 :: Tree GDig_
  Gn2 :: Tree GDigit_
  Gn3 :: Tree GDigit_
  Gn4 :: Tree GDigit_
  Gn5 :: Tree GDigit_
  Gn6 :: Tree GDigit_
  Gn7 :: Tree GDigit_
  Gn8 :: Tree GDigit_
  Gn9 :: Tree GDigit_
  GIDig :: GDig -> Tree GDigits_
  GIIDig :: GDig -> GDigits -> Tree GDigits_
  GListAP :: [GAP] -> Tree GListAP_
  GListAdv :: [GAdv] -> Tree GListAdv_
  GListNP :: [GNP] -> Tree GListNP_
  GListS :: [GS] -> Tree GListS_
  GListVPS :: [GVPS] -> Tree GListVPS_
  LexN :: String -> Tree GN_
  LexN2 :: String -> Tree GN2_
  GConjNP :: GConj -> GListNP -> Tree GNP_
  GDetCN :: GDet -> GCN -> Tree GNP_
  GGerundNP :: GVP -> Tree GNP_
  GMassNP :: GCN -> Tree GNP_
  GUsePron :: GPron -> Tree GNP_
  Gnum :: GSub1000000 -> Tree GNumeral_
  G_specific_etnia_PN :: Tree GPN_
  GNEG :: Tree GPol_
  GPOS :: Tree GPol_
  G_on_Prep :: Tree GPrep_
  G_to_Prep :: Tree GPrep_
  Gabout_Prep :: Tree GPrep_
  Gafter_Prep :: Tree GPrep_
  Gbefore_Prep :: Tree GPrep_
  Gfor_Prep :: Tree GPrep_
  Gfrom_Prep :: Tree GPrep_
  Gon_Prep :: Tree GPrep_
  Gpossess_Prep :: Tree GPrep_
  Gto_Prep :: Tree GPrep_
  Gs_he_Pron :: Tree GPron_
  Gno_Quant :: Tree GQuant_
  GBecauseS :: GS -> GS -> Tree GS_
  GConjS :: GConj -> GListS -> Tree GS_
  GNoEvidenceThat :: GSC -> Tree GS_
  GNoEvidenceThat_ :: GListS -> Tree GS_
  GPredVPS :: GNP -> GVPS -> Tree GS_
  GUseCl :: GTemp -> GPol -> GCl -> Tree GS_
  Gand :: GS -> Tree GS_
  Gcondition :: GS -> Tree GS_
  GfullStop :: GS -> Tree GS_
  GEmbedSC :: GNP -> GVPS -> Tree GSC_
  Gpot0 :: GDigit -> Tree GSub10_
  Gpot01 :: Tree GSub10_
  Gpot0as1 :: GSub10 -> Tree GSub100_
  Gpot1 :: GDigit -> Tree GSub100_
  Gpot110 :: Tree GSub100_
  Gpot111 :: Tree GSub100_
  Gpot1plus :: GDigit -> GSub10 -> Tree GSub100_
  Gpot1to19 :: GDigit -> Tree GSub100_
  Gpot1as2 :: GSub100 -> Tree GSub1000_
  Gpot2 :: GSub10 -> Tree GSub1000_
  Gpot21 :: Tree GSub1000_
  Gpot2plus :: GSub10 -> GSub100 -> Tree GSub1000_
  Gpot2as3 :: GSub1000 -> Tree GSub1000000_
  Gpot3 :: GSub1000 -> Tree GSub1000000_
  Gpot31 :: Tree GSub1000000_
  Gpot3float :: GFloat -> Tree GSub1000000_
  Gpot3plus :: GSub1000 -> GSub1000 -> Tree GSub1000000_
  Gpot3as4 :: GSub1000000 -> Tree GSub1000000000_
  Gpot4 :: GSub1000 -> Tree GSub1000000000_
  Gpot41 :: Tree GSub1000000000_
  Gpot4float :: GFloat -> Tree GSub1000000000_
  Gpot4plus :: GSub1000 -> GSub1000000 -> Tree GSub1000000000_
  Gpot4as5 :: GSub1000000000 -> Tree GSub1000000000000_
  Gpot5 :: GSub1000 -> Tree GSub1000000000000_
  Gpot51 :: Tree GSub1000000000000_
  Gpot5float :: GFloat -> Tree GSub1000000000000_
  Gpot5plus :: GSub1000 -> GSub1000000000 -> Tree GSub1000000000000_
  GpastSimul :: Tree GTemp_
  GpresAnt :: Tree GTemp_
  GpresSimul :: Tree GTemp_
  LexV2 :: String -> Tree GV2_
  GAdvVP :: GVP -> GAdv -> Tree GVP_
  GComplV2 :: GV2 -> GNP -> Tree GVP_
  GComplVV :: GVV -> GVP -> Tree GVP_
  GPassV2 :: GV2 -> Tree GVP_
  GUseComp :: GComp -> Tree GVP_
  GMkVPI :: GVP -> Tree GVPI_
  GConjVPS :: GConj -> GListVPS -> Tree GVPS_
  GMkVPS :: GTemp -> GPol -> GVP -> Tree GVPS_
  LexVV :: String -> Tree GVV_
  LexA2 :: String -> Tree GA2_
  LexVS :: String -> Tree GVS_
  GString :: String -> Tree GString_
  GInt :: Int -> Tree GInt_
  GFloat :: Double -> Tree GFloat_

instance Eq (Tree a) where
  i == j = case (i,j) of
    (LexA x,LexA y) -> x == y
    (GConjAP x1 x2,GConjAP y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GPositA x1,GPositA y1) -> and [ x1 == y1 ]
    (GAdAdv x1 x2,GAdAdv y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GByVP x1,GByVP y1) -> and [ x1 == y1 ]
    (GConjAdv x1 x2,GConjAdv y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GPrepNP x1 x2,GPrepNP y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GAdjCN x1 x2,GAdjCN y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GComplN2 x1 x2,GComplN2 y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GSentCN x1 x2,GSentCN y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GUseN x1,GUseN y1) -> and [ x1 == y1 ]
    (GExistCN x1,GExistCN y1) -> and [ x1 == y1 ]
    (GExistNP x1,GExistNP y1) -> and [ x1 == y1 ]
    (GCompAP x1,GCompAP y1) -> and [ x1 == y1 ]
    (GCompAdv x1,GCompAdv y1) -> and [ x1 == y1 ]
    (GCompNP x1,GCompNP y1) -> and [ x1 == y1 ]
    (Gand_Conj,Gand_Conj) -> and [ ]
    (Gbecause_Conj,Gbecause_Conj) -> and [ ]
    (Gor_Conj,Gor_Conj) -> and [ ]
    (GaSg,GaSg) -> and [ ]
    (GthePl,GthePl) -> and [ ]
    (GtheSg,GtheSg) -> and [ ]
    (Gyour,Gyour) -> and [ ]
    (GD_0,GD_0) -> and [ ]
    (GD_1,GD_1) -> and [ ]
    (GD_2,GD_2) -> and [ ]
    (GD_3,GD_3) -> and [ ]
    (GD_4,GD_4) -> and [ ]
    (GD_5,GD_5) -> and [ ]
    (GD_6,GD_6) -> and [ ]
    (GD_7,GD_7) -> and [ ]
    (GD_8,GD_8) -> and [ ]
    (GD_9,GD_9) -> and [ ]
    (Gn2,Gn2) -> and [ ]
    (Gn3,Gn3) -> and [ ]
    (Gn4,Gn4) -> and [ ]
    (Gn5,Gn5) -> and [ ]
    (Gn6,Gn6) -> and [ ]
    (Gn7,Gn7) -> and [ ]
    (Gn8,Gn8) -> and [ ]
    (Gn9,Gn9) -> and [ ]
    (GIDig x1,GIDig y1) -> and [ x1 == y1 ]
    (GIIDig x1 x2,GIIDig y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GListAP x1,GListAP y1) -> and [x == y | (x,y) <- zip x1 y1]
    (GListAdv x1,GListAdv y1) -> and [x == y | (x,y) <- zip x1 y1]
    (GListNP x1,GListNP y1) -> and [x == y | (x,y) <- zip x1 y1]
    (GListS x1,GListS y1) -> and [x == y | (x,y) <- zip x1 y1]
    (GListVPS x1,GListVPS y1) -> and [x == y | (x,y) <- zip x1 y1]
    (LexN x,LexN y) -> x == y
    (LexN2 x,LexN2 y) -> x == y
    (GConjNP x1 x2,GConjNP y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GDetCN x1 x2,GDetCN y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GGerundNP x1,GGerundNP y1) -> and [ x1 == y1 ]
    (GMassNP x1,GMassNP y1) -> and [ x1 == y1 ]
    (GUsePron x1,GUsePron y1) -> and [ x1 == y1 ]
    (Gnum x1,Gnum y1) -> and [ x1 == y1 ]
    (G_specific_etnia_PN,G_specific_etnia_PN) -> and [ ]
    (GNEG,GNEG) -> and [ ]
    (GPOS,GPOS) -> and [ ]
    (G_on_Prep,G_on_Prep) -> and [ ]
    (G_to_Prep,G_to_Prep) -> and [ ]
    (Gabout_Prep,Gabout_Prep) -> and [ ]
    (Gafter_Prep,Gafter_Prep) -> and [ ]
    (Gbefore_Prep,Gbefore_Prep) -> and [ ]
    (Gfor_Prep,Gfor_Prep) -> and [ ]
    (Gfrom_Prep,Gfrom_Prep) -> and [ ]
    (Gon_Prep,Gon_Prep) -> and [ ]
    (Gpossess_Prep,Gpossess_Prep) -> and [ ]
    (Gto_Prep,Gto_Prep) -> and [ ]
    (Gs_he_Pron,Gs_he_Pron) -> and [ ]
    (Gno_Quant,Gno_Quant) -> and [ ]
    (GBecauseS x1 x2,GBecauseS y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GConjS x1 x2,GConjS y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GNoEvidenceThat x1,GNoEvidenceThat y1) -> and [ x1 == y1 ]
    (GNoEvidenceThat_ x1,GNoEvidenceThat_ y1) -> and [ x1 == y1 ]
    (GPredVPS x1 x2,GPredVPS y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GUseCl x1 x2 x3,GUseCl y1 y2 y3) -> and [ x1 == y1 , x2 == y2 , x3 == y3 ]
    (Gand x1,Gand y1) -> and [ x1 == y1 ]
    (Gcondition x1,Gcondition y1) -> and [ x1 == y1 ]
    (GfullStop x1,GfullStop y1) -> and [ x1 == y1 ]
    (GEmbedSC x1 x2,GEmbedSC y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (Gpot0 x1,Gpot0 y1) -> and [ x1 == y1 ]
    (Gpot01,Gpot01) -> and [ ]
    (Gpot0as1 x1,Gpot0as1 y1) -> and [ x1 == y1 ]
    (Gpot1 x1,Gpot1 y1) -> and [ x1 == y1 ]
    (Gpot110,Gpot110) -> and [ ]
    (Gpot111,Gpot111) -> and [ ]
    (Gpot1plus x1 x2,Gpot1plus y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (Gpot1to19 x1,Gpot1to19 y1) -> and [ x1 == y1 ]
    (Gpot1as2 x1,Gpot1as2 y1) -> and [ x1 == y1 ]
    (Gpot2 x1,Gpot2 y1) -> and [ x1 == y1 ]
    (Gpot21,Gpot21) -> and [ ]
    (Gpot2plus x1 x2,Gpot2plus y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (Gpot2as3 x1,Gpot2as3 y1) -> and [ x1 == y1 ]
    (Gpot3 x1,Gpot3 y1) -> and [ x1 == y1 ]
    (Gpot31,Gpot31) -> and [ ]
    (Gpot3float x1,Gpot3float y1) -> and [ x1 == y1 ]
    (Gpot3plus x1 x2,Gpot3plus y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (Gpot3as4 x1,Gpot3as4 y1) -> and [ x1 == y1 ]
    (Gpot4 x1,Gpot4 y1) -> and [ x1 == y1 ]
    (Gpot41,Gpot41) -> and [ ]
    (Gpot4float x1,Gpot4float y1) -> and [ x1 == y1 ]
    (Gpot4plus x1 x2,Gpot4plus y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (Gpot4as5 x1,Gpot4as5 y1) -> and [ x1 == y1 ]
    (Gpot5 x1,Gpot5 y1) -> and [ x1 == y1 ]
    (Gpot51,Gpot51) -> and [ ]
    (Gpot5float x1,Gpot5float y1) -> and [ x1 == y1 ]
    (Gpot5plus x1 x2,Gpot5plus y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GpastSimul,GpastSimul) -> and [ ]
    (GpresAnt,GpresAnt) -> and [ ]
    (GpresSimul,GpresSimul) -> and [ ]
    (LexV2 x,LexV2 y) -> x == y
    (GAdvVP x1 x2,GAdvVP y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GComplV2 x1 x2,GComplV2 y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GComplVV x1 x2,GComplVV y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GPassV2 x1,GPassV2 y1) -> and [ x1 == y1 ]
    (GUseComp x1,GUseComp y1) -> and [ x1 == y1 ]
    (GMkVPI x1,GMkVPI y1) -> and [ x1 == y1 ]
    (GConjVPS x1 x2,GConjVPS y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GMkVPS x1 x2 x3,GMkVPS y1 y2 y3) -> and [ x1 == y1 , x2 == y2 , x3 == y3 ]
    (LexVV x,LexVV y) -> x == y
    (LexA2 x,LexA2 y) -> x == y
    (LexVS x,LexVS y) -> x == y
    (GString x, GString y) -> x == y
    (GInt x, GInt y) -> x == y
    (GFloat x, GFloat y) -> x == y
    _ -> False

instance Gf GA where
  gf (LexA x) = mkApp (mkCId x) []

  fg t =
    case unApp t of

      Just (i,[]) -> LexA (showCId i)
      _ -> error ("no A " ++ show t)

instance Gf GAP where
  gf (GConjAP x1 x2) = mkApp (mkCId "ConjAP") [gf x1, gf x2]
  gf (GPositA x1) = mkApp (mkCId "PositA") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjAP" -> GConjAP (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "PositA" -> GPositA (fg x1)


      _ -> error ("no AP " ++ show t)

instance Gf GAdv where
  gf (GAdAdv x1 x2) = mkApp (mkCId "AdAdv") [gf x1, gf x2]
  gf (GByVP x1) = mkApp (mkCId "ByVP") [gf x1]
  gf (GConjAdv x1 x2) = mkApp (mkCId "ConjAdv") [gf x1, gf x2]
  gf (GPrepNP x1 x2) = mkApp (mkCId "PrepNP") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "AdAdv" -> GAdAdv (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "ByVP" -> GByVP (fg x1)
      Just (i,[x1,x2]) | i == mkCId "ConjAdv" -> GConjAdv (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "PrepNP" -> GPrepNP (fg x1) (fg x2)


      _ -> error ("no Adv " ++ show t)

instance Gf GCN where
  gf (GAdjCN x1 x2) = mkApp (mkCId "AdjCN") [gf x1, gf x2]
  gf (GComplN2 x1 x2) = mkApp (mkCId "ComplN2") [gf x1, gf x2]
  gf (GSentCN x1 x2) = mkApp (mkCId "SentCN") [gf x1, gf x2]
  gf (GUseN x1) = mkApp (mkCId "UseN") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "AdjCN" -> GAdjCN (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ComplN2" -> GComplN2 (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "SentCN" -> GSentCN (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "UseN" -> GUseN (fg x1)


      _ -> error ("no CN " ++ show t)

instance Gf GCl where
  gf (GExistCN x1) = mkApp (mkCId "ExistCN") [gf x1]
  gf (GExistNP x1) = mkApp (mkCId "ExistNP") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "ExistCN" -> GExistCN (fg x1)
      Just (i,[x1]) | i == mkCId "ExistNP" -> GExistNP (fg x1)


      _ -> error ("no Cl " ++ show t)

instance Gf GComp where
  gf (GCompAP x1) = mkApp (mkCId "CompAP") [gf x1]
  gf (GCompAdv x1) = mkApp (mkCId "CompAdv") [gf x1]
  gf (GCompNP x1) = mkApp (mkCId "CompNP") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "CompAP" -> GCompAP (fg x1)
      Just (i,[x1]) | i == mkCId "CompAdv" -> GCompAdv (fg x1)
      Just (i,[x1]) | i == mkCId "CompNP" -> GCompNP (fg x1)


      _ -> error ("no Comp " ++ show t)

instance Gf GConj where
  gf Gand_Conj = mkApp (mkCId "and_Conj") []
  gf Gbecause_Conj = mkApp (mkCId "because_Conj") []
  gf Gor_Conj = mkApp (mkCId "or_Conj") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "and_Conj" -> Gand_Conj 
      Just (i,[]) | i == mkCId "because_Conj" -> Gbecause_Conj 
      Just (i,[]) | i == mkCId "or_Conj" -> Gor_Conj 


      _ -> error ("no Conj " ++ show t)

instance Gf GDet where
  gf GaSg = mkApp (mkCId "aSg") []
  gf GthePl = mkApp (mkCId "thePl") []
  gf GtheSg = mkApp (mkCId "theSg") []
  gf Gyour = mkApp (mkCId "your") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "aSg" -> GaSg 
      Just (i,[]) | i == mkCId "thePl" -> GthePl 
      Just (i,[]) | i == mkCId "theSg" -> GtheSg 
      Just (i,[]) | i == mkCId "your" -> Gyour 


      _ -> error ("no Det " ++ show t)

instance Gf GDig where
  gf GD_0 = mkApp (mkCId "D_0") []
  gf GD_1 = mkApp (mkCId "D_1") []
  gf GD_2 = mkApp (mkCId "D_2") []
  gf GD_3 = mkApp (mkCId "D_3") []
  gf GD_4 = mkApp (mkCId "D_4") []
  gf GD_5 = mkApp (mkCId "D_5") []
  gf GD_6 = mkApp (mkCId "D_6") []
  gf GD_7 = mkApp (mkCId "D_7") []
  gf GD_8 = mkApp (mkCId "D_8") []
  gf GD_9 = mkApp (mkCId "D_9") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "D_0" -> GD_0 
      Just (i,[]) | i == mkCId "D_1" -> GD_1 
      Just (i,[]) | i == mkCId "D_2" -> GD_2 
      Just (i,[]) | i == mkCId "D_3" -> GD_3 
      Just (i,[]) | i == mkCId "D_4" -> GD_4 
      Just (i,[]) | i == mkCId "D_5" -> GD_5 
      Just (i,[]) | i == mkCId "D_6" -> GD_6 
      Just (i,[]) | i == mkCId "D_7" -> GD_7 
      Just (i,[]) | i == mkCId "D_8" -> GD_8 
      Just (i,[]) | i == mkCId "D_9" -> GD_9 


      _ -> error ("no Dig " ++ show t)

instance Gf GDigit where
  gf Gn2 = mkApp (mkCId "n2") []
  gf Gn3 = mkApp (mkCId "n3") []
  gf Gn4 = mkApp (mkCId "n4") []
  gf Gn5 = mkApp (mkCId "n5") []
  gf Gn6 = mkApp (mkCId "n6") []
  gf Gn7 = mkApp (mkCId "n7") []
  gf Gn8 = mkApp (mkCId "n8") []
  gf Gn9 = mkApp (mkCId "n9") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "n2" -> Gn2 
      Just (i,[]) | i == mkCId "n3" -> Gn3 
      Just (i,[]) | i == mkCId "n4" -> Gn4 
      Just (i,[]) | i == mkCId "n5" -> Gn5 
      Just (i,[]) | i == mkCId "n6" -> Gn6 
      Just (i,[]) | i == mkCId "n7" -> Gn7 
      Just (i,[]) | i == mkCId "n8" -> Gn8 
      Just (i,[]) | i == mkCId "n9" -> Gn9 


      _ -> error ("no Digit " ++ show t)

instance Gf GDigits where
  gf (GIDig x1) = mkApp (mkCId "IDig") [gf x1]
  gf (GIIDig x1 x2) = mkApp (mkCId "IIDig") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "IDig" -> GIDig (fg x1)
      Just (i,[x1,x2]) | i == mkCId "IIDig" -> GIIDig (fg x1) (fg x2)


      _ -> error ("no Digits " ++ show t)

instance Gf GListAP where
  gf (GListAP [x1,x2]) = mkApp (mkCId "BaseAP") [gf x1, gf x2]
  gf (GListAP (x:xs)) = mkApp (mkCId "ConsAP") [gf x, gf (GListAP xs)]
  fg t =
    GListAP (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseAP" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsAP" -> fg x1 : fgs x2


      _ -> error ("no ListAP " ++ show t)

instance Gf GListAdv where
  gf (GListAdv [x1,x2]) = mkApp (mkCId "BaseAdv") [gf x1, gf x2]
  gf (GListAdv (x:xs)) = mkApp (mkCId "ConsAdv") [gf x, gf (GListAdv xs)]
  fg t =
    GListAdv (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseAdv" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsAdv" -> fg x1 : fgs x2


      _ -> error ("no ListAdv " ++ show t)

instance Gf GListNP where
  gf (GListNP [x1,x2]) = mkApp (mkCId "BaseNP") [gf x1, gf x2]
  gf (GListNP (x:xs)) = mkApp (mkCId "ConsNP") [gf x, gf (GListNP xs)]
  fg t =
    GListNP (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseNP" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsNP" -> fg x1 : fgs x2


      _ -> error ("no ListNP " ++ show t)

instance Gf GListS where
  gf (GListS [x1,x2]) = mkApp (mkCId "BaseS") [gf x1, gf x2]
  gf (GListS (x:xs)) = mkApp (mkCId "ConsS") [gf x, gf (GListS xs)]
  fg t =
    GListS (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseS" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsS" -> fg x1 : fgs x2


      _ -> error ("no ListS " ++ show t)

instance Gf GListVPS where
  gf (GListVPS [x1,x2]) = mkApp (mkCId "BaseVPS") [gf x1, gf x2]
  gf (GListVPS (x:xs)) = mkApp (mkCId "ConsVPS") [gf x, gf (GListVPS xs)]
  fg t =
    GListVPS (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseVPS" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsVPS" -> fg x1 : fgs x2


      _ -> error ("no ListVPS " ++ show t)

instance Gf GN where
  gf (LexN x) = mkApp (mkCId x) []

  fg t =
    case unApp t of

      Just (i,[]) -> LexN (showCId i)
      _ -> error ("no N " ++ show t)

instance Gf GN2 where
  gf (LexN2 x) = mkApp (mkCId x) []

  fg t =
    case unApp t of

      Just (i,[]) -> LexN2 (showCId i)
      _ -> error ("no N2 " ++ show t)

instance Gf GNP where
  gf (GConjNP x1 x2) = mkApp (mkCId "ConjNP") [gf x1, gf x2]
  gf (GDetCN x1 x2) = mkApp (mkCId "DetCN") [gf x1, gf x2]
  gf (GGerundNP x1) = mkApp (mkCId "GerundNP") [gf x1]
  gf (GMassNP x1) = mkApp (mkCId "MassNP") [gf x1]
  gf (GUsePron x1) = mkApp (mkCId "UsePron") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjNP" -> GConjNP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "DetCN" -> GDetCN (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "GerundNP" -> GGerundNP (fg x1)
      Just (i,[x1]) | i == mkCId "MassNP" -> GMassNP (fg x1)
      Just (i,[x1]) | i == mkCId "UsePron" -> GUsePron (fg x1)


      _ -> error ("no NP " ++ show t)

instance Gf GNumeral where
  gf (Gnum x1) = mkApp (mkCId "num") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "num" -> Gnum (fg x1)


      _ -> error ("no Numeral " ++ show t)

instance Gf GPN where
  gf G_specific_etnia_PN = mkApp (mkCId "_specific_etnia_PN") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "_specific_etnia_PN" -> G_specific_etnia_PN 


      _ -> error ("no PN " ++ show t)

instance Gf GPol where
  gf GNEG = mkApp (mkCId "NEG") []
  gf GPOS = mkApp (mkCId "POS") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "NEG" -> GNEG 
      Just (i,[]) | i == mkCId "POS" -> GPOS 


      _ -> error ("no Pol " ++ show t)

instance Gf GPrep where
  gf G_on_Prep = mkApp (mkCId "_on_Prep") []
  gf G_to_Prep = mkApp (mkCId "_to_Prep") []
  gf Gabout_Prep = mkApp (mkCId "about_Prep") []
  gf Gafter_Prep = mkApp (mkCId "after_Prep") []
  gf Gbefore_Prep = mkApp (mkCId "before_Prep") []
  gf Gfor_Prep = mkApp (mkCId "for_Prep") []
  gf Gfrom_Prep = mkApp (mkCId "from_Prep") []
  gf Gon_Prep = mkApp (mkCId "on_Prep") []
  gf Gpossess_Prep = mkApp (mkCId "possess_Prep") []
  gf Gto_Prep = mkApp (mkCId "to_Prep") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "_on_Prep" -> G_on_Prep 
      Just (i,[]) | i == mkCId "_to_Prep" -> G_to_Prep 
      Just (i,[]) | i == mkCId "about_Prep" -> Gabout_Prep 
      Just (i,[]) | i == mkCId "after_Prep" -> Gafter_Prep 
      Just (i,[]) | i == mkCId "before_Prep" -> Gbefore_Prep 
      Just (i,[]) | i == mkCId "for_Prep" -> Gfor_Prep 
      Just (i,[]) | i == mkCId "from_Prep" -> Gfrom_Prep 
      Just (i,[]) | i == mkCId "on_Prep" -> Gon_Prep 
      Just (i,[]) | i == mkCId "possess_Prep" -> Gpossess_Prep 
      Just (i,[]) | i == mkCId "to_Prep" -> Gto_Prep 


      _ -> error ("no Prep " ++ show t)

instance Gf GPron where
  gf Gs_he_Pron = mkApp (mkCId "s_he_Pron") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "s_he_Pron" -> Gs_he_Pron 


      _ -> error ("no Pron " ++ show t)

instance Gf GQuant where
  gf Gno_Quant = mkApp (mkCId "no_Quant") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "no_Quant" -> Gno_Quant 


      _ -> error ("no Quant " ++ show t)

instance Gf GS where
  gf (GBecauseS x1 x2) = mkApp (mkCId "BecauseS") [gf x1, gf x2]
  gf (GConjS x1 x2) = mkApp (mkCId "ConjS") [gf x1, gf x2]
  gf (GNoEvidenceThat x1) = mkApp (mkCId "NoEvidenceThat") [gf x1]
  gf (GNoEvidenceThat_ x1) = mkApp (mkCId "NoEvidenceThat_") [gf x1]
  gf (GPredVPS x1 x2) = mkApp (mkCId "PredVPS") [gf x1, gf x2]
  gf (GUseCl x1 x2 x3) = mkApp (mkCId "UseCl") [gf x1, gf x2, gf x3]
  gf (Gand x1) = mkApp (mkCId "and") [gf x1]
  gf (Gcondition x1) = mkApp (mkCId "condition") [gf x1]
  gf (GfullStop x1) = mkApp (mkCId "fullStop") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BecauseS" -> GBecauseS (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ConjS" -> GConjS (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "NoEvidenceThat" -> GNoEvidenceThat (fg x1)
      Just (i,[x1]) | i == mkCId "NoEvidenceThat_" -> GNoEvidenceThat_ (fg x1)
      Just (i,[x1,x2]) | i == mkCId "PredVPS" -> GPredVPS (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "UseCl" -> GUseCl (fg x1) (fg x2) (fg x3)
      Just (i,[x1]) | i == mkCId "and" -> Gand (fg x1)
      Just (i,[x1]) | i == mkCId "condition" -> Gcondition (fg x1)
      Just (i,[x1]) | i == mkCId "fullStop" -> GfullStop (fg x1)


      _ -> error ("no S " ++ show t)

instance Gf GSC where
  gf (GEmbedSC x1 x2) = mkApp (mkCId "EmbedSC") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "EmbedSC" -> GEmbedSC (fg x1) (fg x2)


      _ -> error ("no SC " ++ show t)

instance Gf GSub10 where
  gf (Gpot0 x1) = mkApp (mkCId "pot0") [gf x1]
  gf Gpot01 = mkApp (mkCId "pot01") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "pot0" -> Gpot0 (fg x1)
      Just (i,[]) | i == mkCId "pot01" -> Gpot01 


      _ -> error ("no Sub10 " ++ show t)

instance Gf GSub100 where
  gf (Gpot0as1 x1) = mkApp (mkCId "pot0as1") [gf x1]
  gf (Gpot1 x1) = mkApp (mkCId "pot1") [gf x1]
  gf Gpot110 = mkApp (mkCId "pot110") []
  gf Gpot111 = mkApp (mkCId "pot111") []
  gf (Gpot1plus x1 x2) = mkApp (mkCId "pot1plus") [gf x1, gf x2]
  gf (Gpot1to19 x1) = mkApp (mkCId "pot1to19") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "pot0as1" -> Gpot0as1 (fg x1)
      Just (i,[x1]) | i == mkCId "pot1" -> Gpot1 (fg x1)
      Just (i,[]) | i == mkCId "pot110" -> Gpot110 
      Just (i,[]) | i == mkCId "pot111" -> Gpot111 
      Just (i,[x1,x2]) | i == mkCId "pot1plus" -> Gpot1plus (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "pot1to19" -> Gpot1to19 (fg x1)


      _ -> error ("no Sub100 " ++ show t)

instance Gf GSub1000 where
  gf (Gpot1as2 x1) = mkApp (mkCId "pot1as2") [gf x1]
  gf (Gpot2 x1) = mkApp (mkCId "pot2") [gf x1]
  gf Gpot21 = mkApp (mkCId "pot21") []
  gf (Gpot2plus x1 x2) = mkApp (mkCId "pot2plus") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "pot1as2" -> Gpot1as2 (fg x1)
      Just (i,[x1]) | i == mkCId "pot2" -> Gpot2 (fg x1)
      Just (i,[]) | i == mkCId "pot21" -> Gpot21 
      Just (i,[x1,x2]) | i == mkCId "pot2plus" -> Gpot2plus (fg x1) (fg x2)


      _ -> error ("no Sub1000 " ++ show t)

instance Gf GSub1000000 where
  gf (Gpot2as3 x1) = mkApp (mkCId "pot2as3") [gf x1]
  gf (Gpot3 x1) = mkApp (mkCId "pot3") [gf x1]
  gf Gpot31 = mkApp (mkCId "pot31") []
  gf (Gpot3float x1) = mkApp (mkCId "pot3float") [gf x1]
  gf (Gpot3plus x1 x2) = mkApp (mkCId "pot3plus") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "pot2as3" -> Gpot2as3 (fg x1)
      Just (i,[x1]) | i == mkCId "pot3" -> Gpot3 (fg x1)
      Just (i,[]) | i == mkCId "pot31" -> Gpot31 
      Just (i,[x1]) | i == mkCId "pot3float" -> Gpot3float (fg x1)
      Just (i,[x1,x2]) | i == mkCId "pot3plus" -> Gpot3plus (fg x1) (fg x2)


      _ -> error ("no Sub1000000 " ++ show t)

instance Gf GSub1000000000 where
  gf (Gpot3as4 x1) = mkApp (mkCId "pot3as4") [gf x1]
  gf (Gpot4 x1) = mkApp (mkCId "pot4") [gf x1]
  gf Gpot41 = mkApp (mkCId "pot41") []
  gf (Gpot4float x1) = mkApp (mkCId "pot4float") [gf x1]
  gf (Gpot4plus x1 x2) = mkApp (mkCId "pot4plus") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "pot3as4" -> Gpot3as4 (fg x1)
      Just (i,[x1]) | i == mkCId "pot4" -> Gpot4 (fg x1)
      Just (i,[]) | i == mkCId "pot41" -> Gpot41 
      Just (i,[x1]) | i == mkCId "pot4float" -> Gpot4float (fg x1)
      Just (i,[x1,x2]) | i == mkCId "pot4plus" -> Gpot4plus (fg x1) (fg x2)


      _ -> error ("no Sub1000000000 " ++ show t)

instance Gf GSub1000000000000 where
  gf (Gpot4as5 x1) = mkApp (mkCId "pot4as5") [gf x1]
  gf (Gpot5 x1) = mkApp (mkCId "pot5") [gf x1]
  gf Gpot51 = mkApp (mkCId "pot51") []
  gf (Gpot5float x1) = mkApp (mkCId "pot5float") [gf x1]
  gf (Gpot5plus x1 x2) = mkApp (mkCId "pot5plus") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "pot4as5" -> Gpot4as5 (fg x1)
      Just (i,[x1]) | i == mkCId "pot5" -> Gpot5 (fg x1)
      Just (i,[]) | i == mkCId "pot51" -> Gpot51 
      Just (i,[x1]) | i == mkCId "pot5float" -> Gpot5float (fg x1)
      Just (i,[x1,x2]) | i == mkCId "pot5plus" -> Gpot5plus (fg x1) (fg x2)


      _ -> error ("no Sub1000000000000 " ++ show t)

instance Gf GTemp where
  gf GpastSimul = mkApp (mkCId "pastSimul") []
  gf GpresAnt = mkApp (mkCId "presAnt") []
  gf GpresSimul = mkApp (mkCId "presSimul") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "pastSimul" -> GpastSimul 
      Just (i,[]) | i == mkCId "presAnt" -> GpresAnt 
      Just (i,[]) | i == mkCId "presSimul" -> GpresSimul 


      _ -> error ("no Temp " ++ show t)

instance Gf GV2 where
  gf (LexV2 x) = mkApp (mkCId x) []

  fg t =
    case unApp t of

      Just (i,[]) -> LexV2 (showCId i)
      _ -> error ("no V2 " ++ show t)

instance Gf GVP where
  gf (GAdvVP x1 x2) = mkApp (mkCId "AdvVP") [gf x1, gf x2]
  gf (GComplV2 x1 x2) = mkApp (mkCId "ComplV2") [gf x1, gf x2]
  gf (GComplVV x1 x2) = mkApp (mkCId "ComplVV") [gf x1, gf x2]
  gf (GPassV2 x1) = mkApp (mkCId "PassV2") [gf x1]
  gf (GUseComp x1) = mkApp (mkCId "UseComp") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "AdvVP" -> GAdvVP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ComplV2" -> GComplV2 (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ComplVV" -> GComplVV (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "PassV2" -> GPassV2 (fg x1)
      Just (i,[x1]) | i == mkCId "UseComp" -> GUseComp (fg x1)


      _ -> error ("no VP " ++ show t)

instance Gf GVPI where
  gf (GMkVPI x1) = mkApp (mkCId "MkVPI") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "MkVPI" -> GMkVPI (fg x1)


      _ -> error ("no VPI " ++ show t)

instance Gf GVPS where
  gf (GConjVPS x1 x2) = mkApp (mkCId "ConjVPS") [gf x1, gf x2]
  gf (GMkVPS x1 x2 x3) = mkApp (mkCId "MkVPS") [gf x1, gf x2, gf x3]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjVPS" -> GConjVPS (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "MkVPS" -> GMkVPS (fg x1) (fg x2) (fg x3)


      _ -> error ("no VPS " ++ show t)

instance Gf GVV where
  gf (LexVV x) = mkApp (mkCId x) []

  fg t =
    case unApp t of

      Just (i,[]) -> LexVV (showCId i)
      _ -> error ("no VV " ++ show t)

instance Show GA2

instance Gf GA2 where
  gf _ = undefined
  fg _ = undefined



instance Show GAdA

instance Gf GAdA where
  gf _ = undefined
  fg _ = undefined



instance Show GAnt

instance Gf GAnt where
  gf _ = undefined
  fg _ = undefined



instance Show GQS

instance Gf GQS where
  gf _ = undefined
  fg _ = undefined



instance Show GTense

instance Gf GTense where
  gf _ = undefined
  fg _ = undefined



instance Show GV

instance Gf GV where
  gf _ = undefined
  fg _ = undefined



instance Show GVS

instance Gf GVS where
  gf _ = undefined
  fg _ = undefined




instance Compos Tree where
  compos r a f t = case t of
    GConjAP x1 x2 -> r GConjAP `a` f x1 `a` f x2
    GPositA x1 -> r GPositA `a` f x1
    GAdAdv x1 x2 -> r GAdAdv `a` f x1 `a` f x2
    GByVP x1 -> r GByVP `a` f x1
    GConjAdv x1 x2 -> r GConjAdv `a` f x1 `a` f x2
    GPrepNP x1 x2 -> r GPrepNP `a` f x1 `a` f x2
    GAdjCN x1 x2 -> r GAdjCN `a` f x1 `a` f x2
    GComplN2 x1 x2 -> r GComplN2 `a` f x1 `a` f x2
    GSentCN x1 x2 -> r GSentCN `a` f x1 `a` f x2
    GUseN x1 -> r GUseN `a` f x1
    GExistCN x1 -> r GExistCN `a` f x1
    GExistNP x1 -> r GExistNP `a` f x1
    GCompAP x1 -> r GCompAP `a` f x1
    GCompAdv x1 -> r GCompAdv `a` f x1
    GCompNP x1 -> r GCompNP `a` f x1
    GIDig x1 -> r GIDig `a` f x1
    GIIDig x1 x2 -> r GIIDig `a` f x1 `a` f x2
    GConjNP x1 x2 -> r GConjNP `a` f x1 `a` f x2
    GDetCN x1 x2 -> r GDetCN `a` f x1 `a` f x2
    GGerundNP x1 -> r GGerundNP `a` f x1
    GMassNP x1 -> r GMassNP `a` f x1
    GUsePron x1 -> r GUsePron `a` f x1
    Gnum x1 -> r Gnum `a` f x1
    GBecauseS x1 x2 -> r GBecauseS `a` f x1 `a` f x2
    GConjS x1 x2 -> r GConjS `a` f x1 `a` f x2
    GNoEvidenceThat x1 -> r GNoEvidenceThat `a` f x1
    GNoEvidenceThat_ x1 -> r GNoEvidenceThat_ `a` f x1
    GPredVPS x1 x2 -> r GPredVPS `a` f x1 `a` f x2
    GUseCl x1 x2 x3 -> r GUseCl `a` f x1 `a` f x2 `a` f x3
    Gand x1 -> r Gand `a` f x1
    Gcondition x1 -> r Gcondition `a` f x1
    GfullStop x1 -> r GfullStop `a` f x1
    GEmbedSC x1 x2 -> r GEmbedSC `a` f x1 `a` f x2
    Gpot0 x1 -> r Gpot0 `a` f x1
    Gpot0as1 x1 -> r Gpot0as1 `a` f x1
    Gpot1 x1 -> r Gpot1 `a` f x1
    Gpot1plus x1 x2 -> r Gpot1plus `a` f x1 `a` f x2
    Gpot1to19 x1 -> r Gpot1to19 `a` f x1
    Gpot1as2 x1 -> r Gpot1as2 `a` f x1
    Gpot2 x1 -> r Gpot2 `a` f x1
    Gpot2plus x1 x2 -> r Gpot2plus `a` f x1 `a` f x2
    Gpot2as3 x1 -> r Gpot2as3 `a` f x1
    Gpot3 x1 -> r Gpot3 `a` f x1
    Gpot3float x1 -> r Gpot3float `a` f x1
    Gpot3plus x1 x2 -> r Gpot3plus `a` f x1 `a` f x2
    Gpot3as4 x1 -> r Gpot3as4 `a` f x1
    Gpot4 x1 -> r Gpot4 `a` f x1
    Gpot4float x1 -> r Gpot4float `a` f x1
    Gpot4plus x1 x2 -> r Gpot4plus `a` f x1 `a` f x2
    Gpot4as5 x1 -> r Gpot4as5 `a` f x1
    Gpot5 x1 -> r Gpot5 `a` f x1
    Gpot5float x1 -> r Gpot5float `a` f x1
    Gpot5plus x1 x2 -> r Gpot5plus `a` f x1 `a` f x2
    GAdvVP x1 x2 -> r GAdvVP `a` f x1 `a` f x2
    GComplV2 x1 x2 -> r GComplV2 `a` f x1 `a` f x2
    GComplVV x1 x2 -> r GComplVV `a` f x1 `a` f x2
    GPassV2 x1 -> r GPassV2 `a` f x1
    GUseComp x1 -> r GUseComp `a` f x1
    GMkVPI x1 -> r GMkVPI `a` f x1
    GConjVPS x1 x2 -> r GConjVPS `a` f x1 `a` f x2
    GMkVPS x1 x2 x3 -> r GMkVPS `a` f x1 `a` f x2 `a` f x3
    GListAP x1 -> r GListAP `a` foldr (a . a (r (:)) . f) (r []) x1
    GListAdv x1 -> r GListAdv `a` foldr (a . a (r (:)) . f) (r []) x1
    GListNP x1 -> r GListNP `a` foldr (a . a (r (:)) . f) (r []) x1
    GListS x1 -> r GListS `a` foldr (a . a (r (:)) . f) (r []) x1
    GListVPS x1 -> r GListVPS `a` foldr (a . a (r (:)) . f) (r []) x1
    _ -> r t

class Compos t where
  compos :: (forall a. a -> m a) -> (forall a b. m (a -> b) -> m a -> m b)
         -> (forall a. t a -> m (t a)) -> t c -> m (t c)

composOp :: Compos t => (forall a. t a -> t a) -> t c -> t c
composOp f = runIdentity . composOpM (Identity . f)

composOpM :: (Compos t, Monad m) => (forall a. t a -> m (t a)) -> t c -> m (t c)
composOpM = compos return ap

composOpM_ :: (Compos t, Monad m) => (forall a. t a -> m ()) -> t c -> m ()
composOpM_ = composOpFold (return ()) (>>)

composOpMonoid :: (Compos t, Monoid m) => (forall a. t a -> m) -> t c -> m
composOpMonoid = composOpFold mempty mappend

composOpMPlus :: (Compos t, MonadPlus m) => (forall a. t a -> m b) -> t c -> m b
composOpMPlus = composOpFold mzero mplus

composOpFold :: Compos t => b -> (b -> b -> b) -> (forall a. t a -> b) -> t c -> b
composOpFold z c f = unC . compos (\_ -> C z) (\(C x) (C y) -> C (c x y)) (C . f)

newtype C b a = C { unC :: b }
