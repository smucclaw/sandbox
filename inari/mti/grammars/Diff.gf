abstract Diff = {
    cat
        S ;
        [S]{2} ;
    fun
        '_' : String -> S ;
        MEANS : String -> String -> S ;
        '__' : [S] -> S ;

}