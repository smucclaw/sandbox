# Frontend
## Limitations
1. radio button will always have first option as default instead of unselected nulls
2. balloons need to be last because once activated, it will always appear upon any click of checkbox, button, radio
3. music need to be manually click to play instead of "onEdit"/"onChange"
4. checkbox for multi-select only
5. radio for single-select only

## Prerequisites and steps to use the program:
1.  Your favourite IDE -- I use vsc
2.  Python  3.6+
3.  PIP
4.  I used a virtual environment for insurance. There are a few. I used `virtualenv` so in your terminal ,do the following in this directory:
    1.  `pip install virtualenv`
    2.  `virtualenv pdpaenv`
    3.  `source pdpaenv/bin/activate`
5.  Install streamlit with `pip install streamlit`
6.  Run the program with `streamlit run pdpa.py`
7.  A browser page should pop up that you can interact with. Otherwise try clicking on the URL that appears in the terminal
8.  To exit, hit `Ctrl` and `C` button
9.  To exit environment, simply `deactivate`

# Universal Dependencies (UD)
1. Make sure you have the necessary libraries and modules in your virtual environment by
   1. `pip install spacy-udpipe`
   2. `pip install nltk`
2. `python3 pdpa_ud.py` to visualisze the trees of
   1. text in terminal
   2. tags in terminal
   3. combo of text with UD pos in browser
   4. combo of text with UD pos in svg format in the folder sandbox/regina/pdpa/ud_trees_svg . Note that this will only be generated when you exit the program unlike the other 3 visualisations
3. Web app to visualise UD for text input by user on frontend
   1. `source pdpaenv/bin/activate`
   2. `streamlit run pdpa_ud_web.py`
4. To open and see the ud.svg rendered, open the file in vsc and on it, do
   1. shift + option + S (then release) and press O

# UD to abstract and skeleton concrete GF.
1. Extract predicates with `python pdpa_read_predicates.py pdpa_predicates.csv > input`
2. See steps for processing into conllu , more processing to generate GF files in [spacyconlltree](https://github.com/1Regina/spacyconlltree)

# UD to conllu format with model.
1. get modelfrom https://ufal.mff.cuni.cz/udpipe/1/users-manual#model_training and put in /Users/regina/Code/gf-udpipe/src/english-lines-ud-2.5-191206.udpipe p
2. Background info:
   1. working with conllu file https://universaldependencies.org/format.html
   2. udpipe https://github.com/ufal/udpipe
3. Check predicates in https://github.com/smucclaw/sandbox/blob/default/regina/pdpa/pdpa_predicates.csv
4. In /Users/regina/Code/gf-udpipe/src, run command `echo "an organisation must report the notifiable data breach to the Commission as soon as possible" | udpipe --tokenize --tag --parse english-lines-ud-2.5-191206.udpipe`
5. Copy the conllu output in terminal and put into annotatorix https://maryszmary.github.io/ud-annotatrix/standalone/annotator.html
6. Check against dependencies in https://universaldependencies.org/u/dep/
7. Note the following:
   1. **nmod**
      1. school by the road
   2. **acl**
      1. school offering education
      2. school famous for its success
   3. **amod**
      1. old school
      2. very old school

# Fixing gf-rgl and testing the chinese rgl
1. get to /Users/regina/installations/gf-rgl/src/chinese
2. do `gf ../english/LangEng.gf LangChi.gf`
3. find the tree and linearisations for a phrase with `p -cat=Cl "the cat walks" | l -treebank` . Change the `cat=Cl` to `cat=S` , `cat=QS` , `cat=NP` accordingly to different phrases. This produces:
   ```
   Lang: PredVP (DetCN (DetQuant DefArt NumSg) (UseN cat_N)) (UseV walk_V)
   LangChi: 猫 走
   LangEng: the cat walks
   ```
4. Do the necessary tweaks in the different chinese modules -- QuestionChi, ResChi, StructuralChi, Don't add to LexiconChi unless disagree. Consider ExtendChi, ResChi instead.
5. Write tests in test files in /Users/regina/installations/gf-rgl/src/chinese/unittest
6. Retrack back to /Users/regina/installations/gf-rgl
7. Run the command `python unittest/unittest.py src/chinese/unittest/future.gftest`to test the linearisation in future.gftest
8. To do comparison:
   1. go to /Users/regina/installations/gf-rgl/src/chinese
   2. `gf -make LangChi.gf` to get the Lang.pgf
   3. move this current Lang.pgf to a created folder you want to hold the old pgf e.g in gftestiing folder `mv Lang.pgf gftesting`
   4. do the changes you want in the modules e.g NounChi.gf / GrammarChi.gf or whatever.
   5. then refresh the Lang.pgf with `gf -make LangChi.gf`
   6. compile the comparison of the 2 pgf files with `gftest -g Lang -o gftesting/Lang.pgf -l "Chi"` See more commands of gftest [here] (https://github.com/GrammaticalFramework/gftest#:~:text=an%20executable%20gftest.-,common%20use%20cases,-Run%20gftest%20--help) . This will produce 4 files
      1. LangChi-ccat-diff.org
      2. LangChi-lin-diff.org (most useful)
      3. LangChi-new-funs.org
      4. LangChi-new-funs.org
   7. Open LangChi-lin-diff.org for detailed example and LangChi-ccat-diff.org for cat summary changes.
   8. `gftest -g Lang -f "ComplVV" -l "Chi"`
      1. -g to test the file path (Lang)
      2. -f of function "ComplVV"
      3. -l of language "Chi"