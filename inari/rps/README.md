# Quick and dirty RPS grammar in GF

### Files
```
RockPaperScissors.gf    -- abstract syntax
RockPaperScissorsEng.gf -- English concrete syntax
demo.sh                 -- Hand-crafted trees
```

### Usage

```
$ ./demo.sh
Player 1: Jason
Player 2: Inari
Name of the game: Go

Jason wins Go if Jason and Inari are players , Go is a game , Jason and Inari are participants in Go and
* Jason throws rock and Inari throws scissors ,
* Jason throws paper and Inari throws rock or
* Jason throws scissors and Inari throws paper
```

### What is this

#### Writing the grammar

> "What information would GF need in order to be able to do it, and is that information already in the s(CASP) code, or no?"

From the s(CASP) code we can get pretty quickly to a GF abstract syntax. For instance, the arity of functions/predicates/whatever like `IsGame`, `Wins`, `ThrowRock` etc. I've made them all take strings as arguments: e.g. "Inari" or "Jason" are good arguments for all.

The s(CASP) code doesn't have much for the concrete syntax. You need a person to encode that "in $game" is an adverbial, which then attaches to the noun "participant", to form "Inari is a participant in RPS".

You could probably automate lexicon to some extent: search for the words in the s(CASP) code in WordNet, and then instead of writing `mkN "player"`, you can use `WordNet.player_1_N` _"a person who participates in or is skilled at some game"_. (Need to check that you don't accidentally choose `player_2_N` _"someone who plays a musical instrument"_.)

If you want to make it multilingual, the biggest effort was in creating the abstract syntax and the first concrete. Additional concretes may need some modification, but it's less work than writing one from scratch. It's more things like, "are _scissors_ a plural noun also in $LANG?", or "does $LANG use the verb _throw_ for RPS?". (Although, if you made it through the trouble to choose `throw_14_V2` from WordNet, that's more likely to be translated as the right sense of _throw_ even in $LANG.)

#### Mapping from sCASP code to GF trees

The expressions in `demo.sh` are constructed manually and manipulating strings.

In the real case, we create a Haskell version of the GF abstract syntax, and do all this
as AST -> AST mapping. In such a version, `Wins`, `ThrowRock` and such are Haskell constructors, and if you're about to apply them to the wrong type of argument, your compiler (or editor) will complain about type error. The actual experience of mapping is much nicer than inserting the string `$a` to the right slot in a string like `Players __ $c`.
