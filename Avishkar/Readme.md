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
query(C,0):-generate_q(C).
query(C1,0):-generate_q(C),opposes(C,C1).

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

What we have described so far covers most aspects of a general translation from L4 to ASP. Further additions to the ASP program are more specific to the scenario and the particular set of L4 rules in question.

We will now describe the entire ASP encoding of a small section of the PDPA, explaining what each section of the ASP encoding does in greater detail. We will condider a section of the PDPA act (and not the associated regulations).

We first begin with the core rules in the PDPA. These are encoded using the general schema given above
```javascript
%Definition of data breach 26A(a). In general a data breach is represented as a pair (E,T), where E is the 'name' of the data breach and T is the time at which it occured.
according_to(26,occurs_data_breach(E,T)):-legally_holds(unauthorised_access(E,T)).
according_to(26,occurs_data_breach(E,T)):-legally_holds(unauthorised_collection(E,T)).


% When is a data breach notifiable? 26B(1)
according_to(27,is_notifiable_data_breach(E,T)):-legally_holds(cause_significant_harm(E,T)),legally_holds(occurs_data_breach(E,T)).
according_to(27,is_notifiable_data_breach(E,T)):-legally_holds(has_significant_scale(E,T)), legally_holds(occurs_data_breach(E,T)).

% Definitions of significant harm and significant scale 26B (2,3)
according_to(28,cause_significant_harm(E,T)):-legally_holds(is_personal_data(E,T)).
according_to(29,has_significant_scale(E,T)):-legally_holds(affects_many_individuals(E,T)).

% Exception for notification requirement 26B (4)
according_to(30,not_is_notifiable_data_breach(E,T)):-legally_holds(data_breach_within_organisation(E,T)).
```
Next there are meta-rules including the rules that encode defeasibility
```javascript
% Meta-rules and facts

defeated(R2,C2):-overrides(R1,R2),according_to(R2,C2),legally_enforces(R1,C1),opposes(C1,C2).
opposes(C1,C2):-opposes(C2,C1).
legally_enforces(R,C):-according_to(R,C),not defeated(R,C).
legally_holds(C):-legally_enforces(R,C).
:-opposes(C1,C2),legally_holds(C1),legally_holds(C2).
```
The next two lines of ASP code are relevant to the defeasible aspect of this particular rule set. Namely that rule 30 overrides rule 27 and it is not possible for a data-breach to be both notifiable and not notifiable.
```javascript
overrides(30,27).
opposes(is_notifiable_data_breach(E,T),not_is_notifiable_data_breach(E,T)):-data_event(E,T).
```
The following 3 lines of triggers the generation of abducibles for the generation and of appropriate questions
```javascript
generate_q(is_notifiable_data_breach(E,T)):-data_event(E,T).
query(C,0):-generate_q(C).
query(C1,0):-generate_q(C),opposes(C,C1).
```
The following two integrity constraints are used as 'goals' in order to facilitate question optimization process.

```javascript
%Strong Constraint-data breach notifiable

:-data_event(E,T),not legally_holds(is_notifiable_data_breach(E,T)),const(N),not opp_const(N+1).

%Strong Constraint-data breach NOT notifiable
:-data_event(E,T), legally_holds(is_notifiable_data_breach(E,T)),opp_const(N),not const(N+1).
```

Next we have the ASP rules derived from the encoding of the main legal rules, that help generate the questions as abducibles

```javascript
explains(unauthorised_access(E,T),occurs_data_breach(E,T),N+1):-query(occurs_data_breach(E,T),N).
explains(unauthorised_collection(E,T),occurs_data_breach(E,T),N+1):-query(occurs_data_breach(E,T),N).

explains(cause_significant_harm(E,T),is_notifiable_data_breach(E,T),N+1):-query(is_notifiable_data_breach(E,T),N).
explains(occurs_data_breach(E,T),is_notifiable_data_breach(E,T),N+1):-query(is_notifiable_data_breach(E,T),N).
explains(has_significant_scale(E,T),is_notifiable_data_breach(E,T),N+1):-query(is_notifiable_data_breach(E,T),N).

explains(is_personal_data(E,T),cause_significant_harm(E,T),N+1):-query(cause_significant_harm(E,T),N).


explains(affects_many_individuals(E,T),has_significant_scale(E,T),N+1):-query(has_significant_scale(E,T),N).

explains(data_breach_within_organisation(E,T),not_is_notifiable_data_breach(E,T),N+1):-query(not_is_notifiable_data_breach(E,T),N).
```
The next part of the program is again part of the question generation and optimization process

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


