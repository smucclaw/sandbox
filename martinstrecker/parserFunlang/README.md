# parserFunlang

An example of a small functional language featuring

- syntax analysis with Alex and Happy
- type checking
- comming soon: evaluation


How to run:

* Either with:

stack ghci

process environment expression
where
environment is an association list (variables, types)
expression is a string to be parsed and processed
Attention, "lambdas" have to be escaped

for example:
process [("a", IntT)] "\\ f: (Int -> Int) -> (f a)"

* Or with:

stack build 

stack exec parserFunlang

then enter expression to be checked
(in an empty environment, and "lambda" unescaped)
for example:
Funlang> \ f: (Int -> Int) -> \a : Int -> (f a)

Much of the original setup copied from:
http://dev.stephendiehl.com/fun/008_extended_parser.html




