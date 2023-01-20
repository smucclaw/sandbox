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

    SumOfItem : [Item] -> Number ; -- the sum of [the original shares] and [the number of new shares]
    SumOfKind : [Kind] -> Number ; -- the sum of [original shares] and [Class A shares]
    SumOfQuality : [Quality] -> Kind -> Number ; -- the sum of [Class B and Class C] [shares]
                                                -- Sums of Kind and Quality allow optional [the] and [the number of] in linearisations:
                                                -- the sum of (the number of) [Class K, Class G, and Class H] [shares]
                                                -- the sum of (the) [Class I and (the) Class J] [shares]

    -- SumOfQuality : Determiner -> [Quality] -> Kind -> Number ; -- the sum of [Class B and Class C] [shares]
    -- Value : OfWhat ;
    -- Number : OfWhat ;

-- List categories
    cat
      [Item]{2} ;
      [Kind]{2} ;
      [Quality]{2} ;

    -- Workarounds to allow optional repetition of the in ellipsis
    fun
      BaseQualityDet : Quality -> Quality -> [Quality] ; -- to allow "[the Class I] and [the Class J]"
      BaseQualityDetLeft : Quality -> Quality -> [Quality] ; --  "[the Class I] and [tClass J]"
      BaseQualityDetRight : Quality -> Quality -> [Quality] ; -- "[Class I] and [the Class J]"
      ConsQualityDet : Quality -> [Quality] -> [Quality] ; -- "[the Class I], [the Class J] and [the class K]"


}