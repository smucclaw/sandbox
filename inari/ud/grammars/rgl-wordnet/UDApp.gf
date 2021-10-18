abstract UDApp =
  JustWordsWordNet,

   Extend [
      Temp, Pol, NP, Tense,
      S, ExistS, ExistNP,
      N, CompoundN -- : N -> N -> N    -- control system
   ],

 Sentence [
    S,QS,Cl,QCl,NP,Temp,Pol,VP,Imp,Adv,
    ImpVP ,      -- VP -> Imp ;                 -- walk / do not walk
    AdvS ,
    ExtAdvS
    ],

 Verb [
    VP,AdV,Adv,AP,Comp,NP,V,Tense,
    UseV      , -- V   -> VP ;             -- sleep
--    UseComp,
    CompAP,
    CompAdv,
    CompNP,
    UseAdv,     -- Adv -> VP ;             -- be in the house ---s
    AdvVP,      -- VP -> Adv -> VP ;       -- sleep here
    AdVVP
    ],

 Noun [
    NP,CN,AP,Adv,Ord,RS,Pron,PN,Det,Numeral,N,
    DetCN     , -- Det -> CN -> NP ;       -- the man
    UsePN     , -- PN -> NP ;              -- John
    UsePron   , -- Pron -> NP ;            -- he
    MassNP    , -- CN -> NP ;              -- milk
    UseN      , -- N -> CN ;               -- house
    AdjCN,      -- AP -> CN -> CN ;        -- big house
    OrdNumeral,
    RelCN,
    AdvCN
    ],

 Adjective [
    AP,AdA,A,Ord,
    PositA    , -- A  -> AP ;              -- warm
    UseComparA,
    AdAP,
    AdjOrd
    ],

 Adverb [
    A,
    Prep,NP,Adv,Subj,S,
    PrepNP    , -- Prep -> NP -> Adv ;     -- in the house
    SubjS,
    PositAdvAdj -- A -> Adv  --- not sure if this should be used

    ],

 Conjunction,
 Relative,
 Question,
 Numeral,

 Tense

** {
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

   case_noun_nmod : Prep -> NP -> nmod ; -- UD-specific version of PrepNP

   -- syntactic functions
   intransitive : root -> nsubj -> UDS ;  -- the cat sleeps
   transitive : root -> nsubj -> obj -> UDS ; -- the cat sees us

   -- Constructions with copula
   pred        : root -> nsubj -> cop -> UDS ; -- the cat is small
   pred_nmod   : root -> nsubj -> cop -> nmod -> UDS ; -- my hovercraft is full [of eels] (eels is nmod)
   pred_advmod : root -> nsubj -> cop -> advmod -> UDS ; -- the party is [here] (here is advmod)


   punct_ : UDS -> punct -> UDS ;
   --anyUDS : Utt -> UDS ;

   -- hacks and workarounds
   the_Det : Det ;


}