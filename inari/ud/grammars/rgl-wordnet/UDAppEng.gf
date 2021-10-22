--# -path=/Users/inari/work/GF/gf-ud/grammars

concrete UDAppEng of UDApp =
  BareRGEng, JustWordsWordNetEng **
  open Prelude, SyntaxEng, (P=ParadigmsEng), IrregEng, ExtendEng in {

  lincat
    UDS = LinUDS ;

    -- Direct translation of Universal POSes
    -- these are our lexical categories
    -- SYM
    -- X ;

    -- Phrasal categories are derived from UD relations https://universaldependencies.org/u/dep/
    root = Root ;

    -- Sentences
    -- ccomp ; -- Adv with SubjS? Just a S?
    -- csubj ; -- SC?

    -- More like GF NPs, APs or Comps
    nsubjPass,
    nsubj,
    obj = NP ;
    iobj = NP ;
    xcomp = Comp ;
    obl,
    nmod,
    advmod = Adv ;
--   conj = {s : Number => Str} ;
    cc = Conj ;

    aclRelcl = RCl ;

  lin

    -- in UD, syncategorematics (copula, tenses) are all AUX
    -- in UD, syncategorematics (copula, tenses) are all AUX
    may_aux = ss "may" ;
    have_aux = ss "have" ;

    be_cop = ss "" ;

    '._punct' = ss "." ;


    nsubj_,
    obj_,
    iobj_ = id NP ;
    xcomp_ = id Comp ;
    aclRelcl_ = id RCl ;
    cc_ = id Conj ;
    obl_,
    advmod_ = id Adv ;

    rootV_ vp = mkRoot vp ;
    rootV2_ vp = mkRoot vp ;
    rootA_ ap = mkRoot ap ;
    rootN_ np = mkRoot np ;
    auxPass_ x = x ;
    nmod_ = PrepNP ;

    conjA_ ap = mkUtt ap ; -- : AP -> conj ;
    conjN_ np = mkUtt np ; -- : NP -> conj ;
    conjAdv_ a = mkUtt a ; -- : Adv -> conj ;

    -- passives
    nsubjPass_ = id NP ;

    -- : root -> RP -> cop -> aclRelcl ; -- [whose data]:RP is affected
    passRelCl_ rt rp cop =
      let is_affected : VP = ExtendEng.PassVPSlash (root2vpslash rt) ;
       in  (mkRCl rp is_affected) ;


    -- syntactic functions
    -- : root -> nsubj -> UDS ;  -- the cat sleeps
    root_nsubj rt sub = mkUDS sub rt.vp ;

    -- : root -> nsubj -> obj -> UDS ; -- the cat sees us
    root_nsubj_obj rt sub ob = mkUDS sub (mkVP (root2vpslash rt) ob) ;

    -- : root -> nsubj -> cop -> UDS ; -- the cat is small
    root_nsubj_cop rt sub cp = root_nsubj rt sub ;

    -- : root -> nsubj -> cop -> nmod/advmod -> UDS ;
    root_nsubj_cop_advmod,
    root_nsubj_cop_nmod = \rt,sub,cop,adv -> mkUDS sub (mkVP rt.vp adv) ;

    root_nsubj_cop_cc_conj rt sub cop cc conj =
      let big_and_old : Adv = mkAdv cc rt.adv <conj : Adv> ;
      in mkUDS sub (mkVP big_and_old) ;

    -- : root -> nsubj -> cop -> aclRelcl -> UDS ;
    root_nsubj_cop_aclRelcl rt sub cop rcl = root_nsubj_cop (addRcl rt rcl) sub cop ;

    -- : root -> nsubj -> cop -> aclRelcl -> obl -> UDS ;  -- the person whose personal data is affected by the breach
    root_nsubj_cop_aclRelcl_obl rt sub cop rcl obl =
      let uds : UDS = root_nsubj_cop_aclRelcl rt sub cop rcl
       in uds ** {vp = mkVP rt.vp obl} ;

    -- : root -> nsubjPass -> Deontic -> cop (more exactly, aux:pass) -> UDS ; -- everyone should be notified
    root_nsubjPass_deontic_auxPass rt sub deo auxpass =
      let should_be_notified : Root = rt ** {vp = mkVP deo rt.vp} ; -- mkVP : VV -> VP -> VP
       in root_nsubj should_be_notified sub ;




  linref
     UDS = linUDS ;

  oper
    emptyNP : NP = it_NP ** {s = \\_ => ""} ;

    --Aux : Type = {v : V ; isCop : Bool} ;
--   Root : Type = {vp : VP ; comp : Comp ; c2 : Str} ;
    LinUDS : Type = {subj : NP ; pred : VP} ;
    mkUDS : NP -> VP -> LinUDS = \np,vp -> {
       subj = np ; pred = vp } ;

    linUDS : LinUDS -> Str = \uds -> (mkS (mkCl uds.subj uds.pred)).s ;

    Root : Type = {vp : VP ; c2 : Str ; adv : Adv} ;

    -- alternative Root: {a : A ; n : N ; v : V ; adv : Adv ; whichFieldIsLegit : LegitField}


    mkRoot = overload {
       mkRoot : AP -> Root = \ap -> emptyRoot ** {vp = mkVP ap ; adv = lin Adv (mkUtt ap)} ;
       mkRoot : NP -> Root = \np -> emptyRoot ** {vp = mkVP np ; adv = lin Adv (mkUtt np)} ;
       mkRoot : VP -> Root = \vp -> emptyRoot ** {vp = vp ; adv = lin Adv (mkUtt vp)} ; ---- ADV is bad
       mkRoot : VPSlash -> Root = \vp -> emptyRoot ** {vp = vp ; c2 = vp.c2 ; adv = lin Adv (mkUtt <vp : VP>)}
    } ;

    emptyRoot : Root = {
       vp = mkVP (P.mkN "dummy") ;
       adv = ss "dummy" ;
       c2 = []
    } ;

    root2vpslash : Root -> VPSlash = \root -> root.vp ** {
       c2 = root.c2 ;
       gapInMiddle,
       missingAdv = False  -- TODO check
       } ;

    -- unstable hack, TODO fixme
    addRcl : Root -> RCl -> Root = \rt,rcl ->
      let dummyNP : NP = mkNP emptyNP (mkRS rcl) ;
          dummyVPSlash : VPSlash = root2vpslash rt ;
       in rt ** {
            vp = mkVP dummyVPSlash dummyNP
          } ;

}