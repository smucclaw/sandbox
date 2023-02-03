abstract NumberShares = Numeral ** {

  flags startcat = Comment ;
  cat
    Comment ;
    Item ;
    ModKind ;
    Kind ;
    Quality ;
    Number ;
    Value ;
  fun
    PredNumber : Item -> Number -> Comment ;  -- {The number of original shares} is {1000}
    PredNumberVerbose : Item -> Number -> Comment ; -- {item} shall be given by {number} -- just like Pred but verbose copula

    -- Item
    The : Kind -> Item ; -- the original shares
    NumberOf : Kind -> Item ; -- number of {Class A, new, original, …} shares
    ValueOf : Kind -> Item ;  -- value of Gamma

    -- Kind
    Mod : Quality -> ModKind -> Kind ; -- class A shares, original shares

    Shares : ModKind ; -- can be modified and quantified
    Alpha,
    Beta,
    Delta,
    Gamma : Kind ; -- can't be quantified with The—this is handled in concrete syntax!
    ConversionPrice,
    PurchasePrice : Kind ; -- May be quantified, turned into values, but not modified

    -- Quality
    New,
    Original : Quality ;
    Class : String -> Quality ;  -- Class A

    -- Number
    NumInt : Int -> Number ; -- The number of original shares is 1000.
    NumNumeral : Numeral -> Number ; -- The number of new shares is two hundred.

    SumOfItem : [Item] -> Number ; -- the sum of [the original shares] and [the number of new shares]
    SumOfKind : [Kind] -> Number ; -- the sum of [original shares] and [Class A shares]
    SumOfQuality : [Quality] -> ModKind -> Number ; -- the sum of [Class B and Class C] [shares]
                                                -- Sums of Kind and Quality allow optional [the] and [the number of] in linearisations:
                                                -- the sum of (the number of) [Class K, Class G, and Class H] [shares]
                                                -- the sum of (the) [Class I and (the) Class J] [shares]
    -- Pure arithmetics
    PredValue : Item -> Value -> Comment ;  -- {The value of original shares} is {1000}
    PredValueVerbose : Item -> Value -> Comment ; -- {item} shall be given by {number} -- just like Pred but verbose copula
    PredValueGreaterOf : Item -> [Value] -> Comment ; -- {item} shall be given by the greater of {twelwe, twenty}
    PredValueLesserOf : Item -> [Value] -> Comment ;

    ValInt : Int -> Value ; -- (The value of original shares is) 1000
    ValNumeral : Numeral -> Value ; -- (The value of new shares is) two hundred
    ValKind : Kind -> Value ; -- Gamma (plus ten percent)
    ValItem : Item -> Value ; -- the number of new shares (less twenty percent)

    SumValue : Value -> Value -> Value ; -- Five plus five / the sum of two and three
    ProductValue : Value -> Value -> Value ; -- Five times five / six multiplied by two / four multiplied by the sum of two and three

      -- All variants below share the same prefix, so interpreting in Python 
      -- is just a matter of `if f.startswith("SumValue")`
      SumValueItem : Item -> Item -> Value ; -- the number of Class L shares plus Gamma
      ProductValueItem : Item -> Item -> Value ; -- Gamma multiplied by Delta

      SumValueItemVal : Item -> Value -> Value ; -- the number of Class L shares plus three
      ProductValueItemVal : Item -> Value -> Value ; -- Gamma multiplied by the sum of two and three
      SumValueValItem : Value -> Item -> Value ; -- three plus the number of Class L shares
      ProductValueValItem : Value -> Item -> Value ; -- three multiplied by Gamma


    SubtractPercent : Value -> Numeral -> Value ; -- twenty less ten percent
    AddPercent : Value -> Numeral -> Value ; -- Gamma plus ten percent.
    MultiplyPercent : Value -> Numeral -> Value ; -- the purchase price multiplied by ninety percent
    SubtractPercentInt : Value -> Int -> Value ; -- twenty less 10 %
    AddPercentInt : Value -> Int -> Value ; -- Gamma plus 10 %
    MultiplyPercentInt : Value -> Int -> Value ; -- the purchase price multiplied by 90 %
{-
The value of Alpha shall be given by the greater of twelve and twenty

The value of Beta shall be given by the lesser of twelve and twenty.

The value of Gamma is twenty less ten percent.

The value of Delta shall be given by Gamma plus ten percent.

The value of the Class L shares shall be given by the lesser of the conversion price multiplied by the number of Class L shares, and the purchase price multiplied by the number of new shares less twenty percent.

The conversion price shall be given by the lesser of the purchase price multiplied by 90 % , and the sum of two thousand and five hundred and two hundred.
-}
-- List categories
    cat
      [Item]{2} ;
      [Kind]{2} ;
      [Quality]{2} ;
      [Value]{2} ;

    -- Workarounds to allow optional repetition of the in ellipsis
    fun
      BaseQualityDet : Quality -> Quality -> [Quality] ; -- to allow "[the Class I] and [the Class J]"
      BaseQualityDetLeft : Quality -> Quality -> [Quality] ; --  "[the Class I] and [tClass J]"
      BaseQualityDetRight : Quality -> Quality -> [Quality] ; -- "[Class I] and [the Class J]"
      ConsQualityDet : Quality -> [Quality] -> [Quality] ; -- "[the Class I], [the Class J] and [the class K]"


}