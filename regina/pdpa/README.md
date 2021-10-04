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