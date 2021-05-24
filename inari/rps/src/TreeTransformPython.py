import pgf
import itertools
import sys

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

aRock_cScissors = [
   "A wins RPS",
   "RPS is a game",
   "A is a participant in RPS",
   "A is a player",
   "A throws rock",
   "C is a player",
   "C is a participant in RPS",
   "C throws scissors",
   "rock beats scissors",
]

aScissors_cPaper = [
   "A wins RPS",
   "RPS is a game",
   "A is a participant in RPS",
   "A is a player",
   "A throws scissors",
   "C is a player",
   "C is a participant in RPS",
   "C throws paper",
   "scissors beats paper",
]


aPaper_cRock = [
   "A wins RPS",
   "RPS is a game",
   "A is a participant in RPS",
   "A is a player",
   "A throws paper",
   "C is a player",
   "C is a participant in RPS",
   "C throws rock",
   "paper beats rock",
]

testCorpus = [aRock_cScissors, aScissors_cPaper, aPaper_cRock]

# for e in testCorpus:
#     print(e)


def getExpr(sentence):
    i = eng.parse(sentence)
    prob,expr = next(i)
    return expr

parsedTestCorpus = []
for model in testCorpus:
    parsedModel = []
    for s in model:
        parsedModel.append(getExpr(s))
    parsedTestCorpus.append(parsedModel)

# for e in parsedTestCorpus:
#     print(e)

####################################
## Translating the Haskell functions

def aggregateBy(
    exprs,
    sortf=lambda e : e,
    groupf=lambda e : e,
    name='',
    debug=False):
    """Generic aggregation function"""
    sortByShow = lambda e : showExprs(sortf(e))
    results = []
    if debug:
        print("debug: aggregateBy", name)
        for e in [sortByShow(e) for e in exprs]:
            print(e)
        print("---------")
    exprs = sorted(exprs, key=sortByShow)
    for _, g in itertools.groupby(exprs, sortByShow):
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
    # internal aggregation fun
    def aggregate(es):
        subjs = [getSubj(e) for e in es]
        fullExpr = es[0]
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

    return aggregateBy(exprs, getPred, aggregate, name="Predicate", debug=False)

def aggregateBySubject(exprs):
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
    return aggregateBy(exprs, getSubj, aggregate, name="Subject", debug=False)

def aggregateAll(exprs, typography):
    """Takes a list of expressions and typography (R.Bullets or R.Inline).
       Returns the expressions aggregated and put in a single
    """
    aggr = aggregateBySubject(aggregateByPredicate(exprs))
    return wrap(typography, aggr)


def nlgModels(models):
    concls = [m[0] for m in models]
    evidence = [m[1:] for m in models]
    if all(x == concls[0] for x in concls):
        conclusion = concls[0]
    else:
        raise Exception("nlgModels: expected identical conclusions, got", showExprs(concls))

    allEvidence = [e for es in evidence for e in es] # flatten to find duplicates
    sharedEvidence = [
        g[0]
        for g in aggregateBy(allEvidence)
        if isinstance(g, list)]
    aggrShared = aggregateAll(sharedEvidence, R.Bullets)

    uniques = [
        aggregateAll([e for e in es if e not in sharedEvidence], R.Inline)
        for es in evidence]
    aggrUniques = R.DisjStatement(R.Bullets, listStatement(uniques))

    ## Final NLG
    result = [
        prettyLin(conclusion) + ",",

        "\nif all of the following hold:",
        prettyLin(aggrShared),

        "\nand one of the following holds:",
        prettyLin(aggrUniques)
    ]
    return '\n'.join(result)

### Helper functions

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
        raise Exception("separateSubjPred should be applied to a simple tree, got ", str(expr))

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

### Handle lists

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

def listArg(args):
    return listGeneric(args, R.BaseArg, R.ConsArg)

def listStatement(args):
    return listGeneric(args, R.BaseStatement, R.ConsStatement)

def unListStatement(statement):
    c, args = statement.unpack()
    if c=="BaseStatement":
        return args
    elif c=="ConsStatement":
        s1, rest = args
        return [s1].extend(unListStatement(rest))

### Printing the trees

def wrap(typography, statements):
    return R.ConjStatement(typography, listStatement(statements))

def unwrap(statement):
    c, args = statement.unpack()
    if c=="ConjStatement":
        _, listSt = args
        return unListStatement(listSt)

def pretty(s):
    s = s.replace("\\", "\n")  # \ to newline
    s = s.replace(" \n", "\n") # remove whitespace at the end of line
    return s

def prettyLin(e):
    return pretty(eng.linearize(e))

###### Main

if __name__ == "__main__":
    print(nlgModels(parsedTestCorpus))


################# TESTS #################
## Some rudimentary tests.
## TODO: use a real testing framework?

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


def nlgSingleModel(model):
    conclusion, evidence = model[0], model[1:]
    firstAggr = aggregateByPredicate(evidence)
    secondAggr = aggregateBySubject(firstAggr)
    finalExpr = R.IfThen(conclusion, (wrap(R.Bullets, secondAggr)))
    return prettyLin(finalExpr)

aRock_cScissors_gold = """A wins RPS if
* A throws rock,
* C throws scissors,
* RPS is a game,
* rock beats scissors and
* A and C are players and participants in RPS"""

# print(type(parsedTestCorpus))
# print(type(parsedTestCorpus[0]))

aRock_cScissors_system = nlgSingleModel(parsedTestCorpus[0])

with open('/tmp/gold', 'w') as g:
    g.write(aRock_cScissors_gold)
with open('/tmp/system', 'w') as s:
    s.write(aRock_cScissors_system)


assert aRock_cScissors_system == aRock_cScissors_gold
