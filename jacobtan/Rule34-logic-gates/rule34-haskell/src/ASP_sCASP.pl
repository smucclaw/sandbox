#abducible s.
#abducible q.
#abducible p.
#abducible f.

s :- not q.
q :- not s.
p :- q, not s.
f :- s, not f.

% not p :- q.

?- true.