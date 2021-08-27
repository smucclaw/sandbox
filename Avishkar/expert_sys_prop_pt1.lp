% We have the following rules below and our objective is to etablish whether or not holds(a) is true by
% obtaining information from the user in an optimal way.

holds(a):-holds(b).
holds(a):-holds(f).
holds(b):-holds(c), not holds(d).
holds(d):-not holds(e).

% Below is a set of 'abducibles' written as choice rules. This means that given a {user_input(X)}. clause, the solver can choose (subject to the other constraints
% and rules in the program) whether or not to make the atom user_input(X) true. Intuitively each user_input(X) would correspond to a question asking the user whether or
% not X is true.

{user_input(c)}.
{user_input(d)}.
{user_input(e)}.
{user_input(f)}.
{user_input(b)}.

% If the solver chooses to make user_input(X) true then hold(X) becomes true and interacts with the original program above
holds(X):-user_input(X).

% This integrity constraint says that it is illegal for hold(a) to not be derived, meaning hold(a) must be true in any answer set corresponding to this program.
% An integrity constraint can be thought of as a rule with given body whose head is 'false'. The below constraint corresponds to false:-not holds(a).
:-not holds(a).

% This integrity constraint says that it is illegal for hold(a) to be derived, meaning hold(a) must NOT be true in any answer set corresponding to this program
%:-holds(a).


% This is the user_input optimization part using weak constraints. Making an 'user_input' predicate true induces a 'penalty' at various levels. The goal of the solver
% is to minimize the total penalty corresponding to the answer set, starting with the highest level. So informally speaking the solver is 'discouraged' from
% making any 'user_input' predicate true but if it has to choose between say making user_input(e) true and making user_input(f) true it will first make user_input(e) true because that induces
% a penalty of 1 at level 1 whereas user_input(f) induces a penalty of 1 at level 3. The level assigned to each user_input(X) predicate corresponds to how far away holds(X) is from
% holds(a) in the dependency graph of the original program. holds(e) is the farthest away so has the lowest level meaning that first we ask the user about 'e' rather
% than 'f' and only ask about 'f' if we need to.
:~user_input(b).[1@3,b]
:~user_input(f).[1@3,f]
:~user_input(c).[1@2,c]
:~user_input(d).[1@2,d]
:~user_input(e).[1@1,e]

% The interactive process works as follows: We start of by activating the integrity constraint that forces holds(a) to be true and commenting
% out the constraint that forces holds(a) to be false. The optimum answer set returned will contain a number of user_input(X) predicates. For each of
% these the user responds by either adding a 'holds(X)' as a fact or ':-holds(X)' as an integrity constraint depending of whether X is true
% or false. After each of these additions we re-run the program. If we eventually reach a stage where we get 'unsatisfiable' as the output, then
% we know that based on the info the user has provided 'holds(a)' is false and the process ends there. If we get to a stage where 'holds(a)' is
% established without the need for any additional user_input predicates then at this stage 'hold(a)' is tentatively established. We then turn on the integrity
% constraint that forces 'hold(a)' to be false and comment out the constraint that forces 'holds(a)' to be true. We repeat the preceeding process again. Now we
% are checking if there is any additional information that the user could provide that would 'defeat' our initial conclusion of 'holds(a)'. We keep
% repeating this process, swithing between the integrity constraints as needed until we can establish either that 'holds(a)' is true and cannot be defeated
% by additional information or 'holds(a)' is not true and cannot be made true by additional information. For this example this involves only one
% iteration of this swithing process. (The process terminates when for a given active integrity constraint the solver has returned 'Unsatisfiable')

%:-holds(f).
%holds(e).
%holds(c).
%holds(d).



#show user_input/1.
