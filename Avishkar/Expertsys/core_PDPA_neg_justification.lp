%include 'user_inputs.lp'.
%data_event(hospital_data,1).
%min_q_level(0).
%gen_graph(legally_holds(is_notifiable_data_breach(hospital_data,1))).
%max_graph_level(6).

show_graph(0).

gen_graph(defeated(R,C)):-defeated(R,C),show_graph(0).
gen_graph(legally_holds(is_notifiable_data_breach(E,T))):-data_event(E,T),show_graph(0).


% Toggle between the integrity constraints enforcing notifiable vs not notifiable data breach
%const(0).
%opp_const(1).
%const(2).


% User inputed facts
%user_input(pos,is_personal_data(hospital_data,1)).
%user_input(neg,affects_many_individuals(hospital_data,1)).
%user_input(pos,unauthorised_access(hospital_data,1)).
%user_input(pos,unauthorised_collection(hospital_data,1)).
%user_input(neg,data_breach_within_organisation(hospital_data,1)).


%Definition of data breach 26A(a). In general a data breach is represented as a pair (E,T), where E is the 'name' of the data breach and T is the time at which it occured.
according_to(26,occurs_data_breach(E,T)):-legally_holds(unauthorised_access(E,T)).
according_to(26,occurs_data_breach(E,T)):-legally_holds(unauthorised_collection(E,T)).


% When is a data breach notifiable? 26B(1)
according_to(27,is_notifiable_data_breach(E,T)):-legally_holds(cause_significant_harm(E,T)),legally_holds(occurs_data_breach(E,T)).
according_to(27,is_notifiable_data_breach(E,T)):-legally_holds(has_significant_scale(E,T)), legally_holds(occurs_data_breach(E,T)).

% Definitions of significant harm and significant scale 26B (2,3)
according_to(28,cause_significant_harm(E,T)):-legally_holds(is_personal_data(E,T)).
according_to(29,has_significant_scale(E,T)):-legally_holds(affects_many_individuals(E,T)).

% Exception for notification requirement 26B (4)
according_to(30,not_is_notifiable_data_breach(E,T)):-legally_holds(data_breach_within_organisation(E,T)).

% Meta-rules and facts

defeated(R2,C2):-overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2).
opposes(C1,C2):-opposes(C2,C1).
legally_enforces(R,C):-according_to(R,C),not defeated(R,C).
legally_holds(C):-legally_enforces(R,C).
:-opposes(C1,C2),legally_holds(C1),legally_holds(C2).
overrides(30,27).
opposes(is_notifiable_data_breach(E,T),not_is_notifiable_data_breach(E,T)):-data_event(E,T).



%Generating abducibles
generate_q(is_notifiable_data_breach(E,T)):-data_event(E,T).
query(C,0):-generate_q(C).
query(C1,0):-generate_q(C),opposes(C,C1).



%Strong Constraint-data breach notifiable

:-generate_q(C),not legally_holds(C),const(N),not opp_const(N+1).

%Strong Constraint-data breach NOT notifiable
:-generate_q(C),legally_holds(C),opp_const(N),not const(N+1).



explains(unauthorised_access(E,T),occurs_data_breach(E,T),N+1):-query(occurs_data_breach(E,T),N).
explains(unauthorised_collection(E,T),occurs_data_breach(E,T),N+1):-query(occurs_data_breach(E,T),N).

explains(cause_significant_harm(E,T),is_notifiable_data_breach(E,T),N+1):-query(is_notifiable_data_breach(E,T),N).
explains(occurs_data_breach(E,T),is_notifiable_data_breach(E,T),N+1):-query(is_notifiable_data_breach(E,T),N).
explains(has_significant_scale(E,T),is_notifiable_data_breach(E,T),N+1):-query(is_notifiable_data_breach(E,T),N).

explains(is_personal_data(E,T),cause_significant_harm(E,T),N+1):-query(cause_significant_harm(E,T),N).


explains(affects_many_individuals(E,T),has_significant_scale(E,T),N+1):-query(has_significant_scale(E,T),N).

explains(data_breach_within_organisation(E,T),not_is_notifiable_data_breach(E,T),N+1):-query(not_is_notifiable_data_breach(E,T),N).


query(X,N):-explains(X,Y,N),q_level(N).
q_level(N+1):-query(X,N).



not_leaf(X):-explains(X,Y,N),explains(Z,X,N+1).
abducible(leaf,X,N):-explains(X,Y,N),not not_leaf(X).
abducible(nleaf,X,N):-explains(X,Y,N),not_leaf(X).



ask(X,N):-abducible(leaf,X,N).
ask(X,N):-abducible(nleaf,X,N),N>M,min_q_level(M).


max_q_level(N):-not q_level(N+1),q_level(N),N>0.


% Integrate with main program

:-legally_holds(X),change(X),user_input(pos,X).
legally_holds(X):-user_input(neg,X),change(X).
legally_holds(X):-abducible(leaf,X,N),not user_input(pos,X),change(X).
:-legally_holds(X),not change(X),user_input(neg,X).
legally_holds(X):-user_input(pos,X),not change(X).
{change(X)}:-user_input(Y,X).
{change(X)}:-abducible(leaf,X,N).

asserted(X):-user_input(neg,X),change(X).
asserted(X):-abducible(leaf,X,N),not user_input(pos,X),change(X).
asserted(X):-user_input(pos,X),not change(X).
:~change(X).[1@1,X]
:-change(X),change_const(0).




% Generate justification graph
caused_by(pos,legally_holds(unauthorised_access(E,T)),according_to(26,occurs_data_breach(E,T)),N+1):-according_to(26,occurs_data_breach(E,T)),legally_holds(unauthorised_access(E,T)),justify(according_to(26,occurs_data_breach(E,T)),N).
caused_by(pos,legally_holds(unauthorised_collection(E,T)),according_to(26,occurs_data_breach(E,T)),N+1):-according_to(26,occurs_data_breach(E,T)),legally_holds(unauthorised_collection(E,T)),justify(according_to(26,occurs_data_breach(E,T)),N).

caused_by(pos,legally_holds(cause_significant_harm(E,T)),according_to(27,is_notifiable_data_breach(E,T)),N+1):-according_to(27,is_notifiable_data_breach(E,T)),legally_holds(cause_significant_harm(E,T)), legally_holds(occurs_data_breach(E,T)),justify(according_to(27,is_notifiable_data_breach(E,T)),N).
caused_by(pos,legally_holds(occurs_data_breach(E,T)),according_to(27,is_notifiable_data_breach(E,T)),N+1):-according_to(27,is_notifiable_data_breach(E,T)),legally_holds(cause_significant_harm(E,T)), legally_holds(occurs_data_breach(E,T)),justify(according_to(27,is_notifiable_data_breach(E,T)),N).


caused_by(pos,legally_holds(has_significant_scale(E,T)),according_to(27,is_notifiable_data_breach(E,T)),N+1):-according_to(27,is_notifiable_data_breach(E,T)),legally_holds(has_significant_scale(E,T)), legally_holds(occurs_data_breach(E,T)),justify(according_to(27,is_notifiable_data_breach(E,T)),N).
caused_by(pos,legally_holds(occurs_data_breach(E,T)),according_to(27,is_notifiable_data_breach(E,T)),N+1):-according_to(27,is_notifiable_data_breach(E,T)),legally_holds(has_significant_scale(E,T)), legally_holds(occurs_data_breach(E,T)),justify(according_to(27,is_notifiable_data_breach(E,T)),N).


caused_by(pos,legally_holds(is_personal_data(E,T)),according_to(28,cause_significant_harm(E,T)),N+1):-according_to(28,cause_significant_harm(E,T)),legally_holds(is_personal_data(E,T)),justify(according_to(28,cause_significant_harm(E,T)),N).

caused_by(pos,legally_holds(affects_many_individuals(E,T)),according_to(29,has_significant_scale(E,T)),N+1):-according_to(29,has_significant_scale(E,T)),legally_holds(affects_many_individuals(E,T)),justify(according_to(29,has_significant_scalem(E,T)),N).


caused_by(pos,legally_holds(data_breach_within_organisation(E,T)),according_to(30,not_is_notifiable_data_breach(E,T)),N+1):-according_to(30,not_is_notifiable_data_breach(E,T)),legally_holds(data_breach_within_organisation(E,T)),justify(according_to(30,not_is_notifiable_data_breach(E,T)),N).

caused_by(pos,overrides(R1,R2),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).
caused_by(pos,according_to(R2,C2),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).
caused_by(pos,legally_enforces(R1,C1),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).
caused_by(pos,opposes(C1,C2),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).


caused_by(pos,according_to(R,C),legally_enforces(R,C),N+1):-legally_enforces(R,C),according_to(R,C),not defeated(R,C),justify(legally_enforces(R,C),N).
caused_by(neg,defeated(R,C),legally_enforces(R,C),N+1):-legally_enforces(R,C),according_to(R,C),not defeated(R,C),justify(legally_enforces(R,C),N).


caused_by(pos,legally_enforces(R,C),legally_holds(C),N+1):-legally_holds(C),legally_enforces(R,C),not asserted(C), justify(legally_holds(C),N).

caused_by(pos,user_input(pos,C),legally_holds(C),N+1):-legally_holds(C), user_input(pos,C), not change(C),asserted(C), justify(legally_holds(C),N).

caused_by(pos,change(C),legally_holds(C),N+1):-legally_holds(C), not user_input(pos,C), change(C),asserted(C), justify(legally_holds(C),N).
justify(X,N):-caused_by(pos,X,Y,N),graph_level(N+1), not asserted(X).

directedEdge(Sgn,X,Y):-caused_by(Sgn,X,Y,M).

graph_level(0..N):-max_graph_level(N).

justify(X,0):-gen_graph(X).

%Generate partial graphs as well
%justify(X,0):-explains(X,Y,M).
