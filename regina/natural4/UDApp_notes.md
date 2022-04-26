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
    * **UDCat(Eng)**: coercion funs, e.g. `obl_ : Adv -> obl` ; some of these funs may have more arguments, but as a rule, *their return types are UD labels, not UDS (our custom type, the startcat of UDApp, entrypoint of NLG.hs). The coercion funs may take UDS as arguments.*
       </br> - Examples of more complex "coercion funs" in UDCat:

        xcompAdv_ : Adv -> xcomp ;
        xcompN_ : NP -> xcomp ; -- considered [a building]
        xcompToBeN_ : mark -> cop -> NP -> xcomp ; -- considered [to be a building]
        xcompA_ : AP -> xcomp ; -- become [aware]:
        xcompA_ccomp_ : AP -> ccomp -> xcomp ; -- become [aware [that a data breach occurred]]

        ccomp_ : UDS -> ccomp ; -- just missing a complementiser, like "that"

    * **UDApp(Eng)**: Sentence pattern funs, e.g. `root_nsubj : root -> nsubj -> UDS` . All these funs that return UDS come from a corpus—there was some sentence in the corpus that followed that pattern, e.g. "breach occurs", "the cat sleeps". (There may be other funs in UDApp, but we should move them into different modules.)
    * **UDExt(Eng)**: Only used for NLG, not parsing
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
    4. So we can fix this by adding a new top-level sentence pattern fun in three places:

     * fun `root_mark_nsubj_xcomp : root -> mark -> nsubj -> xcomp -> UDS ;`  in UDApp.gf,
     * linearisation in UDAppEng.gf, and
     * labels in UDApp.labels
        <p align="center">
        <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UDApp_screenshots/5.2_example_3filesFix.png" title="Files adjustments for linearization">
        </p>

        So this was the scenario where the missing word is an immediate child of the root, and solution is to add a new top-level sentence pattern fun into UDApp.gf (+ UDAppEng + UDApp.labels). Copy the `root_mark_nsubj.....` and do `pbpaste | pretty-simple`
        <p align="center">
        <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UDApp_screenshots/5.3_example_fix_proof.png" title="Linearisation fix result">
        </p>

### 3.1 My personal favourite way to hunt for funs that are missing linearisations (tested with nmod cluster):
1. Use gf to find the missing linearsations via `gf UDApppEng.gf`.
        <p align="center">
        <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UPApp_screenshots_personalFav/1%20gf%20missing%20linearization.png" title="Find in gf">
        </p>
2. Find the targets to fix from UDApp.gf, copying their example, labelling the words to their tags.
        <p align="center">
        <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UPApp_screenshots_personalFav/2.%20Search%20the%20missing%20funs%20in%20UPApp.gf.png" title="Find the funs">
        </p>
3. For each ud labels for the funs, find the lincat. Impt because the labels correspond to some GF labels and is necessary since we want to use the RGL api.
        <p align="center">
        <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UPApp_screenshots_personalFav/3.%20Find%20lincat%20of%20the%20UD%20labels.png" title="Match the lincat">
        </p>
4. Leverage on existing patterns funs in UPAppEng.gf to avoid starting from scratch. [Something mentioned earlier](https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UDApp_notes.md#:~:text=many%20of%20the%20sentence%20pattern%20funs%20are%20very%20similar%2C%20so%20check%20in%20the%20concrete%20syntax%20if%20a%20similar%20fun%20already%20has%20a%20lin%2C%20you%20can%20probably%20reuse%20it.). Note the use of `rs` for `acl:rcl` in `root_nmod_aclRelcl`
        <p align="center">
        <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/UPApp_screenshots_personalFav/4.%20Linearisation%20Funs%20.png" title="Add the linearisation funs">
        </p>
    Here in these examples, I leverage on `root_acl` , `root_aclRelcl` and `root_nmod`.
### 3A. AUX FUNS
In linearisation for words that are adverbial in nature e.g nmod, advmod, obl, advcl. their linearisation should have 2 steps and use a `let xxx in yyy ` structure.
</br>**Tip**: auxfuns are needed if the problem lies in the ud2gf step, but if ud2gf returns a correct tree, then the problem is somewhere in NLG.hs, and auxfuns are not needed

    e.g [the updates]:nsubjPass [are]: auxPass [reviewed]:root [regularly]: advmod

    root_nsubjPass_auxPass_advmod rt subj aux adv =
    -- step 1: attach the adverbial to root
    -- step 2; find fun without the advmod/conj/ part
        let root_adv : Root = rt ** {vp = mkVP rt.vp adv};
        in root_nsubjPass_auxPass root_adv subj aux;

(??? can i remove this bcos I dont understand this part below well at all to document it)
  --   root_nsubjPass_auxPass_advmod rt subj aux advm = case advm.isNot of {
  --     False =>****
  --       let root_advm : Root = advRoot rt advm.adv ; -- new root: attached the advmod into the old root
  --        in root_nsubjPass_auxPass root_advm subj aux;

  --     True => -- advmod is the negation, so the adv field is just a dummy --- the real info is in that it's NEG
  --             -- so we need to apply applyNeg at some point.
  --             -- incidentally, this pattern also contains an auxiliary, which means that we need also applyAux
  --             -- conclusion: this is not a simple case, Inari will refactor applyNeg and applyAux to allow them
  --             -- to be used in the same UDS.
  --       let root_neg : Root = applyNeg rt ;
  --        in root_nsubjPass_auxPass root_neg subj aux

  --   };

1. Fixing Parentheses aux fun on: Discovered while parsing "The policy (called the applicable policy) of the company"
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/AuxFuns_screenshots/1.%20Get%20input%20into%20conllu%20format.png" title="Get into conllu format">
    </p>
2. Find the breaking point using ud2gf
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/AuxFuns_screenshots/2.%20fix%20the%20area%20to%20fix.png" title="Find breaking point">
    </p>
   Using pbpaste | pretty-simple could be helpful
3. Add the aux fun into UDAppEng.labels
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/AuxFuns_screenshots/3.%20Define%20the%20aux%20fun%20RECOVER.png" title="Define the aux fun">
    </p>
4. After you're done, do `./updateHS.sh` in natural4 directory
5. Can repeat step 2 to see the breaking point is healed and confirm with `stack test` in natural4 directory

### 3B Other Supplementary Funs like articles when changing from predicates to questions
1. Use stack run on the csv with checklist tag to see the AST. Compare the existing definite article one with `the` article (Is the observance mandatory?") which is correct to get inspiration on how to rectify the indefinite article `a` for "day of silence" when it is converted into a question.
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/Articles_screenshots/1.%20check%20which%20getQSFromTrees%20.png" title="Use the AST to see which RGL tree to use">
    </p>
2. FYI. With "groundToChecklist" in VueJSON.hs, the parsed tokens and AST are put through all the intermediate functions as it tries to decide how the predicates were formed so as to twist it to become a question
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/Articles_screenshots/2final.combine%20all%20intermediate%20funs.png" title="Check the parsing via groupByRGLtype via the intermediate functions">
    </p>

3. Knowing where to insert: Knowing that the `getQSFromTrees` is the function that converts trees into questions and the indefinite article is to be inserted only when converting into a question, add the *makeSubjectIndefinite* into it, observing that the "a" article is applied on a np instead of a vp (as in the definite article "the" scenario). Observe the arguments as the function is built.
   <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/Articles_screenshots/3.%20Insert%20at%20the%20right%20place.png" title="Know where to insert">
    </p>
4. Check the result
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/Articles_screenshots/4.%20stack%20test%20to%20see%20rectified%20fix.png" title="Stack test">
    </p>