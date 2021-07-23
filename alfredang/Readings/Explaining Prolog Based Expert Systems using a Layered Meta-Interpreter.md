### Meta
Authors: Leon Sterling, L. Umit Yalginalp

### Core ideas
An expert system's explanatory scope falls under 3 areas:
1. How explanations (How the ES arrived at the conclusion, typically provided after computation)
2. Whynot explanations (Why a goal might not be possible/allowable, typically provided after computation)
3. Why explanations (Why the ES is asking for more information, typically provided during computation)

To enable an expert system to give explanations, we require certain constructs:
- Proof trees; represents successful branches of the search tree implicitly generated and traversed during Prolog's computation
- History lists; represents the current branch of the search tree being traversed, commonly implemented as a stack of successive goals investigated up to the current goal (Is this the "trace" that [[Martin Strecker]] was referring to?)
- Failure trees; represent failure branches of the search tree that have been traversed

#### "State of the Art" solutions & their inadequacies
In [[The Art of Prolog]](1986), Sterling and Sharpiro detail a "four clause meta-interpreter" that implement these constructs. 
The authors point out certain flaws of that implementation:
- It does not explain extra-logical predicates like "negation" & "cut"
- During computation, when asked for more information (a Why question), the user is unable to see other parts of the search tree.



### Blurb

Didn't see the "see first page" comment in Meng note where he linked this, read the whole thing. 

It helped expose me to the vocabulary used to a lot of the things I was struggling to elucidate earlier (Proof trees & Failure trees). I really liked the idea of having "branches" of computation, that were explicit and available to the user.

___
related: 
tags: #ExpertSystems #computerscience 