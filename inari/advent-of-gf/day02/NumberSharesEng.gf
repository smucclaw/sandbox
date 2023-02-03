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
    Value = LinValue ;
  oper
    LinKind : Type = {s : CN ; det : DetType} ;
    LinValue : Type = {s : NP ; isSimple : Bool} ;
  param
    DetType = CanDet | NoDet ;

-- Numbers
  lin
    -- : Item -> Number -> Comment ;  -- {The number of original shares} is {1000}
    PredNumber numshares hundred = mkS (mkCl numshares hundred) ;
    PredNumberVerbose numshares hundred = mkS (mkCl numshares (shallBeGivenBy hundred)) ;

    -- : Kind -> Item ; -- the original shares
    The kind = case kind.det of {
      NoDet => mkNP kind.s ; -- Gamma, not *the Gamma
      CanDet => the kind.s   -- the new shares
      } ;
    NumberOf kind = the (N.PossNP number_CN (optThe kind.s)) ;
    ValueOf kind = the (N.PossNP value_CN (optThe kind.s)) ;

    -- : Quality -> ModKind -> Kind ; -- class A shares, original shares , *original Gamma
    Mod quality kind = {
      s = mkCN quality kind ;
      det = CanDet } ;

    -- : ModKind
    Shares = mkCN (mkN "shares" "shares") ; -- Always in plural! TODO: should singular be allowed?

    -- : Kind
    Alpha = noDetKind (mkN "Alpha" "Alpha") ;
    Beta = noDetKind (mkN "Beta" "Beta") ; -- we don't want to accidentally linearise "Deltas", "Gammas" etc.
    Delta = noDetKind (mkN "Delta" "Delta") ;
    Gamma = noDetKind (mkN "Gamma" "Gamma") ;
    ConversionPrice = detKind (mkN "conversion price") ;
    PurchasePrice = detKind (mkN "purchase price") ;

    -- : Quality
    New = mkAP (mkA "new") ;
    Original = mkAP (mkA "original") ;

    -- : String -> Quality
    Class x = mkAP (invarA ("Class" ++ x.s)) ;

    -- : Int -> Number ;
    NumInt int = (numInt int).s ;
    -- : Numeral -> Number ;
    NumNumeral num = (numNumeral num).s ;

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
    optThe : CN -> NP = \cn -> mkNP cn | the cn ;

    detKind : N -> LinKind = \n -> {
      s = mkCN n ;
      det = CanDet ;
      } ;
    noDetKind : N -> LinKind = \n -> detKind n ** {det = NoDet} ;

    numInt : SS -> LinValue = \int -> {s = symb int ; isSimple = True} ;
    numNumeral : Numeral -> LinValue = \num -> {s = mkNP (mkDet <num : Numeral>) ; isSimple = True} ; -- two hundred


    -- lexicon
    shall_VV : VV = auxVV (mkV "shall" "shall" "shall" "shall" "shall") ; --- TODO
    number_CN : CN = mkCN (mkN "number") ;
    value_CN : CN = mkCN (mkN "value") ;
    sum_CN : CN = mkCN (mkN "sum") ;

    lincat
      [Item] = [NP] ;
    lin
      BaseItem = C.BaseNP ;
      ConsItem = C.ConsNP ;

    lincat
      [Value] = ListNP ** {isSimple : Bool} ;
    lin
      BaseValue x y = C.BaseNP x.s y.s ** {isSimple = andB x.isSimple y.isSimple} ;
      ConsValue x xs = C.ConsNP x.s xs ** {isSimple = andB x.isSimple xs.isSimple} ;

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
----------------------------------------------------------------------
-- Values
  lin
    -- : Item -> Value -> Comment ;
    PredValue val hundred = mkS (mkCl val hundred.s) ;
    PredValueVerbose val hundred = mkS (mkCl val (shallBeGivenBy hundred.s)) ;
    -- : Item -> [Value] -> Comment ; -- {item} shall be given by the greater of {twelwe} and {twenty}
    PredValueGreaterOf item vals = PredValueVerbose item (xerOf greater_CN vals) ;
    PredValueLesserOf item vals = PredValueVerbose item (xerOf lesser_CN vals) ;

    -- Pure arithmetics
    ValInt = numInt ;
    ValNumeral = numNumeral ;
    ValKind k = {s = mkNP k.s ; isSimple = True} ;
    ValItem i = {s = i ; isSimple = False} ;

    -- : Value -> Value -> Value ; -- Five plus five / the sum of two and three
    SumValue,
    SumValueItem,
    SumValueItemVal,
    SumValueValItem = binOpVal "sum" "plus" ;

    -- : Value -> Value -> Value ; -- Five times five / six multiplied by two / four multiplied by the sum of two and three
    ProductValue,
    ProductValueItem,
    ProductValueItemVal,
    ProductValueValItem = binOpVal "product" "multiplied by" ;

    -- : Value -> Numeral -> Value ; -- twenty {less,plus,multiplied by} ten percent
    SubtractPercent twenty ten = percentValue "less" twenty ten ;
    AddPercent twenty ten = percentValue "plus" twenty ten ;
    MultiplyPercent twenty ten = percentValue "multiplied by" twenty ten ;

    -- : Value -> Int -> Value ; -- Gamma {less,plus,multiplied by} 10 %
    SubtractPercentInt twenty ten = percentValue "less" twenty ten ;
    AddPercentInt twenty ten = percentValue "plus" twenty ten ;
    MultiplyPercentInt twenty ten = percentValue "multiplied by" twenty ten ;

  oper
    binOpVal = overload {
      binOpVal : Str -> Str -> LinValue -> LinValue -> LinValue = \sum,plus,two,three -> 
        let sumTwoThree : NP = the (N.PossNP (mkCN (mkN sum)) (mkNP and_Conj two.s three.s)) ;
            plus_Conj : Conj = mkConj plus ;
            twoPlusThree : NP = mkNP plus_Conj two.s three.s ;
        in {s = sumTwoThree | twoPlusThree ; isSimple = False} ;
      binOpVal : Str -> Str -> LinValue -> NP -> LinValue = \sum,plus,two,three -> 
        let sumTwoThree : NP = the (N.PossNP (mkCN (mkN sum)) (mkNP and_Conj two.s three)) ;
            plus_Conj : Conj = mkConj plus ;
            twoPlusThree : NP = mkNP plus_Conj two.s three ;
        in {s = sumTwoThree | twoPlusThree ; isSimple = False} ;
      binOpVal : Str -> Str -> NP -> LinValue -> LinValue = \sum,plus,two,three -> 
        let sumTwoThree : NP = the (N.PossNP (mkCN (mkN sum)) (mkNP and_Conj two three.s)) ;
            plus_Conj : Conj = mkConj plus ;
            twoPlusThree : NP = mkNP plus_Conj two three.s ;
        in {s = sumTwoThree | twoPlusThree ; isSimple = False} ;
      binOpVal : Str -> Str -> NP -> NP -> LinValue = \sum,plus,two,three -> 
        let sumTwoThree : NP = the (N.PossNP (mkCN (mkN sum)) (mkNP and_Conj two three)) ;
            plus_Conj : Conj = mkConj plus ;
            twoPlusThree : NP = mkNP plus_Conj two three ;
        in {s = sumTwoThree | twoPlusThree ; isSimple = False}
    } ;

    percentValue = overload {
      percentValue : Str -> LinValue -> SS -> LinValue = \less,twenty,ten ->
        {s = mkNP twenty.s (percentAdvInt less ten) ; isSimple = False} ;
      percentValue : Str -> LinValue -> Numeral -> LinValue = \less,twenty,ten ->
        {s = mkNP twenty.s (percentAdv less ten) ; isSimple = False} 
    } ;
      
    greater_CN : CN = mkCN (mkN "greater" "greater") ;
    lesser_CN : CN = mkCN (mkN "lesser" "lesser") ;

    oxfordCommaNP : Conj -> NP -> NP -> NP = \and,two,three -> 
      let commaAdv : Adv = ParadigmsEng.mkAdv "," ;
          commaTwo : NP = mkNP two commaAdv ;
       in mkNP and commaTwo three ;

    oxfordCommaListNP : Conj -> ListValue -> NP = \and,vals -> 
      let valsWithComma : ListValue = case vals.isSimple of {
            True => vals  ;
            False => vals ** {s1 = \\cas => vals.s1 ! cas ++ bindComma}
            } ;
       in mkNP and <valsWithComma : ListNP> ;

    -- : Value -> Value -> Value ; -- {greater,lesser} of twelwe and twenty
    xerOf : CN -> ListValue -> LinValue = \cn,vals -> {
      s = the (N.PossNP cn (oxfordCommaListNP and_Conj vals)) ;
      isSimple = False 
      } ;

    percentAdv : Str -> Numeral -> Adv = \less,ten -> lin Adv {s = less ++ (mkUtt (mkCard ten)).s ++ "percent"} ;

    percentAdvInt : Str -> SS -> Adv = \less,ten -> lin Adv {s = less ++ ten.s ++ "%"} ;

}