from clorm import Predicate, ConstantField, IntegerField, RawField
from clorm.clingo import Control
from clorm import *

class User_input(Predicate):
   sgn = ConstantField
   prop = RawField

class Data_event(Predicate):
    name = ConstantField
    time = IntegerField

class Min_q_level(Predicate):
   level = IntegerField

class Max_graph_level(Predicate):
   level = IntegerField

class Const(Predicate):
    val=IntegerField

class Opp_const(Predicate):
    val = IntegerField

class Ask_user(Predicate):
    name = RawField



class Show_graph(Predicate):
    val = IntegerField


class DirectedEdge(Predicate):
    sgn = ConstantField
    edge1 = RawField
    edge2 = RawField


d = 0
#Remove User_input from unifier for now
ctrl = Control(unifier=[Data_event,Min_q_level,Max_graph_level,Const,Ask_user])
ctrl.load("core_PDPA_clingo.lp")

from clorm import FactBase

data_events=[Data_event(name='hospital_data',time=1)]
consts=[Const(val=0)]
min_q_levels=[Min_q_level(level=0)]
max_graph_levels=[Max_graph_level(level=1)]
#user_inputs=[User_input('pos',RawField('is_personal_data(hospital_data,1)')]
opp_consts=[Opp_const(val=1)]
fact= [Show_graph(val=0)]
#Remove user_inputs list from instance for now. Why not working??
instance1 = FactBase(data_events + consts + min_q_levels + max_graph_levels)
instance2 = FactBase(data_events + consts + min_q_levels + max_graph_levels+opp_consts)
instance3 = FactBase(data_events + consts + min_q_levels + max_graph_levels+fact)
instance4 = FactBase(data_events + consts + min_q_levels + max_graph_levels+opp_consts+fact)

ctrl.add_facts(instance1)
ctrl.ground([("base",[])])

solution=None
def on_model(model):
    global solution     # Note: use `nonlocal` keyword depending on scope
    solution = model.facts(atoms=True)

ctrl.solve(on_model=on_model)
if not solution:
    #print('DB not notifiable')
    print("DB not notifiable")
    d = 1
#print(solution)
if solution:
    query1=solution.query(Ask_user)
    q_set=set(query1.all())
    if q_set!={}:
        print(q_set)



#REPEAT for opp constraint

ctrl = Control(unifier=[Data_event,Min_q_level,Max_graph_level,Opp_const,Ask_user])
ctrl.load("core_PDPA_clingo.lp")

#from clorm import FactBase

#data_events=[Data_event(name='hospital_data',time=1)]
#consts=[Const(val=0)]
#min_q_levels=[Min_q_level(level=0)]
#max_graph_levels=[Max_graph_level(level=6)]
#user_inputs=[User_input('pos',RawField('is_personal_data(hospital_data,1)')]
#opp_consts=[Opp_const(val=1)]
#Remove user_inputs list from instance for now. Why not working??
instance1 = FactBase(data_events + consts + min_q_levels + max_graph_levels)
instance2 = FactBase(data_events + consts + min_q_levels + max_graph_levels+opp_consts)

ctrl.add_facts(instance2)
ctrl.ground([("base",[])])

solution=None
def on_model(model):
    global solution     # Note: use `nonlocal` keyword depending on scope
    solution = model.facts(atoms=True)

ctrl.solve(on_model=on_model)
if not solution:
    #print('DB not notifiable')
    print("DB is notifiable")
    d = 2
#print(solution)
if solution:
    query1=solution.query(Ask_user)
    q_set=set(query1.all())
    if q_set!={}:
        print(q_set)






if d==1:
    ctrl = Control(unifier=[Data_event,Min_q_level,Max_graph_level,Opp_const,Ask_user,Const,DirectedEdge,Show_graph])
    ctrl.load("core_PDPA_clingo.lp")

    #from clorm import FactBase

    #data_events=[Data_event(name='hospital_data',time=1)]
    #consts=[Const(val=0)]
    #min_q_levels=[Min_q_level(level=0)]
    #max_graph_levels=[Max_graph_level(level=6)]
    #user_inputs=[User_input('pos',RawField('is_personal_data(hospital_data,1)')]
    #opp_consts=[Opp_const(val=1)]
    #Remove user_inputs list from instance for now. Why not working??

    ctrl.add_facts(instance4)
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
        q_set=set(query1.all())
        if q_set!={}:
            print(q_set)
elif d==2:
    ctrl = Control(unifier=[Data_event,Min_q_level,Max_graph_level,Opp_const,Ask_user,Const,DirectedEdge,Show_graph])
    ctrl.load("core_PDPA_clingo.lp")

    #from clorm import FactBase

    #data_events=[Data_event(name='hospital_data',time=1)]
    #consts=[Const(val=0)]
    #min_q_levels=[Min_q_level(level=0)]
    #max_graph_levels=[Max_graph_level(level=6)]
    #user_inputs=[User_input('pos',RawField('is_personal_data(hospital_data,1)')]
    #opp_consts=[Opp_const(val=1)]
    #Remove user_inputs list from instance for now. Why not working??

    ctrl.add_facts(instance3)
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
        q_set=set(query1.all())
        if q_set!={}:
            print(q_set)


#print(q_set)

edge_list=list(q_set)
for edge in edge_list:
    print(edge)
