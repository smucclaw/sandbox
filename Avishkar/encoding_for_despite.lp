%despite(R1, R2).
%except_for(R1,R2).
%according_to(R,C):-precondition(R,C).

despite(R2,R1):-except_for(R1,R2).

overriden(R1,C1):-according_to(R,C),according_to(R1,C1),despite(R1,R).
plausible(R1,C1):-according_to(R1,C1), not overriden(R1,C1).

