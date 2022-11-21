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
'dataTypeDef'('STATE',['constructor'('InProgress'),'constructor'('Breached'),'constructor'('Fulfilled')]).
'dataTypeDef'('PARTY',['constructor'('Borrower'),'constructor'('Lender')]).
'dataTypeDef'('DEONTIC',['constructor'('Ob'),'constructor'('Perm'),'constructor'('Prohib')]).
'channel'('fulfilled','type'('dotUnitType')).
'channel'('breached','type'('dotTupleType'(['agent_call'('src_span'(6,20,6,23,162,3),'Set',['PARTY'])]))).
'channel'('pay_normal','type'('dotUnitType')).
'channel'('a','type'('dotUnitType')).
'channel'('b','type'('dotUnitType')).
'agent'('P'(_n),'&'('>'(_n,'int'(0)),'|||'('prefix'('src_span'(13,12,13,13,227,1),[],'a','prefix'('src_span'(13,17,13,18,232,1),[],'b','skip'('src_span'(13,22,13,26,237,4)),'src_span'(13,19,13,21,233,9)),'src_span'(13,14,13,16,228,14)),'agent_call'('src_span'(13,31,13,32,246,1),'P',['-'(_n,'int'(1))]),'src_span_operator'('no_loc_info_available','src_span'(13,27,13,30,242,3)))),'no_loc_info_available').
'bindval'('MAIN','P','src_span'(17,1,17,9,302,8)).
'comment'('lineComment'('-- Second argument is for blame assignment.'),'src_position'(15,1,257,43)).
'symbol'('STATE','STATE','src_span'(1,10,1,15,9,5),'Datatype').
'symbol'('InProgress','InProgress','src_span'(1,18,1,28,17,10),'Constructor of Datatype').
'symbol'('Breached','Breached','src_span'(1,31,1,39,30,8),'Constructor of Datatype').
'symbol'('Fulfilled','Fulfilled','src_span'(1,42,1,51,41,9),'Constructor of Datatype').
'symbol'('PARTY','PARTY','src_span'(2,10,2,15,60,5),'Datatype').
'symbol'('Borrower','Borrower','src_span'(2,18,2,26,68,8),'Constructor of Datatype').
'symbol'('Lender','Lender','src_span'(2,29,2,35,79,6),'Constructor of Datatype').
'symbol'('DEONTIC','DEONTIC','src_span'(3,10,3,17,95,7),'Datatype').
'symbol'('Ob','Ob','src_span'(3,20,3,22,105,2),'Constructor of Datatype').
'symbol'('Perm','Perm','src_span'(3,25,3,29,110,4),'Constructor of Datatype').
'symbol'('Prohib','Prohib','src_span'(3,32,3,38,117,6),'Constructor of Datatype').
'symbol'('fulfilled','fulfilled','src_span'(5,9,5,18,133,9),'Channel').
'symbol'('breached','breached','src_span'(6,9,6,17,151,8),'Channel').
'symbol'('Set','Set','src_span'(6,20,6,23,162,3),'BuiltIn primitive').
'symbol'('pay_normal','pay_normal','src_span'(8,9,8,19,182,10),'Channel').
'symbol'('a','a','src_span'(10,9,10,10,202,1),'Channel').
'symbol'('b','b','src_span'(10,12,10,13,205,1),'Channel').
'symbol'('P','P','src_span'(12,1,12,2,208,1),'Funktion or Process').
'symbol'('n','n','src_span'(12,3,12,4,210,1),'Ident (Prolog Variable)').
'symbol'('MAIN','MAIN','src_span'(17,1,17,5,302,4),'Ident (Groundrep.)').