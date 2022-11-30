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
'bindval'('Tic','prefix'('src_span'(23,7,23,10,425,3),[],'tic','val_of'('Tic','src_span'(23,14,23,17,432,3)),'src_span'(23,11,23,13,428,10)),'src_span'(23,1,23,17,419,16)).
'agent'('Rule'(_RuleInstance),'lambda'([_rule_name,_evnt,_evnt_timer],'let'(['bindval'('Trigger','repChoice'(['comprehensionGenerator'(_trigger,'closure'(['dotTuple'(['trigger_rule',_rule_name])]))],'prefix'('src_span'(31,57,31,64,734,7),[],_trigger,'val_of'('Trigger','src_span'(31,68,31,75,745,7)),'src_span'(31,65,31,67,741,18)),'src_span'(31,18,31,56,695,38)),'src_span'(31,5,31,75,682,70)),'bindval'('Go','[]'('prefix'('src_span'(34,7,34,10,769,3),[],'tic','val_of'('Go','src_span'(34,14,34,16,776,2)),'src_span'(34,11,34,13,772,9)),'prefix'('src_span'(35,7,35,19,788,12),['out'(_rule_name),'in'(_actor)],'trigger_rule',';'('/\x5c\'('|||'('agent_call'('src_span'(36,11,36,23,832,12),_RuleInstance,[_actor,_evnt,_evnt_timer]),'val_of'('Trigger','src_span'(36,53,36,60,874,7)),'src_span_operator'('no_loc_info_available','src_span'(36,49,36,52,870,3))),'prefix'('src_span'(37,14,37,28,896,14),['out'(_rule_name)],'interrupt_rule','skip'('src_span'(37,42,37,46,924,4)),'src_span'(37,39,37,41,920,18)),'src_span_operator'('no_loc_info_available','src_span'(37,11,37,13,893,2))),'val_of'('Go','src_span'(38,9,38,11,939,2)),'src_span_operator'('no_loc_info_available','src_span'(37,47,37,48,929,1))),'src_span'(35,36,35,38,816,139)),'src_span_operator'('no_loc_info_available','src_span'(34,17,34,19,779,2))),'src_span'(33,5,39,8,758,191))],'val_of'('Go','src_span'(41,5,41,7,963,2)))),'src_span'(28,22,41,7,605,360)).
'agent'('PreAchvI'(_Cont),'lambda'([_actor2,_evnt2,_initial_evnt_timer],'&'('>='(_initial_evnt_timer,'int'(0)),'let'(['agent'('Go2'(_evnt_timer2),'ifte'('<'(_evnt_timer2,'int'(0)),'prefix'('src_span'(49,11,49,15,1157,4),['out'('false'),'out'(_actor2)],_evnt2,'agent_call'('src_span'(49,31,49,35,1177,4),_Cont,['false']),'src_span'(49,28,49,30,1173,21)),'[]'('prefix'('src_span'(51,11,51,15,1212,4),['out'('true'),'out'(_actor2)],_evnt2,'agent_call'('src_span'(51,30,51,34,1231,4),_Cont,['true']),'src_span'(51,27,51,29,1227,20)),'prefix'('src_span'(52,11,52,14,1255,3),[],'tic','agent_call'('src_span'(52,18,52,20,1262,2),'Go2',['-'(_evnt_timer2,'int'(1))]),'src_span'(52,15,52,17,1258,25)),'src_span_operator'('no_loc_info_available','src_span'(51,41,51,43,1242,2))),'no_loc_info_available','no_loc_info_available','no_loc_info_available'),'src_span'(48,9,52,36,1124,156))],'agent_call'('src_span'(54,7,54,9,1298,2),'Go2',[_initial_evnt_timer])))),'src_span'(44,18,54,29,1020,300)).
'agent'('NonPreAchvI'(_Cont2),'lambda'([_actor3,_evnt3,_initial_evnt_timer2],'&'('>='(_initial_evnt_timer2,'int'(0)),'let'(['agent'('Go3'(_evnt_timer3),'ifte'('=='(_evnt_timer3,'int'(0)),'[]'('prefix'('src_span'(62,11,62,15,1519,4),['out'('true'),'out'(_actor3)],_evnt3,'agent_call'('src_span'(62,30,62,34,1538,4),_Cont2,['true']),'src_span'(62,27,62,29,1534,20)),'prefix'('src_span'(63,14,63,17,1562,3),[],'tic','prefix'('src_span'(63,21,63,25,1569,4),['out'('false'),'out'(_actor3)],_evnt3,'agent_call'('src_span'(63,41,63,45,1589,4),_Cont2,['false']),'src_span'(63,38,63,40,1585,21)),'src_span'(63,18,63,20,1565,38)),'src_span_operator'('no_loc_info_available','src_span'(63,11,63,13,1559,2))),'prefix'('src_span'(65,11,65,14,1624,3),[],'tic','agent_call'('src_span'(65,18,65,20,1631,2),'Go3',['-'(_evnt_timer3,'int'(1))]),'src_span'(65,15,65,17,1627,25)),'no_loc_info_available','no_loc_info_available','no_loc_info_available'),'src_span'(61,9,65,36,1485,164))],'agent_call'('src_span'(67,7,67,9,1667,2),'Go3',[_initial_evnt_timer2])))),'src_span'(57,21,67,29,1382,307)).
'agent'('NCPreRule'(_OnDone,_OnTimeout),'let'(['agent'('Cont3'(_is_done),'ifte'(_is_done,_OnDone,_OnTimeout,'src_span'(72,21,72,31,1797,10),'src_span'(72,32,72,36,1807,19),'src_span'(72,44,72,48,1819,21)),'src_span'(72,21,72,58,1797,37))],'agent_call'('src_span'(74,5,74,9,1848,4),'Rule',['agent_call'('src_span'(74,10,74,18,1853,8),'PreAchvI',['Cont3'])])),'src_span'(71,3,74,25,1773,95)).
'bindval'('NCPreOb','agent_call'('src_span'(77,11,77,20,1934,9),'NCPreRule',['val_of'('Tic','src_span'(77,21,77,24,1944,3)),'stop'('src_span'(77,26,77,30,1949,4))]),'src_span'(77,1,77,31,1924,30)).
'bindval'('NCPreProhib','agent_call'('src_span'(80,15,80,24,2025,9),'NCPreRule',['stop'('src_span'(80,25,80,29,2035,4)),'val_of'('Tic','src_span'(80,31,80,34,2041,3))]),'src_span'(80,1,80,35,2011,34)).
'bindval'('CPreRule','agent_call'('src_span'(83,12,83,16,2129,4),'Rule',['agent_call'('src_span'(83,17,83,25,2134,8),'PreAchvI',['lambda'([_],'val_of'('Tic','src_span'(83,32,83,35,2149,3)))])]),'src_span'(83,1,83,37,2118,36)).
'bindval'('MAIN','let'(['bindval'('Procs','setExp'('rangeEnum'(['val_of'('Tic','src_span'(88,7,88,10,2189,3)),'agent_call'('src_span'(89,7,89,14,2200,7),'val_of'('NCPreOb','src_span'(89,7,89,14,2200,7)),['Assessment','assess','int'(30)]),'agent_call'('src_span'(90,7,90,14,2239,7),'val_of'('NCPreOb','src_span'(90,7,90,14,2239,7)),['NotifyPdpc','notify_pdpc','int'(3)]),'agent_call'('src_span'(91,7,91,14,2282,7),'val_of'('NCPreOb','src_span'(91,7,91,14,2282,7)),['NotifyIndiv','notify_indiv','int'(3)]),'agent_call'('src_span'(92,7,92,15,2327,8),'val_of'('CPreRule','src_span'(92,7,92,15,2327,8)),['ProhibitNotifyIndiv','prohibit_notify_indiv','int'(5)])])),'src_span'(87,5,93,6,2173,215))],'procRepSharing'('setExp'('rangeEnum'(['tic'])),['comprehensionGenerator'(_P,'val_of'('Procs','src_span'(95,21,95,26,2418,5)))],_P,'src_span'(95,17,95,28,2414,11))),'src_span'(85,1,95,30,2156,271)).
'comment'('lineComment'('-- datatype Ord = GT | LT | EQ'),'src_position'(1,1,0,30)).
'comment'('lineComment'('-- compare(x, y) ='),'src_position'(3,1,32,18)).
'comment'('lineComment'('--   if x < y then'),'src_position'(4,1,51,18)).
'comment'('lineComment'('--     GT'),'src_position'(5,1,70,9)).
'comment'('lineComment'('--   else if x > y then '),'src_position'(6,1,80,24)).
'comment'('lineComment'('--     LT'),'src_position'(7,1,105,9)).
'comment'('lineComment'('--   else'),'src_position'(8,1,115,9)).
'comment'('lineComment'('--   EQ'),'src_position'(9,1,125,7)).
'comment'('lineComment'('-- Master process for rules.'),'src_position'(25,1,437,28)).
'comment'('lineComment'('-- This is parameterized over RuleInstance, which is a process containing a'),'src_position'(26,1,466,75)).
'comment'('lineComment'('-- timer mechanism for the related event.'),'src_position'(27,1,542,41)).
'comment'('lineComment'('-- Soak up aditional triggers.'),'src_position'(30,5,647,30)).
'comment'('lineComment'('-- Preemptive achievement instance.'),'src_position'(43,1,967,35)).
'comment'('lineComment'('-- Non-preemptive achievement instance.'),'src_position'(56,1,1322,39)).
'comment'('lineComment'('-- Template for non-compensable preemptive rule.'),'src_position'(69,1,1691,48)).
'comment'('lineComment'('-- Non-compensable preemptive achievement obligation.'),'src_position'(76,1,1870,53)).
'comment'('lineComment'('-- Non-compensable preemptive achievement prohibition.'),'src_position'(79,1,1956,54)).
'comment'('lineComment'('-- Compensable, pre-emptive obligations, prohibitions and permissions.'),'src_position'(82,1,2047,70)).
'symbol'('Actor','Actor','src_span'(11,10,11,15,143,5),'Datatype').
'symbol'('org','org','src_span'(11,18,11,21,151,3),'Constructor of Datatype').
'symbol'('indiv','indiv','src_span'(11,24,11,29,157,5),'Constructor of Datatype').
'symbol'('pdpc','pdpc','src_span'(11,32,11,36,165,4),'Constructor of Datatype').
'symbol'('RuleName','RuleName','src_span'(13,10,13,18,180,8),'Datatype').
'symbol'('Assessment','Assessment','src_span'(14,3,14,13,193,10),'Constructor of Datatype').
'symbol'('NotifyPdpc','NotifyPdpc','src_span'(14,16,14,26,206,10),'Constructor of Datatype').
'symbol'('NotifyIndiv','NotifyIndiv','src_span'(14,29,14,40,219,11),'Constructor of Datatype').
'symbol'('ProhibitNotifyIndiv','ProhibitNotifyIndiv','src_span'(14,43,14,62,233,19),'Constructor of Datatype').
'symbol'('trigger_rule','trigger_rule','src_span'(16,9,16,21,262,12),'Channel').
'symbol'('interrupt_rule','interrupt_rule','src_span'(17,9,17,23,300,14),'Channel').
'symbol'('assess','assess','src_span'(19,9,19,15,335,6),'Channel').
'symbol'('notify_pdpc','notify_pdpc','src_span'(19,17,19,28,343,11),'Channel').
'symbol'('notify_indiv','notify_indiv','src_span'(19,30,19,42,356,12),'Channel').
'symbol'('prohibit_notify_indiv','prohibit_notify_indiv','src_span'(19,44,19,65,370,21),'Channel').
'symbol'('tic','tic','src_span'(21,9,21,12,414,3),'Channel').
'symbol'('Tic','Tic','src_span'(23,1,23,4,419,3),'Ident (Groundrep.)').
'symbol'('Rule','Rule','src_span'(28,1,28,5,584,4),'Funktion or Process').
'symbol'('RuleInstance','RuleInstance','src_span'(28,6,28,18,589,12),'Ident (Prolog Variable)').
'symbol'('rule_name','rule_name','src_span'(28,24,28,33,607,9),'Ident (Prolog Variable)').
'symbol'('evnt','evnt','src_span'(28,35,28,39,618,4),'Ident (Prolog Variable)').
'symbol'('evnt_timer','evnt_timer','src_span'(28,41,28,51,624,10),'Ident (Prolog Variable)').
'symbol'('Trigger','Trigger','src_span'(31,5,31,12,682,7),'Ident (Groundrep.)').
'symbol'('trigger','trigger','src_span'(31,18,31,25,695,7),'Ident (Prolog Variable)').
'symbol'('Go','Go','src_span'(33,5,33,7,758,2),'Ident (Groundrep.)').
'symbol'('actor','actor','src_span'(35,30,35,35,811,5),'Ident (Prolog Variable)').
'symbol'('PreAchvI','PreAchvI','src_span'(44,1,44,9,1003,8),'Funktion or Process').
'symbol'('Cont','Cont','src_span'(44,10,44,14,1012,4),'Ident (Prolog Variable)').
'symbol'('actor2','actor','src_span'(44,20,44,25,1022,5),'Ident (Prolog Variable)').
'symbol'('evnt2','evnt','src_span'(44,27,44,31,1029,4),'Ident (Prolog Variable)').
'symbol'('initial_evnt_timer','initial_evnt_timer','src_span'(44,33,44,51,1035,18),'Ident (Prolog Variable)').
'symbol'('Go2','Go','src_span'(47,7,47,9,1099,2),'Funktion or Process').
'symbol'('evnt_timer2','evnt_timer','src_span'(47,10,47,20,1102,10),'Ident (Prolog Variable)').
'symbol'('NonPreAchvI','NonPreAchvI','src_span'(57,1,57,12,1362,11),'Funktion or Process').
'symbol'('Cont2','Cont','src_span'(57,13,57,17,1374,4),'Ident (Prolog Variable)').
'symbol'('actor3','actor','src_span'(57,23,57,28,1384,5),'Ident (Prolog Variable)').
'symbol'('evnt3','evnt','src_span'(57,30,57,34,1391,4),'Ident (Prolog Variable)').
'symbol'('initial_evnt_timer2','initial_evnt_timer','src_span'(57,36,57,54,1397,18),'Ident (Prolog Variable)').
'symbol'('Go3','Go','src_span'(60,7,60,9,1460,2),'Funktion or Process').
'symbol'('evnt_timer3','evnt_timer','src_span'(60,10,60,20,1463,10),'Ident (Prolog Variable)').
'symbol'('NCPreRule','NCPreRule','src_span'(70,1,70,10,1740,9),'Funktion or Process').
'symbol'('OnDone','OnDone','src_span'(70,11,70,17,1750,6),'Ident (Prolog Variable)').
'symbol'('OnTimeout','OnTimeout','src_span'(70,19,70,28,1758,9),'Ident (Prolog Variable)').
'symbol'('Cont3','Cont','src_span'(72,5,72,9,1781,4),'Funktion or Process').
'symbol'('is_done','is_done','src_span'(72,10,72,17,1786,7),'Ident (Prolog Variable)').
'symbol'('NCPreOb','NCPreOb','src_span'(77,1,77,8,1924,7),'Ident (Groundrep.)').
'symbol'('NCPreProhib','NCPreProhib','src_span'(80,1,80,12,2011,11),'Ident (Groundrep.)').
'symbol'('CPreRule','CPreRule','src_span'(83,1,83,9,2118,8),'Ident (Groundrep.)').
'symbol'('MAIN','MAIN','src_span'(85,1,85,5,2156,4),'Ident (Groundrep.)').
'symbol'('Procs','Procs','src_span'(87,5,87,10,2173,5),'Ident (Groundrep.)').
'symbol'('P','P','src_span'(95,17,95,18,2414,1),'Ident (Prolog Variable)').