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
