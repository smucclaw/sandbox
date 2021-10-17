from clorm import Predicate, ConstantField, IntegerField, RawField
from clorm.clingo import Control
from clorm import *

#"user_input(pos,majorityShareholder(gates,microsoft)).","user_input(pos,highMarketShare(microsoft)).","user_input(pos,madeLoss(microsoft))."
user_inputs_list = ["user_input(neg,majorityShareholder(gates,microsoft))."]
textfile = open("user_inputs.lp", "w")
for element in user_inputs_list:
    textfile.write(element + "\n")
textfile.close()

params=["min_q_level(0).","max_graph_level(4).","generate_q(mustPayCorpTax(gates,microsoft)).","overrides(b_2,b_1)."]
textfile = open("params.lp", "w")
for element in params:
    textfile.write(element + "\n")
textfile.close()


class Const(Predicate):
    val=IntegerField

class Opp_const(Predicate):
    val = IntegerField

class Ask_user(Predicate):
    name = RawField


class DirectedEdge(Predicate):
    sgn = ConstantField
    edge1 = RawField
    edge2 = RawField


d = 0
ctrl = Control(unifier=[Const,Opp_const,Ask_user,DirectedEdge])
ctrl.load("core_corp_tax_clingo.lp")
ctrl.load("asp_fixed_code.lp")
ctrl.load("params.lp")
ctrl.load("user_inputs.lp")

from clorm import FactBase

consts=[Const(val=0)]
opp_consts=[Opp_const(val=1)]

instance1 = FactBase(consts)
instance2 = FactBase(consts +opp_consts)

ctrl.add_facts(instance1)
ctrl.ground([("base",[])])

solution=None
def on_model(model):
    global solution     # Note: use `nonlocal` keyword depending on scope
    solution = model.facts(atoms=True)

ctrl.solve(on_model=on_model)
if not solution:
    #print('DB not notifiable')
    print("Query not legally true")
    d = 1
    q1_set=set()
#print(solution)
if solution:
    query1=solution.query(Ask_user)
    q1_set=set(query1.all())



#REPEAT for opp constraint

ctrl = Control(unifier=[Const,Opp_const,Ask_user,DirectedEdge])
ctrl.load("core_corp_tax_clingo.lp")
ctrl.load("asp_fixed_code.lp")
ctrl.load("params.lp")
ctrl.load("user_inputs.lp")

#instance1 = FactBase(consts)
#instance2 = FactBase(consts+opp_consts)

ctrl.add_facts(instance2)
ctrl.ground([("base",[])])

solution=None
def on_model(model):
    global solution     # Note: use `nonlocal` keyword depending on scope
    solution = model.facts(atoms=True)

ctrl.solve(on_model=on_model)
if not solution:
    #print('DB not notifiable')
    print("Query is legally true")
    d = 2
    q2_set=set()
#print(solution)
if solution:
    query1=solution.query(Ask_user)
    q2_set=set(query1.all())







if d==1:
    ctrl = Control(unifier=[Const,Opp_const,Ask_user,DirectedEdge])

    ctrl.load("core_corp_tax_clingo.lp")
    ctrl.load("asp_fixed_code.lp")
    ctrl.load("params.lp")
    ctrl.load("user_inputs.lp")

    ctrl.add_facts(instance2)
    ctrl.ground([("base",[])])

    solution=None
    def on_model(model):
        global solution     # Note: use `nonlocal` keyword depending on scope
        solution = model.facts(atoms=True)

    ctrl.solve(on_model=on_model)
    if not solution:
        #print('DB not notifiable')
        print("Error")

    #print(solution)
    if solution:
        query1=solution.query(DirectedEdge)
        edge_set_1=set(query1.all())

elif d==2:
    ctrl = Control(unifier=[Const,Opp_const,Ask_user,DirectedEdge])
    ctrl.load("core_corp_tax_clingo.lp")
    ctrl.load("asp_fixed_code.lp")
    ctrl.load("params.lp")
    ctrl.load("user_inputs.lp")



    ctrl.add_facts(instance1)
    ctrl.ground([("base",[])])

    solution=None
    def on_model(model):
        global solution     # Note: use `nonlocal` keyword depending on scope
        solution = model.facts(atoms=True)

    ctrl.solve(on_model=on_model)
    if not solution:
        #print('DB not notifiable')
        print("Error")

    #print(solution)
    if solution:
        query1=solution.query(DirectedEdge)
        edge_set_1=set(query1.all())


else:
    edge_set_1=set()

question_list=list(q1_set.union(q2_set))
for elt in question_list:
    print(elt)

edge_list=list(edge_set_1)
for elt in edge_list:
    print(elt)
