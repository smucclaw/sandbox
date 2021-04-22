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
    : Identifier  ':' tp
    ;

globalVarDecls 
    : 'decl' Identifier ':' tp
    ;

varDeclsCommaSep
    : varDecl (',' varDecl)*
    ;

varDecl
    : Identifier ':' tp
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

atp  : 'Boolean'
     | 'Int'
     | Identifier
     | '(' tp (',' tp)* ')'
     ;

tp   : atp
     | tp '->' tp
     ;

expr
    : 'forall' Identifier ':' tp '.' expr
    | 'exists' Identifier ':' tp '.' expr
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

