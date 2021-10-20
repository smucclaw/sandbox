abstract UDApp = BareRG, JustWordsWordNet ** {
  flags startcat = UDS ;

  cat
    UDS ;

    -- Direct translation of Universal POSes
--    AUX ;
    SYM ;
    X ;


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
    nmod ;
    --amod ;
    advmod ;
    cc ;
    conj ;

   -- skip the lexical layer AUX, COP
    aux ;
    cop ;
    punct ;


  fun

    -- in UD, syncategorematics (copula, tenses) are all AUX
   may_aux,
   have_aux : aux ;

   be_cop : cop ;

   '._punct' : punct ;

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

   conjA_ : AP -> conj ;
   conjN_ : NP -> conj ;
   conjAdv_ : Adv -> conj ;

   cc_ : Conj -> cc ;

   advmod_ : Adv -> advmod ;

   nmod_ : Prep -> NP -> nmod ; -- UD-specific version of PrepNP

   -- syntactic functions
   intransitive : root -> nsubj -> UDS ;  -- the cat sleeps
   transitive : root -> nsubj -> obj -> UDS ; -- the cat sees us

   -- Constructions with copula
   pred        : root -> nsubj -> cop -> UDS ; -- the cat is small
   pred_nmod   : root -> nsubj -> cop -> nmod -> UDS ; -- my hovercraft is full [of eels] (eels is nmod)
   pred_advmod : root -> nsubj -> cop -> advmod -> UDS ; -- the party is [here] (here is advmod)

   nsubj_cop_cc_conj : root -> nsubj -> cop -> cc -> conj -> UDS ; -- he is big and old

   punct_ : UDS -> punct -> UDS ;
   --anyUDS : Utt -> UDS ;

}