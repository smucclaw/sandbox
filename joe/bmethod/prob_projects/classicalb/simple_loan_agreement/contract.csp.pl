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
'agent'('Rule'(_RuleInstance),'lambda'([_rule_name,_evnt,_evnt_timer],'let'(['bindval'('Trigger','repChoice'(['comprehensionGenerator'(_trigger,'closure'(['dotTuple'(['trigger_rule',_rule_name])]))],'prefix'('src_span'(22,57,22,64,578,7),[],_trigger,'val_of'('Trigger','src_span'(22,68,22,75,589,7)),'src_span'(22,65,22,67,585,18)),'src_span'(22,18,22,56,539,38)),'src_span'(22,5,22,75,526,70)),'bindval'('Go','[]'('prefix'('src_span'(25,7,25,10,613,3),[],'tic','val_of'('Go','src_span'(25,14,25,16,620,2)),'src_span'(25,11,25,13,616,9)),'prefix'('src_span'(26,7,26,19,632,12),['out'(_rule_name),'in'(_actor)],'trigger_rule','exception'('setExp'('rangeEnum'(['dotTuple'([_evnt,'true',_actor]),'dotTuple'([_evnt,'false',_actor])])),'|||'('agent_call'('src_span'(27,11,27,23,674,12),_RuleInstance,[_actor,_evnt,_evnt_timer]),'val_of'('Trigger','src_span'(27,53,27,60,716,7)),'src_span_operator'('no_loc_info_available','src_span'(27,49,27,52,712,3))),'val_of'('Go','src_span'(28,53,28,55,777,2)),'src_span'(28,11,28,52,735,41)),'src_span'(26,36,27,8,660,126)),'src_span_operator'('no_loc_info_available','src_span'(25,17,25,19,623,2))),'src_span'(24,5,28,56,602,178))],'/\x5c\'('val_of'('Go','src_span'(30,5,30,7,794,2)),'prefix'('src_span'(30,11,30,25,800,14),['out'(_rule_name)],'interrupt_rule','val_of'('Go','src_span'(30,39,30,41,828,2)),'src_span'(30,36,30,38,824,16)),'src_span_operator'('no_loc_info_available','src_span'(30,8,30,10,797,2))))),'src_span'(20,22,30,41,484,346)).
'bindval'('PreAchvI','lambda'([_actor2,_evnt2,_initial_evnt_timer],'&'('>='(_initial_evnt_timer,'int'(0)),'let'(['agent'('Go2'(_evnt_timer2),'ifte'('<'(_evnt_timer2,'int'(0)),'prefix'('src_span'(38,11,38,15,1016,4),['out'('false'),'out'(_actor2)],_evnt2,'skip'('src_span'(38,31,38,35,1036,4)),'src_span'(38,28,38,30,1032,14)),'[]'('prefix'('src_span'(40,11,40,15,1066,4),['out'('true'),'out'(_actor2)],_evnt2,'skip'('src_span'(40,30,40,34,1085,4)),'src_span'(40,27,40,29,1081,14)),'prefix'('src_span'(41,11,41,14,1103,3),[],'tic','agent_call'('src_span'(41,18,41,20,1110,2),'Go2',['-'(_evnt_timer2,'int'(1))]),'src_span'(41,15,41,17,1106,25)),'src_span_operator'('no_loc_info_available','src_span'(40,35,40,37,1090,2))),'no_loc_info_available','no_loc_info_available','src_span'(38,36,39,13,1040,122)),'src_span'(37,9,42,10,983,155))],'agent_call'('src_span'(44,7,44,9,1156,2),'Go2',[_initial_evnt_timer])))),'src_span'(33,1,44,29,868,310)).
'bindval'('NonPreAchvI','lambda'([_actor3,_evnt3,_initial_evnt_timer2],'&'('>='(_initial_evnt_timer2,'int'(0)),'let'(['agent'('Go3'(_evnt_timer3),'ifte'('=='(_evnt_timer3,'int'(0)),'[]'('prefix'('src_span'(52,11,52,15,1371,4),['out'('true'),'out'(_actor3)],_evnt3,'skip'('src_span'(52,30,52,34,1390,4)),'src_span'(52,27,52,29,1386,14)),'prefix'('src_span'(53,14,53,17,1408,3),[],'tic','prefix'('src_span'(53,21,53,25,1415,4),['out'('false'),'out'(_actor3)],_evnt3,'skip'('src_span'(53,41,53,45,1435,4)),'src_span'(53,38,53,40,1431,14)),'src_span'(53,18,53,20,1411,31)),'src_span_operator'('no_loc_info_available','src_span'(53,11,53,13,1405,2))),'prefix'('src_span'(55,11,55,14,1463,3),[],'tic','agent_call'('src_span'(55,18,55,20,1470,2),'Go3',['-'(_evnt_timer3,'int'(1))]),'src_span'(55,15,55,17,1466,25)),'no_loc_info_available','no_loc_info_available','no_loc_info_available'),'src_span'(51,9,55,36,1337,151))],'agent_call'('src_span'(57,7,57,9,1506,2),'Go3',[_initial_evnt_timer2])))),'src_span'(47,1,57,29,1220,308)).
'bindval'('PreRule','agent_call'('src_span'(60,11,60,15,1586,4),'Rule',['val_of'('PreAchvI','src_span'(60,16,60,24,1591,8))]),'src_span'(60,1,60,25,1576,24)).
'bindval'('NonPreRule','agent_call'('src_span'(61,14,61,18,1614,4),'Rule',['val_of'('NonPreAchvI','src_span'(61,19,61,30,1619,11))]),'src_span'(61,1,61,31,1601,30)).
'bindval'('Rules','setExp'('rangeEnum'(['agent_call'('src_span'(64,3,64,10,1645,7),'val_of'('PreRule','src_span'(64,3,64,10,1645,7)),['RequestPrincipal','request_principal','int'(1)]),'agent_call'('src_span'(65,3,65,13,1696,10),'val_of'('NonPreRule','src_span'(65,3,65,13,1696,10)),['SendPrincipal','send_principal','int'(1)]),'agent_call'('src_span'(66,3,66,13,1744,10),'val_of'('NonPreRule','src_span'(66,3,66,13,1744,10)),['Payment1','pay1','int'(365)]),'agent_call'('src_span'(67,3,67,13,1779,10),'val_of'('NonPreRule','src_span'(67,3,67,13,1779,10)),['Payment2','pay2','int'(365)]),'agent_call'('src_span'(68,3,68,10,1814,7),'val_of'('PreRule','src_span'(68,3,68,10,1814,7)),['EventOfDefault','event_of_default','int'(710)]),'agent_call'('src_span'(69,3,69,10,1864,7),'val_of'('PreRule','src_span'(69,3,69,10,1864,7)),['NotifyBorrower','notify_borrower','int'(3)]),'agent_call'('src_span'(70,3,70,10,1911,7),'val_of'('PreRule','src_span'(70,3,70,10,1911,7)),['CureDefault','cure_default','int'(2)]),'agent_call'('src_span'(71,3,71,10,1952,7),'val_of'('PreRule','src_span'(71,3,71,10,1952,7)),['PayAccelerated','pay_accelerated','int'(1)])])),'src_span'(63,1,72,2,1633,364)).
'bindval'('MAIN','procRepSharing'('setExp'('rangeEnum'(['tic'])),['comprehensionGenerator'(_P,'agent_call'('src_span'(74,24,74,29,2022,5),'union',['val_of'('Rules','src_span'(74,30,74,35,2028,5)),'setExp'('rangeEnum'(['val_of'('Tic','src_span'(74,38,74,41,2036,3))]))]))],_P,'src_span'(74,20,74,45,2018,25)),'src_span'(74,1,74,47,1999,46)).
'comment'('lineComment'('-- Preemptive achievement instance.'),'src_position'(32,1,832,35)).
'comment'('lineComment'('-- Non-preemptive achievement instance.'),'src_position'(46,1,1180,39)).
'comment'('lineComment'('-- Pre-emptive and non-pre-emptive instances.'),'src_position'(59,1,1530,45)).
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
'symbol'('PreAchvI','PreAchvI','src_span'(33,1,33,9,868,8),'Ident (Groundrep.)').
'symbol'('actor2','actor','src_span'(33,14,33,19,881,5),'Ident (Prolog Variable)').
'symbol'('evnt2','evnt','src_span'(33,21,33,25,888,4),'Ident (Prolog Variable)').
'symbol'('initial_evnt_timer','initial_evnt_timer','src_span'(33,27,33,45,894,18),'Ident (Prolog Variable)').
'symbol'('Go2','Go','src_span'(36,7,36,9,958,2),'Funktion or Process').
'symbol'('evnt_timer2','evnt_timer','src_span'(36,10,36,20,961,10),'Ident (Prolog Variable)').
'symbol'('NonPreAchvI','NonPreAchvI','src_span'(47,1,47,12,1220,11),'Ident (Groundrep.)').
'symbol'('actor3','actor','src_span'(47,17,47,22,1236,5),'Ident (Prolog Variable)').
'symbol'('evnt3','evnt','src_span'(47,24,47,28,1243,4),'Ident (Prolog Variable)').
'symbol'('initial_evnt_timer2','initial_evnt_timer','src_span'(47,30,47,48,1249,18),'Ident (Prolog Variable)').
'symbol'('Go3','Go','src_span'(50,7,50,9,1312,2),'Funktion or Process').
'symbol'('evnt_timer3','evnt_timer','src_span'(50,10,50,20,1315,10),'Ident (Prolog Variable)').
'symbol'('PreRule','PreRule','src_span'(60,1,60,8,1576,7),'Ident (Groundrep.)').
'symbol'('NonPreRule','NonPreRule','src_span'(61,1,61,11,1601,10),'Ident (Groundrep.)').
'symbol'('Rules','Rules','src_span'(63,1,63,6,1633,5),'Ident (Groundrep.)').
'symbol'('MAIN','MAIN','src_span'(74,1,74,5,1999,4),'Ident (Groundrep.)').
'symbol'('P','P','src_span'(74,20,74,21,2018,1),'Ident (Prolog Variable)').
'symbol'('union','union','src_span'(74,24,74,29,2022,5),'BuiltIn primitive').