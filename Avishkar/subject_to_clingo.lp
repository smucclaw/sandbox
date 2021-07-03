% Rule 1 derives the conclusion 'a', Rule 2 derives the conclusion 'b', Rule 3 derives the conclusion 'c'. Rule 1 and Rule 2 are subject to Rule 3. However, 
% {a,b,c} form a minimal inconsistent set in the 'background theory', meaning all 3 cannot be simultaneously true but any 2 of them can be. These minimal inconsistent sets have 
% to be inputed by the user. Most real-life cases may only have minimal inconsistent sets containing at most 2 elements. 


% These rules can be formed automatically given minimal inconsistent sets by putting a pair from the minimal inconsistent set in the head and the rest in the body.  

opposess(a,c):-legally_true(b).
opposess(b,c):-legally_true(a).
opposess(b,a):-legally_true(c).

% Opoosess is a symmetric relationship
opposess(X,Y):-opposess(Y,X).

according_to(1,a).
according_to(2,b).
according_to(3,c).

subject_to(3,1).
subject_to(3,2).

% The lower priority rule is defeated by the higher priority rule if the conclusion of the higher priority rule opposess the conclusion from the lower priority rule AND the higher priority rule has come into effect.

defeated_legally(R,C,R1):-opposess(C,C1),according_to(R,C),according_to(R1,C1),legally_valid(R1,C1),subject_to(R1,R).

% Definition of not_legally_valid.

not_legally_valid(R,C):-defeated_legally(R,C,R1),according_to(R,C),according_to(R1,C1).

% Definition of legally_valid. Something is legally valid if it is derived and there is no proof that not_legally_valid is true.
legally_valid(R,C):-not not_legally_valid(R,C), according_to(R,C).


legally_true(C):-legally_valid(R,C).

#show legally_valid/2.

% Shows two answer sets. Both contain legally_valid(3,c). One contains legally_valid(1,a), the other contains legally_valid(2,b).
