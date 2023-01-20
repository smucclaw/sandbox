import pgf

gr = pgf.readPGF("NumberShares.pgf")
eng = gr.languages["NumberSharesEng"]

numberShares = {}

def getSharesAndValue(tree):
    f,args = tree.unpack()
    if f.startswith("Pred"):
        numOf,_ = args[0].unpack()
        if numOf=="NumberOf":
            return args
        else:
            print ("numOf =", numOf)
            return (tree,tree)
    else:
        print("f =" , f)
        return (tree,tree)

def interpret(tree):
    [sharesTree,valueTree] = getSharesAndValue(tree)
    shares = getSharesID(sharesTree)    # :: String
    value = getValue(valueTree) # :: Int
    numberShares[shares] = value


def getValue(tree):
    f,args = tree.unpack()
    if f=="Thousand":
        return 1000
    elif f=="TwoHundred":
        return 200
    elif f.startswith("SumOf"):
        val = 0
        for q in getList(args[0]):
            qID = getSharesID(q)
            val += numberShares[qID]
        return val




def getSharesID(tree):
    """
    Takes a tree, which is assumed to be Item, Kind or Quality.
    Returns a string of Quality, which is used as key in lookup table of the shares' values.
    """
    _,typ = gr.inferExpr(tree)
    f,args = tree.unpack()
    if f in ["NumberOf", "The"]: # we assume "the … shares" as shorthand for "the number of … shares"
        return getSharesName(args[0]) # tree is of type Item, give its argument Kind to getSharesName
    elif str(typ) == "Kind":
        return getSharesName(tree) # tree is of type Kind, give it to getSharesName
    elif str(typ) == "Quality":
        return printQuality(tree) # it's already quality, so just prettyprint it
    else:
        pass

def printQuality(tree):
    """
    printing a Quality, checking if it has literal or not
    """
    f,a = tree.unpack()
    if f == "Class":
        return f + a[0].unpack() # unpack for literal is just string
    else:
        return f

def getSharesName(tree):
    f,args = tree.unpack()
    if f=="Mod":
        kind,_ = args[1].unpack()
        if kind=="Shares":
            return printQuality(args[0])
        else:
            pass
    elif f=="Shares":
        return "Unnamed"  # shouldn't happen—there's always some kind of modifier for Shares!
    else:
        pass

def getList(tree):
    f,args = tree.unpack()
    if f.startswith("Base"):
        return args
    elif f.startswith("Cons"):
        res = getList(args[1]) # contains another list
        return [args[0], *res]


corpus = [
    "the number of original shares is 1000",
    "the number of new shares is two hundred",
    "the number of Class A shares shall be given by the sum of the number of original shares and the number of new shares",
    "the number of Class B shares shall be given by the sum of the original shares and the number of new shares",
    "the number of Class C shares shall be given by the sum of the original shares and the new shares",
    "the number of Class D shares is the sum of the original shares and the number of new shares",
    "the number of Class E shares is the sum of the original shares and the new shares",
    "the number of Class F shares is the sum of the original and the new shares",
    "the number of Class G shares is the sum of the original and new shares",
    "the number of Class H shares is the sum of original and new shares",
    "the number of Class I shares is the sum of original shares and Class A shares",
    "the number of Class J shares is the sum of Class B and Class C shares",
    "the number of Class K shares is the sum of the Class I and the Class J shares",
    "the number of Class L shares is the sum of Class K , Class G and Class H shares",
]

if __name__ == '__main__':

    trees = []
    for sentence in corpus:
        iter = eng.parse(sentence)
        _,tree = iter.__next__()
        trees.append(tree)

    [interpret(t) for t in trees]

    for shares,val in numberShares.items():
        print (shares + ':', val)
