abstract Diff = {
    cat
        S ;
        [S]{2} ;

    fun
        mkS : String -> S ;
        MEANS : String -> String -> S ;
        INCLUDES : String -> String -> S ;
        MEANS_EXCEPT : S -> S -> S ;
        MEANS_EXCEPT_ : [S] -> [S] -> S ;
        BUT_DOES_NOT_INCLUDE : String -> S ;
        ConjS : [S] -> S ;


}