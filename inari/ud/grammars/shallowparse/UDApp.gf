--# -path=/Users/inari/work/GF/gf-ud/grammars

abstract UDApp = ShallowParse ** {
  flags startcat = UDS ;

  cat
    UDS ;

    -- Direct translation of Universal POSes
    -- these are our lexical categories
    AUX ;
    SYM ;
    X ;
    -- ADJ ; ADP ;
    -- ADV ; AUX ;
    -- INTJ ; CCONJ ;
    -- NOUN ; DET ;
    -- PROPN ; NUM ;
    -- VERB ; PART ;
    -- PRON ; SCONJ ;
    -- PUNCT ; SYM ; X ;

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


  fun

    -- Functions to UD lexical categories
    -- Is this even necessary? Can we just do coercions from GF phrasal cats to UD phrasal cats?

    -- Coercions
    -- adj_ : A -> ADJ ;
    -- noun_ : N -> NOUN ;
    -- -- cn_ : CN -> NOUN ; -- or only lexical cats?
    -- det_ : Det -> DET ;
    -- pn_ : PN -> PROPN ;
    -- pron_ : Pron -> PRON ;

    -- in UD, syncategorematics (copula, tenses) are all AUX
    may_AUX,
    be_AUX,
    have_AUX : AUX ;

    beCop : cop ;

    -- Functions to UD phrasal categories
    -- detCN : DET -> NOUN -> nsubj ;

    nsubj_ : NP -> nsubj ; -- it can be NOUN, DET, PRON, but all those can be NPs in GF
    obj_ : NP -> obj ;
    iobj_ : NP -> iobj ;
    xcomp_ : Comp -> xcomp ; -- like Comp, it can be from AP, CN, NP, Adv (how about gerund?)

    rootV_ : VP -> root ; -- TODO: figure out good way for this
    rootV2_ : VPSlash -> root ;
    rootA_ : AP -> root ;
    rootN_ : NP -> root ;

    -- syntactic functions
    intransitive : root -> nsubj -> UDS ;  -- the cat sleeps
    transitive : root -> nsubj -> obj -> UDS ; -- the cat sees us
    apred : root -> nsubj -> cop -> UDS ; -- the cat is small

}