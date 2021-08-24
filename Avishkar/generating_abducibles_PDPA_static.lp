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

query(is_notifiable_data_breach(hospital_data,1),0).

not_leaf(X):-explains(X,Y,N),explains(Z,X,N+1).
abducible(leaf,X,N):-explains(X,Y,N),not not_leaf(X).
abducible(nleaf,X,N):-explains(X,Y,N),not_leaf(X).



ask(X,N):-abducible(leaf,X,N).
ask(X,N):-abducible(nleaf,X,N),N>2.


maxlevel(N):-not level(N+1),level(N),N>0.

#show ask/2.
#show maxlevel/1.





% Integrate with main program

maxlevel(N):-not level(N+1),level(N),N>0.
{ab(X,N-M)}:-ask(X,M),maxlevel(N).
holds(X):-ab(X,K).

~:ab(X,M).[1@M,X,M]
