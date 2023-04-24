concrete DiffEng of Diff = open Prelude, Coordination in {
    lincat
        S = SS ;
        [S] = ListX ;

        [String] = ListX ;
    lin
        mkS, BUT_DOES_NOT_INCLUDE = id SS ;
        MEANS, INCLUDES, MEANS_EXCEPT = cc2 ;
        MEANS_EXCEPT_ ss ts = cc2 (ConjS ss) (ConjS ts) ;
        BaseS = twoSS ;
        ConsS = consrSS [] ;
        ConjS = conjunctSS (ss []) ;

}