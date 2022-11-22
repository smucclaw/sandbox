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
'dataTypeDef'('Status',['constructor'('breached'),'constructor'('fulfilled')]).
'channel'('evnt','type'('dotTupleType'(['boolType']))).
'channel'('trigger','type'('dotTupleType'(['boolType']))).
'channel'('interrupt','type'('dotTupleType'(['boolType']))).
'channel'('status','type'('dotTupleType'(['Status']))).
'channel'('tic','type'('dotUnitType')).
'bindval'('Tic','prefix'('src_span'(51,7,51,10,2065,3),[],'tic','val_of'('Tic','src_span'(51,14,51,17,2072,3)),'src_span'(51,11,51,13,2068,10)),'src_span'(51,1,51,17,2059,16)).
'agent'('Ob'(_n,_event_timer),'ifte'('=='(_n,'int'(0)),'val_of'('Tic','src_span'(80,8,80,11,3016,3)),'[]'('prefix'('src_span'(82,5,82,8,3031,3),[],'tic','agent_call'('src_span'(82,12,82,14,3038,2),'Ob',[_n,_event_timer]),'src_span'(82,9,82,11,3034,25)),'prefix'('src_span'(85,5,85,12,3191,7),['out'('true')],'trigger','sharing'('setExp'('rangeEnum'(['tic'])),'agent_call'('src_span'(86,7,86,10,3215,3),'ObI',[_event_timer]),'agent_call'('src_span'(86,36,86,38,3244,2),'Ob',['-'(_n,'int'(1)),_event_timer]),'src_span'(86,24,86,35,3232,11)),'src_span'(85,18,85,20,3203,74)),'src_span_operator'('no_loc_info_available','src_span'(82,31,82,33,3057,2))),'no_loc_info_available','no_loc_info_available','no_loc_info_available'),'src_span'(79,3,87,6,2999,273)).
'agent'('ObI'(_event_timer2),'ifte'('=='(_event_timer2,'int'(0)),'prefix'('src_span'(120,8,120,12,4440,4),['out'('false')],'evnt','prefix'('src_span'(120,22,120,28,4454,6),['out'('breached')],'status','val_of'('Tic','src_span'(120,41,120,44,4473,3)),'src_span'(120,38,120,40,4469,16)),'src_span'(120,19,120,21,4450,32)),'prefix'('src_span'(127,5,127,14,4673,9),['out'('false')],'interrupt','[]'('prefix'('src_span'(128,7,128,11,4700,4),['out'('true')],'evnt','prefix'('src_span'(128,20,128,26,4713,6),['out'('fulfilled')],'status','val_of'('Tic','src_span'(128,40,128,43,4733,3)),'src_span'(128,37,128,39,4729,17)),'src_span'(128,17,128,19,4709,32)),'prefix'('src_span'(129,7,129,10,4746,3),[],'tic','agent_call'('src_span'(129,14,129,17,4753,3),'ObI',['-'(_event_timer2,'int'(1))]),'src_span'(129,11,129,13,4749,27)),'src_span_operator'('no_loc_info_available','src_span'(128,44,128,46,4737,2))),'src_span'(127,21,127,23,4688,97)),'no_loc_info_available','no_loc_info_available','src_span'(120,45,127,4,4476,339)),'src_span'(119,3,130,6,4413,366)).
'bindval'('MAIN','agent_call'('src_span'(132,8,132,10,4788,2),'Ob',['int'(1),'int'(3)]),'src_span'(132,1,132,16,4781,15)).
'comment'('blockComment'('{- Process model for contracts inspired by Symboleo\xa\\xa\  A contract is modelled as a distributed system with a dynamic number of nodes.\xa\  Each deontic notion (obligation, permission, prohibition) found in a\xa\  regulative rule gives rise to a node in the system, modelled as a\xa\  CSP process.\xa\  The topology of the system at runtime is dynamic in that new nodes\xa\  corresponding to instances of obligations may be started and stopped at\xa\  anytime.\xa\  For communication between nodes, we use a message-passing model achieved via\xa\  CSP channels, which are synchronized with a B machine that uses ZFC to reason\xa\  about these messages and guard conditions.\xa\\xa\  For our time model, we do not have any notion of a global clock.\xa\  Instead, each node in the system carries its own local timer, which\xa\  counts down via the discrete tic transition, until expiry.\xa\  To synchronize these timers across all nodes, we simply synchronize all\xa\  the tic transitions.\xa\\xa\  TODO:\xa\  - Read \xa\    https://martin.kleppmann.com/2022/10/12/verifying-distributed-systems-isabelle.html\xa\  - Implement some message queue thing to handle inter-node communication.\xa\  - Utilize the fact that the CSP we use is higher-order to abstract over\xa\    the structure of the processes.\xa\  - How to eliminate Zeno run like\xa\    borrower default -> borrower default -> ...\xa\    Can we impose a fairness constraint that forces the tic transition to run\xa\    eventually.\xa\\xa\  For details on CSP || B, see:\xa\  https://prob.hhu.de/w/index.php?title=CSP-M\xa\  https://cocotec.io/fdr/manual/cspm/processes.html\xa\\xa\  For details on modelling the control flow induced by obligations, see:\xa\  https://researchportal.port.ac.uk/en/publications/an-event-b-approach-to-data-sharing-agreements\xa\  https://hal.inria.fr/inria-00525098\xa\-}'),'src_position'(1,1,0,1755)).
'comment'('blockComment'('{-\xa\  evnt is a B operation corresponding to an event.\xa\  tic is the discrete clock tick transition, corresponding to a B operation.\xa\  trigger and interrupt correspond to B variables.\xa\-}'),'src_position'(42,1,1797,184)).
'comment'('blockComment'('{-\xa\  An obligation gives rise to a process that dynamically instantiates obligation\xa\  instances at runtime, when the trigger condition is met.\xa\  Basically it models something like a timed arc petri net of the form\xa\\xa\                + --> [event done] --> ()\xa\                |\xa\  [trigger] --> ()\xa\                |\xa\                + --> [timeout]    --> ()\xa\\xa\  but with fancier stuff like interrupts and message passing communication\xa\  between the nets.\xa\  Also, the trigger condition could be a first-order formula interpreted over\xa\  the runtime state.\xa\\xa\  The parameter n is used to bound the max number of instances so that we\xa\  don\x27\t end up with an infinite state space.\xa\\xa\  Note that instead of using a global clock, we have timers local to each\xa\  obligation instance.\xa\  The tic transition is then synchronized across all instances of an obligation\xa\  to force their timers to count down together.\xa\-}'),'src_position'(54,1,2078,897)).
'comment'('lineComment'('-- If the trigger condition is met, we start up a new node and continue.'),'src_position'(83,5,3064,72)).
'comment'('lineComment'('-- TODO: Keep track of PIDs of new instances.'),'src_position'(84,5,3141,45)).
'comment'('blockComment'('{-\xa\  Some notes:\xa\  How to give trigger and interrupt events higher priority?\xa\  Model scheduler mechanism in B machine?\xa\\xa\  Such a priority relation behaves like a superiority relation in defeasible\xa\  logic, so that the logic of guard conditions is defeasible in nature.\xa\  What we want to say is something like\xa\\xa\  if original_guard_condition {subjectTo: obligation_not_interrupted}\xa\  then guard_condition\xa\\xa\  I guess we could use the naive transformation as seen in the paper on\xa\  automating defeasible reasoning: https://arxiv.org/pdf/2205.07335.pdf\xa\  and squeeze in (and not ...) into every guard condition.\xa\\xa\  Or we could just use a message queue.\xa\\xa\  Regarding explicit time, the downside of these approaches is that we lose the\xa\  fancy zone and region based abstractions as in timed automata that combat\xa\  state space explosions.\xa\  The benefit of such an approach though is that we can reason about them\xa\  alongside other state variables.\xa\-}'),'src_position'(89,1,3274,942)).
'comment'('blockComment'('{-\xa\    First we check if the timer has expired.\xa\    If so, we use evnt!false to indicate that the obligation instance timed out\xa\    and the event didn\x27\t occur in time.\xa\  -}'),'src_position'(114,3,4238,172)).
'comment'('blockComment'('{-\xa\      If the timer is still running, we check if the obligation has been\xa\      interrupted.\xa\      If no, we allow for either the event to occur or the timer to countdown.\xa\    -}'),'src_position'(122,5,4488,180)).
'comment'('lineComment'('-- [| {tic} |] Ob(1, 10)'),'src_position'(132,17,4797,24)).
'symbol'('Status','Status','src_span'(40,10,40,16,1766,6),'Datatype').
'symbol'('breached','breached','src_span'(40,19,40,27,1775,8),'Constructor of Datatype').
'symbol'('fulfilled','fulfilled','src_span'(40,30,40,39,1786,9),'Constructor of Datatype').
'symbol'('evnt','evnt','src_span'(47,9,47,13,1990,4),'Channel').
'symbol'('trigger','trigger','src_span'(47,15,47,22,1996,7),'Channel').
'symbol'('interrupt','interrupt','src_span'(47,24,47,33,2005,9),'Channel').
'symbol'('status','status','src_span'(48,9,48,15,2030,6),'Channel').
'symbol'('tic','tic','src_span'(49,9,49,12,2054,3),'Channel').
'symbol'('Tic','Tic','src_span'(51,1,51,4,2059,3),'Ident (Groundrep.)').
'symbol'('Ob','Ob','src_span'(78,1,78,3,2976,2),'Funktion or Process').
'symbol'('n','n','src_span'(78,4,78,5,2979,1),'Ident (Prolog Variable)').
'symbol'('event_timer','event_timer','src_span'(78,7,78,18,2982,11),'Ident (Prolog Variable)').
'symbol'('ObI','ObI','src_span'(113,1,113,4,4217,3),'Funktion or Process').
'symbol'('event_timer2','event_timer','src_span'(113,5,113,16,4221,11),'Ident (Prolog Variable)').
'symbol'('MAIN','MAIN','src_span'(132,1,132,5,4781,4),'Ident (Groundrep.)').