--# -path=/Users/inari/work/GF/gf-ud/grammars

concrete UDAppEng of UDApp =
  JustWordsWordNetEng,

 PhraseEng [
    Utt,S,QS,Adv,NP,Pol,Imp,
    UttS      , -- S  -> Utt ;         -- John walks
    UttQS     , -- QS -> Utt ;         -- does John walk
    UttNP     , -- NP -> Utt ;         -- John
    UttAdv ,    -- Adv -> Utt ;        -- in the house
    UttImpSg   -- Pol -> Imp -> Utt ;  -- (do not) walk ----s
    ],

ExtendEng [
    VPS,VPI,ListVPS,ListVPI,
    MkVPS,    --    : Temp -> Pol -> VP -> VPS ;  -- hasn't slept
    ExistS,
    ConjVPS,  --    : Conj -> [VPS] -> VPS ;      -- has walked and won't sleep
    PredVPS,  --    : NP   -> VPS -> S ;          -- she [has walked and won't sleep]

    MkVPI,     --  : VP -> VPI ;                   -- to sleep (TODO: Ant and Pol)
    ConjVPI,   -- : Conj -> [VPI] -> VPI ;         -- to sleep and to walk

    BaseVPS, ConsVPS,
    BaseVPI, ConsVPI,
---- TODO: Extend cannot form QS yet
    CompoundN

    ],

 SentenceEng [
    S,QS,Cl,QCl,NP,Temp,Pol,VP,Imp,
    ImpVP ,      -- VP -> Imp ;                 -- walk / do not walk
    AdvS ,
    ExtAdvS
    ],

 VerbEng [
    VP,AdV,Adv,AP,Comp,V,
    UseV      , -- V   -> VP ;             -- sleep
    UseComp,
    CompAP,
    CompAdv,
    CompNP,
    AdvVP    , -- VP -> Adv -> VP ;       -- sleep here
    AdVVP
    ],

 NounEng [
    NP,CN,AP,Adv,Ord,RS,Pron,PN,Det,Numeral,N,
    DetCN     , -- Det -> CN -> NP ;       -- the man
    UsePN     , -- PN -> NP ;              -- John
    UsePron   , -- Pron -> NP ;            -- he
    MassNP    , -- CN -> NP ;              -- milk
    UseN      , -- N -> CN ;               -- house
    AdjCN,       -- AP -> CN -> CN ;        -- big house
    OrdNumeral,
    RelCN,
    AdvCN
    ],

 AdjectiveEng [
    AP,AdA,A,Ord,
    PositA    , -- A  -> AP ;              -- warm
    UseComparA,
    AdAP,
    AdjOrd
    ],

 AdverbEng [
    Prep,NP,Adv,Subj,S,
    PrepNP    , -- Prep -> NP -> Adv ;     -- in the house
    SubjS,
    PositAdvAdj -- A -> Adv  --- not sure if this should be used

    ],

-- IdiomEng [
--     VP,
--     ProgrVP
-- ----    ExistNP
--     ],

 ConjunctionEng,
 RelativeEng,
 QuestionEng,
 NumeralEng,

 TenseX - [CAdv,Pol] **
  open Prelude, SyntaxEng, ParadigmsEng, IrregEng in {

  lincat
    UDS = Cl ;

    -- Direct translation of Universal POSes
    -- these are our lexical categories
    AUX = Aux ;
    -- SYM
    -- X ;

    -- Phrasal categories are derived from UD relations https://universaldependencies.org/u/dep/
    root = Root ;

    -- Sentences
    -- ccomp ; -- Adv with SubjS? Just a S?
    -- csubj ; -- SC?

    -- More like GF NPs, APs or Comps
    nsubj = NP ;
    -- nsubjPass ; --TODO
    obj = NP ;
    iobj = NP ;
    xcomp = Comp ;


  lin

    -- in UD, syncategorematics (copula, tenses) are all AUX
    -- may_AUX,
    -- be_AUX,
    -- have_AUX : AUX ;

    -- Functions to UD phrasal categories
    -- detCN : DET -> NOUN -> nsubj ;
    beCop = ss "" ;

    the_Det = DetQuant DefArt NumSg ;

    nsubj_,
    obj_,
    iobj_ = id NP ;
    xcomp_ = id Comp ;

    rootV_ vp = mkRoot vp ;
    rootV2_ vp = mkRoot vp ;
    rootA_ ap = mkRoot ap ;
    rootN_ np = mkRoot np ;

    -- syntactic functions
    -- : root -> nsubj -> UDS ;  -- the cat sleeps
    intransitive rt np = mkCl np rt.vp ;

    -- : root -> nsubj -> obj -> UDS ; -- the cat sees us
    transitive rt sub ob = mkCl sub (mkVP (root2vpslash rt) ob) ;

    -- : root -> nsubj -> cop -> UDS ; -- the cat is small
    apred rt sub cp = mkCl sub (mkVP rt.comp) ;

    anyUDS s = mkCl i_NP (mkVP know_VS <s : S>) ;

oper
  know_VS : VS = mkVS (mkV "know") ;
  emptyNP : NP = it_NP ** {s = \\_ => ""} ;

  Aux : Type = {v : V ; isCop : Bool} ;
  Root : Type = {vp : VP ; comp : Comp ; c2 : Str} ;

  mkRoot = overload {
    mkRoot : AP -> Root = \ap -> emptyRoot ** {comp = mkComp ap} ;
    mkRoot : NP -> Root = \np -> emptyRoot ** {comp = mkComp np} ;
    mkRoot : VP -> Root = \vp -> emptyRoot ** {vp = vp} ;
    mkRoot : VPSlash -> Root = \vp -> emptyRoot ** {vp = vp ; c2 = vp.c2}
  } ;

  emptyRoot : Root = {
    vp = mkVP (mkN "dummy") ;
    comp = mkComp (mkNP (mkN "dummy")) ;
    c2 = []
  } ;

  root2vpslash : Root -> VPSlash = \root -> root.vp ** {
    c2 = root.c2 ;
    gapInMiddle,
    missingAdv = False  -- TODO check
    } ;
}