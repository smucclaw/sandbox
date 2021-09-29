%Rules
sing:-walk,eat_or_drink.
eat_or_drink:-eat.
eat_or_drink:-drink.

% Abducibles (choice rules)
{eat}.
{drink}.
{walk}.

% Produce a positive atom as a 'record' of not having done a particular action. 
not_eat:-not eat.
not_drink:-not drink.
not_walk:-not walk.

% Goal is to avoid having to sing
:-sing.
(In Clingo this is shorthand for false:-sing.)

% Weak Constraints to minimize the number of actions I DON'T do. That is as far as possible I want to be able to eat,drink etc.
:~not_eat.[1@1,not_eat]
:~not_drink.[1@1,not_drink]
:~not_walk.[1@1,not_walk]

Optimal Solution:
not_walk, eat,drink

On the other hand with the following weak constraints instead that minimize the number of actions performed while avoiding having to sing:
:~eat.[1@1,eat]
:~drink.[1@1,drink]
:~walk.[1@1,walk]

We get the obvious optimal solution which is just don't do anything. Ie:
not_walk, not_eat, not_drink
