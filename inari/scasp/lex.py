import spacy
import re
import itertools
import functools
import sys
import string

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

def removeIllegal(str):
    return ''.join([l for l in str if l not in '()[]><'])

def getBasic(t):
    lemmas = [t.lemma_]
    return getAny(lemmas, posDict[t.pos_])

def getAny(lemmas, pos, prep0=None):
    linlem = ' '.join(lemmas) # if compound
    funlem = '_'.join([removeIllegal(l) for l in lemmas])
    if prep0:
        prep = '(mkPrep "%s")' % (prep0)
        fun = '_%s_%s_%s' % (funlem, prep0, pos)
        inner = 'mk%s "%s"' % (pos[0], linlem) # first character of POS = intransitive
        lin = 'lin %s = mk%s (%s) %s' % (fun, pos, inner, prep)
    else:
        fun = '_%s_%s' % (funlem, pos)
        lin = 'lin %s = mk%s "%s"' % (fun, pos, linlem)
    return (pos, fun, lin)

def getVerb(t, pos, prep0='because'):
    lemmas = [t.lemma_]
    if prep0 == 'because':
        return getAny(lemmas,pos)
    else:
        return getAny(lemmas, pos, prep0)

def getCmpnd(t1, t2):
    lemmas = [t1.lemma_, t2.lemma_]
    return getAny(lemmas, posDict[t2.pos_])

def checkSubChild(dep, ls):
    return any(child[2] == dep for child in ls)

def checkSubChildTwo(dep1, dep2, ls):
    return all(any(child[2] == dep for child in ls) for dep in [dep1, dep2])

def getSubChild(dep, ls):
    return [child[0] for child in ls if child[2] == dep]

def checkWhichVerb(t):
    childList = [[child.lemma_, child.pos_, child.dep_] for child in t.children]
    if t.lemma_ == "be":
        pass
    elif t.lemma_ in string.punctuation:
        pass
    elif checkSubChildTwo("xcomp", "obj", childList):
#        print(t.lemma_, childList)
        for child in childList:
            if child[1] == "ADJ" and child[2] == "xcomp":
                words.append(getVerb(t, "V2A"))
            elif child[1] == "VERB" and child[2] == "xcomp":
                words.append(getVerb(t, "V2V"))
    elif checkSubChild("prep", childList):
        prep = getSubChild("prep", childList)[0]
        words.append(getVerb(t, "V2", prep))

    elif checkSubChildTwo("ccomp", "obj", childList):
        words.append(wogetVerb(t, "V2S"))
    elif checkSubChild("dobj", childList):
        if checkSubChild("iobj", childList):
            words.append(getVerb(t, "V3"))
        else:
            words.append(getVerb(t, "V2"))
    # also for adjectival complement
    # https://universaldependencies.org/fi/dep/xcomp.html
    elif checkSubChild("xcomp", childList):
        for child in childList:
            if child[1] == "ADJ":
                words.append(getVerb(t, "VA"))
            elif child[1] == "VERB":
                words.append(getVerb(t, "VV"))
    elif checkSubChild("ccomp", childList):
        words.append(getVerb(t, "VS"))
    else:
        print("*** VERB HAS CHILD BUT NOT LISTED", t, " :", t.lemma_, t.pos_, t.morph, childList)
        words.append(getBasic(t))

def hasChild(t):
    return any(True for _ in t.children)

def get_toks(line):
    txt = get_words(line)
    doc = nlp(txt)

    words = []
    tok = enumerate(doc)

    for i, t in tok:
        #print(t, " :", t.lemma_, t.pos_, t.morph, t.dep_)
        if t.pos_ == "VERB" and hasChild(t):
            words.append(checkWhichVerb(t))
        elif t.dep_ == "compound":
            words.append(getCmpnd(doc[i], doc[i + 1]))
            next(tok)
        elif t.lemma_ == "-":
            words.append(getCmpnd(doc[i-1], doc[i + 1]))
            next(tok)
        elif t.pos_ == "PART":
            if t.dep_ == "neg" or t.dep_ == "pos":
                pass
            elif t.dep_ == "aux":
                words.append(getBasic(doc[i + 1]))
                next(tok)
            else:
                print("IGNORING THE FOLLOWING:" , (t.lemma_, t.pos_, t.tag_, t.morph, t.dep_))
        elif posDict[t.pos_] not in ["A", "N", "CN", "V", "PN", "AdA", "Adv", "Prep"]:
            pass
        else:
            #print("word :", getBasic(doc[i]))
            words.append(getBasic(doc[i]))
    return [w for w in words if w]

def absheader(name):
    return "abstract %s = Cat [A, N, CN, V, VV, V2, PN, AdA, Adv, Prep, Pron] ** {\n  fun\n" % (name)

def cncheader(name, cnc):
    header = [
        "concrete %s%s of %s = Cat%s [A, N, CN, V, VV, V2, PN, AdA, Adv, Prep, Pron] ** " % (name, cnc, name, cnc)
      , "  open Paradigms%s, Prelude in {"  % (cnc)
      , ""
    ]
    return "\n".join(header)

if __name__ == "__main__":

    absname = sys.argv[1]
    cncname = "Eng"
    absfile = absname + ".gf"
    cncfile = absname + cncname + ".gf"
    corpus = sys.argv[2]

    with open(corpus, "r") as corpusfile:
        corpus = corpusfile.read().split("\n")

    words = []
    for line in corpus:
        words += get_toks(line)

    with open(absfile, "w") as abstract:
        with open(cncfile, "w") as concrete:
            abstract.write(absheader(absname))
            concrete.write(cncheader(absname, cncname))
            for pos, fun, lin in set(words):
                abstract.write("    %s : %s ;\n" % (fun, pos))
                concrete.write("    %s ;\n" % (lin))
            abstract.write("}")
            concrete.write("}")
    print("Created %s and %s" % (absfile, cncfile))