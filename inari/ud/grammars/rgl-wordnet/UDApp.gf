abstract UDApp =
  JustWordsWordNet,

 Phrase [
    Text,Utt,S,QS,Adv,NP,Pol,Imp,
    UttS      , -- S  -> Utt ;         -- John walks
    UttQS     , -- QS -> Utt ;         -- does John walk
    UttNP     , -- NP -> Utt ;         -- John
    UttAdv  ,   -- Adv -> Utt ;        -- in the house
    UttImpSg    -- Pol -> Imp -> Utt ; -- (do not) walk
    ],

   Extend [
   --  VPS,VPI,ListVPS,ListVPI,
   --  MkVPS,    --    : Temp -> Pol -> VP -> VPS ;  -- hasn't slept
   --  ExistS,
   --  ConjVPS,  --    : Conj -> [VPS] -> VPS ;      -- has walked and won't sleep
   --  PredVPS,  --    : NP   -> VPS -> S ;          -- she [has walked and won't sleep]

   --  MkVPI,     --  : VP -> VPI ;                   -- to sleep (TODO: Ant and Pol)
   --  ConjVPI,   -- : Conj -> [VPI] -> VPI ;         -- to sleep and to walk

   --  BaseVPS, ConsVPS,
   --  BaseVPI, ConsVPI,

      CompoundN -- : N -> N -> N    -- control system
   ],

 Sentence [
    S,QS,Cl,QCl,NP,Temp,Pol,VP,Imp,
    ImpVP ,      -- VP -> Imp ;                 -- walk / do not walk
    AdvS ,
    ExtAdvS
    ],

 Verb [
    VP,AdV,Adv,AP,Comp,V,
    UseV      , -- V   -> VP ;             -- sleep
--    UseComp,
    CompAP,
    CompAdv,
    CompNP,
    UseAdv     -- Adv -> VP ;             -- be in the house ---s
--    AdvVP    , -- VP -> Adv -> VP ;       -- sleep here
--    AdVVP
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
    Prep,NP,Adv,Subj,S,
    PrepNP    , -- Prep -> NP -> Adv ;     -- in the house
    SubjS,
    PositAdvAdj -- A -> Adv  --- not sure if this should be used

    ],

-- Idiom [
--     VP,
--     ProgrVP
-- ----    ExistNP
--     ],

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

    the_Det : Det ;

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

    anyUDS : Utt -> UDS ;

}