--# -path=./../rgl-wordnet

concrete UDCatEng of UDCat = BareRGEng **
  open SyntaxEng, Prelude, (P=ParadigmsEng), (E=ExtraEng), ExtendEng in {

  lincat
    UDS = LinUDS ; -- TODO: use VPS instead of VP???

    root = Root ;

    nsubjPass,
    nsubj,
    obj = NP ;
    iobj = NP ;
    xcomp = Adv ;
    ccomp = S ;
    obl,
    nmod,
    advmod = Adv ;
--   conj = {s : Number => Str} ;
    cc = Conj ;
    aclRelcl = RS ;
    aux = LinAux ;

  linref
    UDS = linUDS ;


  param
    AuxType = Have | Will | RealAux ;
  oper

    LinAux : Type = {s : Str ; vv : VV ; auxType : AuxType} ;
    mkAux = overload {
      mkAux : Str -> VV -> LinAux = \str,vv -> {
          s = str ; vv = vv ; auxType = RealAux } ;
      mkAux : Str -> AuxType -> LinAux = \str,at -> {
          s = str ; vv = must_VV ; auxType = at } -- dummy vv, not used
    } ;

  lin

    may_aux = mkAux "may" E.may_VV ;
    have_aux = mkAux "have" Have ;
    will_aux = mkAux "will" Will ;
    can_aux = mkAux "can" can_VV ;
    must_aux = mkAux "must" must_VV ;
    should_aux = mkAux "should" should_Deontic ;

    be_cop = ss "" ;

    nsubj_,
    obj_,
    iobj_ = id NP ;
    aclRelcl_ = id RS ;
    cc_ = id Conj ;
    obl_,
    advmod_ = id Adv ;
    oblPrep_ to = mkAdv to emptyNP ;

    rootV_ vp = mkRoot vp ;
    rootA_ ap = mkRoot ap ;
    rootN_ np = mkRoot np ;
    auxPass_ = be_cop ;
    nmod_ = PrepNP ;

    conjA_ ap = mkUtt ap ; -- : AP -> conj ;
    conjN_ np = mkUtt np ; -- : NP -> conj ;
    conjAdv_ a = mkUtt a ; -- : Adv -> conj ;
    ccomp_ uds = lin S {s = linUDS uds} ; -- TODO: later switch to PredVPS?
    xcomp_ adv = adv ;
    xcompA_ ap = lin Adv (mkUtt ap) ;

    -- passives
    nsubjPass_ = id NP ;

  oper
    emptyNP : NP = it_NP ** {s = \\_ => ""} ;

    LinUDS : Type = {subj : NP ; pred : VPS} ;

    mkUDS : NP -> VP -> LinUDS = \np,vp -> {
       subj = np ; pred = myVPS vp } ;

    linUDS : LinUDS -> Str = \uds -> (PredVPS uds.subj uds.pred).s ;
    emptyNP : NP = it_NP ** {s = \\_ => ""} ;

    myVPS = overload {
      myVPS : VP -> VPS = \vp ->
        MkVPS (mkTemp presentTense simultaneousAnt) positivePol vp ;
      myVPS : Tense -> VP -> VPS = \tns,vp ->
        MkVPS (mkTemp tns simultaneousAnt) positivePol vp ;
      myVPS : Ant -> VP -> VPS = \ant,vp ->
        MkVPS (mkTemp presentTense ant) positivePol vp
    } ;
    --Aux : Type = {v : V ; isCop : Bool} ;
--   Root : Type = {vp : VP ; comp : Comp ; c2 : Str} ;

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
}