This file is to document some aspects of the clingo PDPA expert system prototype.

Rules:
We assume that all rules derived for the legislation (more specifically, the L4 translation of the legal rules) can be translated as prolog style rules. Furthemore it is assumed that the set of variables occuring in the pre-conditions of a rule is exactly the same as the set of varibles occuring in the post condition. All post conditions are atomic. No disjunctions or conjunctions in rule post-conditions. We implicitly universally quantify over all variables occuring in a rule. Finally we assume that each L4 rule has an integer rule ID.

Translating a set of L4 rules into the corresponding ASP program:
Given a set of L4 rules that satisfies the condtions above, we have to write the sets of ASP rules for our expert system ASP program.

We assume a genric L4 rule has the fillowing form:
pre_con_1(V1),pre_con_2(V2)...,pre_con_n(Vn) -> post_con(V).

Here V1,V2,...,Vn denote the set of variables present in each of the atomic preconditions. V is the set of variables in the post-condition. In accordance with the syntactic restrictions above the union of V1, V2,...,Vn  must equal V. 

Assume that this rule has rule id n.

Then we write the following ASP rule.

according_to(n,post_con(V)):-legally_holds(pre_con(V1)),...,legally_holds(pre_con(Vn)).

After doing 
