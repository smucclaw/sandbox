abstract naiveNumbers = {
    {-
      Ten is five plus five.
      Twelve is six multiplied by two.
      Twenty is four multiplied by the sum of two and three.
      five plus five equals 10 
      -}

    flags startcat = S ; 

    cat
      S ;
      Expr ;
      ComplexExpr ;
      UnknownAmount ; -- Meaning "Alpha, Beta, Gamma, Delta"
      Share ;
    fun
    --   Arithmetic part
      One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten : Expr ;
      MkComp : Expr -> ComplexExpr ;

      Sum, Minus, Multiply, Divide : ComplexExpr -> ComplexExpr -> ComplexExpr ;

      Equals : Expr -> ComplexExpr -> S ; -- This Equals is for numerical equations

    -- Alpha, Beta, Gamma, Delta
    {-
      The value of Alpha shall be given by the greater of twelve and twenty.
      The value of Beta shall be given by the lesser of twelve and twenty.
      The value of Gamma is twenty less ten percent.
      The value of Delta shall be given by Gamma plus ten percent.
    -}
      
      Alpha, Beta, Gamma, Delta : UnknownAmount ;
      MkGreater, MkLesser : UnknownAmount -> ComplexExpr -> ComplexExpr -> S;

    -- Original and new shares
      A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, SLetter, T, U, V, W, X, Y, Z, OriginalShares, NewShares : Share ; --All types of shares

      EasyCompareShares : Share -> Int -> S ; -- "The number of original shares is 1000"
      CompareSharesThe : Share -> Share -> Share -> S ;
      CompareShares : Share -> Share -> Share -> S ;

}