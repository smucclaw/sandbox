abstract question2Answer = {
    {-
    X: Do you promise to serve ?
    Y: I promise to serve .
    X: Do you swear your loyalty ?
    Y: I swear my loyalty .
    X: Do you swear your loyalty to me ?
    Y: I hereby swear my loyalty to you .
    X: Do you swear your loyalty , to me ?
    Y: I hereby swear my loyalty , to you .
    X: Do you swear your loyalty , to me , upon this book ?
    Y: I hereby swear my loyalty , to you , upon this book .
    X: Do you swear your loyalty , to me , upon this book , on oath ?
    -}

    cat
      
      S ;
      Question ;
      Answer ;
      Phrase ; -- Do you swear your loyalty, upon this book?
      Person ; -- you, I, me
      

    fun
      
      you, I, me : Person ;

      book : Phrase ;
      oath : Phrase ;
      toMe : Phrase ; -- to me
      toYou : Phrase ; -- to you
      loyalyQ : Phrase ; -- Do you swear your loyalty
      loyaltyA : Phrase ; -- I hereby swear my loyalty
      promiseQ : Phrase ; -- Do you promise to serve
      promiseA : Phrase ; --I promise to serve

      
      mkLoyaltyQ : Phrase -> Phrase -> Phrase ;
      mkLoyaltyA : Phrase -> Phrase -> Phrase ;

      mkPhraseQ : Phrase -> Phrase -> Phrase ;
      mkPhraseA : Phrase -> Phrase -> Phrase ;

      mkSentence : Phrase -> S ;
      

}