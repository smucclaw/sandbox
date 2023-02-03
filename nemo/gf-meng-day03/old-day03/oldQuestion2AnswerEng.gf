concrete question2AnswerEng of question2Answer = open Prelude in {

    lincat
      
      S = {s: Str} ;
      Question = {s: Str} ;
      Answer = {s: Str} ;
      Phrase = {s: Str} ;
      Person = {s: Str} ;

    lin

      you = ss "you" ;
      I = ss "I" ;
      me = ss "me" ;
      book = ss "upon this book" ;
      oath = ss "on oath" ;
      toMe = ss "to me" ;
      toYou = ss "to you" ;
      loyalyQ = ss (optDo ++ "you swear your loyalty") ;
      loyaltyA = ss ("I" ++ optHereby ++ "swear my loyalty") ;
      promiseQ = ss "Do you promise to serve" ;
      promiseA = ss "I promise to serve" ;

      mkLoyaltyQ loyalty phrase = {s = "Do" ++ loyalty.s ++ optPunc ++ phrase.s ++ optPunc} ;
      mkLoyaltyA loyalty phrase = {s = loyalty.s ++ optPunc ++ phrase.s ++ optPunc} ;

      mkPhraseQ phraseA phraseB = {s = phraseA.s ++ optPunc ++ phraseB.s ++ optPunc} ;
      mkPhraseA phraseA phraseB = {s = phraseA.s ++ optPunc ++ phraseB.s ++ optPunc} ;

      mkSentence Phrase = {s = Phrase.s ++ optPunc} ;

    oper
      
      optPunc : Str = "," | "." | "" | "?" ;
      optHereby : Str = "hereby" | "" ;
      optDo : Str = "Do" | "" ;

}