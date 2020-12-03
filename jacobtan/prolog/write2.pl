% Example from Max's question on Slack.
% https://smucclaw.slack.com/archives/C015YSNRNH2/p1606989302142700

% modified for my own testing

human(tom). human(dick). human(harry).
% human(X) :- owns(X,_).

% dog(Y) :- owns(_,Y).
dog(fido). dog(rover). dog(jane). 

% xor(human(X),dog(X)).

% dogowner(max).

dogowner(X) :- owns(X,_).

owns(rover,fido).

% owns(X,Y) :- write(X),
%   write(' owns '),write(Y),nl.

% go5 :- dogowner(_).