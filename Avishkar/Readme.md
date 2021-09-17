This file is to document some aspects of the clingo PDPA expert system prototype and define a tentative translation from L4 rules.

Rules:
We assume that all rules derived from the legislation (more specifically, the L4 translation of the legal rules) can be translated as prolog style rules. Furthemore it is assumed that the set of variables occuring in the pre-conditions of a rule is exactly the same as the set of varibles occuring in the post condition. All post conditions are atomic. No disjunctions or conjunctions in rule post-conditions. We implicitly universally quantify over all variables occuring in a rule. Finally we assume that each L4 rule has an integer rule ID.

Translating a set of L4 rules into the corresponding ASP program:
Given a set of L4 rules that satisfies the condtions above, we have to write the sets of ASP rules for our expert system ASP program.

We assume a genric L4 rule has the fillowing form:
```javascript
pre_con_1(V1),pre_con_2(V2)...,pre_con_n(Vn) -> post_con(V).
```
Here V1,V2,...,Vn denote the set of variables present in each of the atomic preconditions. V is the set of variables in the post-condition. In accordance with the syntactic restrictions above the union of V1, V2,...,Vn  must equal V. 

Assume that this rule has rule id n.

Then we write the following ASP rule.

```javascript

according_to(n,post_con(V)):-legally_holds(pre_con(V1)),...,legally_holds(pre_con(Vn)).
```

After doing this for each rule we add some ASP rules to encode defeasibility:

```javascript

defeated(R2,C2):-overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2).


opposes(C1,C2):-opposes(C2,C1).

legally_enforces(R,C):-according_to(R,C),not defeated(R,C).

legally_holds(C):-legally_enforces(R,C).

:-opposes(C1,C2),legally_holds(C1),legally_holds(C2).
```
Next we add overrides and opposes facts according to which rule overrides which rule and which sets of atoms are opposites of each other.

Generating Abducibles.

Given as before, the generic L4 rule:
```javascript
pre_con_1(V1),pre_con_2(V2)...,pre_con_n(Vn) -> post_con(V).
```
We add the following set of ASP rules to our ASP program:
```javascript
explains(pre_con_1(V1),post_con(V),N+1):-query(post_con(V),N).
explains(pre_con_2(V2),post_con(V),N+1):-query(post_con(V),N).
                          .
                          .
                          .
                          
explains(pre_con_n(Vn),post_con(V),N+1):-query(post_con(V),N).

```
For each L4 rule we add the corresponding set of ASP rules as above.

Next we add the following ASP rules:
```javascript
query(X,N):-explains(X,Y,N),q_level(N).
q_level(N+1):-query(X,N).



not_leaf(X):-explains(X,Y,N),explains(Z,X,N+1).
abducible(leaf,X,N):-explains(X,Y,N),not not_leaf(X).
abducible(nleaf,X,N):-explains(X,Y,N),not_leaf(X).



ask(X,N):-abducible(leaf,X,N).
ask(X,N):-abducible(nleaf,X,N),N>M,min_q_level(M).


max_q_level(N):-not q_level(N+1),q_level(N),N>0.


% Integrate with main program

{choose(X,N-M)}:-ask(X,M),max_q_level(N).
legally_holds(X):-choose(X,K).
ask_user(X):-choose(X,M).
legally_holds(X):-user_input(pos,X).
:-user_input(neg,X),legally_holds(X).

:~choose(X,M).[1@M,X,M]
```

ASP Rules for generating the justification graph

Given the generic L4 rule:
```javascript

pre_con_1(V1),pre_con_2(V2)...,pre_con_n(Vn) -> post_con(V).
```
We add the following ASP rules

```javascript
caused_by(pos,pre_con_1(V1),post_con(V),N+1):-justify(post_con(V),N).
caused_by(pos,pre_con_2(V2),post_con(V),N+1):-justify(post_con(V),N).
                          .
                          .
                          .
                          
caused_by(post,pre_con_n(Vn),post_con(V),N+1):-justify(post_con(V),N).
```
We repeat this for each L4 rule.

Then we add the following ASP rules.

```javascript
caused_by(pos,overrides(R1,R2),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).
caused_by(pos,according_to(R2,C2),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).
caused_by(pos,legally_enforces(R1,C1),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).
caused_by(pos,opposes(C1,C2),defeated(R2,C2),N+1):-defeated(R2,C2),overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2),justify(defeated(R2,C2),N).


caused_by(pos,according_to(R,C),legally_enforces(R,C),N+1):-legally_enforces(R,C),according_to(R,C),not defeated(R,C),justify(legally_enforces(R,C),N).
caused_by(neg,defeated(R,C),legally_enforces(R,C),N+1):-legally_enforces(R,C),according_to(R,C),not defeated(R,C),justify(legally_enforces(R,C),N).


caused_by(pos,legally_enforces(R,C),legally_holds(C),N+1):-legally_holds(C),legally_enforces(R,C),not user_input(pos,C), justify(legally_holds(C),N).

caused_by(pos,user_input(pos,C),legally_holds(C),N+1):-legally_holds(C), user_input(pos,C), justify(legally_holds(C),N).

justify(X,N):-caused_by(pos,X,Y,N),graph_level(N+1), not user_input(pos,X).
directedEdge(Sgn,X,Y):-caused_by(Sgn,X,Y,M).

graph_level(0..N):-max_graph_level(N).

justify(X,0):-gen_graph(X).
```







