--# -path=/Users/inari/work/GF/gf-ud/grammars

abstract UDAppMini = MiniLang - [UseAP, UseNP, PredVP] ** {
  flags startcat = UDS ;

  cat
    UDS ;

    -- Phrasal categories are derived from UD relations https://universaldependencies.org/u/dep/
    root ; -- can be V*, A*, N*, Adv, …

    -- Sentences
    ccomp ; -- Adv with SubjS? Just a S?
    csubj ; -- SC?

    -- More like GF NPs, APs or Comps
    nsubj ;
    -- nsubjPass ; --TODO
    obj ;
    iobj ;
    xcomp ;
    cop ;

    nmod ; -- full of eels

--    Comp ; -- borrow Comp from full RGL
  fun

    -- in UD, syncategorematics (copula, tenses) are all AUX
    be_cop : cop ;

    nsubj_ : NP -> nsubj ; -- it can be NOUN, DET, PRON, but all those can be NPs in GF
    obj_ : NP -> obj ;
    iobj_ : NP -> iobj ;
    nmod_ : Adv -> nmod ;
  --  xcomp_ : Comp -> xcomp ; -- like Comp, it can be from AP, CN, NP, Adv (how about gerund?)

    rootV_ : VP -> root ; -- TODO: figure out good way for this
    rootV2_ : V2 -> root ;
    rootA_ : AP -> root ;
    rootN_ : NP -> root ;

    -- syntactic functions
    --utt : root -> UDS ; -- the cat / is big / …
    intransitive : root -> nsubj -> UDS ;  -- the cat sleeps
    transitive : root -> nsubj -> obj -> UDS ; -- the cat sees us
    coppred : root -> nsubj -> cop -> UDS ; -- the cat is small
    coppred_nmod : root -> nsubj -> cop -> nmod -> UDS ; -- my hovercraft is full of eel

    --anyUDS : Utt -> UDS ;

}