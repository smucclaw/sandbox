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
'channel'('c','type'('dotUnitType')).
'channel'('d','type'('dotUnitType')).
'dataTypeDef'('List',['constructor'('Nil'),'constructorC'('Cons','dotTupleType'(['intType','List']))]).
'agent'('head'('dotpat'(['Cons',_x,_xs])),_x,'src_span'(5,19,5,20,69,1)).
'agent'('head'('Nil'),'int'(0),'src_span'(6,13,6,14,83,1)).
'agent'('P'(_x2),'prefix'('src_span'(8,8,8,9,93,1),[],'c','let'(['bindval'('xs2','dotTuple'(['Cons',_x2,'Nil']),'src_span'(9,6,9,21,103,15))],'ifte'('=='('agent_call'('src_span'(10,5,10,9,130,4),'head',['val_of'('xs2','src_span'(10,10,10,12,135,2))]),'int'(0)),'skip'('src_span'(10,24,10,28,149,4)),'|||'('agent_call'('src_span'(10,35,10,36,160,1),'P',['int'(0)]),'val_of'('Q','src_span'(10,44,10,45,169,1)),'src_span_operator'('no_loc_info_available','src_span'(10,40,10,43,165,3))),'no_loc_info_available','no_loc_info_available','src_span'(10,29,10,33,153,22))),'src_span'(8,10,9,1,94,78)),'src_span'(8,8,10,46,93,78)).
'bindval'('Q','prefix'('src_span'(12,5,12,6,177,1),[],'d','val_of'('Q','src_span'(12,10,12,11,182,1)),'src_span'(12,7,12,9,178,6)),'src_span'(12,1,12,11,173,10)).
'bindval'('MAIN','exception'('setExp'('rangeEnum'(['c'])),'agent_call'('src_span'(15,8,15,9,225,1),'P',['int'(1)]),'skip'('src_span'(15,23,15,27,240,4)),'src_span'(15,13,15,22,230,9)),'src_span'(15,1,15,27,218,26)).
'comment'('lineComment'('-- try { P(1) } catch c { SKIP }'),'src_position'(14,1,185,32)).
'symbol'('c','c','src_span'(1,9,1,10,8,1),'Channel').
'symbol'('d','d','src_span'(1,12,1,13,11,1),'Channel').
'symbol'('List','List','src_span'(3,10,3,14,23,4),'Datatype').
'symbol'('Nil','Nil','src_span'(3,17,3,20,30,3),'Constructor of Datatype').
'symbol'('Cons','Cons','src_span'(3,23,3,27,36,4),'Constructor of Datatype').
'symbol'('head','head','src_span'(5,1,5,5,51,4),'Funktion or Process').
'symbol'('Cons','Cons','src_span'(3,23,3,27,36,4),'Constructor of Datatype').
'symbol'('x','x','src_span'(5,11,5,12,61,1),'Ident (Prolog Variable)').
'symbol'('xs','xs','src_span'(5,13,5,15,63,2),'Ident (Prolog Variable)').
'symbol'('Nil','Nil','src_span'(3,17,3,20,30,3),'Constructor of Datatype').
'symbol'('P','P','src_span'(8,1,8,2,86,1),'Funktion or Process').
'symbol'('x2','x','src_span'(8,3,8,4,88,1),'Ident (Prolog Variable)').
'symbol'('xs2','xs','src_span'(9,6,9,8,103,2),'Ident (Groundrep.)').
'symbol'('Q','Q','src_span'(12,1,12,2,173,1),'Ident (Groundrep.)').
'symbol'('MAIN','MAIN','src_span'(15,1,15,5,218,4),'Ident (Groundrep.)').