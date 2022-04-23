1. Check for new funs to add to UDApp.gf using the python scripts in spacyconltree
    1. `pip3 install conllu` to ensure the underlying treefrom module can execute.
    2. `cp ../dsl/lib/haskell/natural4/grammars/UDApp.pgf ../spacyconlltree` to make a copy of the existing UDApp.pgf file to the spacycolltree directory
    3. `python3 make_GF_files.py ./test_ud2gf/differences NewGrammar UDApp > diff` to use the make_GF_files.py script to contrast and retrieve the incremental funs and labels from the consoliated `differences` file as compared to the existing `UPApp.pgf`
2. Put the additional newly uncovered contents of the `diff` file according to their relevance into UPApp.gf and UDApp.labels respectively.

##### Alternative Step 1 and Step 2 --
1. Get funs and labels 1 by 1 (slower)
   1. Getting UD parses for strings. t's good to find a minimal example, so try different phrasings, simplify the sentence, or if you run into ambiguity, add a word (e.g. "becoming aware" to "I become aware …")
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UDApp_screenshots/1_get_UD_parses_for_strings.png">
    </p>
   2.

2. In linearisation for words that are adverbial in nature e.g nmod, advmod, obl, advcl. their linearisation should have 2 steps and use a let xxx in yyy structure
   root_nsubjPass_auxPass_advmod rt subj aux adv =
   -- step 1: attach the adverbial to root
   -- step 2; find fun without the advmod/conj/ part
    let root_adv : Root = rt ** {vp = mkVP rt.vp adv};
    in root_nsubjPass_auxPass root_adv subj aux;