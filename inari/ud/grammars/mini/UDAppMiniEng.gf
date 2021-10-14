--# -path=/Users/inari/work/GF/gf-ud/grammars

concrete UDAppMiniEng of UDAppMini =
  MiniLangEng - [UseAP, UseNP, PredVP] **
  open Prelude, MiniGrammarEng, MiniParadigmsEng, (R=MiniResEng) in {

  lincat
    UDS = Cl ;
    -- Direct translation of Universal POSes
    -- these are our lexical categories
    AUX = Aux ;

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
    nmod = Adv ;
--    xcomp = Comp ;


  lin

    -- in UD, syncategorematics (copula, tenses) are all AUX
    -- may_AUX,
    -- be_AUX,
    -- have_AUX : AUX ;

    -- Functions to UD phrasal categories
    -- detCN : DET -> NOUN -> nsubj ;
    be_cop = ss "" ;

    nsubj_,
    obj_,
    iobj_ = id NP ;
    nmod_ = id Adv ;
--    xcomp_ = id Comp ;

    rootV_ vp = mkRoot vp ;
    rootV2_ vp = mkRoot vp ;
    rootA_ ap = mkRoot ap ;
    rootN_ np = mkRoot np ;

    -- syntactic functions
    -- : root -> nsubj -> UDS ;  -- the cat sleeps
    intransitive rt np = PredVP np rt.vp ;

    -- : root -> nsubj -> obj -> UDS ; -- the cat sees us
    transitive rt sub ob = PredVP sub (complV2 rt ob) ;

    -- : root -> nsubj -> cop -> UDS ; -- the cat is small
    apred rt sub cp = intransitive rt sub ;

    -- : root -> nsubj -> cop -> nmod -> UDS ; -- my hovercraft is full of eels
    advpred rt sub cp adv = PredVP sub (AdvVP rt.vp adv) ;

    utt rt = intransitive rt emptyNP ;

    anyUDS s = lin Cl {
      preadv = s.s ;
      subj = [] ;
      compl = [] ;
      verb = \\_,_ => {fin=[] ; inf=[]}
    } ;

  linref
    UDS = \x -> (UseCl TSim PPos x).s ;

oper
--  know_VS : VS = mkVS (mkV "know") ;
  emptyNP : NP = MassNP (UseN (mkN "" "")) ;

  Aux : Type = {v : V ; isCop : Bool} ;
  Root : Type = {vp : VP ; c2 : Str} ;

  complV2 : Root -> NP -> VP = \rt,np -> rt.vp ** {
     compl = rt.vp.compl ++ rt.c2 ++ np.s ! R.Acc
  } ;

  mkRoot = overload {
    mkRoot : AP -> Root = \ap -> emptyRoot ** {vp = UseAP ap} ;
    mkRoot : NP -> Root = \np -> emptyRoot ** {vp = UseNP np} ;
    mkRoot : VP -> Root = \vp -> emptyRoot ** {vp = vp} ;
    mkRoot : V2 -> Root = \v2 -> emptyRoot ** {vp = UseV v2 ; c2 = v2.c}
  } ;

  emptyRoot : Root = {
    vp = UseNP (MassNP (UseN (mkN "dummy"))) ;
    c2 = []
  } ;
}