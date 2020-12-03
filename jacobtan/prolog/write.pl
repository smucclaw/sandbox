% Example from Max's question on Slack.
% https://smucclaw.slack.com/archives/C015YSNRNH2/p1606989302142700

human(tom). human(dick). human(harry).
% human(X) :- owns(X,_).
% dog(Y) :- owns(_,Y).

dog(fido). dog(rover). dog(jane). 

dogowner(max).

dogowner(X) :- dog(Y),owns(X,Y).

owns(max,fido).

owns(X,Y) :- write(X),
  write(' owns '),write(Y),nl.

go5 :- dogowner(_).