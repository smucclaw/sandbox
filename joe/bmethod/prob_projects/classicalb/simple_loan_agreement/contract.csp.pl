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
'agent'('Rule'(_RuleInstance),'lambda'([_rule_name,_evnt,_evnt_timer],'let'(['bindval'('Trigger','repChoice'(['comprehensionGenerator'(_trigger,'closure'(['dotTuple'(['trigger_rule',_rule_name])]))],'prefix'('src_span'(22,57,22,64,578,7),[],_trigger,'val_of'('Trigger','src_span'(22,68,22,75,589,7)),'src_span'(22,65,22,67,585,18)),'src_span'(22,18,22,56,539,38)),'src_span'(22,5,22,75,526,70)),'bindval'('Go','[]'('prefix'('src_span'(25,7,25,10,613,3),[],'tic','val_of'('Go','src_span'(25,14,25,16,620,2)),'src_span'(25,11,25,13,616,9)),'prefix'('src_span'(26,7,26,19,632,12),['out'(_rule_name),'in'(_actor)],'trigger_rule',';'('/\x5c\'('|||'('agent_call'('src_span'(27,11,27,23,676,12),_RuleInstance,[_actor,_evnt,_evnt_timer]),'val_of'('Trigger','src_span'(27,53,27,60,718,7)),'src_span_operator'('no_loc_info_available','src_span'(27,49,27,52,714,3))),'prefix'('src_span'(28,14,28,28,740,14),['out'(_rule_name)],'interrupt_rule','skip'('src_span'(28,42,28,46,768,4)),'src_span'(28,39,28,41,764,18)),'src_span_operator'('no_loc_info_available','src_span'(28,11,28,13,737,2))),'val_of'('Go','src_span'(29,9,29,11,783,2)),'src_span_operator'('no_loc_info_available','src_span'(28,47,28,48,773,1))),'src_span'(26,36,26,38,660,139)),'src_span_operator'('no_loc_info_available','src_span'(25,17,25,19,623,2))),'src_span'(24,5,30,8,602,191))],'val_of'('Go','src_span'(32,5,32,7,807,2)))),'src_span'(20,22,32,7,484,325)).
'agent'('PreAchvI'(_Cont),'lambda'([_actor2,_evnt2,_initial_evnt_timer],'&'('>='(_initial_evnt_timer,'int'(0)),'let'(['agent'('Go2'(_evnt_timer2),'ifte'('<'(_evnt_timer2,'int'(0)),'prefix'('src_span'(40,11,40,15,1001,4),['out'('false'),'out'(_actor2)],_evnt2,'agent_call'('src_span'(40,31,40,35,1021,4),_Cont,['false']),'src_span'(40,28,40,30,1017,21)),'[]'('prefix'('src_span'(42,11,42,15,1058,4),['out'('true'),'out'(_actor2)],_evnt2,'agent_call'('src_span'(42,30,42,34,1077,4),_Cont,['true']),'src_span'(42,27,42,29,1073,20)),'prefix'('src_span'(43,11,43,14,1101,3),[],'tic','agent_call'('src_span'(43,18,43,20,1108,2),'Go2',['-'(_evnt_timer2,'int'(1))]),'src_span'(43,15,43,17,1104,25)),'src_span_operator'('no_loc_info_available','src_span'(42,41,42,43,1088,2))),'no_loc_info_available','no_loc_info_available','src_span'(40,43,41,13,1032,135)),'src_span'(39,9,44,10,968,168))],'agent_call'('src_span'(46,7,46,9,1154,2),'Go2',[_initial_evnt_timer])))),'src_span'(35,18,46,29,864,312)).
'agent'('NonPreAchvI'(_Cont2),'lambda'([_actor3,_evnt3,_initial_evnt_timer2],'&'('>='(_initial_evnt_timer2,'int'(0)),'let'(['agent'('Go3'(_evnt_timer3),'ifte'('=='(_evnt_timer3,'int'(0)),'[]'('prefix'('src_span'(54,11,54,15,1375,4),['out'('true'),'out'(_actor3)],_evnt3,'agent_call'('src_span'(54,30,54,34,1394,4),_Cont2,['true']),'src_span'(54,27,54,29,1390,20)),'prefix'('src_span'(55,14,55,17,1418,3),[],'tic','prefix'('src_span'(55,21,55,25,1425,4),['out'('false'),'out'(_actor3)],_evnt3,'agent_call'('src_span'(55,41,55,45,1445,4),_Cont2,['false']),'src_span'(55,38,55,40,1441,21)),'src_span'(55,18,55,20,1421,38)),'src_span_operator'('no_loc_info_available','src_span'(55,11,55,13,1415,2))),'prefix'('src_span'(57,11,57,14,1480,3),[],'tic','agent_call'('src_span'(57,18,57,20,1487,2),'Go3',['-'(_evnt_timer3,'int'(1))]),'src_span'(57,15,57,17,1483,25)),'no_loc_info_available','no_loc_info_available','no_loc_info_available'),'src_span'(53,9,57,36,1341,164))],'agent_call'('src_span'(59,7,59,9,1523,2),'Go3',[_initial_evnt_timer2])))),'src_span'(49,21,59,29,1238,307)).
'agent'('NCPreRule'(_OnDone,_OnTimeout),'let'(['agent'('Cont3'(_is_done),'ifte'(_is_done,_OnDone,_OnTimeout,'src_span'(64,21,64,31,1653,10),'src_span'(64,32,64,36,1663,19),'src_span'(64,44,64,48,1675,21)),'src_span'(64,21,64,58,1653,37))],'agent_call'('src_span'(66,5,66,9,1704,4),'Rule',['agent_call'('src_span'(66,10,66,18,1709,8),'PreAchvI',['Cont3'])])),'src_span'(63,3,66,25,1629,95)).
'bindval'('NCPreOb','agent_call'('src_span'(69,11,69,20,1790,9),'NCPreRule',['val_of'('Tic','src_span'(69,21,69,24,1800,3)),'stop'('src_span'(69,26,69,30,1805,4))]),'src_span'(69,1,69,31,1780,30)).
'bindval'('NCPreProhib','agent_call'('src_span'(72,15,72,24,1881,9),'NCPreRule',['stop'('src_span'(72,25,72,29,1891,4)),'val_of'('Tic','src_span'(72,31,72,34,1897,3))]),'src_span'(72,1,72,35,1867,34)).
'bindval'('CPreRule','agent_call'('src_span'(75,12,75,16,1985,4),'Rule',['agent_call'('src_span'(75,17,75,25,1990,8),'PreAchvI',['lambda'([_],'val_of'('Tic','src_span'(75,32,75,35,2005,3)))])]),'src_span'(75,1,75,37,1974,36)).
'bindval'('CNonPreRule','agent_call'('src_span'(77,15,77,19,2026,4),'Rule',['agent_call'('src_span'(77,20,77,31,2031,11),'NonPreAchvI',['lambda'([_],'val_of'('Tic','src_span'(77,38,77,41,2049,3)))])]),'src_span'(77,1,77,43,2012,42)).
'bindval'('MAIN','let'(['bindval'('Procs','setExp'('rangeEnum'(['val_of'('Tic','src_span'(82,7,82,10,2089,3)),'agent_call'('src_span'(83,7,83,15,2100,8),'val_of'('CPreRule','src_span'(83,7,83,15,2100,8)),['RequestPrincipal','request_principal','int'(1)]),'agent_call'('src_span'(84,7,84,14,2156,7),'val_of'('NCPreOb','src_span'(84,7,84,14,2156,7)),['SendPrincipal','send_principal','int'(1)]),'agent_call'('src_span'(85,7,85,18,2205,11),'val_of'('CNonPreRule','src_span'(85,7,85,18,2205,11)),['Payment1','pay1','int'(365)]),'agent_call'('src_span'(86,7,86,18,2245,11),'val_of'('CNonPreRule','src_span'(86,7,86,18,2245,11)),['Payment2','pay2','int'(365)]),'agent_call'('src_span'(87,7,87,15,2285,8),'val_of'('CPreRule','src_span'(87,7,87,15,2285,8)),['EventOfDefault','event_of_default','int'(730)]),'agent_call'('src_span'(89,7,89,15,2369,8),'val_of'('CPreRule','src_span'(89,7,89,15,2369,8)),['NotifyBorrower','notify_borrower','int'(3)]),'agent_call'('src_span'(92,7,92,15,2505,8),'val_of'('CPreRule','src_span'(92,7,92,15,2505,8)),['CureDefault','cure_default','int'(2)]),'agent_call'('src_span'(93,7,93,14,2551,7),'val_of'('NCPreOb','src_span'(93,7,93,14,2551,7)),['PayAccelerated','pay_accelerated','int'(1)])])),'src_span'(81,5,94,6,2073,527))],'procRepSharing'('setExp'('rangeEnum'(['tic'])),['comprehensionGenerator'(_P,'val_of'('Procs','src_span'(96,21,96,26,2630,5)))],_P,'src_span'(96,17,96,28,2626,11))),'src_span'(79,1,96,30,2056,583)).
'comment'('lineComment'('-- Preemptive achievement instance.'),'src_position'(34,1,811,35)).
'comment'('lineComment'('-- Non-preemptive achievement instance.'),'src_position'(48,1,1178,39)).
'comment'('lineComment'('-- Template for non-compensable preemptive rule.'),'src_position'(61,1,1547,48)).
'comment'('lineComment'('-- Non-compensable preemptive achievement obligation.'),'src_position'(68,1,1726,53)).
'comment'('lineComment'('-- Non-compensable preemptive achievement prohibition.'),'src_position'(71,1,1812,54)).
'comment'('lineComment'('-- Compensable, pre-emptive obligations, prohibitions and permissions.'),'src_position'(74,1,1903,70)).
'comment'('lineComment'('-- May notify borrower'),'src_position'(88,7,2340,22)).
'comment'('lineComment'('-- Must notify borrower'),'src_position'(90,7,2421,23)).
'comment'('lineComment'('-- NCPreOb(NotifyBorrower, notify_borrower, 3),'),'src_position'(91,7,2451,47)).
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
'symbol'('PreAchvI','PreAchvI','src_span'(35,1,35,9,847,8),'Funktion or Process').
'symbol'('Cont','Cont','src_span'(35,10,35,14,856,4),'Ident (Prolog Variable)').
'symbol'('actor2','actor','src_span'(35,20,35,25,866,5),'Ident (Prolog Variable)').
'symbol'('evnt2','evnt','src_span'(35,27,35,31,873,4),'Ident (Prolog Variable)').
'symbol'('initial_evnt_timer','initial_evnt_timer','src_span'(35,33,35,51,879,18),'Ident (Prolog Variable)').
'symbol'('Go2','Go','src_span'(38,7,38,9,943,2),'Funktion or Process').
'symbol'('evnt_timer2','evnt_timer','src_span'(38,10,38,20,946,10),'Ident (Prolog Variable)').
'symbol'('NonPreAchvI','NonPreAchvI','src_span'(49,1,49,12,1218,11),'Funktion or Process').
'symbol'('Cont2','Cont','src_span'(49,13,49,17,1230,4),'Ident (Prolog Variable)').
'symbol'('actor3','actor','src_span'(49,23,49,28,1240,5),'Ident (Prolog Variable)').
'symbol'('evnt3','evnt','src_span'(49,30,49,34,1247,4),'Ident (Prolog Variable)').
'symbol'('initial_evnt_timer2','initial_evnt_timer','src_span'(49,36,49,54,1253,18),'Ident (Prolog Variable)').
'symbol'('Go3','Go','src_span'(52,7,52,9,1316,2),'Funktion or Process').
'symbol'('evnt_timer3','evnt_timer','src_span'(52,10,52,20,1319,10),'Ident (Prolog Variable)').
'symbol'('NCPreRule','NCPreRule','src_span'(62,1,62,10,1596,9),'Funktion or Process').
'symbol'('OnDone','OnDone','src_span'(62,11,62,17,1606,6),'Ident (Prolog Variable)').
'symbol'('OnTimeout','OnTimeout','src_span'(62,19,62,28,1614,9),'Ident (Prolog Variable)').
'symbol'('Cont3','Cont','src_span'(64,5,64,9,1637,4),'Funktion or Process').
'symbol'('is_done','is_done','src_span'(64,10,64,17,1642,7),'Ident (Prolog Variable)').
'symbol'('NCPreOb','NCPreOb','src_span'(69,1,69,8,1780,7),'Ident (Groundrep.)').
'symbol'('NCPreProhib','NCPreProhib','src_span'(72,1,72,12,1867,11),'Ident (Groundrep.)').
'symbol'('CPreRule','CPreRule','src_span'(75,1,75,9,1974,8),'Ident (Groundrep.)').
'symbol'('CNonPreRule','CNonPreRule','src_span'(77,1,77,12,2012,11),'Ident (Groundrep.)').
'symbol'('MAIN','MAIN','src_span'(79,1,79,5,2056,4),'Ident (Groundrep.)').
'symbol'('Procs','Procs','src_span'(81,5,81,10,2073,5),'Ident (Groundrep.)').
'symbol'('P','P','src_span'(96,17,96,18,2626,1),'Ident (Prolog Variable)').