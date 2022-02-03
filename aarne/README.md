# Top-level grammar for Singapore Law texts

Based on Act 6A of PDPA.

Files:

- Analyse.hs  -- Haskell file for generating the grammar
- Top.cf      -- (obsolete) the generated grammar, with manual modifications at the end
- Law.gf      -- abstract syntax converted from Top.cf
- LawEng.gf   -- abstract syntax converted from Top.cf
- LawParser.hs -- script for parsing and analysing lines of text
- Spreadsheet.hs -- a simple recursive spreadsheet data structure
- act-6A.html -- the original document
- act-6A.txt  -- the original as plain text
- annotated-6A.txt -- the origina annotated with categories and keywords
- lines-6A.txt  -- the original separated by empty lines (for UD)
- tokenized-6A.txt -- the original tokenized so that it can be parsed


Processing:
- build pgf: `gf --make LawEng.gf`
- parse text: `runghc LawParser.hs <tokenized-6A.txt`

Older processing:

- generate the grammar: `runghc Analyse.hs >GenTop.cf` (no longer needed)
- parse in GF:
```
> i Top.cf
> rf -file="tokenized-6A.txt" -lines | p -cat=Line
```

## Alternative: use stack

If you don't have a global GHC, you can also run this with stack. In that case, follow these steps:

* `stack build` to build both executables

#### Processing:
- build pgf—**identical to previous instruction**: `gf --make LawEng.gf`
- parse text: `stack run LawParser <tokenized-6A.txt`

#### Older processing:
- generate the grammar: `stack run Analyses > GenTop.cf` (no longer needed)
