concrete naiveNumbersEng of naiveNumbers = open Prelude in {

{-

This grammar is for day 02 of advent of GF.

This grammar cannot generate:

The number of Class H shares is the sum of original and new shares. (Without "the" in front of original and new)
The number of Class D shares is the sum of the original shares and the number of new shares. (Without the in front of "number of new shares")

-}

    lincat
      S = {s : Str} ;
      Expr, ComplexExpr = Number ;
      UnknownAmount = {s: Str} ;
      Share = {s: Str} ;
    lin
    -- Arithmetic
      One = mkNumber "one" ;
      Two = mkNumber "two" ;
      Three = mkNumber "three" ;
      Four = mkNumber "four" ;
      Five = mkNumber "five" ;
      Six = mkNumber "six" ;
      Seven = mkNumber "seven" ;
      Eight = mkNumber "eight" ;
      Nine = mkNumber "nine" ;
      Ten = mkNumber "ten" ;
      
      Sum a b = {s = a.embedded ++ "plus" ++ b.embedded ; embedded =  "the sum of" ++ a.embedded ++ "and" ++ b.embedded} ;
      Minus a b = {s = a.embedded ++ "minus" ++ b.embedded ; embedded = b.embedded ++ "less" ++ a.embedded} ;
      Multiply a b = {s = a.embedded ++ "multiplied by" ++ b.embedded ; embedded = "the product of" ++ a.embedded ++ "and" ++ b.embedded} ;
      Divide a b = {s = a.embedded ++ "divided by" ++ b.embedded; embedded = b.embedded ++ "dividing" ++ a.embedded} ;
      Equals a b = ss (a.s ++ "equals" ++ b.s) ; -- same as Equals a b {s = a.s ++ "equals" ++ b.s} ;

      MkComp a = a ;

    -- Alpha, Beta, Gamma, Delta
      Alpha = ss "Alpha" ;
      Beta = ss "Beta" ;
      Gamma = ss "Gamma" ;
      Delta = ss "Delta" ;

      MkGreater amt num1 num2 = {s = "The value of " ++ amt.s ++ "shall be given by the greater of" ++ num1.embedded ++ "and" ++ num2.embedded} ;
      MkLesser amt num1 num2 = {s = "The value of " ++ amt.s ++ "shall be given by the lesser of" ++ num1.embedded ++ "and" ++ num2.embedded} ;

    -- Original and new Shares
      A = ss "Class A Shares" ;
      B = ss "Class B Shares" ;
      C = ss "Class C Shares" ;
      D = ss "Class D Shares" ;
      E = ss "Class E Shares" ;
      F = ss "Class F Shares" ;
      G = ss "Class G Shares" ;
      H = ss "Class H Shares" ;
      I = ss "Class I Shares" ;
      J = ss "Class J Shares" ;
      K = ss "Class K Shares" ;
      L = ss "Class L Shares" ;
      M = ss "Class M Shares" ;
      N = ss "Class N Shares" ;
      O = ss "Class O Shares" ;
      P = ss "Class P Shares" ;
      Q = ss "Class Q Shares" ;
      R = ss "Class R Shares" ;
      SLetter = ss "Class S Shares" ;
      T = ss "Class T Shares" ;
      U = ss "Class U Shares" ;
      V = ss "Class V Shares" ;
      W = ss "Class W Shares" ;
      X = ss "Class X Shares" ;
      Y = ss "Class Y Shares" ;
      Z = ss "Class Z Shares" ;
      OriginalShares = ss "original shares" ;
      NewShares = ss "new shares" ;

      EasyCompareShares share int = {s = "The number of" ++ share.s ++ "is" ++ int.s} ; --For some reason, the 'int' part only generates '999'
      CompareSharesThe share comp1 comp2 = {s = "The number of" ++ share.s ++ "is the sum of the" ++ comp1.s ++ "and" ++ comp2.s} ;
      CompareShares share comp1 comp2 = {s = "The number of" ++ share.s ++ "is the sum of" ++ comp1.s ++ "and" ++ comp2.s} ;
    oper
    -- Arithmetic part
      Number: Type = {s, embedded: Str} ;
      mkNumber : Str -> Number = \str -> {s, embedded = str}; 

}