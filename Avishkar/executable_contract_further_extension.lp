act(borrowBook,tom,1).
%act(payFine,tom,13).
%act(returnBook,tom,2).
%reject_obligation(1,(c1,1)).
%reject_obligation(2,(c1,1)).
%reject_obligation(1,(c2,2)).

trigger(c1,T):-act(borrowBook,tom,T).


prompt(return_book_in_10_days):-trigger(c1,T),not reject_obligation(1,(c1,T)),not contract_satisfied(c1,T).
sat(1,(c1,T),T1):-trigger(c1,T),act(returnBook,tom,T1),T1<T+10.


prompt(pay_fine_within_5_days):-reject_obligation(1,(c1,T)), trigger(c1,T),not contract_satisfied(c1,T).
sat(2,(c1,1),T2):-trigger(c1,T),act(payFine,tom,T2),T2<T+15.


sat_oblig(c1,T):-sat(N,(c1,T),Tj).

contract_succeeds((c1,T),Ts):-trigger(c1,T), sat_oblig(c1,T),#min {Tq,1:sat(N,(c1,T),Tq)} = Ts.

contract_satisfied(c1,T):-contract_succeeds((c1,T),Ts).

contract_violated(c1,T,T+15):-not contract_satisfied(c1,T),reject_obligation(1,(c1,T)),reject_obligation(2,(c1,T)),trigger(c1,T).







%New contract
trigger(c2,Ts):-contract_succeeds((c1,T),Ts).
prompt(send_thank_you_note_within_2_days):-trigger(c2,Ts),not reject_obligation(1,(c2,Ts)),not contract_satisfied(c2,Ts).
sat(1,(c2,Ts),T1):-trigger(c2,Ts),act(send_thank_you_note_to,tom,T1),T1<Ts+2.

sat_oblig(c2,T):-sat(N,(c2,T),Tj).

contract_succeeds((c2,T),Ts):-trigger(c2,T), sat_oblig(c2,T),#min {Tq,1:sat(N,(c1,T),Tq)} = Ts.

contract_satisfied(c2,T):-contract_succeeds((c2,T),Ts).

contract_violated(c2,T,T+2):-not contract_satisfied(c2,T),reject_obligation(1,(c2,T)),trigger(c2,T).




#show prompt/1.
#show contract_succeeds/2.
#show contract_violated/3.
