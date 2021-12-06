--# -path=./../rgl-wordnet

concrete UDCatEng of UDCat = BareRGEng - [Deontic,may_Deontic,must_Deontic,should_Deontic,shall_Deontic,shant_Deontic] **
  open SyntaxEng, Prelude, (P=ParadigmsEng), (E=ExtraEng), ResEng, ExtendEng in {

  lincat
    UDS = LinUDS ; -- TODO: use VPS instead of VP???

    root = Root ;

    nsubjPass,
    nsubj,
    obj = NP ;
    iobj = NP ;
    ccomp = S ;
    obl,
    nmod,
    xcomp = Adv ;
    advmod = LinAdvmod ;
--   conj = {s : Number => Str} ;
    cc = Conj ;
    aclRelcl = RS ; -- which is a breach
    acl,
    advcl = Adv ; -- if it is a breach
    aux = LinAux ;
    det = Det ;
    vocative = NP ;
    expl = Pron ;
    amod = AP ;
    mark = Subj ;

  linref
    UDS = linUDS ;


  param
    AuxType = Be | Have | Will | RealAux ;
  oper
    LinAdvmod : Type = {adv : Adv ; isNot : Bool} ;
    LinAux : Type = {s : Str ; vv : VV ; auxType : AuxType} ;
    mkAux = overload {
      mkAux : Str -> VV -> LinAux = \str,vv -> {
          s = str ; vv = vv ; auxType = RealAux } ;
      mkAux : Str -> AuxType -> LinAux = \str,at -> {
          s = str ; vv = must_VV ; auxType = at } -- dummy vv, not used
    } ;

  lin

    be_aux = mkAux "be" Be ;
    may_aux = mkAux "may" E.may_VV ;
    have_aux = mkAux "have" Have ;
    will_aux = mkAux "will" Will ;
    can_aux = mkAux "can" can_VV ;
    must_aux = mkAux "must" must_VV ;
    should_aux = mkAux "should" should_VV ; --Deontic ;
    be_cop,
    be_auxPass = ss "be" ;
    not_advmod = {adv = lin Adv (ss "not") ; isNot = True} ;

    nsubj_,
    obj_,
    iobj_ = id NP ;
    aclRelclRS_ = id RS ;
    aclRelclUDS_ uds =
      let dummyRS : RS = mkRS (mkRCl (genericCl (mkVP (P.mkV "dummy")))) ;
       in dummyRS ** {s = \\_ => linUDS uds};
    cc_ = id Conj ;
    obl_ = id Adv ;
    advmod_ adv = {adv = adv ; isNot = False} ;
    oblPrep_ to = mkAdv to emptyNP ;

    rootV_ vp = mkRoot vp ;
    rootA_ ap = mkRoot ap ;
    rootN_ np = mkRoot np ;
    nmod_ = PrepNP ;

    conjA_ ap = mkUtt ap ; -- : AP -> conj ;
    conjN_ np = mkUtt np ; -- : NP -> conj ;
    conjAdv_ a = mkUtt a ; -- : Adv -> conj ;
    ccomp_ uds = lin S {s = linUDS uds} ;
    xcompAdv_ adv = adv ;
    xcompA_ ap = lin Adv (mkUtt ap) ;
    aclUDS_,
    advclUDS_ = \uds -> lin Adv {s = linUDS uds} ;

    expl_ = id Pron ;
    det_ = id Det ;
    vocative_ = id NP ;
    amod_ = id AP ;
    mark_ = id Subj ;

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

    should_VV : VV = lin VV {
      s = table {
        VVF VInf => ["be obliged to"] ;
        VVF VPres => "should" ;
        VVF VPPart => ["been obliged to"] ;
        VVF VPresPart => ["being obliged to"] ;
        VVF VPast => "shall" ;
        VVPastNeg => "shall not" ;
        VVPresNeg => "shouldn't"
        } ;
      p = [] ;
      typ = VVAux
    } ;

    -- copied this from ParseExtendEng, easier to duplicate code than to introduce new dependency?
    ParseExtendComplVV : VV -> Ant -> Pol -> VP -> VP ;
    ParseExtendComplVV v ant pol vp =
      insertObj (variants {\\agr => ant.s ++ pol.s ++
                                    infVP v.typ vp True  ant.a pol.p agr;
                           \\agr => ant.s ++ pol.s ++
                                    infVP v.typ vp False ant.a pol.p agr})
                (predVV v) ;
}