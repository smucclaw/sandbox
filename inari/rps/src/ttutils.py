import pgf

### Generic helper functions

def myRange(l):
    max = len(l)+1
    return zip(list(range(1,max)), l)

### Manipulating PGF expressions

def separateSubjPred(expr):
    try:
        c, args = expr.unpack()
    except AttributeError:
        raise Exception("separateSubjPred: should be applied to pgf.Expr, was applied to", expr)

    ### Simple trees: subject is a single Expr
    if c=="App1":
        pred, subj = args
        return (subj, [pred])
    elif c=="App2":
        pred, subj, obj = args
        return (subj, [pred, obj])

    ### Complex trees: subject is [Expr]
    elif c=="AggregateSubj1":
        pred, subjs = args
        return (subjs, [pred])
    elif c=="AggregateSubj2":
        pred, obj, subjs = args
        return (subjs, [pred, obj])

    ### Most complex trees: subject is [Expr], preds are special Pred, not a list of atoms and args anymore
    elif c=="AggregatePred":
        pr1, pr2, subjs = args
        return (subjs, [pr1, pr2])
    else:
        raise Exception("separateSubjPred should be applied to a simple tree, got ", showExprs(expr))

def getSubj(e):
    subj, _ = separateSubjPred(e)
    return subj
def getPred(e):
    _, preds = separateSubjPred(e)
    return preds

def showExprs(es):
    if isinstance(es, list):
        return ' '.join([e.__str__() for e in es])
    else:
        return es.__str__()


### Manipulate lists

def listGeneric(args, basefun, consfun):
    if len(args)<2:
        raise Exception("listArg: too short list", args)
    elif len(args)==2:
        a, b = args
        return basefun(a,b)
    else:
        a = args[0]
        rest = args[1:]
        return consfun(a, listGeneric(rest, basefun, consfun))


def unListGeneric(expr, basefStr, consfStr):
    try:
        c, args = expr.unpack()
    except Exception:
        raise Exception("unListGeneric should be applied to PGF expr, got", expr)
    if c==basefStr:
        return args
    elif c==consfStr:
        s1, rest = args
        return [s1].extend(unListGeneric(rest, basefStr, consfStr))
    else:
        raise Exception("unListGeneric should be applied to a list, got", expr)

### Printout

def pretty(s):
    s = s.replace("\\", "\n")  # \ to newline
    s = s.replace(" \n", "\n") # remove whitespace at the end of line
    return s
