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
    : 'class' Identifier ('extends' Identifier)? classFieldBlock?
    ;

classFieldBlock
    : '{' classField+ '}'
    ;

classField
    : Identifier  ':' type
    ;

globalVarDecls 
    : 'decl' Identifier ':' type
    ;

varDeclsCommaSep
    : varDecl (',' varDecl)*
    ;

varDecl
    : Identifier ':' type
    ;

rules
    : 'rule' '<' Identifier '>' ruleVarDecls rulePrecond ruleConcl
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

type
    : 'Boolean'
    | 'Int'
    | Identifier
    | '(' type (',' type)* ')'
    | type '->' type
    ;


expr
    : 'forall' Identifier ':' type '.' expr
    | 'exists' Identifier ':' type '.' expr
    | expr '-->' expr
    | expr '||' expr
    | expr '&&' expr
    | 'if' expr 'then' expr 'else' expr
    | 'not' expr
    | 'not' 'derivable' Identifier
    | 'not' 'derivable' 'not' Identifier
    | 'not' 'derivable' Identifier Identifier
    | 'not' 'derivable' 'not' Identifier Identifier
    | expr '<' expr
    | expr '<=' expr
    | expr '>' expr
    | expr '>=' expr
    | expr '=' expr
    | expr '+' expr
    | expr '-' expr
    | '-' expr
    | expr '*' expr
    | expr '/' expr
    | expr '%' expr
    | app
    ;

app :  acc+;

acc : acc '.' Identifier
    | atom
    ;

atom
    : '(' expr (',' expr)* ')'
    | NumberLiteral
    | StringLiteral
    | Identifier
    | 'true'
    | 'false'
    ;

// START: lex

StringLiteral
    :  '"' ( EscapeSequence | ~('\\'|'"') )* '"'
    ;

NumberLiteral
	:	'0'
	|	NonZeroDigit (Digits? | Underscores Digits)
	;

fragment
Digits
	:	Digit (DigitsAndUnderscores? Digit)?
	;

fragment
Digit
	:	'0'
	|	NonZeroDigit
	;

fragment
NonZeroDigit
	:	[1-9]
	;

fragment
DigitsAndUnderscores
	:	DigitOrUnderscore+
	;

fragment
DigitOrUnderscore
	:	Digit
	|	'_'
	;

fragment
Underscores
	:	'_'+
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

