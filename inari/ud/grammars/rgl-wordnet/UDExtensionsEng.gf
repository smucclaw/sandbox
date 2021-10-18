concrete UDExtensionsEng of UDExtensions = UDAppEng **
  open SyntaxEng, ExtendEng in {

  lin
    -- : NP -> UDS -> UDFragment ; -- add new or replace existing subject
    addSubj np uds = mkS (mkCl np uds.pred) ;

    -- : UDS -> UDFragment ;
    -- upon [becoming aware a data breach has occurred]
    gerund uds = mkUtt (ExtendEng.GerundCN uds.pred) ;

    -- has the data breach occurred on or after <date>?
    question uds = mkUtt (mkQS (mkQCl (mkCl uds.subj uds.pred))) ;
    negation uds = mkS negativePol (mkCl uds.subj uds.pred) ;

}