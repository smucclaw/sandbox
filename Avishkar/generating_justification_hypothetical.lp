% Generating explainations, for hypothetical scenarios, ground program. This can be used as a tool to further justify negated atoms not present in actual model.

%b.
%a:-b,c.
%c:-not d.

%This time the actual atoms from the original logic program are not in the body of the 'explains' predicates. 

explains(pos,fact,b,N+1):-query(b,N).
explains(pos,b,a,N+1):-query(a,N).
explains(pos,c,a,N+1):-query(a,N).
explains(neg,d,c,N+1):-query(c,N).

query(X,N):-explains(pos,X,Y,N),level(N+1),X!=fact.

level(0..3).

query(a,0).

directedEdge(Sgn,X,Y):-explains(Sgn,X,Y,M).

#show directedEdge/3.
