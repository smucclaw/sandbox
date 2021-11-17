--# -path=./../rgl-wordnet

abstract UDCat = BareRG ** {
	cat
	    UDS ;
		acl ;
		aclRelcl ;
		advcl ;
		advmod ;
		advmodEmph ;
		advmodLmod ;
		amod ;
		appos ;
		aux ;
		auxPass ;
		case_ ;
		cc ;
		ccPreconj ;
		ccomp ;
		clf ;
		compound ;
		compoundLvc ;
		compoundPrt ;
		compoundRedup ;
		compoundSvc ;
		conj ;
		cop ;
		csubj ;
		csubjPass ;
		dep ;
		det ;
		detNumgov ;
		detNummod ;
		detPoss ;
		discourse ;
		dislocated ;
		expl ;
		explImpers ;
		explPass ;
		explPv ;
		fixed ;
		flat ;
		flatForeign ;
		flatName ;
		goeswith ;
		iobj ;
		list ;
		mark ;
		nmod ;
		nmodPoss ;
		nmodTmod ;
		nsubj ;
		nsubjPass ;
		nummod ;
		nummodGov ;
		obj ;
		obl ;
		oblAgent ;
		oblArg ;
		oblLmod ;
		oblTmod ;
		orphan ;
		parataxis ;
		punct ;
		reparandum ;
		root ;
		vocative ;
		xcomp ;

	 -- coercion funs

	cat X ; -- later: replace the Xs with actual cats
	fun
		acl_ : X -> acl ;
		advcl_ : X -> advcl ;
		advmodEmph_ : X -> advmodEmph ;
		advmodLmod_ : X -> advmodLmod ;
		amod_ : X -> amod ;
		appos_ : X -> appos ;
		aux_ : X -> aux ;
		case__ : X -> case_ ;
		ccPreconj_ : X -> ccPreconj ;
		ccomp_ : UDS -> ccomp ; -- just missing a complementiser, like "that"
		clf_ : X -> clf ;
		compound_ : X -> compound ;
		compoundLvc_ : X -> compoundLvc ;
		compoundPrt_ : X -> compoundPrt ;
		compoundRedup_ : X -> compoundRedup ;
		compoundSvc_ : X -> compoundSvc ;
		conj_ : X -> conj ;
		csubj_ : X -> csubj ;
		csubjPass_ : X -> csubjPass ;
		dep_ : X -> dep ;
		det_ : X -> det ;
		detNumgov_ : X -> detNumgov ;
		detNummod_ : X -> detNummod ;
		detPoss_ : X -> detPoss ;
		discourse_ : X -> discourse ;
		dislocated_ : X -> dislocated ;
		expl_ : X -> expl ;
		explImpers_ : X -> explImpers ;
		explPass_ : X -> explPass ;
		explPv_ : X -> explPv ;
		fixed_ : X -> fixed ;
		flat_ : X -> flat ;
		flatForeign_ : X -> flatForeign ;
		flatName_ : X -> flatName ;
		goeswith_ : X -> goeswith ;
		list_ : X -> list ;
		mark_ : X -> mark ;
		nmodPoss_ : X -> nmodPoss ;
		nmodTmod_ : X -> nmodTmod ;
		nummod_ : X -> nummod ;
		nummodGov_ : X -> nummodGov ;
		oblAgent_ : X -> oblAgent ;
		oblArg_ : X -> oblArg ;
		oblLmod_ : X -> oblLmod ;
		oblTmod_ : X -> oblTmod ;
		orphan_ : X -> orphan ;
		parataxis_ : X -> parataxis ;
		punct_ : X -> punct ;
		reparandum_ : X -> reparandum ;
		root_ : X -> root ;
		vocative_ : X -> vocative ;
		xcomp_ : Adv -> xcomp ;
        xcompA_ : AP -> xcomp ;

        -- in UD, syncategorematics (copula, tenses) are all AUX
        may_aux,
        have_aux,
        will_aux,
        can_aux,
        must_aux,
        should_aux : aux ;

        be_cop : cop ;

        it_expl : expl ; -- render [it] unlikely that …

        nsubj_ : NP -> nsubj ; -- can be NOUN, DET, PRON, but all those can be NPs in GF
        obj_ : NP -> obj ;
        iobj_ : NP -> iobj ;

        rootV_ : VP -> root ; -- TODO: figure out good way for this
        rootA_ : AP -> root ;
        rootN_ : NP -> root ;

        conjA_ : AP -> conj ;
        conjN_ : NP -> conj ;
        conjAdv_ : Adv -> conj ;

        cc_ : Conj -> cc ;
        aclRelcl_ : RS -> aclRelcl ; -- whose personal data is/was/has been affected

        obl_    : Adv -> obl ;
        advmod_ : Adv -> advmod ;
        nmod_ : Prep -> NP -> nmod ; -- UD-specific version of PrepNP
        auxPass_ : auxPass ;
        nsubjPass_ : NP -> nsubjPass ;

}