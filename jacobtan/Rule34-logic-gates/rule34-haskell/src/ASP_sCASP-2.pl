#abducible s.
#abducible q.
#abducible p.
#abducible f.

s :- not q.
q :- not s.

p :- not f.
f :- not p.

?- true.