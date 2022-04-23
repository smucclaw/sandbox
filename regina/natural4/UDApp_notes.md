1. Check for new funs to add to UDApp.gf using the python scripts in spacyconltree
    1. `pip3 install conllu` to ensure the underlying treefrom module can execute.
    2. `cp ../dsl/lib/haskell/natural4/grammars/UDApp.pgf ../spacyconlltree` to make a copy of the existing UDApp.pgf file to the spacycolltree directory
    3. `python3 make_GF_files.py ./test_ud2gf/differences NewGrammar UDApp > diff` to use the make_GF_files.py script to contrast and retrieve the incremental funs and labels from the consoliated `differences` file as compared to the existing `UPApp.pgf`
2. Put the additional newly uncovered contents of the `diff` file according to their relevance into UPApp.gf and UDApp.labels respectively.

##### Alternative Step 1 and Step 2 --
1. Get funs and labels 1 by 1 (slower)
   1. Getting UD parses for strings. t's good to find a minimal example, so try different phrasings, simplify the sentence, or if you run into ambiguity, add a word (e.g. "becoming aware" to "I become aware …")
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UDApp_screenshots/1_get_UD_parses_for_strings.png" title="UD parses for string">
    </p>
   2. In parallel, you should run these conllu files with ud2gf, so that you can see when do you hit that sweet spot of minimal example, but still not covered by the GF grammar yet. So this whole step 1 is back and forth between udpipe at spacyconllu directory (whichever way you decide to use it) and ud2gf in natural4/grammars.
   3. In the output of ud2gf, the asterisk * means that the subtree wasn't incorporated to the final tree. So your output could look like this, very disconnected—none of the subtrees b-e are connected to anything.

        [1] a
         * [2] b
         * [3] c
         * [4] d
         * [5] e
    or like this:

        [1] a
         * [2,3,4,5] b (c (d e))
    4. Find where the tree is breaking at the subtrees that are fine: The final tree is still not correct, but the subtrees b-e are now connected, and it probably requires only a very small change to connect the tree A to the B-E tree. So if your example looks more like this, that is an easier task to fix.
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UDApp_screenshots/2_find_breaking_subtrees.png" title="Find breaking points">
    </p>
    5. Troubleshooting: ud2gf in natural4/grammar produces a tree, but there is no linearisation. Most common reason: the top-level fun (in this case `root_nsubj_ccomp`) doesn't have a linearisation
       To know if a linearisation is missing, you can check in the concrete syntax whether there is a lin or not.
       Regarding "appropriate GF grammar", where to find things:

2. In linearisation for words that are adverbial in nature e.g nmod, advmod, obl, advcl. their linearisation should have 2 steps and use a let xxx in yyy structure
   root_nsubjPass_auxPass_advmod rt subj aux adv =
   -- step 1: attach the adverbial to root
   -- step 2; find fun without the advmod/conj/ part
    let root_adv : Root = rt ** {vp = mkVP rt.vp adv};
    in root_nsubjPass_auxPass root_adv subj aux;