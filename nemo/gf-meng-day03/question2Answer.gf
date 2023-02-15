abstract Question2Answer = {
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
      -- Phrase ; -- Do you swear your loyalty, upon this book?
      Adverbial ;
      Predicate ;
      Pronoun ;

    fun
      
      -- you, I, me : Person ;
      I, you : Pronoun ;

      book : Adverbial ;
      oath : Adverbial ;
      promiseQ : Adverbial ; -- Do you promise to serve
      promiseA : Adverbial ; --I promise to serve

      Loyalty : Pronoun -> Pronoun -> Predicate ;

      mkPredicate : Predicate -> Adverbial -> Predicate ;

      -- mkPhrase : Phrase -> Phrase -> Phrase ;
      -- mkPredicate : Phrase -> Phrase -> Predicate ;

      mkQuestion : Predicate -> S ;
      mkAnswer : Predicate -> S ;

}