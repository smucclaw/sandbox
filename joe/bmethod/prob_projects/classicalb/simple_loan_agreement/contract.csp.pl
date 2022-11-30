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
'agent'('Rule'(_RuleInstance),'lambda'([_rule_name,_evnt,_evnt_timer],'let'(['bindval'('Go','[]'('prefix'('src_span'(23,7,23,10,537,3),[],'tic','val_of'('Go','src_span'(23,14,23,16,544,2)),'src_span'(23,11,23,13,540,9)),'prefix'('src_span'(24,7,24,19,556,12),['out'(_rule_name),'in'(_actor)],'trigger_rule',';'('/\x5c\'('|||'('agent_call'('src_span'(25,11,25,23,600,12),_RuleInstance,[_actor,_evnt,_evnt_timer]),'prefix'('src_span'(25,53,25,65,642,12),['out'(_rule_name),'in'(_actor2)],'trigger_rule','skip'('src_span'(25,85,25,89,674,4)),'src_span'(25,82,25,84,670,14)),'src_span_operator'('no_loc_info_available','src_span'(25,49,25,52,638,3))),'prefix'('src_span'(26,12,26,26,691,14),['out'(_rule_name)],'interrupt_rule','skip'('src_span'(26,40,26,44,719,4)),'src_span'(26,37,26,39,715,18)),'src_span_operator'('no_loc_info_available','src_span'(26,9,26,11,688,2))),'val_of'('Go','src_span'(27,11,27,13,735,2)),'src_span_operator'('no_loc_info_available','src_span'(27,9,27,10,733,1))),'src_span'(24,36,24,38,584,167)),'src_span_operator'('no_loc_info_available','src_span'(23,17,23,19,547,2))),'src_span'(22,5,28,8,526,219))],'val_of'('Go','src_span'(30,5,30,7,759,2)))),'src_span'(20,22,30,7,484,277)).
'agent'('PreAchvI'(_Cont),'lambda'([_actor3,_evnt2,_initial_evnt_timer],'&'('>='(_initial_evnt_timer,'int'(0)),'let'(['agent'('Go2'(_evnt_timer2),'ifte'('<'(_evnt_timer2,'int'(0)),'prefix'('src_span'(38,11,38,15,953,4),['out'('false'),'out'(_actor3)],_evnt2,'agent_call'('src_span'(38,31,38,35,973,4),_Cont,['false']),'src_span'(38,28,38,30,969,21)),'[]'('prefix'('src_span'(40,11,40,15,1010,4),['out'('true'),'out'(_actor3)],_evnt2,'agent_call'('src_span'(40,30,40,34,1029,4),_Cont,['true']),'src_span'(40,27,40,29,1025,20)),'prefix'('src_span'(41,11,41,14,1053,3),[],'tic','agent_call'('src_span'(41,18,41,20,1060,2),'Go2',['-'(_evnt_timer2,'int'(1))]),'src_span'(41,15,41,17,1056,25)),'src_span_operator'('no_loc_info_available','src_span'(40,41,40,43,1040,2))),'no_loc_info_available','no_loc_info_available','src_span'(38,43,39,13,984,135)),'src_span'(37,9,42,10,920,168))],'agent_call'('src_span'(44,7,44,9,1106,2),'Go2',[_initial_evnt_timer])))),'src_span'(33,18,44,29,816,312)).
'agent'('NonPreAchvI'(_Cont2),'lambda'([_actor4,_evnt3,_initial_evnt_timer2],'&'('>='(_initial_evnt_timer2,'int'(0)),'let'(['agent'('Go3'(_evnt_timer3),'ifte'('=='(_evnt_timer3,'int'(0)),'[]'('prefix'('src_span'(52,11,52,15,1327,4),['out'('true'),'out'(_actor4)],_evnt3,'agent_call'('src_span'(52,30,52,34,1346,4),_Cont2,['true']),'src_span'(52,27,52,29,1342,20)),'prefix'('src_span'(53,14,53,17,1370,3),[],'tic','prefix'('src_span'(53,21,53,25,1377,4),['out'('false'),'out'(_actor4)],_evnt3,'agent_call'('src_span'(53,41,53,45,1397,4),_Cont2,['false']),'src_span'(53,38,53,40,1393,21)),'src_span'(53,18,53,20,1373,38)),'src_span_operator'('no_loc_info_available','src_span'(53,11,53,13,1367,2))),'prefix'('src_span'(55,11,55,14,1432,3),[],'tic','agent_call'('src_span'(55,18,55,20,1439,2),'Go3',['-'(_evnt_timer3,'int'(1))]),'src_span'(55,15,55,17,1435,25)),'no_loc_info_available','no_loc_info_available','no_loc_info_available'),'src_span'(51,9,55,36,1293,164))],'agent_call'('src_span'(57,7,57,9,1475,2),'Go3',[_initial_evnt_timer2])))),'src_span'(47,21,57,29,1190,307)).
'agent'('NCPreRule'(_OnDone,_OnTimeout),'let'(['agent'('Cont3'(_is_done),'ifte'(_is_done,_OnDone,_OnTimeout,'src_span'(62,21,62,31,1605,10),'src_span'(62,32,62,36,1615,19),'src_span'(62,44,62,48,1627,21)),'src_span'(62,21,62,58,1605,37))],'agent_call'('src_span'(64,5,64,9,1656,4),'Rule',['agent_call'('src_span'(64,10,64,18,1661,8),'PreAchvI',['Cont3'])])),'src_span'(61,3,64,25,1581,95)).
'bindval'('NCPreOb','agent_call'('src_span'(67,11,67,20,1742,9),'NCPreRule',['val_of'('Tic','src_span'(67,21,67,24,1752,3)),'stop'('src_span'(67,26,67,30,1757,4))]),'src_span'(67,1,67,31,1732,30)).
'bindval'('NCPreProhib','agent_call'('src_span'(70,15,70,24,1833,9),'NCPreRule',['stop'('src_span'(70,25,70,29,1843,4)),'val_of'('Tic','src_span'(70,31,70,34,1849,3))]),'src_span'(70,1,70,35,1819,34)).
'bindval'('CPreRule','agent_call'('src_span'(73,12,73,16,1937,4),'Rule',['agent_call'('src_span'(73,17,73,25,1942,8),'PreAchvI',['lambda'([_],'val_of'('Tic','src_span'(73,32,73,35,1957,3)))])]),'src_span'(73,1,73,37,1926,36)).
'bindval'('CNonPreRule','agent_call'('src_span'(75,15,75,19,1978,4),'Rule',['agent_call'('src_span'(75,20,75,31,1983,11),'NonPreAchvI',['lambda'([_],'val_of'('Tic','src_span'(75,38,75,41,2001,3)))])]),'src_span'(75,1,75,43,1964,42)).
'bindval'('MAIN','let'(['bindval'('Procs','setExp'('rangeEnum'(['val_of'('Tic','src_span'(80,7,80,10,2041,3)),'agent_call'('src_span'(81,7,81,15,2052,8),'val_of'('CPreRule','src_span'(81,7,81,15,2052,8)),['RequestPrincipal','request_principal','int'(1)]),'agent_call'('src_span'(82,7,82,14,2108,7),'val_of'('NCPreOb','src_span'(82,7,82,14,2108,7)),['SendPrincipal','send_principal','int'(1)]),'agent_call'('src_span'(83,7,83,18,2157,11),'val_of'('CNonPreRule','src_span'(83,7,83,18,2157,11)),['Payment1','pay1','int'(365)]),'agent_call'('src_span'(84,7,84,18,2197,11),'val_of'('CNonPreRule','src_span'(84,7,84,18,2197,11)),['Payment2','pay2','int'(365)]),'agent_call'('src_span'(85,7,85,15,2237,8),'val_of'('CPreRule','src_span'(85,7,85,15,2237,8)),['EventOfDefault','event_of_default','int'(730)]),'agent_call'('src_span'(87,7,87,14,2347,7),'val_of'('NCPreOb','src_span'(87,7,87,14,2347,7)),['NotifyBorrower','notify_borrower','int'(3)]),'agent_call'('src_span'(88,7,88,15,2398,8),'val_of'('CPreRule','src_span'(88,7,88,15,2398,8)),['CureDefault','cure_default','int'(2)]),'agent_call'('src_span'(89,7,89,14,2444,7),'val_of'('NCPreOb','src_span'(89,7,89,14,2444,7)),['PayAccelerated','pay_accelerated','int'(1)])])),'src_span'(79,5,90,6,2025,468))],'procRepSharing'('setExp'('rangeEnum'(['tic'])),['comprehensionGenerator'(_P,'val_of'('Procs','src_span'(92,21,92,26,2523,5)))],_P,'src_span'(92,17,92,28,2519,11))),'src_span'(77,1,92,30,2008,524)).
'comment'('lineComment'('-- Preemptive achievement instance.'),'src_position'(32,1,763,35)).
'comment'('lineComment'('-- Non-preemptive achievement instance.'),'src_position'(46,1,1130,39)).
'comment'('lineComment'('-- Template for non-compensable preemptive rule.'),'src_position'(59,1,1499,48)).
'comment'('lineComment'('-- Non-compensable preemptive achievement obligation.'),'src_position'(66,1,1678,53)).
'comment'('lineComment'('-- Non-compensable preemptive achievement prohibition.'),'src_position'(69,1,1764,54)).
'comment'('lineComment'('-- Compensable, pre-emptive obligations, prohibitions and permissions.'),'src_position'(72,1,1855,70)).
'comment'('lineComment'('-- CPreRule(NotifyBorrower, notify_borrower, 3),'),'src_position'(86,7,2292,48)).
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
'symbol'('Go','Go','src_span'(22,5,22,7,526,2),'Ident (Groundrep.)').
'symbol'('actor','actor','src_span'(24,30,24,35,579,5),'Ident (Prolog Variable)').
'symbol'('actor2','actor','src_span'(25,76,25,81,665,5),'Ident (Prolog Variable)').
'symbol'('PreAchvI','PreAchvI','src_span'(33,1,33,9,799,8),'Funktion or Process').
'symbol'('Cont','Cont','src_span'(33,10,33,14,808,4),'Ident (Prolog Variable)').
'symbol'('actor3','actor','src_span'(33,20,33,25,818,5),'Ident (Prolog Variable)').
'symbol'('evnt2','evnt','src_span'(33,27,33,31,825,4),'Ident (Prolog Variable)').
'symbol'('initial_evnt_timer','initial_evnt_timer','src_span'(33,33,33,51,831,18),'Ident (Prolog Variable)').
'symbol'('Go2','Go','src_span'(36,7,36,9,895,2),'Funktion or Process').
'symbol'('evnt_timer2','evnt_timer','src_span'(36,10,36,20,898,10),'Ident (Prolog Variable)').
'symbol'('NonPreAchvI','NonPreAchvI','src_span'(47,1,47,12,1170,11),'Funktion or Process').
'symbol'('Cont2','Cont','src_span'(47,13,47,17,1182,4),'Ident (Prolog Variable)').
'symbol'('actor4','actor','src_span'(47,23,47,28,1192,5),'Ident (Prolog Variable)').
'symbol'('evnt3','evnt','src_span'(47,30,47,34,1199,4),'Ident (Prolog Variable)').
'symbol'('initial_evnt_timer2','initial_evnt_timer','src_span'(47,36,47,54,1205,18),'Ident (Prolog Variable)').
'symbol'('Go3','Go','src_span'(50,7,50,9,1268,2),'Funktion or Process').
'symbol'('evnt_timer3','evnt_timer','src_span'(50,10,50,20,1271,10),'Ident (Prolog Variable)').
'symbol'('NCPreRule','NCPreRule','src_span'(60,1,60,10,1548,9),'Funktion or Process').
'symbol'('OnDone','OnDone','src_span'(60,11,60,17,1558,6),'Ident (Prolog Variable)').
'symbol'('OnTimeout','OnTimeout','src_span'(60,19,60,28,1566,9),'Ident (Prolog Variable)').
'symbol'('Cont3','Cont','src_span'(62,5,62,9,1589,4),'Funktion or Process').
'symbol'('is_done','is_done','src_span'(62,10,62,17,1594,7),'Ident (Prolog Variable)').
'symbol'('NCPreOb','NCPreOb','src_span'(67,1,67,8,1732,7),'Ident (Groundrep.)').
'symbol'('NCPreProhib','NCPreProhib','src_span'(70,1,70,12,1819,11),'Ident (Groundrep.)').
'symbol'('CPreRule','CPreRule','src_span'(73,1,73,9,1926,8),'Ident (Groundrep.)').
'symbol'('CNonPreRule','CNonPreRule','src_span'(75,1,75,12,1964,11),'Ident (Groundrep.)').
'symbol'('MAIN','MAIN','src_span'(77,1,77,5,2008,4),'Ident (Groundrep.)').
'symbol'('Procs','Procs','src_span'(79,5,79,10,2025,5),'Ident (Groundrep.)').
'symbol'('P','P','src_span'(92,17,92,18,2519,1),'Ident (Prolog Variable)').