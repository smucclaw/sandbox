import pgf
import itertools
import ttutils as ttutils       #import gf_python.ttutils as ttutils
import responseparser as rp     #import gf_python.responseparser as rp
import yaml

####################################
# source: https://github.com/smucclaw/gf-python/tree/main/gf_python
## Parsing data from s(CASP) models

# We assume that the PGF file, which is constructed in baby-l4,
# is copied to be in the same directory, or otherwise hardcoded path.
# The name of the grammar is also always the same.
gr = pgf.readPGF("AnswerTop.pgf")
R = gr.embed("AnswerTop")

eng = gr.languages["AnswerTopEng"]

### This file probably shouldn't be called test-model.txt and be in the same directory.
## TODO: find out where to read the s(CASP) responses
responsefile = open('test-model.txt', 'r')                        # open the file that contains the possible outcomes
responsetext = rp.annotate_indents(responsefile.read())           # apply the annotate_indents function in responseparser

def term2exp(term):
    """ Takes a term atom.
        Return it as at transitive or intransitive expression.
    """
    functor = term['functor']['base atom']
    fun = pgf.readExpr(functor)
    args = term2args(term['arguments'])
    allArgs = args.insert(0, fun)
    if len(args)==2:
        return pgf.Expr("App1", args)
    elif len(args)==3:
        return pgf.Expr("App2", args)
    else:
        raise Exception("term2exp: expected unary or binary function, got" + yaml.dump(term))

def term2args(arguments):
    """ Takes a dictionary with keys 'variable' or 'term'.
        Combine them into a list called argExprs.
    """
    argExprs = []
    for a in arguments:
        if 'variable' in a.keys():
            litStr = '"' + a['variable'] + '"' # needs to be in quotes to be parsed as literal
            litExpr = pgf.readExpr(litStr)
            varExpr = R.AVar(R.V(litExpr))
            argExprs.append(varExpr)
        elif 'term' in a.keys():
            fStr = a['term']['functor']['base atom']
            atomExpr = R.AAtom(pgf.readExpr(fStr))
            argExprs.append(atomExpr)
        else:
            raise Exception("term2args: expected dict with 'variable' or 'term', got instead" + a.keys())
    return argExprs

def parseModels(responsetext):
    """ Takes all the possible responses.
        Put them into lists.
        Combine these lists into a list called models.
    """
    models = []
    resp = rp.response.parseString(responsetext,True).asDict()
    answers = resp['answer set']

    # For now, we only read models.
    # Future work: also construct trees from justifications
    ms = [ans['model'] for ans in answers]
    for m in ms:
        pgfExprs = []
        for t in m:
            term = t['term']
            exp = term2exp(term)
            pgfExprs.append(exp)
        models.append(pgfExprs)
    return models

####################################
## Translating the Haskell functions

def aggregateBy(exprs,
                sortf=lambda e : e,
                groupf=lambda e : e,
                name='',
                debug=False):
    """Generic aggregation function"""
    sortByShow = lambda e : show(sortf(e))
    results = []
    if debug:
        print("debug: aggregateBy"+name)
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
    """ Takes all expressions.
        Classify them into 2 groups --  transitive or intransitive.
        Aggregate them by their groups.
    """
    # internal aggregation fun
    def aggregate(es):
        subjs = [ttutils.getSubj(e) for e in es]
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
            raise Exception("aggregatebyPredicate: expected simple expr, got instead", show(fullExpr))

    return aggregateBy(exprs, ttutils.getPred, aggregate, name="Predicate", debug=False)

def sort_by_transitivity(preds):
    """This takes preds like
        R.TransPred(throw, rock)
        R.IntransPred(is_player)
        R.TransPred(beat, scissors)
        We want to sort them in a list so that all IntransPreds are before all TransPreds:
        [IntransPred(...), IntransPred(...), ..., TransPred(...), TransPred(...)]
    """
    transPred = []                   # initiate empty TransPred list
    inTransPred = []                 # initiate empty InTransPred list
    for item in preds:               # to iterate through each item in the entire list of preds
        c, args = item.unpack()      # unpack to retrieve the c
        if c == "TransPred":         # this is the analogous of atom.atype for predicates as type(gf item) will fail. Filter for type TransPred.
            transPred.append(item)   # append to build a list of all TransPreds
        elif c == "IntransPred":     # this is the analogous of atom.atype for predicates as type(gf item) will fail. Filter for type intransPred
            inTransPred.append(item) # append to build a list of all intransPreds
        else:
            raise Exception ("expected predicates, got non-predicates instead", show(item))

    return listPred(inTransPred + transPred) # aggregate into a sorted list of Preds [IntransPred(...), IntransPred(...), ..., TransPred(...), TransPred(...)]


def aggregateBySubject(exprs):
    """ Takes all the expressions.
        Make them into predicates.
        Classify these predicates into transitive vs intransive.
        Aggregate these classified predicates by subject.
        [(Subject1: IntransPred(...), IntransPred(...), ..., TransPred(...), TransPred(...)),
         (Subject2: IntransPred(...), IntransPred(...), ..., TransPred(...), TransPred(...)),...]
    """
    # Internal aggregate fun
    def aggregate(es):
        preds = [mkPred(ttutils.getPred(e)) for e in es]
        fullExpr = es[0] # we can take any expr from group, they all have same subject
        if len(preds)>0:
            _, args = fullExpr.unpack()
            subjs = args[-1]
            transSortedPreds = sort_by_transitivity(preds)
            return R.AggregatePred(transSortedPreds, subjs)
        else:
            raise Exception("aggregateBySubject: expected 2 preds, got instead", show(preds))
    return aggregateBy(exprs, ttutils.getSubj, aggregate, name="Subject", debug=False)

def aggregateAll(exprs, typography):
    """Takes a list of expressions and typography (R.Bullets or R.Inline).
       Returns the expressions aggregated and put in a single
    """
    aggr = aggregateBySubject(aggregateByPredicate(exprs))
    return wrapStatement(typography, aggr)


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

### Specialised versions of generic functions from ttutils

def wrapStatement(typography, statements):
    return R.ConjStatement(typography, listStatement(statements))

def listArg(args):
    return ttutils.listGeneric(args, R.BaseArg, R.ConsArg)

def listPred(args):
    return ttutils.listGeneric(args, R.BasePred, R.ConsPred)

def listStatement(args):
    return ttutils.listGeneric(args, R.BaseStatement, R.ConsStatement)

def show(e):
    return ttutils.showExprs(e)

def prettyLin(e):
    return ttutils.pretty(eng.linearize(e))

### Main function

def nlgModels(models):
    concls = [m[0] for m in models]
    evidence = [m[1:] for m in models]
    if all(x == concls[0] for x in concls):
        conclusion = concls[0]
    else:
        raise Exception("nlgModels: expected identical conclusions, got", show(concls))

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

#### Finally, test aggregation on parsed models

if __name__=="__main__":
    print("Original models")
    for n, exps in zip([1,2,3], parseModels(responsetext)):
        print("\nModel"),
        print(n)
        for exp in exps:
            l = eng.linearize(exp)
            print(l)

    print("\n\nAggregation\n")
    print(nlgModels(parseModels(responsetext)))