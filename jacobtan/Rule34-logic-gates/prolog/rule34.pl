
                                 %   fee sharing    |   commission payments
business("Champerty Champs").    %        yes       |           yes
business("Offshore Islanders").  %        yes       |           no
business("Referral Rewards").    %        no        |           yes
business("Diaper Changers").     %        yes       |           yes, but all persons are authorized to take commission payments

legalPractitioner("Alice").
legalPractitioner("Bob").

person("Shady Saul").        
person("Grandfather Greg").   % authorized to participate in fee sharing with Offshore Islanders only
person("Innocent Ivan").      % authorized to participate in fee sharing with anyone

business_involves("Champerty Champs", feeSharing(_),        for, work(legal,     performedBy(_))).
business_involves("Champerty Champs", commissionPayment(_), for, work(legal,     performedBy(_))).
business_involves("Champerty Champs", commissionPayment(_), for, work(financial, performedBy(_))).

business_involves("Offshore Islanders", feeSharing(_),        for, work(legal,   performedBy(_))).
business_involves("Offshore Islanders", commissionPayment(_), for, work(legal,   performedBy(_))).

business_involves("Diaper Changers", feeSharing(_),        for, work(legal,     performedBy(_))).
business_involves("Diaper Changers", commissionPayment(_), for, work(legal,     performedBy(_))).

% changing diapers is an innocent activity and commision payments are authorized to any person.
authorization("Diaper Changers", commissionPayment(_)).

% fee sharing is a controlled activity. Greg is authorized to share fees in Potato Planters.
authorization("Potato Planters", feeSharing("Grandfather Greg")).

% Innocent Ivan is allowed to share fees with anyone
authorization(_, feeSharing("Innocent Ivan")).

% prolog is not strong enough to shuffle the constraints around and conclude that the rule 34.1.d will stay silent IFF Champerty Champs undertakes to only ever pay commissions to Grandfather Greg.
% but s(CASP) might be!

rule(Rulename, Deontic, B, LP) :- Rulename = "34.1.d", Deontic = "mustNot", 
  business(B), legalPractitioner(LP), person(P),
  business_involves(B, Activity, for, work(legal, performedBy(LP))),
  ( Activity = feeSharing(P)
  ; Activity = commissionPayment(P)
  )
    , \+ authorization(B, Activity)
    , format('judgement: ~s because rule ~s prohibits ~p', [ Deontic, Rulename, Activity, P ])
    , !
    .

rule(Rulename, Deontic, B, LP) :- Rulename = "allow by default", Deontic = "may",
  business(B), legalPractitioner(LP).

