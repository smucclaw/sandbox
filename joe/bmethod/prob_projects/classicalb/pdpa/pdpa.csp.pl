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
'dataTypeDef'('Actor',['constructor'('org'),'constructor'('indiv'),'constructor'('pdpc')]).
'dataTypeDef'('RuleName',['constructor'('Assessment'),'constructor'('NotifyPdpc'),'constructor'('NotifyIndiv'),'constructor'('Exclusions')]).
'channel'('trigger_rule','type'('dotTupleType'(['RuleName']))).
'channel'('assess','type'('dotTupleType'(['boolType']))).
'channel'('notifyPdpc','type'('dotTupleType'(['boolType']))).
'channel'('status','type'('dotTupleType'(['RuleName','Status','Actor']))).
'channel'('tic','type'('dotUnitType')).
'bindval'('Tic','prefix'('src_span'(14,7,14,10,276,3),[],'tic','val_of'('Tic','src_span'(14,14,14,17,283,3)),'src_span'(14,11,14,13,279,10)),'src_span'(14,1,14,17,270,16)).
'agent'('Rule'(_status_on_evnt_done,_status_on_evnt_timeout,_rule_name,_actor,_evnt,_evnt_timer),'let'(['agent'('RuleI'(_evnt_timer2),'ifte'('<='(_evnt_timer2,'int'(0)),'prefix'('src_span'(25,9,25,13,493,4),['out'('false')],_evnt,'prefix'('src_span'(25,23,25,29,507,6),['out'(_rule_name),'out'(_status_on_evnt_timeout),'out'(_actor)],'status','val_of'('Tic','src_span'(25,72,25,75,556,3)),'src_span'(25,69,25,71,552,13)),'src_span'(25,20,25,22,503,62)),'[]'('prefix'('src_span'(27,9,27,13,579,4),['out'('true')],_evnt,'prefix'('src_span'(27,22,27,28,592,6),['out'(_rule_name),'out'(_status_on_evnt_done),'out'(_actor)],'status','val_of'('Tic','src_span'(27,68,27,71,638,3)),'src_span'(27,65,27,67,634,13)),'src_span'(27,19,27,21,588,58)),'prefix'('src_span'(28,9,28,12,653,3),[],'tic','agent_call'('src_span'(28,16,28,21,660,5),'RuleI',['-'(_evnt_timer2,'int'(1))]),'src_span'(28,13,28,15,656,28)),'src_span_operator'('no_loc_info_available','src_span'(27,72,27,74,642,2))),'no_loc_info_available','no_loc_info_available','no_loc_info_available'),'src_span'(23,7,28,37,455,226)),'bindval'('go','[]'('prefix'('src_span'(33,7,33,10,788,3),[],'tic','val_of'('go','src_span'(33,14,33,16,795,2)),'src_span'(33,11,33,13,791,9)),'prefix'('src_span'(34,7,34,19,807,12),['out'(_rule_name)],'trigger_rule','agent_call'('src_span'(35,9,35,14,841,5),'RuleI',[_evnt_timer]),'src_span'(34,30,35,8,829,39)),'src_span_operator'('no_loc_info_available','src_span'(33,17,33,19,798,2))),'src_span'(32,5,35,26,777,81))],'val_of'('go','src_span'(38,7,38,9,895,2))),'src_span'(21,3,38,9,421,476)).
'agent'('Ob'(_rule_name2,_actor2,_evnt2,_evnt_timer3),'agent_call'('src_span'(41,3,41,7,942,4),'Rule',['fulfilled','breached',_rule_name2,_actor2,_evnt2,_evnt_timer3]),'src_span'(41,3,41,64,942,61)).
'agent'('Perm'(_rule_name3,_actor3,_evnt3,_event_timer),'agent_call'('src_span'(44,3,44,7,1051,4),'Rule',['fulfilled','fulfilled',_rule_name3,_actor3,_evnt3,_event_timer]),'src_span'(44,3,44,66,1051,63)).
'agent'('Prohib'(_rule_name4,_actor4,_evnt4,_event_timer2),'agent_call'('src_span'(47,3,47,7,1164,4),'Rule',['breached','fulfilled',_rule_name4,_actor4,_evnt4,_event_timer2]),'src_span'(47,3,47,65,1164,62)).
'bindval'('MAIN','sharing'('setExp'('rangeEnum'(['tic'])),'agent_call'('src_span'(50,3,50,5,1237,2),'Ob',['Assessment','org','assess','int'(30)]),'agent_call'('src_span'(51,3,51,5,1283,2),'Ob',['NotifyPdpc','org','notifyPdpc','int'(3)]),'src_span'(50,35,50,46,1269,11)),'src_span'(49,1,51,37,1228,89)).
'comment'('lineComment'('-- RuleI stands for rule instance.'),'src_position'(20,3,384,34)).
'comment'('lineComment'('-- Auxiliary helper for recursion.'),'src_position'(30,5,687,34)).
'comment'('lineComment'('-- We ignore the notion of perdurance for now.'),'src_position'(31,5,726,46)).
'comment'('lineComment'('-- [| {tic} |] go'),'src_position'(35,27,859,17)).
'symbol'('Status','Status','src_span'(1,10,1,16,9,6),'Datatype').
'symbol'('breached','breached','src_span'(1,19,1,27,18,8),'Constructor of Datatype').
'symbol'('fulfilled','fulfilled','src_span'(1,30,1,39,29,9),'Constructor of Datatype').
'symbol'('Actor','Actor','src_span'(2,10,2,15,48,5),'Datatype').
'symbol'('org','org','src_span'(2,18,2,21,56,3),'Constructor of Datatype').
'symbol'('indiv','indiv','src_span'(2,24,2,29,62,5),'Constructor of Datatype').
'symbol'('pdpc','pdpc','src_span'(2,32,2,36,70,4),'Constructor of Datatype').
'symbol'('RuleName','RuleName','src_span'(4,10,4,18,85,8),'Datatype').
'symbol'('Assessment','Assessment','src_span'(5,3,5,13,98,10),'Constructor of Datatype').
'symbol'('NotifyPdpc','NotifyPdpc','src_span'(5,16,5,26,111,10),'Constructor of Datatype').
'symbol'('NotifyIndiv','NotifyIndiv','src_span'(5,29,5,40,124,11),'Constructor of Datatype').
'symbol'('Exclusions','Exclusions','src_span'(5,43,5,53,138,10),'Constructor of Datatype').
'symbol'('trigger_rule','trigger_rule','src_span'(7,9,7,21,158,12),'Channel').
'symbol'('assess','assess','src_span'(9,9,9,15,191,6),'Channel').
'symbol'('notifyPdpc','notifyPdpc','src_span'(9,17,9,27,199,10),'Channel').
'symbol'('status','status','src_span'(11,9,11,15,226,6),'Channel').
'symbol'('tic','tic','src_span'(12,9,12,12,265,3),'Channel').
'symbol'('Tic','Tic','src_span'(14,1,14,4,270,3),'Ident (Groundrep.)').
'symbol'('Rule','Rule','src_span'(16,1,16,5,288,4),'Funktion or Process').
'symbol'('status_on_evnt_done','status_on_evnt_done','src_span'(17,3,17,22,296,19),'Ident (Prolog Variable)').
'symbol'('status_on_evnt_timeout','status_on_evnt_timeout','src_span'(17,24,17,46,317,22),'Ident (Prolog Variable)').
'symbol'('rule_name','rule_name','src_span'(18,3,18,12,343,9),'Ident (Prolog Variable)').
'symbol'('actor','actor','src_span'(18,14,18,19,354,5),'Ident (Prolog Variable)').
'symbol'('evnt','evnt','src_span'(18,21,18,25,361,4),'Ident (Prolog Variable)').
'symbol'('evnt_timer','evnt_timer','src_span'(18,27,18,37,367,10),'Ident (Prolog Variable)').
'symbol'('RuleI','RuleI','src_span'(22,5,22,10,429,5),'Funktion or Process').
'symbol'('evnt_timer2','evnt_timer','src_span'(22,11,22,21,435,10),'Ident (Prolog Variable)').
'symbol'('go','go','src_span'(32,5,32,7,777,2),'Ident (Groundrep.)').
'symbol'('Ob','Ob','src_span'(40,1,40,3,899,2),'Funktion or Process').
'symbol'('rule_name2','rule_name','src_span'(40,4,40,13,902,9),'Ident (Prolog Variable)').
'symbol'('actor2','actor','src_span'(40,15,40,20,913,5),'Ident (Prolog Variable)').
'symbol'('evnt2','evnt','src_span'(40,22,40,26,920,4),'Ident (Prolog Variable)').
'symbol'('evnt_timer3','evnt_timer','src_span'(40,28,40,38,926,10),'Ident (Prolog Variable)').
'symbol'('Perm','Perm','src_span'(43,1,43,5,1005,4),'Funktion or Process').
'symbol'('rule_name3','rule_name','src_span'(43,6,43,15,1010,9),'Ident (Prolog Variable)').
'symbol'('actor3','actor','src_span'(43,17,43,22,1021,5),'Ident (Prolog Variable)').
'symbol'('evnt3','evnt','src_span'(43,24,43,28,1028,4),'Ident (Prolog Variable)').
'symbol'('event_timer','event_timer','src_span'(43,30,43,41,1034,11),'Ident (Prolog Variable)').
'symbol'('Prohib','Prohib','src_span'(46,1,46,7,1116,6),'Funktion or Process').
'symbol'('rule_name4','rule_name','src_span'(46,8,46,17,1123,9),'Ident (Prolog Variable)').
'symbol'('actor4','actor','src_span'(46,19,46,24,1134,5),'Ident (Prolog Variable)').
'symbol'('evnt4','evnt','src_span'(46,26,46,30,1141,4),'Ident (Prolog Variable)').
'symbol'('event_timer2','event_timer','src_span'(46,32,46,43,1147,11),'Ident (Prolog Variable)').
'symbol'('MAIN','MAIN','src_span'(49,1,49,5,1228,4),'Ident (Groundrep.)').