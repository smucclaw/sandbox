module Interpretation where

import Logics

-- from assembly logic to real logic. The result can be any of the three:

data PropCat = PProp Prop | PSet Set | PInd Ind

formula2prop :: Formula -> Either String PropCat
formula2prop formula = case formula of
  Modal m f -> do
    pf <- formula2prop f
    case pf of
      PProp p -> return $ PProp $ Mod m p
      _ -> return pf --- ignoring modality, which is just a label
  Atomic c a  -> case c of
    CProp -> return $ PProp $ Pred a []
    CSet -> return $ PSet $ Family a []
    CInd -> return $ PInd $ App a []
    CPred -> return $ PProp $ Pred a []
    _ -> Left $ "no Prop, Set, or Ind from " ++ show formula
  Conjunction c cw fs -> case c of
    CProp -> do
      pfs <- mapM f2prop fs
      return $ PProp $ (fst (iConjWord cw)) pfs
    CSet -> do
      pfs <- mapM f2set fs
      return $ PSet $ (snd (iConjWord cw)) pfs
    _ -> Left $ "expected Prop or Set, found"  ++ show formula

  Implication f g -> do
    pf <- f2prop f
    pg <- f2prop g
    return $ PProp $ Impl pf pg
  Conditional a b -> formula2prop (Implication b a)
  Negation CProp f -> do
    pf <- f2prop f
    return $ PProp $ Neg pf

  Application c f q -> case c of
    CSet -> do
      pf <- f2fam f
      let epp = formula2prop q
      case epp of
        Right (PSet s) -> return $ PSet $ Comprehension s $ \x -> set2prop (pf x)
        _ -> do
          pq <- f2quant q
          return $ PProp $ pq $ \x -> set2prop (pf x) ----
    _ -> Left $ "unsupported Application: " ++ show formula
  

  Predication q f -> do
    pq <- f2quant q
    pf <- f2pred f
    return $ PProp $ pq pf

----  Assignment r x f -> 
----  Action f x -> 
  Modification c a p -> case c of
    CSet -> do
      sa <- f2set a
      pp <- f2pred p
      return $ PSet $ Comprehension sa pp
    _ -> Left $ "set expected for Modification, found: " ++ show formula
  
  Qualification CNone _ f -> formula2prop f 
----  Modalization s f -> 

  Quantification q f | elem q ["A", "AN", "ANY"] -> do
    sf <- f2set f
    return $ PSet sf

  Sequence c_ [f] -> formula2prop f ---- check c wrt f?
  Sequence c fs -> formula2prop $ Conjunction c AND fs ----
  Means c a b -> do
    pa <- formula2prop a
    pb <- formula2prop b
    case (pa, pb) of
      (PProp aa, PProp ab) -> return $ PProp $ Equi aa ab
      (PSet aa, PSet ab) -> return $ PProp $ Equals aa ab
      (PInd aa, PInd ab) -> return $ PProp $ Equal aa ab
      _ -> Left $ "common type expected in: " ++ show formula

  Title s  -> return $ PProp $ Pred s []

  _ -> Left $ "not yet: " ++ show formula
 where
   f2prop f =  do
     pf <- formula2prop f
     case pf of
       PProp p -> return p
       _ -> Left $ "no Prop from " ++ show f
   f2set f =  do
     case formula2prop f of
       Right pf -> case pf of
         PSet p -> return p
         _ -> Left $ "no Set from " ++ show f
       _ -> case f of
         Quantification q set | elem q ["A", "AN", "ANY"] -> f2set f
         _ -> Left $ "still no Set from " ++ show f
   f2ind f =  do
     pf <- formula2prop f
     case pf of
       PInd p -> return p
       _ -> Left $ "no Ind from " ++ show f

   f2quant :: Formula -> Either String ((Ind -> Prop) -> Prop) 
   f2quant formula = case formula of
     Quantification s f -> do
       pf <- f2set f
       case s of
         _ | elem s ["A", "AN", "ANY"]  -> return $ \pred -> Exist pf (\x -> pred x)
         _ | elem s ["THAT", "THIS", "THE"]  -> return $ \pred -> pred (Iota pf)
         "EACH" -> return $ \pred -> Univ  pf (\x -> pred x)
     Modification CQuant np rs -> do
       quant <- f2quant np
       pred  <- f2pred rs
       return $ \p -> quant (\x -> Conj [p x, pred x])
     Qualification CNone _ f -> f2quant f
     _ -> do
       pf <- formula2prop formula
       case pf of
         PInd px -> return $ \pred -> pred px
         PSet ps -> return $ \pred -> Exist ps pred
         PProp pp -> return $ \pred -> Exist Universal $ \x -> Conj [pp, pred x] --- ??

   f2pred :: Formula -> Either String (Ind -> Prop) 
   f2pred formula = case formula of
     Atomic CPred f -> return $ \x -> Pred f [x]
     Conjunction cat_ cw fs -> do
       pfs <- mapM f2pred fs
       return $ \x -> fst (iConjWord cw) [f x | f <- pfs]
     Negation CPred f -> do
       pf <- f2pred f
       return $ \x -> Neg (pf x)
     Qualification CPred s a -> do
       fa <- f2prop a
       return $ \x -> fa ---- there should be an argument place for x
     Qualification CNone _ a -> f2pred a

     
     Modification CPred f rs -> do
         pf <- f2pred f
         prs <- f2pred rs
         return $ \x -> Conj [pf x, prs x]
     Action f q -> do
         pf <- f2pred2 f
         pq <- f2quant q
         return $ \x -> pq (\y -> pf x y)
         
     Modalization m f -> do
         pf <- f2pred f
         case m of
             -- "deontic" modalities as implications of breach
             "MAY"  -> return $ \x -> Neg (Impl (pf x) (breachPred x))
             "MUST" -> return $ \x -> Impl (Neg (pf x)) (breachPred x)
             _ -> return pf ---- covers HAS REASON TO, IS DEEMED TO
     Sequence _ [f] -> f2pred f
     Sequence CPred fs -> f2pred $ Conjunction CPred AND fs

     Modal m_ f -> f2pred f -- modality is just a label

     _ -> Left $ "no predicate from: " ++ show formula

   f2pred2 :: Formula -> Either String (Ind -> Ind -> Prop) 
   f2pred2 formula = case formula of
     Atomic CPred2 f -> return $ \x y -> Pred f [x, y]
     Conjunction cat_ cw fs -> do
       pfs <- mapM f2pred2 fs
       return $ \x y -> fst (iConjWord cw) [pf x y | pf <- pfs]
     _ -> Left $ "no 2-place predicate from: " ++ show formula

   f2fam :: Formula -> Either String (Ind -> Set)
   f2fam formula = case formula of
     Atomic CFam a -> return $ \x -> Family a [x]
     Conjunction CFam cw fs -> do
       pfs <- mapM f2fam fs
       return $ \x -> snd (iConjWord cw) [pf x | pf <- pfs]
     Modification CFam mo fam -> do
       pmo <- f2pred mo
       pfam <- f2fam fam
       return $ \x -> Comprehension (pfam x) (\y -> pmo y)
     _ -> Left $ "no family from: " ++ show formula


   iConjWord cw = case cw of
     AND -> (Conj, Intersection)
     OR -> (Disj, Union)

prPropCat pc = case pc of
  PProp prop -> prProp prop
  PSet set -> prSet 0 0 set
  PInd ind -> prInd 0 ind

formula1 = Predication (Quantification "EACH" (Atomic CSet "N")) (Atomic CPred "Even")
formula2 =
  Predication (Quantification "EACH" (Atomic CSet "N"))
    (Conjunction CPred OR [(Atomic CPred "Even"), (Atomic CPred "Odd")])

testTrans formula = do
  let ff = formula2prop formula
  case ff of
    Right (PProp p) -> do
      putStrLn $ prProp p
      putStrLn $ tptpProp p
    Right pp -> putStrLn $ prPropCat pp
    Left s -> putStrLn s
    

