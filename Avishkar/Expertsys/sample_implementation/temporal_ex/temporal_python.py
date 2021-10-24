from clorm import Predicate, ConstantField, IntegerField, RawField
from clorm.clingo import Control
from clorm import *

user_inputs_list = ["user_input(neg, fluent(-4)).", "user_input(neg, fluent(-3))."]
textfile = open("user_inputs.lp", "w")
for element in user_inputs_list:
    textfile.write(element + "\n")
textfile.close()

params=["min_q_level(5).","max_graph_level(20).","generate_q(fluent(3)).","max_query_lvl(6)."]
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
ctrl.load("temporal_core.lp")
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
ctrl.load("temporal_core.lp")
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

    ctrl.load("temporal_core.lp")
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
    ctrl.load("temporal_core.lp")
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


change_const=1
if change_const==1:
    if d==1:
        ctrl = Control(unifier=[Const,Opp_const,Ask_user,DirectedEdge])

        ctrl.load("temporal_core.lp")
        ctrl.load("asp_fixed_code_neg_just.lp")
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
            old_edge_set_1=set(query1.all())

        ctrl = Control(unifier=[Const,Opp_const,Ask_user,DirectedEdge])

        ctrl.load("temporal_core.lp")
        ctrl.load("asp_fixed_code_neg_just.lp")
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
            new_edge_set_1=set(query1.all())
        added_edges_set=new_edge_set_1.difference(old_edge_set_1)
        deleted_edges_set=old_edge_set_1.difference(new_edge_set_1)
        print('Added edges')
        for e in list(added_edges_set):
            print(e)

        print('Deleted edges')
        for e in list(deleted_edges_set):
            print(e)


    elif d==2:
        ctrl = Control(unifier=[Const,Opp_const,Ask_user,DirectedEdge])

        ctrl.load("temporal_core.lp")
        ctrl.load("asp_fixed_code_neg_just.lp")
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
            old_edge_set_1=set(query1.all())

        ctrl = Control(unifier=[Const,Opp_const,Ask_user,DirectedEdge])

        ctrl.load("temporal_core.lp")
        ctrl.load("asp_fixed_code_neg_just.lp")
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
            new_edge_set_1=set(query1.all())
        added_edges_set=new_edge_set_1.difference(old_edge_set_1)
        deleted_edges_set=old_edge_set_1.difference(new_edge_set_1)
        print('Added edges')
        for e in list(added_edges_set):
            print(e)

        print('Deleted edges')
        for e in list(deleted_edges_set):
            print(e)
    else:
        None

else:
    None
