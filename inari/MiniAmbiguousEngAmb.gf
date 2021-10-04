concrete MiniAmbiguousEngAmb of MiniAmbiguous = open SyntaxEng, ParadigmsEng, (R=ResEng), ExtendEng in {
    lincat
      VP = {verb : Str ; compl : Str} ;
      NP = SyntaxEng.NP ;
      Adv = SyntaxEng.Adv ;
    lin
      at_home = ParadigmsEng.mkAdv "at home" ;
      legal_work = mkNP (mkCN legal_A work_N) ;
      perform np = {verb = linVPS (R.agrP3 R.Sg) (myVPS (mkVP perform_V)) ; compl = (mkUtt np).s} ;
      AdvVP vp adv = vp ** {
        compl = vp.compl ++ adv.s
      } ;

      AdvNP np adv = np ** {
        s = \\c => np.s ! c ++ adv.s
        } ;
    oper
      myVPS : SyntaxEng.VP -> VPS = \vp -> MkVPS (mkTemp presentTense simultaneousAnt) positivePol vp ;
      perform_V : V = mkV "perform" ;
      legal_A : A = mkA "legal" ;
      work_N : N = mkN "work" ;

    linref
      VP = \vp -> vp.verb ++ vp.compl ;
}