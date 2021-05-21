import pgf
import itertools

####################################
# Prerequisites:
# - L4 file, from which we generate
#   * GF grammar, with dynamically constructed lexicon
#   * s(CASP) code: L4 rules and declarations translated into s(CASP) rules and facts
# Pipeline:
# - Generate the files in Haskell, on the client side.
# - Create an expert system, and move the generated files to Docassemble server.
# - Run the interview, get answers from user, and run a query.
# - Query produces answers: a set of s(CASP) models. Parse those answers in Python.
# - Initial transformation of the s(CASP) (Python) AST into GF trees.
#   We need to match the s(CASP) statements in the answer (is_player(A)) to the GF funs (Player : Arg -> Statement).
#   Orthographic restrictions:
#   * L4 predicates and GF cats+funs can be anything
#   * s(CASP) atoms must be lowercase and variables uppercase
#   Maybe this needs to be addressed already when we generate the grammar. Make everything lowercase.
# - TODO: figure out if someone else wants to take over the L4toSCASP translation. Does Martin have a normalised format that is easier to use in transformation?
# - Tree transformations from GF trees to other GF trees.
#   That's what I'm doing in this file. The rest of the pipeline depends on other people's work.

####################################
## Dummy data for testing
## Real data is parsed from s(CASP) models

gr = pgf.readPGF("/tmp/RPSTop.pgf")
R = gr.embed("RPSTop")

eng = gr.languages["RPSTopEng"]

testCorpus = [
   "RPS is a game",
   "A is a participant in RPS",
   "A is a player",
   "A throws rock",
   "C is a player",
   "C is a participant in RPS",
   "C throws scissors",
   "rock beats scissors",
]

def getExpr(sentence):
    i = eng.parse(sentence)
    prob,expr = next(i)
    return expr

parsedTestCorpus = [getExpr(str) for str in testCorpus]

# for e in parsedTestCorpus:
#     print(e)

####################################
## Translating the Haskell functions

def aggregateBy(exprs, sortf, groupf, name='', debug=False):
    """Generic aggregation function"""
    results = []
    if debug:
        print("debug: aggregateBy", name)
        for e in [sortf(e) for e in exprs]:
            print(e)
        print("---------")
    exprs = sorted(exprs, key=sortf)
    for _, g in itertools.groupby(exprs, sortf):
        grp = list(g)
        l = len(grp)
        if l==0:
            raise Exception("aggregateBy" + name + ": empty input")
        elif l==1:
            results.append(grp[0])
        else:
            results.append(groupf(grp))
    return results

def aggregateByPredicate(exprs):
    sortf = lambda e : showExprs(getPred(e))
    # internal aggregation fun
    def aggregate(es):
        subjs = [getSubj(e) for e in es]
        fullExpr = es[0] # we can take any expr from group, they all have same predicate
        aggrSubjs = listArg(subjs)
        c, args = fullExpr.unpack()
        if c=="App1":
            pr, _ = args
            return R.AggregateSubj1(pr, aggrSubjs)
        elif c=="App2":
            pr, _, obj = args
            return R.AggregateSubj2(pr, obj, aggrSubjs)
        else:
            raise Exception("aggregatebyPredicate: expected simple expr, got instead", showExprs([fullExpr]))

    return aggregateBy(exprs, sortf, aggregate, name="Predicate", debug=False)

def aggregateBySubject(exprs):
    sortf = lambda e : showSubj(e)
    # Internal aggregate fun
    def aggregate(es):
        preds = [getPred(e) for e in es]
        fullExpr = es[0] # we can take any expr from group, they all have same subject
        if len(preds)==2: # GF grammar works for only two -- TODO make more generic!
            pr1, pr2 = preds
            _, args = fullExpr.unpack()
            subjs = args[-1]
            return R.AggregatePred(mkPred(pr1), mkPred(pr2), subjs)
        else:
            raise Exception("aggregateBySubject: expected 2 preds, got instead", showExprs(preds))
    return aggregateBy(exprs, sortf, aggregate, name="Subject", debug=False)

### Helper functions

def separateSubjPred(expr):
    c, args = expr.unpack()
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
        raise Exception("separateSubjPred should be applied to a simple tree, got ", str(expr))

def getSubj(e):
    subj, _ = separateSubjPred(e)
    return subj
def getPred(e):
    _, preds = separateSubjPred(e)
    return preds

def showSubj(e):
    """Separate show fun for subj, because subj may be a list or a single expression"""
    subj, _ = separateSubjPred(e)
    if isinstance(subj, list):
        return showExprs(subj)
    else:
        return showExprs([subj])

def showExprs(es):
    return ' '.join([e.__str__() for e in es])


def myRange(l):
    max = len(l)+1
    return zip(list(range(1,max)), l)

### Manipulate arguments to become input to aggregation funs

def mkPred(args):
    if len(args)<1:
        raise Exception("mkPred: too short list", args)
    elif len(args)==2:
        p, o = args
        return R.TransPred(p,o)
    else:
        p = args[0]
        return R.IntransPred(p)

def listArg(args):
    if len(args)<2:
        raise Exception("listArg: too short list", args)
    elif len(args)==2:
        a, b = args
        return R.BaseArg(a,b)
    else:
        a = args[0]
        rest = args[1:]
        return R.ConsArg(a, listArg(rest))

### TESTS

print("Some rudimentary tests. TODO: use a real testing framework")
def samePred(expr1, expr2):
    e1p = getPred(expr1)
    e2p = getPred(expr2)
    return e1p == e2p
samePredTrue = samePred(getExpr("A is a player"), getExpr("C is a player"))
assert samePredTrue == True

samePredFalse = samePred(getExpr("A is a player"), getExpr("C is a game"))
assert samePredFalse == False

def sameSubj(expr1, expr2):
    e1s = getSubj(expr1)
    e2s = getSubj(expr2)
    return e1s == e2s

sameSubjSimpleTrue = sameSubj(getExpr("A is a participant in RPS"), getExpr("A is a player"))
assert sameSubjSimpleTrue == True

sameSubjSimpleFalse = sameSubj(getExpr("A is a participant in RPS"), getExpr("B is a player"))
assert sameSubjSimpleFalse == False

sameSubjComplexTrue = sameSubj(getExpr("A and C are participants in RPS"), getExpr("A and C are players"))
assert sameSubjComplexTrue == True

sameSubjComplexFalse = sameSubj(getExpr("A and C are participants in RPS"), getExpr("A and B are players"))
assert sameSubjComplexFalse == False

print("First aggregation:")
firstAggr = aggregateByPredicate(parsedTestCorpus)
for i, t in myRange(firstAggr):
    #print(t)
    print(i),
    print(eng.linearize(t))

print("\nSecond aggregation:")
secondAggr = aggregateBySubject(firstAggr)
for i, t in myRange(secondAggr):
    #print(t)
    print(i),
    print(eng.linearize(t))