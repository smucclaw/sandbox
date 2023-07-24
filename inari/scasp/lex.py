import spacy
import re
import itertools
import functools
import sys

nlp = spacy.load("en_core_web_sm")

posDict = {
    "NOUN": "N",
    "VERB": "V",
    "AUX": "AUX",
    "ADJ": "A",
    "ADV": "Adv",
    "DET": "Det",
    "PRON": "Pron",
    "CCONJ": "Conj",
    "SCONJ": "Conj",
    "PART": "PART",
    "PUNCT": "PUNCT",
    "ADP": "Prep",
    "PROPN": "PN",
    "SPACE": "",
    "NUM": "Num",
    "X": "X",
    "INTJ": "INTJ",
    "SYM": "SYM"
}

def get_words(line):
    def replace_var(str):
        if str[:2] == '@(':
            return "it"
        else:
            return str

    return " ".join([replace_var(w) for w in line.split()])

def getBasic(t):
    lem0 = ''.join([l for l in t.lemma_ if l not in '()[]'])
    lem = "_"+lem0
    linlem = t.lemma_
    pos = posDict[t.pos_]
    fun = lem + "_" + pos
    lin = fun + " = " + "mk" + pos + ' "' + linlem + '"'
    return (pos, fun, lin)

def getCmpnd(t1, t2):
    lem0 = t1.lemma_ + "_" + t2.lemma_
    lem1 = ''.join([l for l in lem0 if l not in '()[]'])
    lem = "_"+lem1
    linlem = t1.lemma_ + "-" + t2.lemma_
    pos = posDict[t2.pos_]
    fun = lem + "_" + pos
    lin = fun + " = " + "mk" + pos + ' "' + linlem + '"'
    return (pos, fun, lin)

def get_toks(line):
    txt = get_words(line)
    doc = nlp(txt)

    words = []
    tok = enumerate(doc)

    for i, t in tok:
        print(t, " :", t.lemma_, t.pos_, t.morph, t.dep_)
        if t.dep_ == "compound":
            words.append(getCmpnd(doc[i], doc[i + 1]))
            next(tok)
        elif t.lemma_ == "-":
            print("found hyphen")
            words.append(getCmpnd(doc[i-1], doc[i + 1]))
            next(tok)

        elif t.pos_ == "PART":
            if t.dep_ == "neg" or t.dep_ == "pos":
                pass
            elif t.dep_ == "aux":
                words.append(getBasic(doc[i + 1]))
                next(tok)
            else:
                print(t.lemma_, t.pos_, t.tag_, t.morph, t.dep_)
        elif posDict[t.pos_] not in ["A", "N", "CN", "V", "PN", "AdA", "Adv", "Prep"]:
            pass
        else:
            print("word :", getBasic(doc[i]))
            words.append(getBasic(doc[i]))
    return words

absheader = "abstract MonoLex = Cat [[A, N, CN, V, VV, V2, PN, AdA, Adv, Prep, Pron] ** {\n  fun\n"

def cncheader(cnc):
    header = [
        "concrete MonoLex%s of MonoLex = Cat%s [[A, N, CN, V, VV, V2, PN, AdA, Adv, Prep, Pron] ** " % (cnc, cnc)
      , "  open Paradigms%s, Prelude in {"  % (cnc)
      , ""
      , "  lin"
      , ""
    ]
    return "\n".join(header)

if __name__ == "__main__":

    absname = sys.argv[1]
    cncname = "Eng"
    absfile = absname + ".gf"
    cncfile = absname + cncname + ".gf"

    with open("school-corpus.txt", "r") as corpusfile:
        corpus = corpusfile.read().split("\n")

    words = []
    for line in corpus:
        words += get_toks(line)

    with open(absfile, "w") as abstract:
        with open(cncfile, "w") as concrete:
            abstract.write(absheader)
            concrete.write(cncheader(cncname))
            for pos, fun, lin in set(words):
                abstract.write("    %s : %s ;\n" % (fun, pos))
                concrete.write("    %s ;\n" % (lin))
            abstract.write("}")
            concrete.write("}")