%Max time span
time(0..4).

%Facts
is_personal_data(hospital_data,1).
occurs_data_breach(hospital_data,1).


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
has_significant_scale(E,T):-affects_individuals(E,T,N), N>prescribed_no_individuals, not defeated_has_significant_scale(E,T),time(T).

% Exception for notification requirement 26B (4)
defeated_is_notifiable_data_breach(E,T):-data_breach_within_organisation(E,T),time(T).

% Duty to conduct assessment 26C (2). The predicate act(A,E,T,T1) represents activity A undertaken at time T1 in relation to the data breach (E,T).
act(conduct_assesment,E,T,T1):-occurs_data_breach(E,T),time(T),T1=T.

% Section 26 is triggered once it is determined that a data breach is notifiable
trigger(26,E,T):-is_notifiable_data_breach(E,T),not defeated_trigger(26,E,T),time(T).


% Notify the comission and individuals 26D (1,2)
remedial_act(26,E,T,1):-act(notify_comission,E,T,T1),trigger(26,E,T),T<=T1,T1<=T+3, not defeated_remedial_act(26,E,T,1), time(T), time(T1).
remedial_act(26,E,T,2):-act(notify_individuals,E,T,T1),trigger(26,E,T),T<=T1, not defeated_remedial_act(26,E,T,2), time(T), time(T1).

% Cannot notify individuals before notifying the comission
:-act(notify_individuals,E,T,T1),act(notify_comission,E,T,T2),trigger(26,E,T),T1<T2.


% Exceptions and prohibitions for notifying individuals 26D (5a), (6b)
defeated_remidial_act(26,E,T,2):-defeated_cause_significant_harm(E,T),time(T).
defeated_remedial_act(26,E,T,2):-law_agency_disclosure_prohibition(E,T),time(T).
% This line may or may not be strictly necessary
:-act(notify_individuals,E,T,T1),law_agency_disclosure_prohibition(E,T),time(T),time(T1).

% Generate remediating actions
{act(notify_comission,E,T,T1)}:-trigger(26,E,T),T1>T, time(T),time(T1).
{act(notify_individuals,E,T,T1)}:-trigger(26,E,T),T1>T, time(T),time(T1).



% Define sufficiency of remediating actions. Either the remedial action has been undertaken or it has been 'defeated' meaning there is no longer a reason to undertake that remedial action.
sat_remedial_act(26,E,T,1):-remedial_act(26,E,T,1),time(T).
sat_remedial_act(26,E,T,1):-defeated_remedial_act(26,E,T,1),time(T).

sat_remedial_act(26,E,T,2):-remedial_act(26,E,T,2),time(T).
sat_remedial_act(26,E,T,2):-defeated_remedial_act(26,E,T,2),time(T).

rectify(26,E,T):-sat_remedial_act(26,E,T,1),sat_remedial_act(26,E,T,2),time(T).


% Prohibit breaking of law
breach_law(26,E,T):-trigger(26,E,T), not rectify(26,E,T), time(T).
:-breach_law(26,E,T), time(T).

% Weak constraint for minimizing the number of actions.

:~act(Act,E,T,T1).[1@1,Act,E,T,T1]

#show act/4.
