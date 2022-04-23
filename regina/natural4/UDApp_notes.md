## Working with the GF grammar
You have written a test case in TestNLG, and ud2gf doesn't parse it correctly—either it's incomplete, wrong, or you get an error "can't parse string <your sentence>".
#### 1. Parsing errors:
So we need to run stuff manually. The first step is to parse your sentence with udpipe manually, without the pipeline in the Haskell code.

1. Check for new funs to add to UDApp.gf using the python scripts in spacyconltree
    1. `pip3 install conllu` to ensure the underlying treefrom module can execute.
    2. `cp ../dsl/lib/haskell/natural4/grammars/UDApp.pgf ../spacyconlltree` to make a copy of the existing UDApp.pgf file to the spacycolltree directory
    3. `python3 make_GF_files.py ./test_ud2gf/differences NewGrammar UDApp > diff` to use the make_GF_files.py script to contrast and retrieve the incremental funs and labels from the consoliated `differences` file as compared to the existing `UPApp.pgf`.
2. Put the additional newly uncovered contents of the `diff` file according to their relevance into `UPApp.gf` and `UDApp.labels` respectively. This is the mechanical part of the fixing process.

    <ins>Alternative Step 1 and Step 2</ins>
    *Get funs and labels 1 by 1 (slower)*
    * Getting UD parses for strings. It's good to find a minimal example, so try different phrasings, simplify the sentence, or if you run into ambiguity, add a word (e.g. "becoming aware" to "I become aware …")
        <p align="center">
        <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UDApp_screenshots/1_get_UD_parses_for_strings.png" title="UD parses for string">
        </p>

3. In parallel, you should run these conllu files with ud2gf, so that you can see when do you hit that sweet spot of minimal example, but still not covered by the GF grammar yet. So this whole step 1 is back and forth between udpipe at spacyconllu directory (whichever way you decide to use it) and ud2gf in natural4/grammars.
   </br> In the output of ud2gf, the asterisk * means that the subtree wasn't incorporated to the final tree. So your output could look like this, very disconnected—none of the subtrees b-e are connected to anything.

        [1] a
         * [2] b
         * [3] c
         * [4] d
         * [5] e
    or like this:

        [1] a
         * [2,3,4,5] b (c (d e))
    </br> Find where the tree is breaking at the subtrees that are fine: The final tree is still not correct, but the subtrees b-e are now connected, and it probably requires only a very small change to connect the tree A to the B-E tree. So if your example looks more like this, that is an easier task to fix.
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UDApp_screenshots/2_find_breaking_subtrees.png" title="Find breaking points">
    </p>

### 2. Troubleshooting: ud2gf in natural4/grammar produces a tree, but there is no linearisation.
1. Most common reason: the top-level fun (in this case) `root_nsubj_ccomp` doesn't have a linearisation
    </br> To know if a linearisation is missing, you can check in the concrete syntax whether there is a lin or not.
    </br> Regarding **"appropriate GF grammar"**, where to find things:
    </br> * **UDCat(Eng)**: coercion funs, e.g. `obl_ : Adv -> obl` ; some of these funs may have more arguments, but as a rule, *their return types are UD labels, not UDS (our custom type, the startcat of UDApp, entrypoint of NLG.hs). The coercion funs may take UDS as arguments.*
       </br> - Examples of more complex "coercion funs" in UDCat:

        xcompAdv_ : Adv -> xcomp ;
        xcompN_ : NP -> xcomp ; -- considered [a building]
        xcompToBeN_ : mark -> cop -> NP -> xcomp ; -- considered [to be a building]
        xcompA_ : AP -> xcomp ; -- become [aware]:
        xcompA_ccomp_ : AP -> ccomp -> xcomp ; -- become [aware [that a data breach occurred]]

        ccomp_ : UDS -> ccomp ; -- just missing a complementiser, like "that"

    </br>* **UDApp(Eng)**: Sentence pattern funs, e.g. `root_nsubj : root -> nsubj -> UDS` . All these funs that return UDS come from a corpus—there was some sentence in the corpus that followed that pattern, e.g. "breach occurs", "the cat sleeps". (There may be other funs in UDApp, but we should move them into different modules.)
    </br>* **UDExt(Eng)**: Only used for NLG, not parsing
    <p float="left">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UDApp_screenshots/3a_troubleshoot.png" title="Troubleshooting: No linearisation">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UDApp_screenshots/3b_troubleshoot.png" title="Troubleshooting: Search for lin ">
    </p>
</br> If a sentence pattern fun is missing a lin, we can add it into UDAppEng. Many of the sentence pattern funs are very similar, so check in the concrete syntax if a similar fun already has a lin, you can probably reuse it.
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UDApp_screenshots/3b_troubleshoot.png" title="Troubleshooting: Search for lin ">
    </p>
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UDApp_screenshots/4_leverage_existing_funs.png" title="Reuse existing lin">
    </p>
After you're done, do `./updateHS.sh.`


### 3. Linearisations process with example
1. Do the mechanical part of labels and funs first (Section 1 Parsing Error Step 2)
2. Fix the linearisation by Debugging by taking advantage of the *.conllu* and *ud2gf*
   1. Start debugging: what is the sentence pattern of that sentence? Use the flag `ut`  to ud2gf to print out the sentence in an indented format, and then I filter out all but the immediate children:

            [inari]% cat <file>.conllu | gf-ud ud2gf UDApp Eng UDS ut no-backups | grep -v "        "
            8       goes    go      VERB    VBZ     Mood=Ind|Number=Sing|Person=3|Tense=Pres|VerbForm=Fin   0       root    _       FUN=goVBZ
                1   if      if      SCONJ   IN      _       8       mark    _       _
                4   device  device  NOUN    NN      Number=Sing     8       nsubj   _       FUN=device_N
                9   missing miss    ADJ     JJ      Degree=Pos      8       xcomp   _       FUN=miss_A
    2. This one is good news: the missing `missing` is an immediate child of the root. Following the naming scheme for sentence pattern funs, this one would be `root_mark_nsubj_xcomp`. We can verify that it doesn't exist in the grammar yet:

            [inari]% ag root_mark_nsubj_xcomp
            (no result)
    3. Recall that subtree that can't be incorporated final tree are marked with *. Here the subtree 'missing' is missing

        <p align="center">
        <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UDApp_screenshots/5.1_example_mssing_subtree.png" title="Subtree that can't be incorporated into the final tree">
        </p>
3. In linearisation for words that are adverbial in nature e.g nmod, advmod, obl, advcl. their linearisation should have 2 steps and use a let xxx in yyy structure
   root_nsubjPass_auxPass_advmod rt subj aux adv =
   -- step 1: attach the adverbial to root
   -- step 2; find fun without the advmod/conj/ part
    let root_adv : Root = rt ** {vp = mkVP rt.vp adv};
    in root_nsubjPass_auxPass root_adv subj aux;