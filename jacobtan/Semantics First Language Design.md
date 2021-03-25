http://web.engr.oregonstate.edu/~walkiner/projects/semantics-first.html

> ## Semantics First Language Design
>
> By convention, the design of a language begins by defining its syntax based on the use cases the designer anticipates. Once the syntax is established, it is given meaning by defining (or usually, implementing) a semantics.
> 
> The semantics first approach argues for an inversion of this process on the basis that it leads to more consistent and extensible languages. In the semantics first approach, early effort is focused on organizing the target domain into a compositional denotational semantics, then incrementally growing a syntax on top of the semantic core.
> 
> The approach is partly inspired by the success of combinator-based DSLs in Haskell, such as Parsec.
> 


Below are some of my observations.

________________________________________________

## Syntax-driven:

Have domain concepts in your head, decide how you'd prefer to say it, and come up with syntax.

Syntax gets parsed into a raw AST, which then gets transformed into an intermediate representation that is more semantically coherent.

--

## External DSL:

Make your own parser, type system, tooling, etc.

Each time you find that existing syntax is insufficient to communicate something in the domain, the syntax is extended "arbitrarily".

Modify parser, type system, tooling, etc., to accommodate the changes. (friction!)

________________________________________________

## Semantics-driven:

Encode the domain concepts first. Compositionality aided by Haskell (pure functional language).

Then come up with convenient syntax.

--

## Shallow-embedding in Haskell:

No parser; leverage Haskell's type system, tooling, etc.

Each time you find that your domain model in Haskell is insufficient, it can be easily augmented, with help from Haskell's type system. (Benefits of maintaining compositionality, because Haskell is a pure functional language.)

"Syntax" is easily augmented / changed to accommodate the expanded semantics.

________________________________________________

### What are the goals of L4?

Simply to allow lawyers to write their awkward legal gobbledygook in a way understood by the computer?

Then syntax-driven is naturally the way to go. Because we want our syntax to mirror existing legal drafting syntax.

Or is the goal to create a better way to express legal concepts?

Then semantics-driven is the way. Which would likely produce syntax that is significantly different from existing legal drafting syntax, but likely much better to work with (after some familiarization).