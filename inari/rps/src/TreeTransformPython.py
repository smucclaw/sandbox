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

def samePred(expr1, expr2):
    e1p = getPred(expr1)
    e2p = getPred(expr2)
    return e1p == e2p

def separateSubjPred(expr):
    c, args = expr.unpack()
    if c=="App1":
        pred, subj = args
        return (subj, [pred])
    elif c=="App2":
        pred, subj, obj = args
        return (subj, [pred, obj])
    else:
        raise Exception("ignoreSubj should be applied to a simple tree, got ", str(expr))

def getSubj(e):
    subj, _ = separateSubjPred(e)
    return subj
def getPred(e):
    _, preds = separateSubjPred(e)
    return preds

def showPred(es):
    return ' '.join([e.__str__() for e in es])

def aggregateByPredicate(exprs):
    groups = []
    results = []
    sortf = lambda e : showPred(getPred(e))
    exprs = sorted(exprs, key=sortf)
    for _, g in itertools.groupby(exprs, sortf):
        groups.append(list(g))      # Store group iterator as a list
    for grp in groups:
        grp = list(grp)
        l = len(grp)
        if l==0:
            raise Exception("aggregateByPredicate: empty input")
        elif l==1:
            results.append(grp[0])
        else:
            subjs = [getSubj(e) for e in grp]
            pred = grp[0] # we can take any expr from grp, they all have same predicate
            results.append(aggregateSubj(subjs,pred))
    return results

def aggregateSubj(subjs, expr):
    aggrSubjs = listArg(subjs)
    c, args = expr.unpack()
    if c=="App1":
        pr, _ = args
        return R.AggregateSubj1(pr, aggrSubjs)
    elif c=="App2":
        pr, _, obj = args
        return R.AggregateSubj2(pr, obj, aggrSubjs)
    else:
        return expr



###### Ad hoc way

def tryToBeRobustPatternMatch(tree1, tree2):

    constructor1, args1 = tree1.unpack()
    constructor2, args2 = tree2.unpack()
    if constructor1 == "App1" and constructor2 == "App1":
        construct11(args1, args2)
    elif constructor1 == "App1" and constructor2 == "App2":
        construct12(tree1, tree2)
    elif constructor1 == "App2" and constructor2 == "App1":
        construct12(tree2, tree1)
    elif constructor1 == "App2" and constructor2 == "App2":
        construct22(tree1, tree2)


def construct11(args1, args2):
    fun1, arg1 = args1
    fun2, arg2 = args2
    if fun1==fun2:
        aggr = R.AggregateSubj1(fun1, (R.BaseArg(arg1, arg2)))
        print(aggr)
        print(eng.linearize(aggr))
    else:
        print("you suck")
    pass

def construct12(t1, t2):
    pass

def construct22(t1, t2):
    pass

### Generic helpers

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
test1 = samePred(getExpr("A is a player"), getExpr("C is a player"))
assert test1 == True

test2 = samePred(getExpr("A is a player"), getExpr("C is a game"))
assert test2 == False

test3 = aggregateByPredicate(parsedTestCorpus)
for t in test3:
    #print(t)
    print(eng.linearize(t))