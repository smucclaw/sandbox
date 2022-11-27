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
'channel'('tic','type'('dotUnitType')).
'bindval'('Tic','prefix'('src_span'(14,7,14,10,333,3),[],'tic','val_of'('Tic','src_span'(14,14,14,17,340,3)),'src_span'(14,11,14,13,336,10)),'src_span'(14,1,14,17,327,16)).
'agent'('Rule'(_BreachedOrFulfilled),'lambda'([_rule_name,_evnt,_evnt_timer],'let'(['agent'('RuleI'(_actor,_evnt_timer2),'ifte'('<'(_evnt_timer2,'int'(0)),'prefix'('src_span'(22,9,22,13,599,4),['out'('false'),'out'(_actor)],_evnt,'agent_call'('src_span'(22,29,22,48,619,19),_BreachedOrFulfilled,['false']),'src_span'(22,26,22,28,615,36)),'[]'('prefix'('src_span'(24,9,24,13,665,4),['out'('true'),'out'(_actor)],_evnt,'agent_call'('src_span'(24,28,24,47,684,19),_BreachedOrFulfilled,['true']),'src_span'(24,25,24,27,680,35)),'prefix'('src_span'(25,9,25,12,721,3),[],'tic','agent_call'('src_span'(25,16,25,21,728,5),'RuleI',[_actor,'-'(_evnt_timer2,'int'(1))]),'src_span'(25,13,25,15,724,35)),'src_span_operator'('no_loc_info_available','src_span'(24,54,24,56,710,2))),'no_loc_info_available','no_loc_info_available','no_loc_info_available'),'src_span'(21,7,25,44,568,188)),'bindval'('Go','[]'('prefix'('src_span'(30,7,30,10,863,3),[],'tic','val_of'('Go','src_span'(30,14,30,16,870,2)),'src_span'(30,11,30,13,866,9)),'prefix'('src_span'(31,7,31,19,882,12),['out'(_rule_name),'in'(_actor2)],'trigger_rule','/\x5c\'('agent_call'('src_span'(34,9,34,14,1071,5),'RuleI',[_actor2,_evnt_timer]),'prefix'('src_span'(34,37,34,51,1099,14),['out'(_rule_name)],'interrupt_rule','val_of'('Tic','src_span'(34,65,34,68,1127,3)),'src_span'(34,62,34,64,1123,17)),'src_span_operator'('no_loc_info_available','src_span'(34,34,34,36,1096,2))),'src_span'(31,36,31,38,910,234)),'src_span_operator'('no_loc_info_available','src_span'(30,17,30,19,873,2))),'src_span'(29,5,35,8,852,286))],'val_of'('Go','src_span'(37,5,37,7,1170,2)))),'src_span'(17,29,37,7,454,718)).
'agent'('ObProhib'(_Hence,_Lest),'agent_call'('src_span'(41,3,41,7,1249,4),'Rule',['lambda'([_is_done],'ifte'(_is_done,_Hence,_Lest,'src_span'(41,20,41,30,1266,10),'src_span'(41,31,41,35,1276,18),'src_span'(41,42,41,46,1287,15)))]),'src_span'(41,3,41,52,1249,49)).
'bindval'('Ob','agent_call'('src_span'(44,6,44,14,1368,8),'ObProhib',['val_of'('Tic','src_span'(44,15,44,18,1377,3)),'stop'('src_span'(44,20,44,24,1382,4))]),'src_span'(44,1,44,25,1363,24)).
'bindval'('Prohib','agent_call'('src_span'(45,10,45,18,1397,8),'ObProhib',['stop'('src_span'(45,19,45,23,1406,4)),'val_of'('Tic','src_span'(45,25,45,28,1412,3))]),'src_span'(45,1,45,29,1388,28)).
'bindval'('Perm','agent_call'('src_span'(48,8,48,12,1486,4),'Rule',['lambda'([_],'val_of'('Tic','src_span'(48,19,48,22,1497,3)))]),'src_span'(48,1,48,23,1479,22)).
'bindval'('MAIN','let'(['bindval'('Procs','setExp'('rangeEnum'(['val_of'('Tic','src_span'(53,7,53,10,1536,3)),'agent_call'('src_span'(54,7,54,9,1547,2),'val_of'('Ob','src_span'(54,7,54,9,1547,2)),['Assessment','assess','int'(30)]),'agent_call'('src_span'(55,7,55,9,1581,2),'val_of'('Ob','src_span'(55,7,55,9,1581,2)),['NotifyPdpc','notify_pdpc','int'(3)]),'agent_call'('src_span'(56,7,56,9,1619,2),'val_of'('Ob','src_span'(56,7,56,9,1619,2)),['NotifyIndiv','notify_indiv','int'(3)]),'agent_call'('src_span'(57,7,57,11,1659,4),'val_of'('Perm','src_span'(57,7,57,11,1659,4)),['ProhibitNotifyIndiv','prohibit_notify_indiv','int'(5)])])),'src_span'(52,5,58,6,1520,196))],'procRepSharing'('setExp'('rangeEnum'(['tic'])),['comprehensionGenerator'(_P,'val_of'('Procs','src_span'(60,21,60,26,1746,5)))],_P,'src_span'(60,17,60,28,1742,11))),'src_span'(50,1,60,30,1503,252)).
'comment'('lineComment'('-- datatype Status = breached | fulfilled'),'src_position'(1,1,0,41)).
'comment'('lineComment'('-- Unfortunately, currying doesn\x27\t work properly but at least nested lambdas do.'),'src_position'(16,1,345,80)).
'comment'('lineComment'('-- RuleI stands for rule instance.'),'src_position'(19,5,496,34)).
'comment'('lineComment'('-- Auxiliary helper for recursion.'),'src_position'(27,5,762,34)).
'comment'('lineComment'('-- We ignore the notion of perdurance for now.'),'src_position'(28,5,801,46)).
'comment'('lineComment'('-- When we interrupt a rule, are we interrupting existing instances, or do'),'src_position'(32,7,922,74)).
'comment'('lineComment'('-- we also prevent all future instances from being spawned?'),'src_position'(33,7,1003,59)).
'comment'('lineComment'('-- [| {tic} |] Go'),'src_position'(35,9,1139,17)).
'comment'('lineComment'('-- Non-compensable obligations and prohibitions.'),'src_position'(39,1,1174,48)).
'comment'('lineComment'('-- We treat Tic ~ Fulfilled and STOP (aka deadlock) ~ Breached'),'src_position'(43,1,1300,62)).
'comment'('lineComment'('-- Permissions and compensable obligations and prohibitions.'),'src_position'(47,1,1418,60)).
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
'symbol'('tic','tic','src_span'(12,9,12,12,322,3),'Channel').
'symbol'('Tic','Tic','src_span'(14,1,14,4,327,3),'Ident (Groundrep.)').
'symbol'('Rule','Rule','src_span'(17,1,17,5,426,4),'Funktion or Process').
'symbol'('BreachedOrFulfilled','BreachedOrFulfilled','src_span'(17,6,17,25,431,19),'Ident (Prolog Variable)').
'symbol'('rule_name','rule_name','src_span'(17,31,17,40,456,9),'Ident (Prolog Variable)').
'symbol'('evnt','evnt','src_span'(17,42,17,46,467,4),'Ident (Prolog Variable)').
'symbol'('evnt_timer','evnt_timer','src_span'(17,48,17,58,473,10),'Ident (Prolog Variable)').
'symbol'('RuleI','RuleI','src_span'(20,5,20,10,535,5),'Funktion or Process').
'symbol'('actor','actor','src_span'(20,11,20,16,541,5),'Ident (Prolog Variable)').
'symbol'('evnt_timer2','evnt_timer','src_span'(20,18,20,28,548,10),'Ident (Prolog Variable)').
'symbol'('Go','Go','src_span'(29,5,29,7,852,2),'Ident (Groundrep.)').
'symbol'('actor2','actor','src_span'(31,30,31,35,905,5),'Ident (Prolog Variable)').
'symbol'('ObProhib','ObProhib','src_span'(40,1,40,9,1223,8),'Funktion or Process').
'symbol'('Hence','Hence','src_span'(40,10,40,15,1232,5),'Ident (Prolog Variable)').
'symbol'('Lest','Lest','src_span'(40,17,40,21,1239,4),'Ident (Prolog Variable)').
'symbol'('is_done','is_done','src_span'(41,10,41,17,1256,7),'Ident (Prolog Variable)').
'symbol'('Ob','Ob','src_span'(44,1,44,3,1363,2),'Ident (Groundrep.)').
'symbol'('Prohib','Prohib','src_span'(45,1,45,7,1388,6),'Ident (Groundrep.)').
'symbol'('Perm','Perm','src_span'(48,1,48,5,1479,4),'Ident (Groundrep.)').
'symbol'('MAIN','MAIN','src_span'(50,1,50,5,1503,4),'Ident (Groundrep.)').
'symbol'('Procs','Procs','src_span'(52,5,52,10,1520,5),'Ident (Groundrep.)').
'symbol'('P','P','src_span'(60,17,60,18,1742,1),'Ident (Prolog Variable)').