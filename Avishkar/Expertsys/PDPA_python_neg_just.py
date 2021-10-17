from clorm import Predicate, ConstantField, IntegerField, RawField
from clorm.clingo import Control
from clorm import *


user_inputs_list = ["user_input(pos,is_personal_data(hospital_data,1)).","user_input(neg,data_breach_within_organisation(hospital_data,1)).",
"user_input(pos,unauthorised_access(hospital_data,1))."]
textfile = open("user_inputs_neg_just.lp", "w")
for element in user_inputs_list:
    textfile.write(element + "\n")
textfile.close()


class Data_event(Predicate):
    name = ConstantField
    time = IntegerField


class Max_graph_level(Predicate):
   level = IntegerField

class Const(Predicate):
    val=IntegerField

class Opp_const(Predicate):
    val = IntegerField


class DirectedEdge(Predicate):
    sgn = ConstantField
    edge1 = RawField
    edge2 = RawField

class Change_const(Predicate):
    val = IntegerField

class Change(Predicate):
    val = RawField



#Remove User_input from unifier for now
ctrl = Control(unifier=[Data_event,Max_graph_level,Const,Opp_const,DirectedEdge,Change_const])
ctrl.load("core_PDPA_neg_justification.lp")
ctrl.load("user_inputs_neg_just.lp")

from clorm import FactBase

data_events=[Data_event(name='hospital_data',time=1)]
consts=[Const(val=0)]
max_graph_levels=[Max_graph_level(level=7)]
opp_consts=[Opp_const(val=1)]
change_consts=[Change_const(val=0)]
#Remove user_inputs list from instance for now. Why not working??
instance1 = FactBase(data_events + consts + max_graph_levels+change_consts)
instance2 = FactBase(data_events + consts + max_graph_levels+opp_consts+change_consts)
instance3 = FactBase(data_events + consts + max_graph_levels)
instance4 = FactBase(data_events + consts + max_graph_levels+opp_consts)

ctrl.add_facts(instance1)
ctrl.ground([("base",[])])

solution=None
def on_model(model):
    global solution     # Note: use `nonlocal` keyword depending on scope
    solution = model.facts(atoms=True)

ctrl.solve(on_model=on_model)
if not solution:
    dbn=0

#print(solution)
else:
    dbn=1


#REPEAT for opp constraint
if dbn==0:
    ctrl = Control(unifier=[Data_event,Max_graph_level,Const,Opp_const,DirectedEdge,Change_const])
    ctrl.load("core_PDPA_neg_justification.lp")
    ctrl.load("user_inputs_neg_just.lp")
    ctrl.add_facts(instance2)
    ctrl.ground([("base",[])])

    solution=None
    def on_model(model):
        global solution     # Note: use `nonlocal` keyword depending on scope
        solution = model.facts(atoms=True)

    ctrl.solve(on_model=on_model)

    query1=solution.query(DirectedEdge)
    initial_edge_set=set(query1.all())


    ctrl = Control(unifier=[Data_event,Max_graph_level,Const,Opp_const,DirectedEdge,Change_const])
    ctrl.load("core_PDPA_neg_justification.lp")
    ctrl.load("user_inputs_neg_just.lp")
    ctrl.add_facts(instance3)
    ctrl.ground([("base",[])])

    solution=None
    def on_model(model):
        global solution     # Note: use `nonlocal` keyword depending on scope
        solution = model.facts(atoms=True)

    ctrl.solve(on_model=on_model)

    query1=solution.query(DirectedEdge)
    new_edge_set=set(query1.all())
    query2=solution.query(Change)
    change_preds=set(query2.all())
    print('DB not notifible based on user inputs')
    print(initial_edge_set.symmetric_difference(new_edge_set))
    print(change_preds)
else:
    ctrl = Control(unifier=[Data_event,Max_graph_level,Const,Opp_const,DirectedEdge,Change_const])
    ctrl.load("core_PDPA_neg_justification.lp")
    ctrl.load("user_inputs_neg_just.lp")
    ctrl.add_facts(instance1)
    ctrl.ground([("base",[])])

    solution=None
    def on_model(model):
        global solution     # Note: use `nonlocal` keyword depending on scope
        solution = model.facts(atoms=True)

    ctrl.solve(on_model=on_model)

    query1=solution.query(DirectedEdge)
    initial_edge_set=set(query1.all())


    ctrl = Control(unifier=[Data_event,Max_graph_level,Const,Opp_const,DirectedEdge,Change_const])
    ctrl.load("core_PDPA_neg_justification.lp")
    ctrl.load("user_inputs_neg_just.lp")
    ctrl.add_facts(instance4)
    ctrl.ground([("base",[])])

    solution=None
    def on_model(model):
        global solution     # Note: use `nonlocal` keyword depending on scope
        solution = model.facts(atoms=True)

    ctrl.solve(on_model=on_model)

    query1=solution.query(DirectedEdge)
    new_edge_set=set(query1.all())
    query2=solution.query(Change)
    change_preds=set(query2.all())
    print('DB is notifible based on user inputs')
    print(initial_edge_set.symmetric_difference(new_edge_set))
    print(change_preds)
