# Methodology

1. Create a grammar that can parse both question and answer
2. Export to PGF
3. Write a Python/Haskell interpreter that uses the PGF and 'translates' one sentence to another

As of 27/01/2023, this grammar can parse:

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

But semantically there's too many trees. I need to:

1. Not have different functions for Q and A at the linearisation level, i.e. Should not have loyaltyQ and loyaltyA, just one loyalty. I can do this with discontinuous constituents. Something like:


    (Note: need to define Agr and Case with Params (Agr = Sg1 | Sg2 | Sg3) and so on) 

    lincat Phrase = {pred, compl: Str, Mod : Agr => Str}

    serveLoyalty = {
        pred = "serve" ;
        compl = "loyalty" ;
        Mods = "upon oath" ;
    } ;
    
    Mod = table {
        Sg1 => "upon my book" ;
        Sg2 => "upon your book" ;
        ... } ;
    }

2. Make "You, I, me" into an inflection table. 