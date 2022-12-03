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
'bindval'('Tic','prefix'('src_span'(13,7,13,10,291,3),[],'tic','val_of'('Tic','src_span'(13,14,13,17,298,3)),'src_span'(13,11,13,13,294,10)),'src_span'(13,1,13,17,285,16)).
'agent'('Rule'(_RuleInstance),'lambda'([_rule_name,_evnt,_evnt_timer],'let'(['bindval'('Trigger','repChoice'(['comprehensionGenerator'(_trigger,'closure'(['dotTuple'(['trigger_rule',_rule_name])]))],'prefix'('src_span'(21,57,21,64,600,7),[],_trigger,'val_of'('Trigger','src_span'(21,68,21,75,611,7)),'src_span'(21,65,21,67,607,18)),'src_span'(21,18,21,56,561,38)),'src_span'(21,5,21,75,548,70)),'bindval'('Go','[]'('prefix'('src_span'(24,7,24,10,635,3),[],'tic','val_of'('Go','src_span'(24,14,24,16,642,2)),'src_span'(24,11,24,13,638,9)),'prefix'('src_span'(25,7,25,19,654,12),['out'(_rule_name),'in'(_actor)],'trigger_rule','exception'('setExp'('rangeEnum'(['dotTuple'([_evnt,'true',_actor]),'dotTuple'([_evnt,'false',_actor])])),'|||'('agent_call'('src_span'(26,10,26,22,697,12),_RuleInstance,[_actor,_evnt,_evnt_timer]),'val_of'('Trigger','src_span'(26,52,26,59,739,7)),'src_span_operator'('no_loc_info_available','src_span'(26,48,26,51,735,3))),'val_of'('Go','src_span'(27,51,27,53,798,2)),'src_span'(27,9,27,50,756,41)),'src_span'(25,36,25,38,682,132)),'src_span_operator'('no_loc_info_available','src_span'(24,17,24,19,645,2))),'src_span'(23,5,28,8,624,184))],'/\x5c\'('val_of'('Go','src_span'(30,5,30,7,822,2)),'prefix'('src_span'(30,11,30,25,828,14),['out'(_rule_name)],'interrupt_rule','val_of'('Go','src_span'(30,39,30,41,856,2)),'src_span'(30,36,30,38,852,16)),'src_span_operator'('no_loc_info_available','src_span'(30,8,30,10,825,2))))),'src_span'(18,22,30,41,471,387)).
'bindval'('PreAchvI','lambda'([_actor2,_evnt2,_initial_evnt_timer],'&'('>='(_initial_evnt_timer,'int'(0)),'let'(['agent'('Go2'(_evnt_timer2),'ifte'('<'(_evnt_timer2,'int'(0)),'prefix'('src_span'(38,11,38,15,1044,4),['out'('false'),'out'(_actor2)],_evnt2,'skip'('src_span'(38,31,38,35,1064,4)),'src_span'(38,28,38,30,1060,14)),'[]'('prefix'('src_span'(40,11,40,15,1092,4),['out'('true'),'out'(_actor2)],_evnt2,'skip'('src_span'(40,30,40,34,1111,4)),'src_span'(40,27,40,29,1107,14)),'prefix'('src_span'(41,11,41,14,1129,3),[],'tic','agent_call'('src_span'(41,18,41,20,1136,2),'Go2',['-'(_evnt_timer2,'int'(1))]),'src_span'(41,15,41,17,1132,25)),'src_span_operator'('no_loc_info_available','src_span'(40,35,40,37,1116,2))),'no_loc_info_available','no_loc_info_available','no_loc_info_available'),'src_span'(37,9,41,36,1011,143))],'agent_call'('src_span'(43,7,43,9,1172,2),'Go2',[_initial_evnt_timer])))),'src_span'(33,1,43,29,896,298)).
'bindval'('NonPreAchvI','lambda'([_actor3,_evnt3,_initial_evnt_timer2],'&'('>='(_initial_evnt_timer2,'int'(0)),'let'(['agent'('Go3'(_evnt_timer3),'ifte'('=='(_evnt_timer3,'int'(0)),'[]'('prefix'('src_span'(51,11,51,15,1387,4),['out'('true'),'out'(_actor3)],_evnt3,'skip'('src_span'(51,30,51,34,1406,4)),'src_span'(51,27,51,29,1402,14)),'prefix'('src_span'(52,14,52,17,1424,3),[],'tic','prefix'('src_span'(52,21,52,25,1431,4),['out'('false'),'out'(_actor3)],_evnt3,'skip'('src_span'(52,41,52,45,1451,4)),'src_span'(52,38,52,40,1447,14)),'src_span'(52,18,52,20,1427,31)),'src_span_operator'('no_loc_info_available','src_span'(52,11,52,13,1421,2))),'prefix'('src_span'(54,11,54,14,1479,3),[],'tic','agent_call'('src_span'(54,18,54,20,1486,2),'Go3',['-'(_evnt_timer3,'int'(1))]),'src_span'(54,15,54,17,1482,25)),'no_loc_info_available','no_loc_info_available','no_loc_info_available'),'src_span'(50,9,54,36,1353,151))],'agent_call'('src_span'(56,7,56,9,1522,2),'Go3',[_initial_evnt_timer2])))),'src_span'(46,1,56,29,1236,308)).
'bindval'('PreRule','agent_call'('src_span'(75,11,75,15,2091,4),'Rule',['val_of'('PreAchvI','src_span'(75,16,75,24,2096,8))]),'src_span'(75,1,75,25,2081,24)).
'bindval'('NonPreRule','agent_call'('src_span'(76,14,76,18,2119,4),'Rule',['val_of'('NonPreAchvI','src_span'(76,19,76,30,2124,11))]),'src_span'(76,1,76,31,2106,30)).
'bindval'('Rules','setExp'('rangeEnum'(['agent_call'('src_span'(79,3,79,10,2150,7),'val_of'('PreRule','src_span'(79,3,79,10,2150,7)),['Assessment','assess','int'(30)]),'agent_call'('src_span'(80,3,80,10,2185,7),'val_of'('PreRule','src_span'(80,3,80,10,2185,7)),['NotifyPdpc','notify_pdpc','int'(3)]),'agent_call'('src_span'(81,3,81,10,2224,7),'val_of'('PreRule','src_span'(81,3,81,10,2224,7)),['NotifyIndiv','notify_indiv','int'(3)]),'agent_call'('src_span'(82,3,82,10,2265,7),'val_of'('PreRule','src_span'(82,3,82,10,2265,7)),['ProhibitNotifyIndiv','prohibit_notify_indiv','int'(5)])])),'src_span'(78,1,83,2,2138,183)).
'bindval'('MAIN','procRepSharing'('setExp'('rangeEnum'(['tic'])),['comprehensionGenerator'(_P,'agent_call'('src_span'(85,24,85,29,2346,5),'union',['val_of'('Rules','src_span'(85,30,85,35,2352,5)),'setExp'('rangeEnum'(['val_of'('Tic','src_span'(85,38,85,41,2360,3))]))]))],_P,'src_span'(85,20,85,45,2342,25)),'src_span'(85,1,85,47,2323,46)).
'comment'('lineComment'('-- Master process for rules.'),'src_position'(15,1,303,28)).
'comment'('lineComment'('-- This is parameterized over RuleInstance, which is a process containing a'),'src_position'(16,1,332,75)).
'comment'('lineComment'('-- timer mechanism for the related event.'),'src_position'(17,1,408,41)).
'comment'('lineComment'('-- Soak up aditional triggers.'),'src_position'(20,5,513,30)).
'comment'('lineComment'('-- Preemptive achievement instance.'),'src_position'(32,1,860,35)).
'comment'('lineComment'('-- Non-preemptive achievement instance.'),'src_position'(45,1,1196,39)).
'comment'('lineComment'('-- Template for non-compensable preemptive rule.'),'src_position'(58,1,1546,48)).
'comment'('lineComment'('-- NCPreRule(OnDone, OnTimeout) ='),'src_position'(59,1,1595,33)).
'comment'('lineComment'('--   let'),'src_position'(60,1,1629,8)).
'comment'('lineComment'('--     Cont(is_done) = if is_done then OnDone else OnTimeout'),'src_position'(61,1,1638,60)).
'comment'('lineComment'('--   within'),'src_position'(62,1,1699,11)).
'comment'('lineComment'('--     Rule(PreAchvI(Cont))'),'src_position'(63,1,1711,27)).
'comment'('lineComment'('-- Non-compensable preemptive achievement obligation.'),'src_position'(65,1,1740,53)).
'comment'('lineComment'('-- NCPreOb = NCPreRule(Tic, STOP)'),'src_position'(66,1,1794,33)).
'comment'('lineComment'('-- Non-compensable preemptive achievement prohibition.'),'src_position'(68,1,1829,54)).
'comment'('lineComment'('-- NCPreProhib = NCPreRule(STOP, Tic)'),'src_position'(69,1,1884,37)).
'comment'('lineComment'('-- Compensable, pre-emptive obligations, prohibitions and permissions.'),'src_position'(71,1,1923,70)).
'comment'('lineComment'('-- CPreRule = Rule(PreAchvI(\x5c\ _ @ Tic))'),'src_position'(72,1,1994,39)).
'comment'('lineComment'('-- Pre-emptive and non-pre-emptive instances.'),'src_position'(74,1,2035,45)).
'symbol'('Actor','Actor','src_span'(1,10,1,15,9,5),'Datatype').
'symbol'('org','org','src_span'(1,18,1,21,17,3),'Constructor of Datatype').
'symbol'('indiv','indiv','src_span'(1,24,1,29,23,5),'Constructor of Datatype').
'symbol'('pdpc','pdpc','src_span'(1,32,1,36,31,4),'Constructor of Datatype').
'symbol'('RuleName','RuleName','src_span'(3,10,3,18,46,8),'Datatype').
'symbol'('Assessment','Assessment','src_span'(4,3,4,13,59,10),'Constructor of Datatype').
'symbol'('NotifyPdpc','NotifyPdpc','src_span'(4,16,4,26,72,10),'Constructor of Datatype').
'symbol'('NotifyIndiv','NotifyIndiv','src_span'(4,29,4,40,85,11),'Constructor of Datatype').
'symbol'('ProhibitNotifyIndiv','ProhibitNotifyIndiv','src_span'(4,43,4,62,99,19),'Constructor of Datatype').
'symbol'('trigger_rule','trigger_rule','src_span'(6,9,6,21,128,12),'Channel').
'symbol'('interrupt_rule','interrupt_rule','src_span'(7,9,7,23,166,14),'Channel').
'symbol'('assess','assess','src_span'(9,9,9,15,201,6),'Channel').
'symbol'('notify_pdpc','notify_pdpc','src_span'(9,17,9,28,209,11),'Channel').
'symbol'('notify_indiv','notify_indiv','src_span'(9,30,9,42,222,12),'Channel').
'symbol'('prohibit_notify_indiv','prohibit_notify_indiv','src_span'(9,44,9,65,236,21),'Channel').
'symbol'('tic','tic','src_span'(11,9,11,12,280,3),'Channel').
'symbol'('Tic','Tic','src_span'(13,1,13,4,285,3),'Ident (Groundrep.)').
'symbol'('Rule','Rule','src_span'(18,1,18,5,450,4),'Funktion or Process').
'symbol'('RuleInstance','RuleInstance','src_span'(18,6,18,18,455,12),'Ident (Prolog Variable)').
'symbol'('rule_name','rule_name','src_span'(18,24,18,33,473,9),'Ident (Prolog Variable)').
'symbol'('evnt','evnt','src_span'(18,35,18,39,484,4),'Ident (Prolog Variable)').
'symbol'('evnt_timer','evnt_timer','src_span'(18,41,18,51,490,10),'Ident (Prolog Variable)').
'symbol'('Trigger','Trigger','src_span'(21,5,21,12,548,7),'Ident (Groundrep.)').
'symbol'('trigger','trigger','src_span'(21,18,21,25,561,7),'Ident (Prolog Variable)').
'symbol'('Go','Go','src_span'(23,5,23,7,624,2),'Ident (Groundrep.)').
'symbol'('actor','actor','src_span'(25,30,25,35,677,5),'Ident (Prolog Variable)').
'symbol'('PreAchvI','PreAchvI','src_span'(33,1,33,9,896,8),'Ident (Groundrep.)').
'symbol'('actor2','actor','src_span'(33,14,33,19,909,5),'Ident (Prolog Variable)').
'symbol'('evnt2','evnt','src_span'(33,21,33,25,916,4),'Ident (Prolog Variable)').
'symbol'('initial_evnt_timer','initial_evnt_timer','src_span'(33,27,33,45,922,18),'Ident (Prolog Variable)').
'symbol'('Go2','Go','src_span'(36,7,36,9,986,2),'Funktion or Process').
'symbol'('evnt_timer2','evnt_timer','src_span'(36,10,36,20,989,10),'Ident (Prolog Variable)').
'symbol'('NonPreAchvI','NonPreAchvI','src_span'(46,1,46,12,1236,11),'Ident (Groundrep.)').
'symbol'('actor3','actor','src_span'(46,17,46,22,1252,5),'Ident (Prolog Variable)').
'symbol'('evnt3','evnt','src_span'(46,24,46,28,1259,4),'Ident (Prolog Variable)').
'symbol'('initial_evnt_timer2','initial_evnt_timer','src_span'(46,30,46,48,1265,18),'Ident (Prolog Variable)').
'symbol'('Go3','Go','src_span'(49,7,49,9,1328,2),'Funktion or Process').
'symbol'('evnt_timer3','evnt_timer','src_span'(49,10,49,20,1331,10),'Ident (Prolog Variable)').
'symbol'('PreRule','PreRule','src_span'(75,1,75,8,2081,7),'Ident (Groundrep.)').
'symbol'('NonPreRule','NonPreRule','src_span'(76,1,76,11,2106,10),'Ident (Groundrep.)').
'symbol'('Rules','Rules','src_span'(78,1,78,6,2138,5),'Ident (Groundrep.)').
'symbol'('MAIN','MAIN','src_span'(85,1,85,5,2323,4),'Ident (Groundrep.)').
'symbol'('P','P','src_span'(85,20,85,21,2342,1),'Ident (Prolog Variable)').
'symbol'('union','union','src_span'(85,24,85,29,2346,5),'BuiltIn primitive').