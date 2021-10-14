--# -path=/Users/inari/work/GF/gf-ud/grammars

concrete UDAppEng of UDApp = ShallowParseEng **
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

oper
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