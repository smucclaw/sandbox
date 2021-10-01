import spacy_udpipe
from nltk import Tree
from spacy import displacy

# download model for 1st execution only
# spacy_udpipe.download("en") # download English model

nlp = spacy_udpipe.load("en")
text = "Wikipedia is a free online encyclopedia, created and edited by volunteers around the world." # "personal data in part 1 of schedule subject to part 2 of schedule"
doc = nlp(text)
for i, token in zip(range(len(doc)), doc):
    print(i+1, token.text, token.lemma_, token.pos_, token.dep_)

#1 to get a tree representation of the english text
def to_nltk_tree(node):
    if node.n_lefts + node.n_rights > 0:
        return Tree(node.orth_, [to_nltk_tree(child) for child in node.children])
    else:
        return node.orth_


[to_nltk_tree(sent.root).pretty_print() for sent in doc.sents]

#2 to get a tree representation of the token
def tok_format(tok):
    return "_".join([tok.orth_, tok.tag_])


def to_nltk_tree(node):
    if node.n_lefts + node.n_rights > 0:
        return Tree(tok_format(node), [to_nltk_tree(child) for child in node.children])
    else:
        return tok_format(node)

[to_nltk_tree(sent.root).pretty_print() for sent in doc.sents]

# 3. A combi of text + POS
displacy.serve(doc, style='dep')