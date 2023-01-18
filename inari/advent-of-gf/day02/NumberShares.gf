abstract NumberShares = {

  flags startcat = Comment ;
  cat
    Comment ;
    Item ;
    Kind ;
    Quality ;
    Number ;
  fun
    Pred : Item -> Number -> Comment ;  -- {The number of original shares} is {1000}
    PredVerbose : Item -> Number -> Comment ; -- {item} shall be given by {number} -- just like Pred but verbose copula

    -- Item
    The : Kind -> Item ; -- the original shares
    NumberOf : Kind -> Item ; -- number of {Class A, new, original, …} shares
    ValueOf : Kind -> Item ;  -- value of Gamma
    ConversionPrice,
    PurchasePrice : Item ; -- standalone Items, not composed of generalisable subparts

    -- Kind
    Mod : Quality -> Kind -> Kind ; -- class A shares, original shares
    Shares : Kind ; -- can be modified and quantified
    Beta,
    Delta,
    Gamma : Kind ; -- can't be modified—this is handled in concrete syntax!

    -- Quality
    New,
    Original : Quality ;
    Cls : String -> Quality ;  -- Class A

    -- Number
    Thousand : Number ;  -- The number of original shares is 1000.
    TwoHundred : Number ; -- The number of new shares is two hundred.
    SumOf : Item -> Item -> Number ; -- sum of [the original shares] and [the number of new shares]
    {- Later variants:
      cat
        [Item]{2} ;
        [Kind]{2} ;
        [Quality]{2} ;
        : [Kind] -> Number ; -- sum of original shares and Class A shares
        : [Quality] -> Kind -> Number ; -- sum of original and new shares
        : ??? --  sum of the number of Class K, Class G, and Class H shares (needs to allow for [Quality] in Mod already)
    -}

}