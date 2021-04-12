// START: grammar
grammar BabyL4;

program
    :   lexiconBlock?
    ;

lexiconBlock
    :   'lexicon' lexiconMapping+
    ;

lexiconMapping
    : Identifier '->' StringLiteral
    ;
// START: lex

StringLiteral
    :  '"' ( EscapeSequence | ~('\\'|'"') )* '"'
    ;


/** Skip whitespace */
WS : (' ' | '\t' | '\r' | '\n') {skip();} ;


LINE_COMMENT
    :   '#' ~[\r\n]*    -> channel(HIDDEN)
    ;

fragment EscapeSequence
    : '\\' [btnfr"'\\]
    ;

Identifier
    :   Letter LetterOrDigit*;

fragment LetterOrDigit
    : Letter
    | [0-9]
    ;

fragment Letter
    : [a-zA-Z$_]
    ;
// END: lex

