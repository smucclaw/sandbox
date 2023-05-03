act(borrowBook,tom,1).
%act(payFine,tom,13).
%act(returnBook,tom,2).
%reject_obligation(1,(c1,1)).
%reject_obligation(2,(c1,1)).
%reject_obligation(1,(c2,2)).
%act(send_thank_you_note_to,tom,3).

trigger(c1,T):-act(borrowBook,tom,T).


prompt(return_book_in_10_days):-trigger(c1,T),not reject_obligation(1,(c1,T)),not contract_satisfied(c1,T).
sat(1,(c1,T),T1):-trigger(c1,T),act(returnBook,tom,T1),T1<T+10.


prompt(pay_fine_within_5_days):-reject_obligation(1,(c1,T)), trigger(c1,T),not contract_satisfied(c1,T).
sat(2,(c1,T),T2):-trigger(c1,T),act(payFine,tom,T2),T2<T+15.


sat_oblig(c1,T):-sat(N,(c1,T),Tj).

contract_succeeds((c1,T),Ts):-trigger(c1,T), sat_oblig(c1,T),#min {Tq,1:sat(N,(c1,T),Tq)} = Ts.

contract_satisfied(c1,T):-contract_succeeds((c1,T),Ts).

contract_violated(c1,T,T+15):-not contract_satisfied(c1,T),reject_obligation(1,(c1,T)),reject_obligation(2,(c1,T)),trigger(c1,T).







%New contract
trigger(c2,Ts):-contract_succeeds((c1,T),Ts).
prompt(send_thank_you_note_within_2_days):-trigger(c2,Ts),not reject_obligation(1,(c2,Ts)),not contract_satisfied(c2,Ts).
sat(1,(c2,Ts),T1):-trigger(c2,Ts),act(send_thank_you_note_to,tom,T1),T1<Ts+2.

sat_oblig(c2,T):-sat(N,(c2,T),Tj).

contract_succeeds((c2,T),Ts):-trigger(c2,T), sat_oblig(c2,T),#min {Tq,1:sat(N,(c2,T),Tq)} = Ts.

contract_satisfied(c2,T):-contract_succeeds((c2,T),Ts).

contract_violated(c2,T,T+2):-not contract_satisfied(c2,T),reject_obligation(1,(c2,T)),trigger(c2,T).

%Equational theory over actions
act(send_thank_you_note_to,Person,Time):-act(print_thank_you_note_for,Person,Time),act(post_thank_you_note_to(Address),Person,Time),lives_at(Address,Person,Time).

%The above rule parametrizes the following 'constitutive rule' over a time parameter
%Sending a thank-you note to someone MEANS/IS priniting a thank-you note for that person and posting it to the right address. 
%More generally constitutive rules of the form head:-body that are independent of state can be lifted over a state parameter S by simply carrying S as an extra
%argument. holds(head,S):-holds(body,S). This possibly opens up a way to integrate constitutive and regulative rules. The above is perhaps not the best example of this
%separation as a person's adress possibly is related to the time poont in question, but the intention is that constitutive rules are state independent.

#show prompt/1.
#show contract_succeeds/2.
#show contract_violated/3.
