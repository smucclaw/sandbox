concrete NumberSharesEng of NumberShares = open Prelude, SyntaxEng, ParadigmsEng, (N=NounEng) in {
  lincat
    Comment = S ;
    Item = NP ;
    Kind = LinKind ; -- needs custom params to prevent "the Gamma"
    Quality = AP ;
    Number = NP ;
  oper
    LinKind : Type = {s : CN ; mod : ModType} ;
  param
    ModType = CanMod | NoMod ;

  lin
    -- : Item -> Number -> Comment ;  -- {The number of original shares} is {1000}
    Pred numshares hundred = mkS (mkCl numshares hundred) ;
    PredVerbose numshares hundred = mkS (mkCl numshares (shallBeGivenBy hundred)) ;

    -- : Kind -> Item ; -- the original shares
    The kind = case kind.mod of {
      NoMod => mkNP kind.s ; -- Gamma, not *the Gamma
      CanMod => the kind.s   -- the value of Gamma
      } ;
    NumberOf kind = the (N.PossNP number_CN (mkNP kind.s)) ;
    ValueOf kind = the (N.PossNP value_CN (mkNP kind.s)) ;
    -- : Item
    ConversionPrice = the (mkCN (mkN "conversion price")) ;
    PurchasePrice = the (mkCN (mkN "purchase price")) ;

    -- : Quality -> Kind -> Kind ; -- class A shares, original shares
    Mod quality kind = kind ** {
      s = case kind.mod of {
            CanMod => mkCN quality kind.s ;
            NoMod => mkCN (mkN nonExist) }
      } ;
    Shares = modKind (mkN "shares" "shares") ; -- Always in plural! TODO: should singular be allowed?
    Beta = noModKind (mkN "Beta") ;
    Delta = noModKind (mkN "Delta") ;
    Gamma = noModKind (mkN "Gamma") ;

    -- : Quality
    New = mkAP (mkA "new") ;
    Original = mkAP (mkA "original") ;

    -- : String -> Quality
    Cls x = mkAP (invarA ("Class" ++ x.s)) ;

    -- : Number
    Thousand = mkNP (mkN "1000" "1000") ;
    TwoHundred = mkNP (mkN "two hundred" "two hundred") ;
    -- : Item -> Item -> Number
    SumOf a b = the (N.PossNP sum_CN (mkNP and_Conj a b)) ;
    {- Later variants:
      cat
        [Item]{2} ;
        [Kind]{2} ;
        [Quality]{2} ;
        : [Kind] -> Number ; -- sum of original shares and Class A shares
        : [Quality] -> Kind -> Number ; -- sum of original and new shares
        : ??? --  sum of the number of Class K, Class G, and Class H shares (needs to allow for [Quality] in Mod already)
    -}

  oper
    shallBeGivenBy : NP -> VP = \np ->
      let givenByNP_Adv : Adv = SyntaxEng.mkAdv (mkPrep "given by") np ;
       in mkVP shall_VV (mkVP givenByNP_Adv) ;

    the : CN -> NP = \cn -> mkNP theSg_Det cn ;

    modKind : N -> LinKind = \n -> {
      s = mkCN n ;
      mod = CanMod ;
      } ;
    noModKind : N -> LinKind = \n -> modKind n ** {mod = NoMod} ;

    -- lexicon
    shall_VV : VV = auxVV (mkV "shall" "shall" "shall" "shall" "shall") ; --- TODO
    number_CN : CN = mkCN (mkN "number") ;
    value_CN : CN = mkCN (mkN "value") ;
    sum_CN : CN = mkCN (mkN "sum") ;


}