
Let's write a parser for a language called OPM. the syntax is encoded in XHTML so import tagsoup for HTML parsing and then build upon that using MegaParsec.

The semantics of the language are drawn from Prolog, but the surface syntax is a controlled natural language.
For example, a Prolog predicate `isRed(Color) :- isHot(Foo), areRound(Shapes), baz.` might be written as:

``` html
<p class=OPM-conclusion><span>Color is red if</span></p>
<p class=OPM-level1><span>all</span></p>
<p class=OPM-level2><span>Foo</span><span>is hot</span></p>
<p class=OPM-level2><span>Shapes are round</span></p>
<p class=OPM-level2><span>baz</span></p>
```

Unification is written above using "is" and "are", also possibly "=".

Some horn clause heads may not have unification operators at all, in which case they are fact predicates, such as `someFact`.

In our type for Clauses and Predicates, the body of a clause is not a list of predicates, but a single predicate; if there are multiple items in the body, use an All conjunction.

Simple clauses are typically written as an OPM-conclusion followed by one or more OPM-level1 elements, which constitute the body of the clause.

Complex clauses are typically written as an OPM-conclusion followed by one or more OPM-level1 elements, which each is followed by one or more OPM-level2 elements.
There are two scenarios: first, the OPM-level1 element is a conjunction such as "and" or "or", in which case the OPM-level2 elements are the individual conjuncts.
The conjunction operators could also be list-oriented operators such as "all" and "any". The clause bodies should be structured accordingly, as a datatype with
`Any [Predicate]`, `All [Predicate]`, `Predicate PredName [String]`.

The second scenario defines an OPM-level1 element as a subsidiary clause head, without the "if" at the end; the body of that subsidiary clause is given by the subsequent OPM-level2 elements.

The `<span>` and other text-level elements within the `<p>` elements should be flattened to strings, ignoring the attributes and tags

The following is sample input:

``` html
<p class=OPM-conclusion><a name="OLE_LINK1"><span lang=EN-IN>the business name
is confirmed if</span></a></p>

<p class=OPM-level1><u><span lang=EN-IN style='color:black'>the business</span></u><span
lang=EN-IN style='color:black'> is currently known and</span></p>

<p class=OPM-level1><u><span lang=EN-IN style='color:black'>the business</span></u><span
lang=EN-IN style='color:black'> is certain and</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the user has confirmed
the business name</span></p>

<p class=OPM-conclusion><span lang=EN-IN>the business sector is confirmed if</span></p>

<p class=OPM-level1><u><span lang=EN-IN style='color:black'>the sector in which
the business operates</span></u><span lang=EN-IN style='color:black'> is
currently known and</span></p>

<p class=OPM-level1><u><span lang=EN-IN style='color:black'>the sector in which
the business operates</span></u><span lang=EN-IN style='color:black'> is
certain and</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the user has confirmed
the business sector</span></p>

<p class=OPM-conclusion><span lang=EN-IN>the business's stage of finance is
confirmed if</span></p>

<p class=OPM-level1><u><span lang=EN-IN style='color:black'>the business's
stage of finance</span></u><span lang=EN-IN style='color:black'> is currently
known and</span></p>

<p class=OPM-level1><u><span lang=EN-IN style='color:black'>the business's
stage of finance</span></u><span lang=EN-IN style='color:black'> is certain and</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the user has confirmed
the business's stage of finance</span></p>

<p class=OPM-conclusion><span lang=EN-IN>the business's stage of
commercialization is confirmed if</span></p>

<p class=OPM-level1><u><span lang=EN-IN style='color:black'>the business's
stage of commercialization</span></u><span lang=EN-IN style='color:black'> is
currently known and</span></p>

<p class=OPM-level1><u><span lang=EN-IN style='color:black'>the business's
stage of commercialization</span></u><span lang=EN-IN style='color:black'> is
certain and</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the user has confirmed
the business's stage of commercialization</span></p>

<p class=OPM-conclusion><span lang=EN-IN>the business's investment requirements
are confirmed if</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the business's
investment details are entered</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the level of
investment requested by the business</span></u><span lang=EN-IN
style='color:black'> is currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the level of
investment requested by the business</span></u><span lang=EN-IN
style='color:black'> is certain and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the number of
shares in the business being offered</span></u><span lang=EN-IN
style='color:black'> is currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the number of
shares in the business being offered</span></u><span lang=EN-IN
style='color:black'> is certain and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the total number of
shares in the business</span></u><span lang=EN-IN style='color:black'> is
currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the total number of
shares in the business</span></u><span lang=EN-IN style='color:black'> is
certain</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>and</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the user has confirmed
the business's investment requirements</span></p>

<p class=OPM-conclusion><span lang=EN-IN>the business's financial details are
confirmed if</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the business's
financial details are entered</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
total revenue in 2023</span></u><span lang=EN-IN style='color:black'> is
currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
total revenue in 2023</span></u><span lang=EN-IN style='color:black'> is
certain and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
EBITDA in 2023</span></u><span lang=EN-IN style='color:black'> is currently
known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
EBITDA in 2023</span></u><span lang=EN-IN style='color:black'> is certain and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
total revenue in 2022</span></u><span lang=EN-IN style='color:black'> is
currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
total revenue in 2022</span></u><span lang=EN-IN style='color:black'> is
certain and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
EBITDA in 2022</span></u><span lang=EN-IN style='color:black'> is currently
known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
EBITDA in 2022</span></u><span lang=EN-IN style='color:black'> is certain and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
projected ROI as an annual percentage (input)</span></u><span lang=EN-IN
style='color:black'> is currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
projected ROI as an annual percentage (input)</span></u><span lang=EN-IN
style='color:black'> is certain</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>and</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the user has confirmed
the business's financial details</span></p>

<p class=OPM-conclusion><span lang=EN-IN>the business's runway is confirmed if</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the business's cash
details are entered</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
current cash on hand</span></u><span lang=EN-IN style='color:black'> is
currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
current cash on hand</span></u><span lang=EN-IN style='color:black'> is certain
and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
current monthly expenses</span></u><span lang=EN-IN style='color:black'> is
currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
current monthly expenses</span></u><span lang=EN-IN style='color:black'> is
certain</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>and</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the user has confirmed
the business's runway</span></p>

<p class=OPM-conclusion><span lang=EN-IN>the business's other details are
confirmed if</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the business's other
details are entered</span></p>

<p class=OPM-level2><span lang=EN-IN style='color:black'>it is currently known
whether or not <u>one of the founders of the business has started a business in
the past</u> and</span></p>

<p class=OPM-level2><span lang=EN-IN style='color:black'>it is certain whether <u>one
of the founders of the business has started a business in the past</u> and</span></p>

<p class=OPM-level2><span lang=EN-IN style='color:black'>it is currently known
whether or not <u>one of the founders of the business has started and sold a
business in the past</u> and</span></p>

<p class=OPM-level2><span lang=EN-IN style='color:black'>it is certain whether
or not <u>one of the founders of the business has started and sold a business
in the past</u> and</span></p>

<p class=OPM-level2><span lang=EN-IN style='color:black'>it is currently known
whether or not <u>the business has an element of Environmental, Social and
Governance</u> and</span></p>

<p class=OPM-level2><span lang=EN-IN style='color:black'>it is certain whether
or not <u>the business has an element of Environmental, Social and Governance</u>
and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the number of
people in the team of the business</span></u><span lang=EN-IN style='color:
black'> is currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the number of
people in the team of the business</span></u><span lang=EN-IN style='color:
black'> is certain and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the total number of
years experience of the team of the business</span></u><span lang=EN-IN
style='color:black'> is currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the total number of
years experience of the team of the business</span></u><span lang=EN-IN
style='color:black'> is certain and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
number of past and current clients</span></u><span lang=EN-IN style='color:
black'> is currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
number of past and current clients</span></u><span lang=EN-IN style='color:
black'> is certain </span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>and</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the user has confirmed
the business's other details</span></p>

<p class=OPM-blankline><span lang=EN-IN>&nbsp;</span></p>

<p class=OPM-conclusion><span lang=EN-IN>the business's market metrics are
confirmed if</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the business
business's market metrics are entered</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
Total Addressable Market (TAM)</span></u><span lang=EN-IN style='color:black'>
is currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
Total Addressable Market (TAM)</span></u><span lang=EN-IN style='color:black'>
is certain and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
Serviceable Addressable Market (SAM)</span></u><span lang=EN-IN
style='color:black'> is currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
Serviceable Addressable Market (SAM)</span></u><span lang=EN-IN
style='color:black'> is certain and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
Serviceable Obtainable Market (SOM)</span></u><span lang=EN-IN
style='color:black'> is currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
Serviceable Obtainable Market (SOM)</span></u><span lang=EN-IN
style='color:black'> is certain</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>and</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the user has confirmed
the business's market metrics</span></p>

<p class=OPM-conclusion><span lang=EN-IN>the business's performance values are
confirmed if</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the business
performance values are entered</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
Compound annual growth rate (CAGR)</span></u><span lang=EN-IN style='color:
black'> is currently known</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
Compound annual growth rate (CAGR)</span></u><span lang=EN-IN style='color:
black'> is certain</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
customer acquisition cost (CAC)</span></u><span lang=EN-IN style='color:black'>
is currently known and</span></p>

<p class=OPM-level2><u><span lang=EN-IN style='color:black'>the business's
customer acquisition cost (CAC)</span></u><span lang=EN-IN style='color:black'>
is certain</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>and</span></p>

<p class=OPM-level1><span lang=EN-IN style='color:black'>the user has confirmed
the business's performance values</span></p>

<p class=OPM-blankline><span lang=EN-IN>&nbsp;</span></p>
```
