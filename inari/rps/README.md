# How to generate a RPS model in GF

TODO

## Which parts took human effort

* Linearisation of App1 and App2
* Linearisation of Aggregate*
* GF constructors for Atoms: how to handle nouns, verbs, adjectives (*throws a rock*, *is a participant in*, *are players*). This is straightforward enough in GF, but you need a human who knows the RGL.
* All Haskell code for tree transformations

## Which parts are easy, could be automated

* Given an abstract syntax for s(CASP), creating the core GF abstract syntax
* Abstract syntaxome extensions: like App1 can become Aggregate1 with multiple subjects sharing a predicate (*A and C are players*), or multiple predicates sharing a subjet (*A is a player and a winner*). App2 can aggregate subject, object or predicate. Sometimes App1 and App2 can be mixed: *A and C are players and participants in B*. Not always: *?A and C are players and throw rock*.
* Given smart GF constructors for Atoms, fill in new lexicon with WordNet (if monolingual, can skip sense distinctions)


