%Facts
legally_holds(is_notifiable_db(hosp_data,sgh,1)).
gen_full_trace.
%reject_obligation(1,hosp_data,sgh,pdpc,1).
%act(hosp_data,sgh,pdpc,1,explain_to_pdpc,32).

contract_triggered(Db_id,Org,pdpc,T):-legally_holds(is_notifiable_db(Db_id,Org,T)).


prompt(must_notify_pdpc_within_30_days):-contract_triggered(Db_id,Org,pdpc,T),not reject_obligation(1,Db_id,Org,pdpc,T),not contract_satisfied(Db_id,Org,pdpc,T).
sat(1,Db_id,Org,pdpc,T,T1):-contract_triggered(Db_id,Org,pdpc,T),act(Db_id,Org,pdpc,T,inform_pdpc,T1),T1>T,T1<T+30.


prompt(must_explain_to_pdpc_within_further_3_days):-contract_triggered(Db_id,Org,pdpc,T),reject_obligation(1,Db_id,Org,pdpc,T),not contract_satisfied(Db_id,Org,pdpc,T).
sat(2,Db_id,Org,pdpc,T,T1):-contract_triggered(Db_id,Org,pdpc,T),act(Db_id,Org,pdpc,T,explain_to_pdpc,T1),T1>T+30, T1<T+33.

%General rules
sat_oblig(Id,P1,P2,T):-sat(N,Id,P1,P2,T,Tj).

contract_succeeds(Id,P1,P2,T,Ts):-contract_triggered(Id,P1,P2,T), sat_oblig(Id,P1,P2,T),#min {Tj,1:sat(N,Id,P1,P2,T,Tj)} = Ts.

contract_satisfied(Id,P1,P2,T):-contract_succeeds(Id,P1,P2,T,Ts).
%End of general rules

contract_violated(Db_id,Org,pdpc,T,T+33):-not contract_satisfied(Db_id,Org,pdpc,T),reject_obligation(1,Db_id,Org,pdpc,T),reject_obligation(2,Db_id,Org,pdpc,T),contract_triggered(Db_id,Org,pdpc,T).

%Generating Trace
time(T..T+33):-gen_trace(Db_id,Org,pdpc,T),contract_triggered(Db_id,Org,pdpc,T).
{do_act(Db_id,Org,pdpc,T,inform_pdpc,T1)}:-gen_trace(Db_id,Org,pdpc,T),contract_triggered(Db_id,Org,pdpc,T),time(T1).
{do_act(Db_id,Org,pdpc,T,explain_to_pdpc,T1)}:-gen_trace(Db_id,Org,pdpc,T),contract_triggered(Db_id,Org,pdpc,T),time(T1).




%New contract for informing affected individuals

%contract_triggered(Db_id,Org,affected_ind,Ts):-legally_holds(is_notifiable_db(Db_id,Org,T)),contract_succeeds(Db_id,Org,pdpc,T,Ts).
contract_triggered(Db_id,Org,affected_ind,T):-legally_holds(is_notifiable_db(Db_id,Org,T)).


prompt(notify_affected_individuals_ASAP):-contract_triggered(Db_id,Org,affected_ind,T),not reject_obligation(1,Db_id,Org,affected_ind,T),not contract_satisfied(Db_id,Org,affected_ind,T).
sat(1,Db_id,Org,affected_ind,T,T1):-contract_triggered(Db_id,Org,affected_ind,T),act(Db_id,Org,affected_ind,T,inform_affected_ind,T1),T1>T.

%General rules
sat_oblig(Id,P1,P2,T):-sat(N,Id,P1,P2,T,Tj).

contract_succeeds(Id,P1,P2,T,Ts):-contract_triggered(Id,P1,P2,T), sat_oblig(Id,P1,P2,T),#min {Tj,1:sat(N,Id,P1,P2,T,Tj)} = Ts.

contract_satisfied(Id,P1,P2,T):-contract_succeeds(Id,P1,P2,T,Ts).
%End of general rules


%Generating Trace
time(T..T+20):-gen_trace(Db_id,Org,affected_ind,T),contract_triggered(Db_id,Org,affected_ind,T).
{do_act(Db_id,Org,affected_ind,T,inform_affected_ind,T1)}:-gen_trace(Db_id,Org,affected_ind,T),contract_triggered(Db_id,Org,affected_ind,T),time(T1).







%Generate trace gneral
act(Id,P1,P2,T,Act,T1):-do_act(Id,P1,P2,T,Act,T1).
gen_trace(Id,P1,P2,T):-gen_full_trace,contract_triggered(Id,P1,P2,T).
:~do_act(Id,P1,P2,T,Act,T1).[1@1,Id,P1,P2,T,Act,T1]

% Contract success constraint
:-gen_trace(Id,P1,P2,T),contract_triggered(Id,P1,P2,T), not contract_satisfied(Id,P1,P2,T).

race_con:-do_act(Db_id,Org,affected_ind,T,inform_affected_ind,T2), do_act(Db_id,Org,pdpc,T3,inform_pdpc,T4),T2<T4.
:- not race_con.
:-do_act(Db_id,Org,affected_ind,T,inform_affected_ind,T2), do_act(Db_id,Org,affected_ind,T,inform_affected_ind,T1), T1 != T2.
:-do_act(Db_id,Org,pdpc,T,Act1,T2), do_act(Db_id,Org,pdpc,T,Act2,T1), T1 != T2.


%#show prompt/1.
%#show contract_succeeds/5.
%#show contract_violated/5.
#show do_act/6.
