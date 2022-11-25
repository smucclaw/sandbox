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
'dataTypeDef'('Actor',['constructor'('org'),'constructor'('indiv'),'constructor'('pdpc')]).
'dataTypeDef'('RuleName',['constructor'('Assessment'),'constructor'('NotifyPdpc'),'constructor'('NotifyIndiv'),'constructor'('ProhibitNotifyIndiv')]).
'channel'('trigger_rule','type'('dotTupleType'(['RuleName','Actor']))).
'channel'('interrupt_rule','type'('dotTupleType'(['RuleName']))).
'channel'('assess','type'('dotTupleType'(['boolType','Actor']))).
'channel'('notify_pdpc','type'('dotTupleType'(['boolType','Actor']))).
'channel'('notify_indiv','type'('dotTupleType'(['boolType','Actor']))).
'channel'('prohibit_notify_indiv','type'('dotTupleType'(['boolType','Actor']))).
'channel'('status','type'('dotTupleType'(['RuleName','Actor']))).
'channel'('tic','type'('dotUnitType')).
'bindval'('Tic','prefix'('src_span'(15,7,15,10,365,3),[],'tic','val_of'('Tic','src_span'(15,14,15,17,372,3)),'src_span'(15,11,15,13,368,10)),'src_span'(15,1,15,17,359,16)).
'agent'('Rule'(_BreachedOrFulfilled),'lambda'([_rule_name,_evnt,_evnt_timer],'let'(['agent'('RuleI'(_actor,_evnt_timer2),'ifte'('<'(_evnt_timer2,'int'(0)),'prefix'('src_span'(23,9,23,13,631,4),['out'('false'),'out'(_actor)],_evnt,'agent_call'('src_span'(23,29,23,48,651,19),_BreachedOrFulfilled,['false']),'src_span'(23,26,23,28,647,36)),'[]'('prefix'('src_span'(25,9,25,13,697,4),['out'('true'),'out'(_actor)],_evnt,'agent_call'('src_span'(25,28,25,47,716,19),_BreachedOrFulfilled,['true']),'src_span'(25,25,25,27,712,35)),'prefix'('src_span'(26,9,26,12,753,3),[],'tic','agent_call'('src_span'(26,16,26,21,760,5),'RuleI',[_actor,'-'(_evnt_timer2,'int'(1))]),'src_span'(26,13,26,15,756,35)),'src_span_operator'('no_loc_info_available','src_span'(25,54,25,56,742,2))),'no_loc_info_available','no_loc_info_available','no_loc_info_available'),'src_span'(22,7,26,44,600,188)),'bindval'('Go','[]'('prefix'('src_span'(31,7,31,10,895,3),[],'tic','val_of'('Go','src_span'(31,14,31,16,902,2)),'src_span'(31,11,31,13,898,9)),'prefix'('src_span'(32,7,32,19,914,12),['out'(_rule_name),'in'(_actor2)],'trigger_rule','/\x5c\'('agent_call'('src_span'(35,9,35,14,1103,5),'RuleI',[_actor2,_evnt_timer]),'prefix'('src_span'(35,37,35,51,1131,14),['out'(_rule_name)],'interrupt_rule','val_of'('Tic','src_span'(35,65,35,68,1159,3)),'src_span'(35,62,35,64,1155,17)),'src_span_operator'('no_loc_info_available','src_span'(35,34,35,36,1128,2))),'src_span'(32,36,32,38,942,234)),'src_span_operator'('no_loc_info_available','src_span'(31,17,31,19,905,2))),'src_span'(30,5,36,8,884,286))],'val_of'('Go','src_span'(38,5,38,7,1202,2)))),'src_span'(18,29,38,7,486,718)).
'agent'('ObProhib'(_Hence,_Lest),'agent_call'('src_span'(42,3,42,7,1282,4),'Rule',['lambda'([_is_done],'ifte'(_is_done,_Hence,_Lest,'src_span'(42,20,42,30,1299,10),'src_span'(42,31,42,35,1309,18),'src_span'(42,42,42,46,1320,15)))]),'src_span'(42,3,42,52,1282,49)).
'bindval'('Ob','agent_call'('src_span'(45,6,45,14,1401,8),'ObProhib',['val_of'('Tic','src_span'(45,15,45,18,1410,3)),'stop'('src_span'(45,20,45,24,1415,4))]),'src_span'(45,1,45,25,1396,24)).
'bindval'('Prohib','agent_call'('src_span'(46,10,46,18,1430,8),'ObProhib',['stop'('src_span'(46,19,46,23,1439,4)),'val_of'('Tic','src_span'(46,25,46,28,1445,3))]),'src_span'(46,1,46,29,1421,28)).
'bindval'('Perm','agent_call'('src_span'(49,8,49,12,1519,4),'Rule',['lambda'([_],'val_of'('Tic','src_span'(49,19,49,22,1530,3)))]),'src_span'(49,1,49,23,1512,22)).
'bindval'('MAIN','let'(['bindval'('Procs','setExp'('rangeEnum'(['val_of'('Tic','src_span'(54,7,54,10,1569,3)),'agent_call'('src_span'(55,7,55,9,1580,2),'val_of'('Ob','src_span'(55,7,55,9,1580,2)),['Assessment','assess','int'(30)]),'agent_call'('src_span'(56,7,56,9,1614,2),'val_of'('Ob','src_span'(56,7,56,9,1614,2)),['NotifyPdpc','notify_pdpc','int'(3)]),'agent_call'('src_span'(57,7,57,9,1652,2),'val_of'('Ob','src_span'(57,7,57,9,1652,2)),['NotifyIndiv','notify_indiv','int'(3)]),'agent_call'('src_span'(58,7,58,11,1692,4),'val_of'('Perm','src_span'(58,7,58,11,1692,4)),['ProhibitNotifyIndiv','prohibit_notify_indiv','int'(5)])])),'src_span'(53,5,59,6,1553,196))],'procRepSharing'('setExp'('rangeEnum'(['tic'])),['comprehensionGenerator'(_P,'val_of'('Procs','src_span'(61,21,61,26,1779,5)))],_P,'src_span'(61,17,61,28,1775,11))),'src_span'(51,1,61,30,1536,252)).
'comment'('lineComment'('-- datatype Status = breached | fulfilled'),'src_position'(1,1,0,41)).
'comment'('lineComment'('-- Unfortunately, currying doesn\x27\t work properly but at least nested lambdas do.'),'src_position'(17,1,377,80)).
'comment'('lineComment'('-- RuleI stands for rule instance.'),'src_position'(20,5,528,34)).
'comment'('lineComment'('-- Auxiliary helper for recursion.'),'src_position'(28,5,794,34)).
'comment'('lineComment'('-- We ignore the notion of perdurance for now.'),'src_position'(29,5,833,46)).
'comment'('lineComment'('-- When we interrupt a rule, are we interrupting existing instances, or do'),'src_position'(33,7,954,74)).
'comment'('lineComment'('-- we also prevent all future instances from being spawned?'),'src_position'(34,7,1035,59)).
'comment'('lineComment'('-- [| {tic} |] Go'),'src_position'(36,9,1171,17)).
'comment'('lineComment'('-- Non-compensable obligations and prohibitions.'),'src_position'(40,1,1207,48)).
'comment'('lineComment'('-- We treat Tic ~ Fulfilled and STOP (aka deadlock) ~ Breached'),'src_position'(44,1,1333,62)).
'comment'('lineComment'('-- Permissions and compensable obligations and prohibitions.'),'src_position'(48,1,1451,60)).
'symbol'('Actor','Actor','src_span'(2,10,2,15,51,5),'Datatype').
'symbol'('org','org','src_span'(2,18,2,21,59,3),'Constructor of Datatype').
'symbol'('indiv','indiv','src_span'(2,24,2,29,65,5),'Constructor of Datatype').
'symbol'('pdpc','pdpc','src_span'(2,32,2,36,73,4),'Constructor of Datatype').
'symbol'('RuleName','RuleName','src_span'(4,10,4,18,88,8),'Datatype').
'symbol'('Assessment','Assessment','src_span'(5,3,5,13,101,10),'Constructor of Datatype').
'symbol'('NotifyPdpc','NotifyPdpc','src_span'(5,16,5,26,114,10),'Constructor of Datatype').
'symbol'('NotifyIndiv','NotifyIndiv','src_span'(5,29,5,40,127,11),'Constructor of Datatype').
'symbol'('ProhibitNotifyIndiv','ProhibitNotifyIndiv','src_span'(5,43,5,62,141,19),'Constructor of Datatype').
'symbol'('trigger_rule','trigger_rule','src_span'(7,9,7,21,170,12),'Channel').
'symbol'('interrupt_rule','interrupt_rule','src_span'(8,9,8,23,208,14),'Channel').
'symbol'('assess','assess','src_span'(10,9,10,15,243,6),'Channel').
'symbol'('notify_pdpc','notify_pdpc','src_span'(10,17,10,28,251,11),'Channel').
'symbol'('notify_indiv','notify_indiv','src_span'(10,30,10,42,264,12),'Channel').
'symbol'('prohibit_notify_indiv','prohibit_notify_indiv','src_span'(10,44,10,65,278,21),'Channel').
'symbol'('status','status','src_span'(12,9,12,15,322,6),'Channel').
'symbol'('tic','tic','src_span'(13,9,13,12,354,3),'Channel').
'symbol'('Tic','Tic','src_span'(15,1,15,4,359,3),'Ident (Groundrep.)').
'symbol'('Rule','Rule','src_span'(18,1,18,5,458,4),'Funktion or Process').
'symbol'('BreachedOrFulfilled','BreachedOrFulfilled','src_span'(18,6,18,25,463,19),'Ident (Prolog Variable)').
'symbol'('rule_name','rule_name','src_span'(18,31,18,40,488,9),'Ident (Prolog Variable)').
'symbol'('evnt','evnt','src_span'(18,42,18,46,499,4),'Ident (Prolog Variable)').
'symbol'('evnt_timer','evnt_timer','src_span'(18,48,18,58,505,10),'Ident (Prolog Variable)').
'symbol'('RuleI','RuleI','src_span'(21,5,21,10,567,5),'Funktion or Process').
'symbol'('actor','actor','src_span'(21,11,21,16,573,5),'Ident (Prolog Variable)').
'symbol'('evnt_timer2','evnt_timer','src_span'(21,18,21,28,580,10),'Ident (Prolog Variable)').
'symbol'('Go','Go','src_span'(30,5,30,7,884,2),'Ident (Groundrep.)').
'symbol'('actor2','actor','src_span'(32,30,32,35,937,5),'Ident (Prolog Variable)').
'symbol'('ObProhib','ObProhib','src_span'(41,1,41,9,1256,8),'Funktion or Process').
'symbol'('Hence','Hence','src_span'(41,10,41,15,1265,5),'Ident (Prolog Variable)').
'symbol'('Lest','Lest','src_span'(41,17,41,21,1272,4),'Ident (Prolog Variable)').
'symbol'('is_done','is_done','src_span'(42,10,42,17,1289,7),'Ident (Prolog Variable)').
'symbol'('Ob','Ob','src_span'(45,1,45,3,1396,2),'Ident (Groundrep.)').
'symbol'('Prohib','Prohib','src_span'(46,1,46,7,1421,6),'Ident (Groundrep.)').
'symbol'('Perm','Perm','src_span'(49,1,49,5,1512,4),'Ident (Groundrep.)').
'symbol'('MAIN','MAIN','src_span'(51,1,51,5,1536,4),'Ident (Groundrep.)').
'symbol'('Procs','Procs','src_span'(53,5,53,10,1553,5),'Ident (Groundrep.)').
'symbol'('P','P','src_span'(61,17,61,18,1775,1),'Ident (Prolog Variable)').