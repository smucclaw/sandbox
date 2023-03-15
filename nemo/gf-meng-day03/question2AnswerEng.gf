concrete Question2AnswerEng of Question2Answer = open Prelude in {

    lincat
      
      S = {s: Str} ;
      -- Phrase = {s: Str} ;
      Adverbial = {s: Str} ;
      Predicate = {s: Sentence => Str} ;

      Pronoun = LinPronoun ;

    lin

      you = mkPronoun "you" "you" "your" ;
      I = mkPronoun "I" "me" "my" ;
      book = ss "upon this book" ;
      oath = ss "on oath" ;
      promiseQ = ss "Do you promise to serve" ;
      promiseA = ss "I promise to serve" ;
      magazine = ss "upon this magazine" ;

      mkPredicate predicate adverbial = {s = \\pred => predicate.s ! pred ++ "," ++ adverbial.s} ;

      mkQuestion predicate = {s = predicate.s ! Question ++ "?"} ;
      mkAnswer predicate = {s = predicate.s ! Answer ++ "."} ;

      mkAdverbial adverbial = {s = adverbial.s} ;

      -- Loyalty question and answer
      Loyalty you I= {
        s =  table {

        Question => "Do" ++ you.s ! Nom ++ "swear" ++ you.s ! Gen ++ "loyalty" ++ optPunc ++ "to" ++ I.s ! Acc;

        Answer => I.s ! Nom ++ "hereby swear" ++ I.s ! Gen ++ "loyalty" ++ optPunc ++ "to" ++ you.s ! Acc
        }
      } ;

    param
      Case = Nom | Acc | Gen ;
      Sentence = Question | Answer ;

    oper
      
      -- These optional words need to be an inflection table or a record with multiple fields. (Multiple fields is something like s: Str ; n: number). Records needs the exact name, inflection tables can have variables, wildcards, computation.
      -- See https://docs.google.com/presentation/d/13RFVpcuZdfSNAFtzD9qPvCVdyET0X_-uBQLkEdOopHk/edit#slide=id.gfcd1e493b_1_51


      optPunc : Str = "," | "." | "" ;

    -- Old pronoun/possessive. See LinPronoun and mkPronoun below
      -- optPronoun : Str = "I" | "you" | "" ;
      -- optPossessive: Str = "my" | "your" | "" ;

      LinPronoun : Type = {s : Case => Str} ;

      mkPronoun : (nom, acc, gen: Str) -> LinPronoun = \nom, acc, gen -> {
        s = table {
            Nom => nom ;
            Acc => acc ;
            Gen => gen 
            }
      } ;

}