# Parse-OIA

Parses the Oracle Intelligent Assistant / Oracle Policy Modelling rules into Horn clauses, with a little bit of semantic desugaring of Prolog-style functionality, e.g. `member/2`


## Usage

``` bash
cabal run < ~/src/smucclaw/royalflush/oia-rules/Business\ Rules.html > business-rules.hs
cabal run < ~/src/smucclaw/royalflush/oia-rules/Business\ Status.html > business-status.hs
cabal run < ~/src/smucclaw/royalflush/oia-rules/System\ Rules.html > system-rules.hs
```

## Upstream

The HTML we work with is an OIA business rule Word document saved as
"Filtered HTML". Critically, we rely on the class names
`OPM-conclusion`, `OPM-level[123...]` to intuit the structure of the
Horn clauses.

## Downstream

This is meant to then transpile toward
[Lam4](https://github.com/smucclaw/lam4) and then
[Simala](https://github.com/smucclaw/simala) for integration into the
[L4](https://github.com/smucclaw/dsl/) language family.

## Resources

OIA / OPM: https://documentation.custhelp.com/euf/assets/devdocs/cloud19b/PolicyAutomation/en/Default.htm#Guides/Policy_Modeling_User_Guide/Work_with_rules/Rule_types.htm

Our AST is a modified version of that found in https://hackage.haskell.org/package/prolog

# TODO

break this out into its own repo

upgrade from propositional (`"foo is bar" :- ...`) to predicate logic style (`isBar(foo) :- ...`)

integrate fully with Language.Prolog to actually support consult/1

