--# -path=./../rgl-wordnet

concrete UDAppEng of UDApp =
  UDCatEng, JustWordsWordNetEng **
  open Prelude, SyntaxEng, IrregEng, ExtendEng in {

lin
-- The concrete syntax is sketchy on purpose.
-- One could say that it doesn't even have to bother to linearise properly,
-- but we do it for the sake of ud2gf: checking linearisations against the original.
-- At a later tree manipulation stage, we can always construct a different kind of tree.
-- So if you look at the concrete and think the attachment of some argument is wrong
-- in the linearisation, that shouldn't be a problem. The important thing is that we can look at the
-- AST and determine what the attachment actually should be.

-- Most of this file is a rather mechanical effort of cutting and pasting the internal trees together.

-- 1) The basic building blocks. Most other funs can be reduced to these.

    -- syntactic functions
    -- : root -> nsubj -> UDS ;  -- the cat sleeps
    root_nsubj rt sub = mkUDS sub rt.vp ;

    -- : root -> nsubj -> obj -> UDS ; -- the cat sees us
    root_nsubj_obj rt sub ob = mkUDS sub (mkVP (root2vpslash rt) ob) ;

    -- : root -> nsubj -> cop -> UDS ; -- the cat is small
    root_nsubj_cop rt sub cp = root_nsubj rt sub ;

    -- UD has many names for Adv
    -- : root -> nsubj -> cop -> nmod/advmod/obl -> UDS ;
    root_nsubj_cop_advmod,
    root_nsubj_cop_obl,
    root_nsubj_cop_nmod = \rt,sub,cop,adv -> mkUDS sub (mkVP rt.vp adv) ;

    -- Hack for lists. TODO: use the new generic way to handle lists of arbitrary length.
    root_nsubj_cop_cc_conj rt sub cop cc conj =
      let big_and_old : Adv = mkAdv cc rt.adv <conj : Adv> ;
      in mkUDS sub (mkVP big_and_old) ;

    -- We don't care that addRcl is a hack. For later applications, we can always attach the aclRelcl differently.
    -- : root -> nsubj -> cop -> aclRelcl -> UDS ;
    -- a data intermediary is one that is processing personal data on behalf of and for the purposes of another organisation ;
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

  -- Two identical structures, just different cat but should be same lincat
	-- : root -> mark -> nsubj -> cop -> obl -> UDS ;
	--"when an organisation is aware of a data breach ;

  -- : root -> advmod -> nsubj -> cop -> obl -> UDS ;
  -- [once]:advmod an [organisation]:nsubj is [aware]:root of a data [breach]:obl ;
  -- hack: we just put "once" in subject. TODO investigate how we want to use these fragments
	  root_mark_nsubj_cop_obl,
    root_advmod_nsubj_cop_obl = \aware, once, organisation, is, of_breach ->
    let once_Predet : Predet = lin Predet once ; -- hack
        once_organisation : NP = mkNP once_Predet organisation ;
     in root_nsubj_cop_obl aware once_organisation is of_breach ;

---------------------------------------------------------------------------
-- Cases where GF and UD structures map less neatly to each other
-- Needed to add special funs that are not the top-level/application layer

    -- Some internal hammering to get relatives correct
    -- : root -> RP -> auxPass -> aclRelcl ; -- [whose data]:RP is affected
    passRelcl_ rt rp auxPass =
      let is_affected : VP = ExtendEng.PassVPSlash (root2vpslash rt) ;
       in mkRS (mkRCl rp is_affected) ;



  oper


    root2vpslash : Root -> VPSlash = \root -> slashV root.vp ;

    -- unstable hack, TODO fixme
    addRcl : Root -> RS -> Root = \rt,rs ->
      let dummyNP : NP = mkNP emptyNP rs ;
      --     dummyVPSlash : VPSlash = root2vpslash rt ;
          RSasAdv : Adv = lin Adv (mkUtt dummyNP) ;
       in rt ** {
            vp = mkVP rt.vp RSasAdv
          } ;
	onlyPred : VP -> UDS = \vp -> mkUDS emptyNP vp ;
}