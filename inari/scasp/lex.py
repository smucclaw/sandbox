import spacy
import re
import itertools
import functools
import sys
from collections import defaultdict

nlp = spacy.load("en_core_web_sm")

posDict = defaultdict(lambda: "NOT FOUND")
posDict["NOUN"] = "N"
posDict["VERB"] = "V"
posDict["ADJ"] = "A"
posDict["ADV"] = "Adv"
# posDict["DET"] = "Det"
# posDict["PRON"] = "Pron"
posDict["CCONJ"] = "Conj"
posDict["SCONJ"] = "Subj"
posDict["PUNCT"] = "PN"
posDict["ADP"] = "Prep"
posDict["PROPN"] = "PN"

def allowed_pos(pos):
    return posDict[pos] not in ["NOT FOUND"]

illegal = '!"#$%&\'()*+, -./:;<=>?@[\]^`{|}~\\§–'
illegal_ = '!"#$%&\'()*+, -./:;<=>?@[\]^`{|}~\\§–_'

def get_words(line):
    def replace_var(str):
        if str[:2] == '@(':
            return "it"
        else:
            return str

    return " ".join([replace_var(w) for w in line.split()])

def removeIllegal(str):
    return ''.join([l for l in str if l not in illegal])

def mkConstructor(pos, linlem):
    if pos in ['A', 'V', 'N', 'PN', 'Prep', 'Conj', 'Adv', 'Subj']:
        return 'mk%s "%s"' % (pos, linlem)
    else:
        inner = '(mk%s "%s")' % (pos[0], linlem)
        return 'mk%s %s' % (pos, inner)


def getBasic(t):
    lemmas = [t.lemma_]
    return getAny(lemmas, posDict[t.pos_])

def getAny(lemmas, pos, prep0=None):
    linlem = ' '.join(lemmas) # if compound
    if linlem == '"':
        return None # TODO: why is this even getting this far?
    funlem = '_'.join([removeIllegal(l) for l in lemmas])
    if prep0:
        prep = '(mkPrep "%s")' % (prep0)
        fun = '_%s_%s_%s' % (funlem, removeIllegal(prep0), pos)
        # inner = 'mk%s "%s"' % (pos[0], linlem) # first character of POS = intransitive
        # lin = 'lin %s = mk%s (%s) %s' % (fun, pos, inner, prep)
    else:
        prep = ''
        fun = '_%s_%s' % (funlem, pos)

    lin = 'lin %s = %s %s' % (fun, mkConstructor(pos, linlem), prep)
    # Result is the pos, fun and lin
    # but in a list, because in case of PN, we try alternative version
    result = [(pos, fun, lin)]
    if pos=='PN':
        alternative = getAny(lemmas, "N")
        return result+alternative
    else:
        return result

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
        return []
    elif checkSubChildTwo("xcomp", "obj", childList):
#        print(t.lemma_, childList)
        for child in childList:
            if child[1] == "ADJ" and child[2] == "xcomp":
                return (getVerb(t, "V2A"))
            elif child[1] == "VERB" and child[2] == "xcomp":
                return (getVerb(t, "V2V"))
    elif checkSubChild("prep", childList):
        prep = getSubChild("prep", childList)[0]
        return (getVerb(t, "V2", prep))

    elif checkSubChildTwo("ccomp", "obj", childList):
        return (wogetVerb(t, "V2S"))
    elif checkSubChild("dobj", childList):
        if checkSubChild("iobj", childList):
            return (getVerb(t, "V3"))
        else:
            return (getVerb(t, "V2"))
    # also for adjectival complement
    # https://universaldependencies.org/fi/dep/xcomp.html
    elif checkSubChild("xcomp", childList):
        for child in childList:
            if child[1] == "ADJ":
                return (getVerb(t, "VA"))
            elif child[1] == "VERB":
                return (getVerb(t, "VV"))
    elif checkSubChild("ccomp", childList):
        return (getVerb(t, "VS"))
    else:
        print("*** VERB HAS CHILD BUT NOT LISTED", t, " :", t.lemma_, t.pos_, t.morph, childList)
        return (getBasic(t))

def hasChild(t):
    return any(True for _ in t.children)

def get_toks(line):
    txt = get_words(line)
    doc = nlp(txt)

    words = []
    tok = enumerate(doc)

    for i, t in tok:
        if allowed_pos(t.pos_):
            #print(t, " :", t.lemma_, t.pos_, t.morph, t.dep_)
            if t.pos_ == "VERB" and hasChild(t):
                words += checkWhichVerb(t)
            elif t.dep_ == "compound":
                t2 = doc[i + 1]
                if allowed_pos(posDict[t2.pos_]):
                    words += getCmpnd(doc[i], doc[i + 1])
                    next(tok)
                else:
                    pass
            elif t.lemma_ == "-":
                if allowed_pos(doc[i + 1]):
                    words += getCmpnd(doc[i-1], doc[i + 1])
                    next(tok)
                else:
                    pass
            elif all([l in illegal_ for l in t.lemma_]):
                print("Word is illegal", t)
                pass
            else:
                #print("word :", getBasic(doc[i]))
                words += getBasic(t)
        else:
            print("ignored", t, ":", t.lemma_, t.pos_)
            pass
    return [w for w in words if w]

def absheader(name):
    return "abstract %s = Cat [A, N, CN, V, VV, V2, VS, V2S, VA, V2A, PN, AdA, Adv, Prep, Pron, Conj, Subj] ** {\n  fun\n" % (name)

def cncheader(name, cnc):
    header = [
        "concrete %s%s of %s = Cat%s [A, N, CN, V, VV, V2, VS, V2S, VA, V2A, PN, AdA, Adv, Prep, Pron, Conj, Subj] ** " % (name, cnc, name, cnc)
      , "  open Paradigms%s, Prelude in {"  % (cnc)
      , ""
      , "oper mkSubj : Str -> Subj = \s -> lin Subj (ss s) ;"
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