--# -path=/Users/inari/work/GF/gf-ud/grammars

concrete UDAppEng of UDApp =
  BareRGEng, JustWordsWordNetEng **
  open Prelude, SyntaxEng, ParadigmsEng, IrregEng in {

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
   nsubj = NP ;
   -- nsubjPass ; --TODO
   obj = NP ;
   iobj = NP ;
   xcomp = Comp ;
   nmod,
   advmod = Adv ;

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

   rootV_ vp = mkRoot vp ;
   rootV2_ vp = mkRoot vp ;
   rootA_ ap = mkRoot ap ;
   rootN_ np = mkRoot np ;

   case_noun_nmod = PrepNP ;

   -- syntactic functions
   -- : root -> nsubj -> UDS ;  -- the cat sleeps
   --intransitive rt np = mkUDS np rt.vp ;

   -- : root -> nsubj -> obj -> UDS ; -- the cat sees us
   --transitive rt sub ob = mkUDS sub (mkVP (root2vpslash rt) ob) ;

   -- : root -> nsubj -> cop -> UDS ; -- the cat is small
   pred rt sub cp = mkUDS sub rt.vp ;

   -- : root -> nsubj -> cop -> nmod -> UDS ;
   pred_advmod,
   pred_nmod = \rt,sub,cop,adv -> mkUDS sub (mkVP rt.vp adv) ;

   --anyUDS s = mkCl i_NP (mkVP know_VS <s : S>) ;

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

   Root : Type = {vp : VP ; c2 : Str} ;

   mkRoot = overload {
      mkRoot : AP -> Root = \ap -> emptyRoot ** {vp = mkVP ap} ;
      mkRoot : NP -> Root = \np -> emptyRoot ** {vp = mkVP np} ;
      mkRoot : VP -> Root = \vp -> emptyRoot ** {vp = vp} ;
      mkRoot : VPSlash -> Root = \vp -> emptyRoot ** {vp = vp ; c2 = vp.c2}
   } ;

   emptyRoot : Root = {
      vp = mkVP (mkN "dummy") ;
--      comp = mkComp (mkNP (mkN "dummy")) ;
      c2 = []
   } ;

   root2vpslash : Root -> VPSlash = \root -> root.vp ** {
      c2 = root.c2 ;
      gapInMiddle,
      missingAdv = False  -- TODO check
      } ;

}