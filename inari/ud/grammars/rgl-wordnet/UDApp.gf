abstract UDApp = BareRG, JustWordsWordNet ** {
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
    obj ;
    iobj ;
    xcomp ;
    obl ;
    nmod ;
    advmod ;
    cc ;
    conj ;

    acl ;
    aclRelcl ;
    --acl_for  -- reason for living
    --acl_of   -- process of writing grammars
    --acl_in   -- skill in getting answers

   -- skip the lexical layer AUX, COP
    aux ;
    auxPass ;
    cop ;

  -- passives
    nsubjPass ;
--    auxPass ; --be_cop


  fun

    -- in UD, syncategorematics (copula, tenses) are all AUX
  may_aux,
  have_aux : aux ;

  be_cop : cop ;

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
  aclRelcl_ : RCl -> aclRelcl ; -- whose personal data is affected

  obl_,
  advmod_ : Adv -> advmod ;
  nmod_ : Prep -> NP -> nmod ; -- UD-specific version of PrepNP
  auxPass_ : cop -> auxPass ;
  nsubjPass_ : NP -> nsubjPass ;

  -- syntactic functions
  root_nsubj : root -> nsubj -> UDS ;  -- the cat sleeps
  root_nsubj_obj : root -> nsubj -> obj -> UDS ;  -- the cat sees us

  -- Constructions with copula
  root_nsubj_cop        : root -> nsubj -> cop -> UDS ; -- the cat is small
  root_nsubj_cop_nmod   : root -> nsubj -> cop -> nmod -> UDS ; -- my hovercraft is full [of eels] (eels is nmod)
  root_nsubj_cop_advmod : root -> nsubj -> cop -> advmod -> UDS ; -- the party is [here] (here is advmod)

  root_nsubj_cop_cc_conj : root -> nsubj -> cop -> cc -> conj -> UDS ; -- he is big and old

  root_nsubj_cop_aclRelcl : root -> nsubj -> cop -> aclRelcl -> UDS ; -- the affected individual is the person whose personal data is affected by the breach
  root_nsubj_cop_aclRelcl_obl :  root -> nsubj -> cop -> aclRelcl -> obl -> UDS ; -- the affected individual is the person whose personal data is affected by the breach

  root_nsubjPass_deontic_auxPass : root -> nsubjPass -> Deontic -> auxPass -> UDS ; -- everyone should be notified
--  punct_ : UDS -> punct -> UDS ;
   --anyUDS : Utt -> UDS ;

}