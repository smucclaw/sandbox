concrete NumberSharesEng of NumberShares = NumeralEng ** open
    Prelude
  , SyntaxEng
  , ParadigmsEng
  , SymbolicEng
  , (N=NounEng)
  , (C=ConjunctionEng)
  in {
  lincat
    Comment = S ;
    Item = NP ;
    ModKind = CN ;
    Kind = LinKind ; -- needs custom params to prevent "the Gamma"
    Quality = AP ;
    Number = NP ;
  oper
    LinKind : Type = {s : CN ; det : DetType} ;
  param
    DetType = CanDet | NoDet ;
  lin
    -- : Item -> Number -> Comment ;  -- {The number of original shares} is {1000}
    Pred numshares hundred = mkS (mkCl numshares hundred) ;
    PredVerbose numshares hundred = mkS (mkCl numshares (shallBeGivenBy hundred)) ;

    -- : Kind -> Item ; -- the original shares
    The kind = case kind.det of {
      NoDet => mkNP kind.s ; -- Gamma, not *the Gamma
      CanDet => the kind.s   -- the new shares
      } ;
    NumberOf kind = the (N.PossNP number_CN (mkNP kind.s)) ;
    ValueOf kind = the (N.PossNP value_CN (mkNP kind.s)) ;
    -- : Item
    ConversionPrice = the (mkCN (mkN "conversion price")) ;
    PurchasePrice = the (mkCN (mkN "purchase price")) ;

    -- : Quality -> ModKind -> Kind ; -- class A shares, original shares , *original Gamma
    Mod quality kind = {
      s = mkCN quality kind ;
      det = CanDet } ;
    Shares = mkCN (mkN "shares" "shares") ; -- Always in plural! TODO: should singular be allowed?
    Beta = noDetKind (mkN "Beta" "Beta") ; -- we don't want to accidentally linearise "Deltas", "Gammas" etc.
    Delta = noDetKind (mkN "Delta" "Delta") ;
    Gamma = noDetKind (mkN "Gamma" "Gamma") ;

    -- : Quality
    New = mkAP (mkA "new") ;
    Original = mkAP (mkA "original") ;

    -- : String -> Quality
    Class x = mkAP (invarA ("Class" ++ x.s)) ;

    -- : Int -> Number ;
    NumInt int = symb int ;
    -- : Numeral -> Number ;
    NumNumeral num = mkNP (mkDet <num : Numeral>) ; -- two hundred

    -- [Item] and [Kind] have the same lincat, merge for convenience
    -- : [Item] -> Number ; -- the sum of [the new shares]:Item and [the number of Class A shares]:Item
    -- : [Kind] -> Number ; -- the sum of [original shares]:Kind and [Class A shares]:Kind
    SumOfItem, SumOfKind = \nps -> the (N.PossNP sum_CN (mkNP and_Conj nps)) ;

    --  : [Quality] -> Kind -> Number ; -- the sum of (the number of)? [Class B and Class C] [shares]
    SumOfQuality daps cn =
      let optNumber : Predet = lin Predet {s = ""|"the number of"} ; -- additional fluff, doesn't add to syntax tree
          modShares : NP = mkNP (C.ConjDet and_Conj daps) cn ;
          numOfModShares : NP = mkNP optNumber modShares ;
       in the (N.PossNP sum_CN numOfModShares) ;

  oper
    shallBeGivenBy : NP -> VP = \np ->
      let givenByNP_Adv : Adv = SyntaxEng.mkAdv (mkPrep "given by") np ;
       in mkVP shall_VV (mkVP givenByNP_Adv) ;

    the : CN -> NP = \cn -> mkNP theSg_Det cn ;

    detKind : N -> LinKind = \n -> {
      s = mkCN n ;
      det = CanDet ;
      } ;
    noDetKind : N -> LinKind = \n -> detKind n ** {det = NoDet} ;

    -- lexicon
    shall_VV : VV = auxVV (mkV "shall" "shall" "shall" "shall" "shall") ; --- TODO
    number_CN : CN = mkCN (mkN "number") ;
    value_CN : CN = mkCN (mkN "value") ;
    sum_CN : CN = mkCN (mkN "sum") ;

    lincat
      [Item] = [NP] ;
    lin
      BaseItem = C.BaseNP ;
      ConsItem =C. ConsNP ;

    lincat
      [Kind] = [NP] ;
    lin
      BaseKind cn1 cn2 = C.BaseNP (mkNP cn1.s) (mkNP cn2.s) ;
      ConsKind cn nps = C.ConsNP (mkNP cn.s) nps ;

    lincat
      [Quality] = C.ListDAP ;
    lin
      BaseQuality ap1 ap2 = C.BaseDAP (onlyDAP ap1) (onlyDAP ap2) ;
      ConsQuality ap daps = C.ConsDAP (onlyDAP ap) daps ;

      -- Workarounds to allow optional repetition of the in ellipsis
      -- : Quality -> Quality -> [Quality] ; -- to allow "[(the) Class I] and [(the) Class J]"
      BaseQualityDet ap1 ap2 = C.BaseDAP (detDAP ap1) (detDAP ap2) ;
      BaseQualityDetLeft ap1 ap2 = C.BaseDAP (detDAP ap1) (onlyDAP ap2) ;
      BaseQualityDetRight ap1 ap2 = C.BaseDAP (onlyDAP ap1) (detDAP ap2) ;

      ConsQualityDet ap daps = C.ConsDAP (detDAP ap) daps ;
    oper
      emptyDet : Det = aPl_Det ; --- TODO: only works because we have "shares" in plural and Gamma, Delta etc. are invariable
      onlyDAP : AP -> DAP = \ap -> N.AdjDAP (N.DetDAP emptyDet) ap ;
      detDAP : AP -> DAP = \ap -> N.AdjDAP (N.DetDAP theSg_Det) ap ;

}