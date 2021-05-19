import pgf

gr = pgf.readPGF("/tmp/RPSTop.pgf")
R = gr.embed("RPSTop")

eng = gr.languages["RPSTopEng"]

i = eng.parse("A is a player")
prob,a_is_player = next(i)
print(a_is_player)

j = eng.parse("C is a player")
prob,c_is_player = next(j)
print(c_is_player)

# constructor, args = a_is_player.unpack()

# print(constructor)
# for arg in args:
#     print(arg)


## We have
# App1 is_player (AVar (V "A"))
# App1 is_player (AVar (V "C"))

## We want
# AggregateSubj1 is_player (BaseArg (AVar (V "A")) (AVar (V "C")))

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

tryToBeRobustPatternMatch(a_is_player, c_is_player)
