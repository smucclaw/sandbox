:- dynamic parserVersionNum/1, parserVersionStr/1, parseResult/5.
:- dynamic module/4.
'parserVersionStr'('0.6.2.1').
'parseResult'('ok','',0,0,0).
:- dynamic channel/2, bindval/3, agent/3.
:- dynamic agent_curry/3, symbol/4.
:- dynamic dataTypeDef/2, subTypeDef/2, nameType/2.
:- dynamic cspTransparent/1.
:- dynamic cspPrint/1.
:- dynamic pragma/1.
:- dynamic comment/2.
:- dynamic assertBool/1, assertRef/5, assertTauPrio/6.
:- dynamic assertModelCheckExt/4, assertModelCheck/3.
:- dynamic assertLtl/4, assertCtl/4.
'parserVersionNum'([0,11,1,1]).
'parserVersionStr'('CSPM-Frontent-0.11.1.1').
'channel'('evnt','type'('dotTupleType'(['boolType']))).
'channel'('trigger','type'('dotTupleType'(['boolType']))).
'channel'('interrupt','type'('dotTupleType'(['boolType']))).
'channel'('tic','type'('dotUnitType')).
'bindval'('Tic','prefix'('src_span'(41,7,41,10,1676,3),[],'tic','val_of'('Tic','src_span'(41,14,41,17,1683,3)),'src_span'(41,11,41,13,1679,10)),'src_span'(41,1,41,17,1670,16)).
'agent'('Ob'(_n,_event_timer),'ifte'('=='(_n,'int'(0)),'val_of'('Tic','src_span'(69,8,69,11,2626,3)),'[]'('prefix'('src_span'(71,5,71,8,2641,3),[],'tic','agent_call'('src_span'(71,12,71,14,2648,2),'Ob',[_n,_event_timer]),'src_span'(71,9,71,11,2644,25)),'prefix'('src_span'(74,5,74,12,2801,7),['out'('true')],'trigger','sharing'('setExp'('rangeEnum'(['tic'])),'agent_call'('src_span'(75,7,75,10,2825,3),'ObI',[_event_timer]),'agent_call'('src_span'(75,36,75,38,2854,2),'Ob',['-'(_n,'int'(1)),_event_timer]),'src_span'(75,24,75,35,2842,11)),'src_span'(74,18,74,20,2813,74)),'src_span_operator'('no_loc_info_available','src_span'(71,31,71,33,2667,2))),'no_loc_info_available','no_loc_info_available','no_loc_info_available'),'src_span'(68,3,76,6,2609,273)).
'agent'('ObI'(_event_timer2),'ifte'('=='(_event_timer2,'int'(0)),'prefix'('src_span'(109,8,109,12,4050,4),['out'('false')],'evnt','val_of'('Tic','src_span'(109,22,109,25,4064,3)),'src_span'(109,19,109,21,4060,13)),'prefix'('src_span'(116,5,116,14,4264,9),['out'('false')],'interrupt','[]'('prefix'('src_span'(117,7,117,11,4291,4),['out'('true')],'evnt','val_of'('Tic','src_span'(117,20,117,23,4304,3)),'src_span'(117,17,117,19,4300,12)),'prefix'('src_span'(118,7,118,10,4317,3),[],'tic','agent_call'('src_span'(118,14,118,17,4324,3),'ObI',['-'(_event_timer2,'int'(1))]),'src_span'(118,11,118,13,4320,27)),'src_span_operator'('no_loc_info_available','src_span'(117,24,117,26,4308,2))),'src_span'(116,21,116,23,4279,77)),'no_loc_info_available','no_loc_info_available','src_span'(109,26,116,4,4067,300)),'src_span'(108,3,119,6,4023,327)).
'bindval'('MAIN','sharing'('setExp'('rangeEnum'(['tic'])),'agent_call'('src_span'(121,8,121,10,4359,2),'Ob',['int'(1),'int'(365)]),'agent_call'('src_span'(121,31,121,33,4382,2),'Ob',['int'(1),'int'(10)]),'src_span'(121,19,121,30,4370,11)),'src_span'(121,1,121,40,4352,39)).
'comment'('blockComment'('{-\xa\  A contract is modelled as a distributed system with a dynamic number of nodes.\xa\  Each deontic notion (obligation, permission, prohibition) found in a\xa\  regulative rule gives rise to a node in the system, modelled as a\xa\  CSP process.\xa\  The topology of the system at runtime is dynamic in that new nodes\xa\  corresponding to instances of obligations may be started and stopped at\xa\  anytime.\xa\  For communication between nodes, we use a message-passing model achieved via\xa\  CSP channels, which are synchronized with a B machine that uses ZFC to reason\xa\  about these messages and guard conditions.\xa\\xa\  For our time model, we do not have any notion of a global clock.\xa\  Instead, each node in the system carries its own local timer, which\xa\  counts down via the discrete tic transition, until expiry.\xa\  To synchronize these timers across all nodes, we simply synchronize all\xa\  the tic transitions.\xa\\xa\  TODO:\xa\  - Implement some message queue thing to handle inter-node communication.\xa\  - Utilize the fact that the CSP we use is higher-order to abstract over\xa\    the structure of the processes.\xa\\xa\  For details on CSP || B, see:\xa\  https://prob.hhu.de/w/index.php?title=CSP-M\xa\  https://cocotec.io/fdr/manual/cspm/processes.html\xa\\xa\  For details on modelling the control flow induced by obligations, see:\xa\  https://researchportal.port.ac.uk/en/publications/an-event-b-approach-to-data-sharing-agreements\xa\  https://hal.inria.fr/inria-00525098\xa\-}'),'src_position'(1,1,0,1430)).
'comment'('blockComment'('{-\xa\  evnt is a B operation corresponding to an event.\xa\  tic is the discrete clock tick transition, corresponding to a B operation.\xa\  trigger and interrupt correspond to B variables.\xa\-}'),'src_position'(33,1,1432,184)).
'comment'('blockComment'('{-\xa\  An obligation gives rise to a process that dynamically instantiates obligation\xa\  instances at runtime, when the trigger condition is met.\xa\  Basically it models something like a timed arc petri net of the form\xa\\xa\                + --> [event done] --> ()\xa\                |\xa\  [trigger] --> ()\xa\                |\xa\                + --> [timeout]    --> ()\xa\\xa\  but with fancier stuff like interrupts and message passing communication\xa\  between the nets.\xa\  Also, the trigger condition could be a first-order formula interpreted over\xa\  the runtime state.\xa\\xa\  The parameter n is used to bound the max number of instances so that we\xa\  don\x27\t end up with an infinite state space.\xa\\xa\  Note that instead of using a global clock, we have timers local to each\xa\  obligation instance.\xa\  The tic transition is then synchronized across all instances of an obligation\xa\  to force their timers to count down together.\xa\-}'),'src_position'(43,1,1688,897)).
'comment'('lineComment'('-- If the trigger condition is met, we start up a new node and continue.'),'src_position'(72,5,2674,72)).
'comment'('lineComment'('-- TODO: Keep track of PIDs of new instances.'),'src_position'(73,5,2751,45)).
'comment'('blockComment'('{-\xa\  Some notes:\xa\  How to give trigger and interrupt events higher priority?\xa\  Model scheduler mechanism in B machine?\xa\\xa\  Such a priority relation behaves like a superiority relation in defeasible\xa\  logic, so that the logic of guard conditions is defeasible in nature.\xa\  What we want to say is something like\xa\\xa\  if original_guard_condition {subjectTo: obligation_not_interrupted}\xa\  then guard_condition\xa\\xa\  I guess we could use the naive transformation as seen in the paper on\xa\  automating defeasible reasoning: https://arxiv.org/pdf/2205.07335.pdf\xa\  and squeeze in (and not ...) into every guard condition.\xa\\xa\  Or we could just use a message queue.\xa\\xa\  Regarding explicit time, the downside of these approaches is that we lose the\xa\  fancy zone and region based abstractions as in timed automata that combat\xa\  state space explosions.\xa\  The benefit of such an approach though is that we can reason about them\xa\  alongside other state variables.\xa\-}'),'src_position'(78,1,2884,942)).
'comment'('blockComment'('{-\xa\    First we check if the timer has expired.\xa\    If so, we use evnt!false to indicate that the obligation instance timed out\xa\    and the event didn\x27\t occur in time.\xa\  -}'),'src_position'(103,3,3848,172)).
'comment'('blockComment'('{-\xa\      If the timer is still running, we check if the obligation has been\xa\      interrupted.\xa\      If no, we allow for either the event to occur or the timer to countdown.\xa\    -}'),'src_position'(111,5,4079,180)).
'symbol'('evnt','evnt','src_span'(38,9,38,13,1625,4),'Channel').
'symbol'('trigger','trigger','src_span'(38,15,38,22,1631,7),'Channel').
'symbol'('interrupt','interrupt','src_span'(38,24,38,33,1640,9),'Channel').
'symbol'('tic','tic','src_span'(39,9,39,12,1665,3),'Channel').
'symbol'('Tic','Tic','src_span'(41,1,41,4,1670,3),'Ident (Groundrep.)').
'symbol'('Ob','Ob','src_span'(67,1,67,3,2586,2),'Funktion or Process').
'symbol'('n','n','src_span'(67,4,67,5,2589,1),'Ident (Prolog Variable)').
'symbol'('event_timer','event_timer','src_span'(67,7,67,18,2592,11),'Ident (Prolog Variable)').
'symbol'('ObI','ObI','src_span'(102,1,102,4,3827,3),'Funktion or Process').
'symbol'('event_timer2','event_timer','src_span'(102,5,102,16,3831,11),'Ident (Prolog Variable)').
'symbol'('MAIN','MAIN','src_span'(121,1,121,5,4352,4),'Ident (Groundrep.)').