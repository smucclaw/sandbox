# Top-level grammar for Singapore Law texts

Based on Act 6A of PDPA.

Files:

- Analyse.hs  -- Haskell file for generating the grammar
- Top.cf      -- the generated grammar, just in case
- act-6A.html -- the original document
- act-6A.txt  -- the original as plain text
- annotated-6A.txt -- the origina annotated with categories and keywords
- lines-6A.txt  -- the original separated by empty lines (for UD)
- tokenized-6A.txt -- the original tokenized so that it can be parsed

Processing:

- generate the grammar: `runghc Analyse.hs >Top.cf`
- parse in GF: `rf -file="tokenized-6A.txt" -lines | p -cat=Line`




