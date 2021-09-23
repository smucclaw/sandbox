%Max time span
time(0..4).

{ab(unauthorised_access,E,T)}:-data_event(E,T),time(T).
{ab(unauthorised_collection,E,T)}:-data_event(E,T),time(T).
{ab(unauthorised_use,E,T)}:-data_event(E,T),time(T).
{ab(unauthorised_disclosure,E,T)}:-data_event(E,T),time(T).
{ab(unauthorised_copying,E,T)}:-data_event(E,T),time(T).
{ab(unauthorised_modification,E,T)}:-data_event(E,T),time(T).
{ab(unauthorised_disposal,E,T)}:-data_event(E,T),time(T).
{ab(is_personal_data,E,T)}:-data_event(E,T),time(T).
{ab(cause_significant_harm,E,T)}:-data_event(E,T),time(T).
{ab(has_significant_scale,E,T)}:-data_event(E,T),time(T).
{ab(data_breach_within_organisation,E,T)}:-data_event(E,T),time(T).
{ab(affects_many_individuals,E,T)}:-data_event(E,T),time(T).


unauthorised_access(E,T):-ab(unauthorised_access,E,T).
unauthorised_collection(E,T):-ab(unauthorised_collection,E,T).
unauthorised_use(E,T):-ab(unauthorised_use,E,T).
unauthorised_disclosure(E,T):-ab(unauthorised_disclosure,E,T).
unauthorised_copying(E,T):-ab(unauthorised_copying,E,T).
unauthorised_modification(E,T):-ab(unauthorised_modification,E,T).
unauthorised_disposal(E,T):-ab(unauthorised_disposal,E,T).
is_personal_data(E,T):-ab(is_personal_data,E,T).
cause_significant_harm(E,T):-ab(cause_significant_harm,E,T).
has_significant_scale(E,T):-ab(has_significant_scale,E,T).
data_breach_within_organisation(E,T):-ab(data_breach_within_organisation,E,T).
affects_many_individuals(E,T):-ab(affects_many_individuals,E,T).

%Facts

data_event(hospital_data,1).
%:-unauthorised_copying(hospital_data,1).
%unauthorised_disclosure(hospital_data,1).
%:-is_personal_data(hospital_data,1).
%cause_significant_harm(hospital_data,1).


%Definition of data breach 26A(a). In general a data breach is represented as a pair (E,T), where E is the 'name' of the data breach and T is the time at which it occured.
occurs_data_breach(E,T):-unauthorised_access(E,T),time(T).
occurs_data_breach(E,T):-unauthorised_collection(E,T),time(T).
occurs_data_breach(E,T):-unauthorised_use(E,T),time(T).
occurs_data_breach(E,T):-unauthorised_disclosure(E,T),time(T).
occurs_data_breach(E,T):-unauthorised_copying(E,T),time(T).
occurs_data_breach(E,T):-unauthorised_modification(E,T),time(T).
occurs_data_breach(E,T):-unauthorised_disposal(E,T),time(T).

% In many of the rules below, whenever there is a predicate 'p' in the head, there is a corresponding 'not defeated_p' in the body. This is meant to ensure defeasibility.

% When is a data breach notifiable? 26B(1)
is_notifiable_data_breach(E,T):-cause_significant_harm(E,T),occurs_data_breach(E,T),not defeated_is_notifiable_data_breach(E,T),time(T).
is_notifiable_data_breach(E,T):-has_significant_scale(E,T), occurs_data_breach(E,T),not defeated_is_notifiable_data_breach(E,T),time(T).

% Definitions of significant harm and significant scale 26B (2,3)
cause_significant_harm(E,T):-is_personal_data(E,T), not defeated_cause_significant_harm(E,T),time(T).
has_significant_scale(E,T):-affects_many_individuals(E,T), not defeated_has_significant_scale(E,T),time(T).

% Exception for notification requirement 26B (4)
defeated_is_notifiable_data_breach(E,T):-data_breach_within_organisation(E,T),time(T).

%Strong Constraint-data breach notifiable

%:-data_event(E,T),not is_notifiable_data_breach(E,T).

%Strong Constraint-data breach NOT notifiable
%:-data_event(E,T), is_notifiable_data_breach(E,T).



%Weak Constraint

:~ab(Prop,E,T).[1@1,Prop,E,T]

#show ab/3.
