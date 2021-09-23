data_event(hospital_data,1).
%Definition of data breach 26A(a). In general a data breach is represented as a pair (E,T), where E is the 'name' of the data breach and T is the time at which it occured.
holds(occurs_data_breach(E,T)):-holds(unauthorised_access(E,T)).
holds(occurs_data_breach(E,T)):-holds(unauthorised_collection(E,T)).
holds(occurs_data_breach(E,T)):-holds(unauthorised_use(E,T)).
holds(occurs_data_breach(E,T)):-holds(unauthorised_disclosure(E,T)).
holds(occurs_data_breach(E,T)):-holds(unauthorised_copying(E,T)).
holds(occurs_data_breach(E,T)):-holds(unauthorised_modification(E,T)).
holds(occurs_data_breach(E,T)):-holds(unauthorised_disposal(E,T)).

% In many of the rules below, whenever there is a predicate 'p' in the head, there is a corresponding 'not defeated_p' in the body. This is meant to ensure defeasibility.

% When is a data breach notifiable? 26B(1)
holds(is_notifiable_data_breach(E,T)):-holds(cause_significant_harm(E,T)),holds(occurs_data_breach(E,T)),not holds(defeated_is_notifiable_data_breach(E,T)).
holds(is_notifiable_data_breach(E,T)):-holds(has_significant_scale(E,T)), holds(occurs_data_breach(E,T)),not holds(defeated_is_notifiable_data_breach(E,T)).

% Definitions of significant harm and significant scale 26B (2,3)
holds(cause_significant_harm(E,T)):-holds(is_personal_data(E,T)), not holds(defeated_cause_significant_harm(E,T)).
holds(has_significant_scale(E,T)):-holds(affects_many_individuals(E,T)), not holds(defeated_has_significant_scale(E,T)).

% Exception for notification requirement 26B (4)
holds(defeated_is_notifiable_data_breach(E,T)):-holds(data_breach_within_organisation(E,T)).

%Generating abducibles

query(is_notifiable_data_breach(E,T),0):-data_event(E,T).

%Strong Constraint-data breach notifiable

:-data_event(E,T),not holds(is_notifiable_data_breach(E,T)).

%Strong Constraint-data breach NOT notifiable
%:-data_event(E,T), holds(is_notifiable_data_breach(E,T)).



explains(unauthorised_access(E,T),occurs_data_breach(E,T),N+1):-query(occurs_data_breach(E,T),N).
explains(unauthorised_collection(E,T),occurs_data_breach(E,T),N+1):-query(occurs_data_breach(E,T),N).
explains(unauthorised_use(E,T),occurs_data_breach(E,T),N+1):-query(occurs_data_breach(E,T),N).

explains(cause_significant_harm(E,T),is_notifiable_data_breach(E,T),N+1):-query(is_notifiable_data_breach(E,T),N).
explains(occurs_data_breach(E,T),is_notifiable_data_breach(E,T),N+1):-query(is_notifiable_data_breach(E,T),N).
explains(defeated_is_notifiable_data_breach(E,T),is_notifiable_data_breach(E,T),N+1):-query(is_notifiable_data_breach(E,T),N).
explains(has_significant_scale(E,T),is_notifiable_data_breach(E,T),N+1):-query(is_notifiable_data_breach(E,T),N).

explains(is_personal_data(E,T),cause_significant_harm(E,T),N+1):-query(cause_significant_harm(E,T),N).
explains(defeated_cause_significant_harm(E,T),cause_significant_harm(E,T),N+1):-query(cause_significant_harm(E,T),N).

explains(affects_many_individuals(E,T),has_significant_scale(E,T),N+1):-query(has_significant_scale(E,T),N).
explains(defeated_has_significant_scale(E,T),has_significant_scale(E,T),N+1):-query(has_significant_scale(E,T),N).

explains(data_breach_within_organisation(E,T),defeated_is_notifiable_data_breach(E,T),N+1):-query(defeated_is_notifiable_data_breach(E,T),N).


query(X,N):-explains(X,Y,N),level(N).
level(N+1):-query(X,N).



not_leaf(X):-explains(X,Y,N),explains(Z,X,N+1).
abducible(leaf,X,N):-explains(X,Y,N),not not_leaf(X).
abducible(nleaf,X,N):-explains(X,Y,N),not_leaf(X).



ask(X,N):-abducible(leaf,X,N).
ask(X,N):-abducible(nleaf,X,N),N>2.


maxlevel(N):-not level(N+1),level(N),N>0.


% Integrate with main program

maxlevel(N):-not level(N+1),level(N),N>0.
{choose(X,N-M)}:-ask(X,M),maxlevel(N).
holds(X):-choose(X,K).
user_input(X):-choose(X,M).

:~choose(X,M).[1@M,X,M]

#show user_input/1.
