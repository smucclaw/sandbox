abstract Diff = {
    cat
        S ;
        [S]{2} ;

    fun
        mkS : String -> S ;
        MEANS : String -> String -> S ;
        MEANS_WITH_RESPECT_TO_ : String -> String -> S ;
        MEANS_WITH_RESPECT_TO : String -> String -> [S] -> S ;
        MEANS_FOR_ : String -> String -> S ;
        MEANS_FOR : String -> [S] -> S ;

        INCLUDES : String -> String -> S ;
        MEANS_EXCEPT_ : S -> S -> S ;
        MEANS_EXCEPT : [S] -> [S] -> S ;
        BUT_DOES_NOT_INCLUDE : String -> S ;
        ConjS : [S] -> S ;


}