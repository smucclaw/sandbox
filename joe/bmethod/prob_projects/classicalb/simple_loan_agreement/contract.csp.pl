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
'dataTypeDef'('Actor',['constructor'('borrower'),'constructor'('lender')]).
'dataTypeDef'('RuleName',['constructor'('RequestPrincipal'),'constructor'('SendPrincipal'),'constructor'('Payment1'),'constructor'('Payment2'),'constructor'('EventOfDefault'),'constructor'('NotifyBorrower'),'constructor'('CureDefault'),'constructor'('PayAccelerated')]).
'channel'('trigger_rule','type'('dotTupleType'(['RuleName','Actor']))).
'channel'('interrupt_rule','type'('dotTupleType'(['RuleName']))).
'channel'('request_principal','type'('dotTupleType'(['boolType','Actor']))).
'channel'('send_principal','type'('dotTupleType'(['boolType','Actor']))).
'channel'('pay1','type'('dotTupleType'(['boolType','Actor']))).
'channel'('pay2','type'('dotTupleType'(['boolType','Actor']))).
'channel'('event_of_default','type'('dotTupleType'(['boolType','Actor']))).
'channel'('notify_borrower','type'('dotTupleType'(['boolType','Actor']))).
'channel'('cure_default','type'('dotTupleType'(['boolType','Actor']))).
'channel'('pay_accelerated','type'('dotTupleType'(['boolType','Actor']))).
'channel'('tic','type'('dotUnitType')).
'bindval'('Tic','prefix'('src_span'(18,7,18,10,451,3),[],'tic','val_of'('Tic','src_span'(18,14,18,17,458,3)),'src_span'(18,11,18,13,454,10)),'src_span'(18,1,18,17,445,16)).
'agent'('Rule'(_RuleInstance),'lambda'([_rule_name,_evnt,_evnt_timer],'let'(['bindval'('Trigger','repChoice'(['comprehensionGenerator'(_trigger,'closure'(['dotTuple'(['trigger_rule',_rule_name])]))],'prefix'('src_span'(22,57,22,64,578,7),[],_trigger,'val_of'('Trigger','src_span'(22,68,22,75,589,7)),'src_span'(22,65,22,67,585,18)),'src_span'(22,18,22,56,539,38)),'src_span'(22,5,22,75,526,70)),'bindval'('Go','[]'('prefix'('src_span'(25,7,25,10,613,3),[],'tic','val_of'('Go','src_span'(25,14,25,16,620,2)),'src_span'(25,11,25,13,616,9)),'prefix'('src_span'(26,7,26,19,632,12),['out'(_rule_name),'in'(_actor)],'trigger_rule','exception'('setExp'('rangeEnum'(['dotTuple'([_evnt,'true',_actor]),'dotTuple'([_evnt,'false',_actor])])),'|||'('agent_call'('src_span'(27,10,27,22,675,12),_RuleInstance,[_actor,_evnt,_evnt_timer]),'val_of'('Trigger','src_span'(27,52,27,59,717,7)),'src_span_operator'('no_loc_info_available','src_span'(27,48,27,51,713,3))),'val_of'('Go','src_span'(28,51,28,53,776,2)),'src_span'(28,9,28,50,734,41)),'src_span'(26,36,26,38,660,132)),'src_span_operator'('no_loc_info_available','src_span'(25,17,25,19,623,2))),'src_span'(24,5,29,8,602,184))],'/\x5c\'('val_of'('Go','src_span'(31,5,31,7,800,2)),'prefix'('src_span'(31,11,31,25,806,14),['out'(_rule_name)],'interrupt_rule','val_of'('Go','src_span'(31,39,31,41,834,2)),'src_span'(31,36,31,38,830,16)),'src_span_operator'('no_loc_info_available','src_span'(31,8,31,10,803,2))))),'src_span'(20,22,31,41,484,352)).
'bindval'('PreAchvI','lambda'([_actor2,_evnt2,_initial_evnt_timer],'&'('>='(_initial_evnt_timer,'int'(0)),'let'(['agent'('Go2'(_evnt_timer2),'ifte'('<'(_evnt_timer2,'int'(0)),'prefix'('src_span'(39,11,39,15,1022,4),['out'('false'),'out'(_actor2)],_evnt2,'skip'('src_span'(39,31,39,35,1042,4)),'src_span'(39,28,39,30,1038,14)),'[]'('prefix'('src_span'(41,11,41,15,1072,4),['out'('true'),'out'(_actor2)],_evnt2,'skip'('src_span'(41,30,41,34,1091,4)),'src_span'(41,27,41,29,1087,14)),'prefix'('src_span'(42,11,42,14,1109,3),[],'tic','agent_call'('src_span'(42,18,42,20,1116,2),'Go2',['-'(_evnt_timer2,'int'(1))]),'src_span'(42,15,42,17,1112,25)),'src_span_operator'('no_loc_info_available','src_span'(41,35,41,37,1096,2))),'no_loc_info_available','no_loc_info_available','src_span'(39,36,40,13,1046,122)),'src_span'(38,9,43,10,989,155))],'agent_call'('src_span'(45,7,45,9,1162,2),'Go2',[_initial_evnt_timer])))),'src_span'(34,1,45,29,874,310)).
'bindval'('NonPreAchvI','lambda'([_actor3,_evnt3,_initial_evnt_timer2],'&'('>='(_initial_evnt_timer2,'int'(0)),'let'(['agent'('Go3'(_evnt_timer3),'ifte'('=='(_evnt_timer3,'int'(0)),'[]'('prefix'('src_span'(53,11,53,15,1377,4),['out'('true'),'out'(_actor3)],_evnt3,'skip'('src_span'(53,30,53,34,1396,4)),'src_span'(53,27,53,29,1392,14)),'prefix'('src_span'(54,14,54,17,1414,3),[],'tic','prefix'('src_span'(54,21,54,25,1421,4),['out'('false'),'out'(_actor3)],_evnt3,'skip'('src_span'(54,41,54,45,1441,4)),'src_span'(54,38,54,40,1437,14)),'src_span'(54,18,54,20,1417,31)),'src_span_operator'('no_loc_info_available','src_span'(54,11,54,13,1411,2))),'prefix'('src_span'(56,11,56,14,1469,3),[],'tic','agent_call'('src_span'(56,18,56,20,1476,2),'Go3',['-'(_evnt_timer3,'int'(1))]),'src_span'(56,15,56,17,1472,25)),'no_loc_info_available','no_loc_info_available','no_loc_info_available'),'src_span'(52,9,56,36,1343,151))],'agent_call'('src_span'(58,7,58,9,1512,2),'Go3',[_initial_evnt_timer2])))),'src_span'(48,1,58,29,1226,308)).
'bindval'('PreRule','agent_call'('src_span'(60,11,60,15,1546,4),'Rule',['val_of'('PreAchvI','src_span'(60,16,60,24,1551,8))]),'src_span'(60,1,60,25,1536,24)).
'bindval'('NonPreRule','agent_call'('src_span'(61,14,61,18,1574,4),'Rule',['val_of'('NonPreAchvI','src_span'(61,19,61,30,1579,11))]),'src_span'(61,1,61,31,1561,30)).
'bindval'('Rules','setExp'('rangeEnum'(['agent_call'('src_span'(64,3,64,10,1605,7),'val_of'('PreRule','src_span'(64,3,64,10,1605,7)),['RequestPrincipal','request_principal','int'(1)]),'agent_call'('src_span'(65,3,65,13,1656,10),'val_of'('NonPreRule','src_span'(65,3,65,13,1656,10)),['SendPrincipal','send_principal','int'(1)]),'agent_call'('src_span'(66,3,66,13,1704,10),'val_of'('NonPreRule','src_span'(66,3,66,13,1704,10)),['Payment1','pay1','int'(365)]),'agent_call'('src_span'(67,3,67,13,1739,10),'val_of'('NonPreRule','src_span'(67,3,67,13,1739,10)),['Payment2','pay2','int'(365)]),'agent_call'('src_span'(68,3,68,10,1774,7),'val_of'('PreRule','src_span'(68,3,68,10,1774,7)),['EventOfDefault','event_of_default','int'(710)]),'agent_call'('src_span'(69,3,69,10,1824,7),'val_of'('PreRule','src_span'(69,3,69,10,1824,7)),['NotifyBorrower','notify_borrower','int'(3)]),'agent_call'('src_span'(70,3,70,10,1871,7),'val_of'('PreRule','src_span'(70,3,70,10,1871,7)),['CureDefault','cure_default','int'(2)]),'agent_call'('src_span'(71,3,71,10,1912,7),'val_of'('PreRule','src_span'(71,3,71,10,1912,7)),['PayAccelerated','pay_accelerated','int'(1)])])),'src_span'(63,1,72,2,1593,364)).
'bindval'('MAIN','procRepSharing'('setExp'('rangeEnum'(['tic'])),['comprehensionGenerator'(_P,'agent_call'('src_span'(74,24,74,29,1982,5),'union',['val_of'('Rules','src_span'(74,30,74,35,1988,5)),'setExp'('rangeEnum'(['val_of'('Tic','src_span'(74,38,74,41,1996,3))]))]))],_P,'src_span'(74,20,74,45,1978,25)),'src_span'(74,1,74,47,1959,46)).
'comment'('lineComment'('-- Preemptive achievement instance.'),'src_position'(33,1,838,35)).
'comment'('lineComment'('-- Non-preemptive achievement instance.'),'src_position'(47,1,1186,39)).
'symbol'('Actor','Actor','src_span'(1,10,1,15,9,5),'Datatype').
'symbol'('borrower','borrower','src_span'(1,18,1,26,17,8),'Constructor of Datatype').
'symbol'('lender','lender','src_span'(1,29,1,35,28,6),'Constructor of Datatype').
'symbol'('RuleName','RuleName','src_span'(3,10,3,18,45,8),'Datatype').
'symbol'('RequestPrincipal','RequestPrincipal','src_span'(4,3,4,19,58,16),'Constructor of Datatype').
'symbol'('SendPrincipal','SendPrincipal','src_span'(4,22,4,35,77,13),'Constructor of Datatype').
'symbol'('Payment1','Payment1','src_span'(5,3,5,11,95,8),'Constructor of Datatype').
'symbol'('Payment2','Payment2','src_span'(5,14,5,22,106,8),'Constructor of Datatype').
'symbol'('EventOfDefault','EventOfDefault','src_span'(6,3,6,17,119,14),'Constructor of Datatype').
'symbol'('NotifyBorrower','NotifyBorrower','src_span'(6,20,6,34,136,14),'Constructor of Datatype').
'symbol'('CureDefault','CureDefault','src_span'(6,37,6,48,153,11),'Constructor of Datatype').
'symbol'('PayAccelerated','PayAccelerated','src_span'(7,3,7,17,169,14),'Constructor of Datatype').
'symbol'('trigger_rule','trigger_rule','src_span'(9,9,9,21,193,12),'Channel').
'symbol'('interrupt_rule','interrupt_rule','src_span'(10,9,10,23,231,14),'Channel').
'symbol'('request_principal','request_principal','src_span'(12,9,12,26,266,17),'Channel').
'symbol'('send_principal','send_principal','src_span'(12,28,12,42,285,14),'Channel').
'symbol'('pay1','pay1','src_span'(12,44,12,48,301,4),'Channel').
'symbol'('pay2','pay2','src_span'(12,50,12,54,307,4),'Channel').
'symbol'('event_of_default','event_of_default','src_span'(13,9,13,25,333,16),'Channel').
'symbol'('notify_borrower','notify_borrower','src_span'(13,27,13,42,351,15),'Channel').
'symbol'('cure_default','cure_default','src_span'(13,44,13,56,368,12),'Channel').
'symbol'('pay_accelerated','pay_accelerated','src_span'(14,9,14,24,402,15),'Channel').
'symbol'('tic','tic','src_span'(16,9,16,12,440,3),'Channel').
'symbol'('Tic','Tic','src_span'(18,1,18,4,445,3),'Ident (Groundrep.)').
'symbol'('Rule','Rule','src_span'(20,1,20,5,463,4),'Funktion or Process').
'symbol'('RuleInstance','RuleInstance','src_span'(20,6,20,18,468,12),'Ident (Prolog Variable)').
'symbol'('rule_name','rule_name','src_span'(20,24,20,33,486,9),'Ident (Prolog Variable)').
'symbol'('evnt','evnt','src_span'(20,35,20,39,497,4),'Ident (Prolog Variable)').
'symbol'('evnt_timer','evnt_timer','src_span'(20,41,20,51,503,10),'Ident (Prolog Variable)').
'symbol'('Trigger','Trigger','src_span'(22,5,22,12,526,7),'Ident (Groundrep.)').
'symbol'('trigger','trigger','src_span'(22,18,22,25,539,7),'Ident (Prolog Variable)').
'symbol'('Go','Go','src_span'(24,5,24,7,602,2),'Ident (Groundrep.)').
'symbol'('actor','actor','src_span'(26,30,26,35,655,5),'Ident (Prolog Variable)').
'symbol'('PreAchvI','PreAchvI','src_span'(34,1,34,9,874,8),'Ident (Groundrep.)').
'symbol'('actor2','actor','src_span'(34,14,34,19,887,5),'Ident (Prolog Variable)').
'symbol'('evnt2','evnt','src_span'(34,21,34,25,894,4),'Ident (Prolog Variable)').
'symbol'('initial_evnt_timer','initial_evnt_timer','src_span'(34,27,34,45,900,18),'Ident (Prolog Variable)').
'symbol'('Go2','Go','src_span'(37,7,37,9,964,2),'Funktion or Process').
'symbol'('evnt_timer2','evnt_timer','src_span'(37,10,37,20,967,10),'Ident (Prolog Variable)').
'symbol'('NonPreAchvI','NonPreAchvI','src_span'(48,1,48,12,1226,11),'Ident (Groundrep.)').
'symbol'('actor3','actor','src_span'(48,17,48,22,1242,5),'Ident (Prolog Variable)').
'symbol'('evnt3','evnt','src_span'(48,24,48,28,1249,4),'Ident (Prolog Variable)').
'symbol'('initial_evnt_timer2','initial_evnt_timer','src_span'(48,30,48,48,1255,18),'Ident (Prolog Variable)').
'symbol'('Go3','Go','src_span'(51,7,51,9,1318,2),'Funktion or Process').
'symbol'('evnt_timer3','evnt_timer','src_span'(51,10,51,20,1321,10),'Ident (Prolog Variable)').
'symbol'('PreRule','PreRule','src_span'(60,1,60,8,1536,7),'Ident (Groundrep.)').
'symbol'('NonPreRule','NonPreRule','src_span'(61,1,61,11,1561,10),'Ident (Groundrep.)').
'symbol'('Rules','Rules','src_span'(63,1,63,6,1593,5),'Ident (Groundrep.)').
'symbol'('MAIN','MAIN','src_span'(74,1,74,5,1959,4),'Ident (Groundrep.)').
'symbol'('P','P','src_span'(74,20,74,21,1978,1),'Ident (Prolog Variable)').
'symbol'('union','union','src_span'(74,24,74,29,1982,5),'BuiltIn primitive').