Steps
1. Create a test in TestNLG.hs under nlgTests :: Spec and add the test case e.g testNLGComplexBSR
     <p align="center">
     <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/1a_newcase.png" width="900" title="create test in TestNLG.hs">
     </p>

2. Create the testNLGComplexBSR below --  ie the BoolStructR that contains the NPs that bsr2gf is going to parse
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/1b_newcase.png" width="900" title="create the BoolStructR">
    </p>
3. in the natural4 folder, do `stack test`
4. With the output from the sentences,
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/2a_checkUDAppTrees.png" width="900" title="stack output">
    </p>
   1. determine to use which RGLTree to use before heading to UDExt. Helpful to use `pbpaste | pretty-simple` the tree that fails
   2. look at how did the test fail under the output "Failures" section. e.g for "the occurence on the beach", it failed to parse "on the beach"
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/2b_failures.png" width="900" title="check failures for clues">
    </p>
   3. go to TestNLG.hs and find the corresponding testBSR that supports the `bsr2gf` in NLG.hs to see how it is built whether it is a treeAP, treeNP, treeAdv which takes care of the differennt scenario. Looking inside bsr2gf to figure out which function to poke
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/3a_find_required_function.png" width="900" title="find the function in bsr2gf">
    </p>
   4. Match NLG.hs tree (ie treeNP case nps) with the pbpaste output 1 test bsr2gf to see which rgl ast it is built from ie how the NPs is built (TreeNP or TreeDet by looking at the GConjNP)
   5. After concluding treeNP is the one, we know it is the nonMassNPFromUDS to correct since this cause the incomplete parsing of the missing parts `on the beach`
5. At NonMassNpFromUDS in NLG.hs, we narrow down to its underlying `npFromUDS` and see that the reason is bcos it is taking only Groot ie only singular cases.
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/4a_add_case.png" width="900" title="Find the underlying function to check for supporting case">
    </p>
6. NB. Step 2 (making the helper function) is not always necessary: if the second argument to the `Groot_whatever` already contains a nice RGL subtree that you can use out of the box, then just use it. An example of this "just use it" strategy is on line 512 in the screenshot: for the the arguments to  `Groot_nsubj` , we only pattern match the constructors (`GrootV_` and `Gnsubj_`), and then we grab their arguments and construct a new RGL tree inline: `GSentNP someNP (GEmbedVP someVP)`. But for the case of `GaclRelclUDS_`, it was nicer to put it in a helper function. because
   1. the resulting tree is so long and complicated,  and
   2. there are several constructors for `aclRelcl`, and matching all of them inline inside `npFromUDS` would just be unwieldy.
    <p align="center">
     <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/5a_add_helper_function.png" width="900" title="Adding helper function-1 n 2">
     <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/6a_bareRGLnAbstract.png" width="900" title="Check for module in BareRG.gf and gf-rgl abstract with 'ag'">
    </p>
7. Scroll back up the `stack test` output where the failure is and copy the UD `root_aclRecl (rootN_ (DetCN...)).........`
8. Paste into a new line in NLG.hs's npFromUDS case and use rgl or otherwise helper function `udRelcl2rglRS` to take care of/neatify this one more case. NB: RS for relative sentence.
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/6b_tidy_case.png" width="700" title="Apply the new helper function">
    </p>
9.  run `stack test` and see that `the assessment that sucks` is fixed that but `the occurence on the beach` is still limited only to `the occurence`
     <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/7_stack_test.png" width="900" title="Find the underlying function to check for supporting case">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/8a_review.png" width="900" title="Review to see if fix is compplete">
    </p>
10. When checking tree in rgl, go to `/Users/regina/installations/gf-rgl/src/abstract` and do e.g `ag "> Det"`

## For "the occurrence at the Beach"
1. For stack test output copy `root_nmod (rootN_ (DetCN (DetQuant DefArt NumSg) (UseN occurrence_N))) (nmod_ at_Prep (DetCN (DetQuant DefArt NumSg) (UseN beach_N)))` to pretty print
    ```
    root_nmod
    ( rootN_
        ( DetCN ( DetQuant DefArt NumSg ) ( UseN occurrence_N ) )
    )
    ( nmod_ at_Prep
        ( DetCN ( DetQuant DefArt NumSg ) ( UseN beach_N ) )
    )
    ```
2. replace all the heads with _ (root_nmod, rootN_ , nmod_ ) into npFromUDS as additional case and add G so they become `Groot_nmod (GrootN_ (DetCN (DetQuant DefArt NumSg) (UseN occurrence_N))) (Gnmod_ at_Prep (DetCN (DetQuant DefArt NumSg) (UseN beach_N)))`
    ```
    Groot_nmod
        ( GrootN_
            ( DetCN ( DetQuant DefArt NumSg ) ( UseN occurrence_N ) )
        )
        ( Gnmod_ at_Prep
            ( DetCN ( DetQuant DefArt NumSg ) ( UseN beach_N ) )
        )
    ```
3. Simplify with np to become ` Groot_nmod (GrootN_ rootNP) (Gnmod_ prep nmodNP) -> Just $ GPrepNP prep nmodNP` LHS bcos BareRG uses the whole Noun module. This is still incomplete, lets look at the RHS results after Just.
4. Tackling 1 argument at a time, use abstract rgl with ag "Prep" to find possible combo for prep and np which results in one of these as a possible option
   ```
    Adverb.gf
    8:-- prepositions from noun phrases.
    11:    PrepNP      : Prep -> NP -> Adv ;        -- in the house
   ```
5. After settling the "at the beach" with `GPrepNP prep nmodNP` which is an Adv, we look at the higher level `NP -> Adv` in the abstract rgl (/Users/regina/installations/gf-rgl/src/abstract) via command `ag "NP -> Adv"` . The most possible one, given npFromUDS :: GUDS -> Maybe GNP returns some sort of NP, look for `ag "NP -> Adv -> NP"` is : `AdvNP   : NP -> Adv -> NP `;
6. Hence the addition in NLG.hs npFromUDS is `Groot_nmod (GrootN_ rootNP) (Gnmod_ prep nmodNP) -> Just $ GAdvNP rootNP (GPrepNP prep nmodNP)` ,Remembering to add a `G` to the `AdvNP` and `PrepNP`.
1. Run stack test again and take the failure output from "but got: ConjNP or_Conj (BaseNP (AdvNP (DetCN (DetQuant DefArt NumSg) (UseN occurrence_N)) (PrepNP at_Prep (DetCN (DetQuant DefArt NumSg) (UseN beach_N)))) (RelNP (DetCN (DetQuant this_Quant NumSg) (UseN assessment_N)) (UseRCl (TTAnt TPres ASimul) PPos (RelVP IdRP (UseV suck_V)))))" to GF shell and run to see if the result is the same as "the occurence at the beach"
2. new shell do `gf grammars/UDApp.pgf`. In this GF shell, linearize the tree "l ConjNP or_Conj (BaseNP (AdvNP (DetCN (DetQuant DefArt NumSg) (UseN occurrence_N)) (PrepNP at_Prep (DetCN (DetQuant DefArt NumSg) (UseN beach_N)))) (RelNP (DetCN (DetQuant this_Quant NumSg) (UseN assessment_N)) (UseRCl (TTAnt TPres ASimul) PPos (RelVP IdRP (UseV suck_V)))))". If correct, it will return "the occurrence at the beach"
    <p align="center">
    <img src="https://github.com/smucclaw/sandbox/blob/default/regina/natural4/8b_linearize.png" width="900" title="test in gf shell">
    </p>
3.  If it does, go back to the test originally in nlgTests :: Spec in TestNLG.hs and replace "TODO" with the tree ie.
    ```
        let treeNPComplex = unsafePerformIO (bsr2gf env testNPComplexBSR)
        it "Should return a noun phrase" $ do
            showExpr treeNPComplex `shouldBe` "TODO"

    WITH THIS CHANGE

    let treeNPComplex = unsafePerformIO (bsr2gf env testNPComplexBSR)
        it "Should return a noun phrase" $ do
            showExpr treeNPComplex `shouldBe` "ConjNP or_Conj (BaseNP (AdvNP (DetCN (DetQuant DefArt NumSg) (UseN occurrence_N)) (PrepNP at_Prep (DetCN (DetQuant DefArt NumSg) (UseN beach_N)))) (RelNP (DetCN (DetQuant this_Quant NumSg) (UseN assessment_N)) (UseRCl (TTAnt TPres ASimul) PPos (RelVP IdRP (UseV suck_V)))))"
    ```
4.  stack test again to ensure no failure