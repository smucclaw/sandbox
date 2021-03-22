# Output s(CASP) models in GF

Given a set of models, such as

```
  { win(A,RPS),  is_game(RPS),  
    is_participant_in(A,RPS), is_player(A),  throw(A,rock), 
    is_player(C),  is_participant_in(C,RPS), throw(C,scissors),  beat(rock,scissors) }
  { win(A,RPS),  is_game(RPS),  
    is_participant_in(A,RPS),  is_player(A),  throw(A,scissors),  
    is_player(C),  is_participant_in(C,RPS),  throw(C,paper),  beat(scissors,paper) }
  { win(A,RPS),  is_game(RPS),  
    is_participant_in(A,RPS),  is_player(A),  throw(A,paper), 
    is_player(C),  is_participant_in(C,RPS),  throw(C,rock),  beat(paper,rock) }
```

we transform it into this:

```
A wins RPS

if all of the following hold:

* RPS is a game and 
* A and C are players and participants in RPS

and one of the following holds:

* A throws rock , C throws scissors and rock beats scissors , 
* A throws scissors , C throws paper and scissors beats paper or 
* A throws paper , C throws rock and paper beats rock
```

## NLG pipeline

![Diagram of the NLG pipeline](./NLG-pipeline.svg)

## Which parts took human effort

* Linearisation of App1 and App2
* Linearisation of Aggregate*
* GF constructors for Atoms: how to handle nouns, verbs, adjectives (*throws a rock*, *is a participant in*, *are players*). This is straightforward enough in GF, but you need a human who knows the RGL.
* All Haskell code for tree transformations
* Naming scheme for predicates in s(CASP): if it's verb, use infinitive. If it's noun or adjective, prefix with `is_`.
   * ✅ `win(A)` becomes `mkV "win"`
   * ✅ `is_winner(A)` becomes `mkN "winner"`
   * ❌ `winner(A)` becomes `mkV "winner"`, which is incorrect.

## Which parts can be automated

* Given an abstract syntax for s(CASP), creating the core GF abstract syntax
* Abstract syntax extensions: like App1 can become Aggregate1 with multiple subjects sharing a predicate (*A and C are players*), or multiple predicates sharing a subjet (*A is a player and a winner*). App2 can aggregate subject, object or predicate. Sometimes App1 and App2 can be mixed: *A and C are players and participants in B*. Not always: *?A and C are players and throw rock*.
* Given smart GF constructors for Atoms, fill in new lexicon.
  * With WordNet (if monolingual, can skip sense distinctions), or
  * Use smart paradigms from the RGL + custom heuristics, e.g. `is_game` becomes `mkAtom (mkN "game")`


