import pandas as pd
import time
import streamlit as st
import spacy_udpipe
from nltk import Tree
from spacy import displacy
from pathlib import Path  # for having the browser displacy version into a svg file

# Create the title, headings for the web app
st.title("Universal Dependencies Trees Web App")
st.header("Visualise Universal Dependencies")

# Create spaces for the user input
# user_para = st.text_area("Put in your paragraphs in the grey box", height=300)
user_text = st.text_input("Put your sentence in here")

# download model for 1st execution only
# spacy_udpipe.download("en") # download English model
nlp = spacy_udpipe.load("en")

text = user_text # user_para (for paragraphs)

# tokeningizing the text and draw ud
def draw_ud(text):
    doc = nlp(text)
    for i, token in zip(range(len(doc)), doc):
        print(i+1, token.text, token.lemma_, token.pos_, token.dep_)
    ud_tree_input = displacy.render(doc, style='dep')
    return (ud_tree_input)

# created a svg file for reference
output_path = Path("ud_trees_svg/ud.svg")
ud_tree_file = displacy.render(nlp(text), style='dep')
with output_path.open("w", encoding="utf-8") as fh:
    fh.write(ud_tree_file)


import base64
import textwrap

st.write("Producing the universal dependencies for: ")
# render universal dependencies tree from user input
def render_svg_example(temp_svg):
    st.code(textwrap.dedent(temp_svg), 'svg')
    # doc = nlp(text)
    # for i, token in zip(range(len(doc)), doc):
    #     print(i+1, token.text, token.lemma_, token.pos_, token.dep_)
    # ud_tree_input = displacy.render(doc, style='dep')
    # print(ud_tree_input)
    # b64 = base64.b64encode(ud_tree_input.encode('utf-8')).decode("utf-8")
    # replace to 1 line using function draw_ud
    b64 = base64.b64encode(draw_ud(text).encode('utf-8')).decode("utf-8")
    html = r'<img src="data:image/svg+xml;base64,%s"/>' % b64
    # with scroll bar for diagram
    # html = r'<div style="width:100%%;overflow:scroll;"><img src="data:image/svg+xml;base64,%s"/></div>' % b64
    st.write(html, unsafe_allow_html=True)

render_svg_example(text)
