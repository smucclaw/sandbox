// START: grammar
grammar BabyL4;

program
    :   lexiconBlock? classDeclaration* globalVarDecls* rules* assertions*
    ;

lexiconBlock
    :   'lexicon' lexiconMapping+
    ;

lexiconMapping
    : Identifier '->' StringLiteral
    ;

classDeclaration
    : 'class' Identifier classFieldBlock?
    ;

classFieldBlock
    : '{' classField+ '}'
    ;

classField
    : Identifier  ':' Identifier
    ;

globalVarDecls 
    : 'decl' Identifier ':' Identifier
    ;

varDeclsCommaSep
    : varDecl (',' varDecl)*
    ;

varDecl
    : Identifier ':' Identifier
    ;

rules
    : 'rule <' Identifier '>' ruleVarDecls rulePrecond ruleConcl
    ;

ruleVarDecls
    : 'for' varDeclsCommaSep
    ;

rulePrecond
    : 'if' expr
    ;

ruleConcl
    : 'then' expr
    ;

assertions
    : 'assert' expr
    ;

expr
    : 'dummy'
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

