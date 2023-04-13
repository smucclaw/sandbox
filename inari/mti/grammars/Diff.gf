abstract Diff = {
    cat
        S ;
        [S]{2} ;
    fun
        '_' : String -> S ;
        MEANS : String -> String -> S ;
        INCLUDES : S -> S -> S ;
        '__' : [S] -> S ;

}