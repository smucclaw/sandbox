generate_q(is_notifiable_data_breach(hospital_data,1)).


%Definition of data breach 26A(a). In general a data breach is represented as a pair (E,T), where E is the 'name' of the data breach and T is the time at which it occured.
according_to(26,occurs_data_breach(E,T)):-legally_holds(unauthorised_access(E,T)).
according_to(26,occurs_data_breach(E,T)):-legally_holds(unauthorised_collection(E,T)).

% In many of the rules below, whenever there is a predicate 'p' in the head, there is a corresponding 'not defeated_p' in the body. This is meant to ensure defeasibility.

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
opposes(is_notifiable_data_breach(E,T),not_is_notifiable_data_breach(E,T)):-query(is_notifiable_data_breach(E,T),N).
opposes(is_notifiable_data_breach(E,T),not_is_notifiable_data_breach(E,T)):-query(not_is_notifiable_data_breach(E,T),N).
opposes(is_notifiable_data_breach(E,T),not_is_notifiable_data_breach(E,T)):-according_to(R,not_is_notifiable_data_breach(E,T)).
opposes(is_notifiable_data_breach(E,T),not_is_notifiable_data_breach(E,T)):-according_to(R,is_notifiable_data_breach(E,T)).

%Generating abducibles
query(C,0):-generate_q(C).
query(C1,N):-query(C,N),opposes(C,C1).






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
user_q(X):-ask(X,N).







#show user_q/1.
