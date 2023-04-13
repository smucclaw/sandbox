concrete DiffEng of Diff = open Prelude, Coordination in {
    lincat
        S = SS ;
        [S] = ListX ;
    lin
        '_' = id SS ;
        MEANS, INCLUDES = cc2 ;
        BaseS = twoSS ;
        ConsS = consrSS [] ;
        '__' = conjunctSS (ss []) ;

}