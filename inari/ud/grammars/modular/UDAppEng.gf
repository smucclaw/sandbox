--# -path=./../rgl-wordnet

concrete UDAppEng of UDApp =
  UDCatEng, JustWordsWordNetEng **
  open Prelude, SyntaxEng, IrregEng, ExtendEng in {

lin

    -- : root -> RP -> cop -> aclRelcl ; -- [whose data]:RP is affected
    passRelcl_ rt rp cop =
      let is_affected : VP = ExtendEng.PassVPSlash (root2vpslash rt) ;
       in mkRS (mkRCl rp is_affected) ;


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
      let root_obl : Root = rt ** {vp = mkVP rt.vp obl} ;
       in root_nsubj_cop_aclRelcl root_obl sub cop rcl ;

    -- : root -> nsubjPass -> Deontic -> auxPass -> UDS ; -- everyone should be notified
    root_nsubjPass_deontic_auxPass rt sub deo auxpass =
      let should_be_notified : Root = rt ** {vp = mkVP deo rt.vp} ; -- mkVP : VV -> VP -> VP
       in root_nsubj should_be_notified sub ;

	-- : root -> xcomp -> ccomp -> UDS ;	--[render] it [unlikely] that the notifiable data breach will [result] in significant [harm] to the individual ;
	root_xcomp_ccomp render unlikely result_harm =
	  let render_unlikely : VP = mkVP render.vp <unlikely : Adv> ;
	      that_result_harm : Adv = mkAdv that_Subj result_harm
	   in onlyPred (mkVP render_unlikely that_result_harm) ;

	-- root_nsubj_aux_obl : root -> nsubj -> aux -> obl -> UDS ;
	--the notifiable data [breach] will [result] in significant [harm] to the individual ;
	root_nsubj_aux_obl result breach will in_harm = {
      subj = breach ;
      pred = willResultInHarm
      } where {
		  barePred : VP = mkVP result.vp in_harm ;
		  willResultInHarm : VPS = case will.auxType of {
               RealAux => myVPS (mkVP will.vv barePred) ; -- may, must, –
               Will => myVPS futureTense barePred ;
			   Have => myVPS anteriorAnt barePred }
	  };


  oper


    root2vpslash : Root -> VPSlash = \root -> slashV root.vp ;

    -- unstable hack, TODO fixme
    addRcl : Root -> RS -> Root = \rt,rs ->
      let dummyNP : NP = mkNP emptyNP rs ;
          dummyVPSlash : VPSlash = root2vpslash rt ;
       in rt ** {
            vp = mkVP dummyVPSlash dummyNP
          } ;
	onlyPred : VP -> UDS = \vp -> mkUDS emptyNP vp ;
}