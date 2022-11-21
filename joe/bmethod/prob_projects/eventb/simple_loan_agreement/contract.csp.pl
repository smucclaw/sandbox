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
'channel'('tick','type'('dotUnitType')).
'channel'('pay_normal','type'('dotTupleType'(['STATE','STATE','boolType','DEONTIC','agent_call'('src_span'(14,64,14,67,413,3),'Set',['PARTY'])]))).
'channel'('pay_accelerated','type'('dotTupleType'(['STATE','STATE','boolType','DEONTIC','agent_call'('src_span'(14,64,14,67,413,3),'Set',['PARTY'])]))).
'channel'('request_principal','type'('dotTupleType'(['STATE','STATE','boolType','DEONTIC','agent_call'('src_span'(15,88,15,91,511,3),'Set',['PARTY'])]))).
'channel'('send_principal','type'('dotTupleType'(['STATE','STATE','boolType','DEONTIC','agent_call'('src_span'(15,88,15,91,511,3),'Set',['PARTY'])]))).
'channel'('borrower_default','type'('dotTupleType'(['STATE','STATE','boolType','DEONTIC','agent_call'('src_span'(15,88,15,91,511,3),'Set',['PARTY'])]))).
'channel'('cure_default','type'('dotTupleType'(['STATE','STATE','boolType','DEONTIC','agent_call'('src_span'(16,77,16,80,598,3),'Set',['PARTY'])]))).
'channel'('notify_borrower_of_default','type'('dotTupleType'(['STATE','STATE','boolType','DEONTIC','agent_call'('src_span'(16,77,16,80,598,3),'Set',['PARTY'])]))).
'bindval'('MAIN','let'(['bindval'('Tick','prefix'('src_span'(28,12,28,16,939,4),[],'tick','val_of'('Tick','src_span'(28,20,28,24,947,4)),'src_span'(28,17,28,19,943,12)),'src_span'(28,5,28,24,932,19))],'val_of'('Contract','src_span'(30,5,30,13,965,8))),'src_span'(26,1,30,13,915,58)).
'bindval'('Contract','exception'('setExp'('rangeEnum'(['dotTuple'(['request_principal','InProgress','Fulfilled','false','Perm','setExp'('rangeEnum'(['Borrower']))]),'dotTuple'(['send_principal','InProgress','Breached','false','Ob','setExp'('rangeEnum'(['Borrower']))])])),'prefix'('src_span'(34,3,34,20,1040,17),['out'('InProgress'),'out'('Fulfilled'),'in'(_),'out'('Perm'),'out'('setExp'('rangeEnum'(['Borrower'])))],'request_principal','prefix'('src_span'(36,6,36,20,1153,14),['out'('InProgress'),'out'('Breached'),'in'(_),'out'('Ob'),'out'('setExp'('rangeEnum'(['Lender'])))],'send_principal','let'(['bindval'('P','|||'('val_of'('Repayment','src_span'(39,11,39,20,1225,9)),'agent_call'('src_span'(39,25,39,37,1239,12),'AvoidDefault',['int'(5)]),'src_span_operator'('no_loc_info_available','src_span'(39,21,39,24,1235,3))),'src_span'(39,7,39,40,1221,33)),'bindval'('exc','dotTuple'(['cure_default','InProgress','InProgress','false','Ob','setExp'('rangeEnum'(['Borrower']))]),'src_span'(40,7,40,67,1261,60))],'exception'('setExp'('rangeEnum'(['val_of'('exc','src_span'(42,13,42,16,1345,3))])),'val_of'('P','src_span'(42,7,42,8,1339,1)),'val_of'('AcceleratedRepayment','src_span'(42,21,42,41,1353,20)),'src_span'(42,9,42,20,1341,11))),'src_span'(36,55,38,4,1201,181)),'src_span'(34,60,36,5,1096,288)),'skip'('src_span'(46,5,46,9,1515,4)),'src_span'(44,3,45,65,1380,130)),'src_span'(32,1,46,9,987,532)).
'bindval'('Repayment','exception'('setExp'('rangeEnum'(['dotTuple'(['pay_normal','InProgress','InProgress','false','Ob','setExp'('rangeEnum'(['Borrower']))]),'dotTuple'(['pay_normal','Fulfilled','InProgress','false','Ob','setExp'('rangeEnum'(['Borrower']))])])),'prefix'('src_span'(50,3,50,13,1573,10),['in'(_stateIfHappened),'out'('InProgress'),'in'(_happened),'out'('Ob'),'out'('setExp'('rangeEnum'(['Borrower'])))],'pay_normal','let'(['agent'('match'('true','Fulfilled'),'skip'('src_span'(53,32,53,36,1678,4)),'src_span'(53,32,53,36,1678,4)),'agent'('match'('true','InProgress'),'val_of'('Repayment','src_span'(54,33,54,42,1715,9)),'src_span'(54,33,54,42,1715,9))],'agent_call'('src_span'(56,7,56,12,1742,5),'match',[_happened,_stateIfHappened])),'src_span'(50,64,52,4,1633,152)),';'('val_of'('BorrowerDefault','src_span'(61,6,61,21,1931,15)),'val_of'('Repayment','src_span'(61,23,61,32,1948,9)),'src_span_operator'('no_loc_info_available','src_span'(61,21,61,22,1946,1))),'src_span'(59,3,60,62,1806,119)),'src_span'(49,1,61,33,1557,401)).
'agent'('AvoidDefault'(_n),'&'('>'(_n,'int'(0)),'|||'('prefix'('src_span'(66,5,66,21,2039,16),['out'('InProgress'),'out'('InProgress'),'out'('true'),'out'('Prohib'),'out'('setExp'('rangeEnum'(['Borrower'])))],'borrower_default','val_of'('BorrowerDefault','src_span'(67,8,67,23,2108,15)),'src_span'(66,67,67,7,2100,34)),'agent_call'('src_span'(67,28,67,40,2128,12),'AvoidDefault',['-'(_n,'int'(1))]),'src_span_operator'('no_loc_info_available','src_span'(67,24,67,27,2124,3)))),'no_loc_info_available').
'bindval'('BorrowerDefault','prefix'('src_span'(72,5,72,31,2240,26),['out'('InProgress'),'out'('Breached'),'in'(_happened2),'out'('Ob'),'out'('setExp'('rangeEnum'(['Lender'])))],'notify_borrower_of_default','&'(_happened2,'prefix'('src_span'(76,9,76,21,2395,12),['out'('InProgress'),'out'('InProgress'),'in'(_happened3),'out'('Ob'),'out'('setExp'('rangeEnum'(['Borrower'])))],'cure_default','&'('bool_not'(_happened3),'val_of'('AcceleratedRepayment','src_span'(77,28,77,48,2480,20))),'src_span'(76,67,77,11,2452,60))),'src_span'(72,73,73,7,2307,210)),'src_span'(70,1,78,7,2153,355)).
'bindval'('AcceleratedRepayment','prefix'('src_span'(83,3,83,18,2619,15),['out'('Fulfilled'),'out'('Breached'),'in'(_),'out'('Ob'),'out'('setExp'('rangeEnum'(['Borrower'])))],'pay_accelerated','skip'('src_span'(83,57,83,61,2673,4)),'src_span'(83,54,83,56,2669,19)),'src_span'(80,1,83,61,2510,167)).
'comment'('lineComment'('-- Datatypes and event channels for communicating with B/Event-B machines.'),'src_position'(1,1,0,74)).
'comment'('lineComment'('-- channel fulfilled'),'src_position'(6,1,200,20)).
'comment'('lineComment'('-- channel breached : Set(PARTY)'),'src_position'(7,1,221,32)).
'comment'('blockComment'('{-\xa\Old state, new state, Did it happen?, deontic, parties who are responsible\xa\-}'),'src_position'(11,1,269,80)).
'comment'('blockComment'('{- Some thoughts:\xa\CSPm supports higher order processes and interruptions/exceptions.\xa\Maybe we can make use of this to make dynamic, reconfigurable stuff?\xa\\xa\On another note, to what extent can we abstract away the progression of real time?\xa\Can we simply look at deadlines and progress time accordingly?\xa\-}'),'src_position'(18,1,610,303)).
'comment'('lineComment'('-- ||| Tick'),'src_position'(30,14,974,11)).
'comment'('lineComment'('-- Permission to request principal.'),'src_position'(33,3,1002,35)).
'comment'('lineComment'('-- Non-compensable obligation to send principal.'),'src_position'(35,3,1099,48)).
'comment'('lineComment'('-- Compensable obligation to repay.'),'src_position'(48,1,1521,35)).
'comment'('lineComment'('-- Reparation pathway.'),'src_position'(58,3,1781,22)).
'comment'('lineComment'('-- Compensable prohibition to avoid default.'),'src_position'(63,1,1960,44)).
'comment'('lineComment'('-- Non-compensable obligation to notify borrower of default.'),'src_position'(71,5,2175,60)).
'comment'('lineComment'('-- Compensable obligation to cure default.'),'src_position'(75,9,2344,42)).
'comment'('lineComment'('-- Non-compensable obligation to pay off the outstanding amount'),'src_position'(81,3,2535,63)).
'comment'('lineComment'('-- immediately.'),'src_position'(82,3,2601,15)).
'comment'('lineComment'('-- MAIN_old ='),'src_position'(85,1,2679,13)).
'comment'('lineComment'('--   -- First the borrower may or may not request for the principal amount.'),'src_position'(86,1,2693,75)).
'comment'('lineComment'('--   -- If he doesn\x27\t then the contract is immediately fulfilled.'),'src_position'(87,1,2769,65)).
'comment'('lineComment'('--   dont_request_principal?_!Fulfilled -> LoopFulfilled'),'src_position'(88,1,2835,56)).
'comment'('lineComment'('--   -- Otherwise, the lender is now obliged to send the principal.'),'src_position'(90,1,2893,67)).
'comment'('lineComment'('--   [] request_principal?_!InProgress -> ('),'src_position'(91,1,2961,43)).
'comment'('lineComment'('--       -- If the Lender defaults on the payment of the principal, the'),'src_position'(93,1,3006,71)).
'comment'('lineComment'('--       -- contract is deemed to be breached.'),'src_position'(94,1,3078,46)).
'comment'('lineComment'('--       lender_default!{Lender}!Breached -> LoopBreached'),'src_position'(95,1,3125,57)).
'comment'('lineComment'('--       -- Otherwise, if he does send the principal, then we start the main and'),'src_position'(97,1,3184,80)).
'comment'('lineComment'('--       -- side tracks.'),'src_position'(98,1,3265,24)).
'comment'('lineComment'('--       [] send_principal?_!InProgress ->'),'src_position'(99,1,3290,42)).
'comment'('lineComment'('--         let'),'src_position'(100,1,3333,14)).
'comment'('lineComment'('--           mainandside = (main ||| side) [| excs |> accel'),'src_position'(101,1,3348,59)).
'comment'('lineComment'('--           excs = {dont_cure_default.{}.inprogress}'),'src_position'(102,1,3408,53)).
'comment'('lineComment'('--         within'),'src_position'(103,1,3462,17)).
'comment'('lineComment'('--           mainandside'),'src_position'(104,1,3480,24)).
'comment'('lineComment'('--   )'),'src_position'(105,1,3505,6)).
'comment'('lineComment'('-- LoopFulfilled = SKIP -- fulfilled -> LoopFulfilled'),'src_position'(107,1,3513,53)).
'comment'('lineComment'('-- LoopBreached = SKIP -- breached?partiesToBlame -> LoopBreached'),'src_position'(108,1,3567,65)).
'comment'('lineComment'('-- Main ='),'src_position'(110,1,3634,9)).
'comment'('lineComment'('--   pay_normal?_ -> (LoopFulfilled [] Main)'),'src_position'(111,1,3644,44)).
'comment'('lineComment'('--   -- (get_outstanding!0 -> SKIP) [[ get_outstanding.0 <- fulfilled ]]'),'src_position'(112,1,3689,72)).
'comment'('lineComment'('--   -- pay_normal?_?newState ->'),'src_position'(113,1,3762,32)).
'comment'('lineComment'('--   --   let'),'src_position'(114,1,3795,13)).
'comment'('lineComment'('--   --     -- Pattern matching is implemented via unification in Prolog.'),'src_position'(115,1,3809,73)).
'comment'('lineComment'('--   --     match(Fulfilled) = LoopFulfilled'),'src_position'(116,1,3883,44)).
'comment'('lineComment'('--   --     match(InProgress) = Main'),'src_position'(117,1,3928,36)).
'comment'('lineComment'('--   --     -- The preconditions for the pay_normal event in the EventB machine ensures'),'src_position'(118,1,3965,87)).
'comment'('lineComment'('--   --     -- that this last case is not possible.'),'src_position'(119,1,4053,51)).
'comment'('lineComment'('--   --     match(Breached) = STOP'),'src_position'(120,1,4105,34)).
'comment'('lineComment'('--   --   within'),'src_position'(121,1,4140,16)).
'comment'('lineComment'('--   --     match(newState)'),'src_position'(122,1,4157,27)).
'comment'('lineComment'('--   -- If the borrower defaults on the payment, we continue here instead.'),'src_position'(124,1,4186,74)).
'comment'('lineComment'('--   -- At this point, the lender has the option to notify the borrower.'),'src_position'(125,1,4261,72)).
'comment'('lineComment'('--   [] pay_normal_default?_!InProgress -> ('),'src_position'(126,1,4334,44)).
'comment'('lineComment'('--     -- If the lender doesn\x27\t notify the borrower upon payment default,'),'src_position'(128,1,4380,73)).
'comment'('lineComment'('--     -- nothing goes wrong and so we simply continue with repayments.'),'src_position'(129,1,4454,71)).
'comment'('lineComment'('--     dont_notify_borrower?_!InProgress -> Main'),'src_position'(130,1,4526,48)).
'comment'('lineComment'('--     -- If the lender does notify the borrower, then the borrower is obliged'),'src_position'(132,1,4576,78)).
'comment'('lineComment'('--     -- to cure his default.'),'src_position'(133,1,4655,30)).
'comment'('lineComment'('--     [] notify_borrower_of_default?_!InProgress -> ('),'src_position'(134,1,4686,54)).
'comment'('lineComment'('--       -- If the borrower cures his default, then we contiunue down the'),'src_position'(136,1,4742,73)).
'comment'('lineComment'('--       -- repayment track, giving him another chance to pay off the current'),'src_position'(137,1,4816,77)).
'comment'('lineComment'('--       -- payment.'),'src_position'(138,1,4894,20)).
'comment'('lineComment'('--       cure_default?_!InProgress -> Main'),'src_position'(139,1,4915,42)).
'comment'('lineComment'('--       -- If the default is not cured, the borrower is then obliged to make'),'src_position'(141,1,4959,77)).
'comment'('lineComment'('--       -- an accelerated payment of the remaining amount to the lender.'),'src_position'(142,1,5037,73)).
'comment'('lineComment'('--       -- The start_accel_s action is used to kick off the'),'src_position'(143,1,5111,60)).
'comment'('lineComment'('--       -- Accel process, which handles this accelerated repayment stage.'),'src_position'(144,1,5172,74)).
'comment'('lineComment'('--       [] dont_cure_default?_!InProgress -> Main'),'src_position'(145,1,5247,50)).
'comment'('lineComment'('--     )'),'src_position'(146,1,5298,8)).
'comment'('lineComment'('--   )'),'src_position'(147,1,5307,6)).
'comment'('lineComment'('-- Side ='),'src_position'(149,1,5315,9)).
'comment'('lineComment'('--   -- When a borrower default event occurs, the lender has the option of'),'src_position'(150,1,5325,74)).
'comment'('lineComment'('--   -- notifying the borrower.'),'src_position'(151,1,5400,31)).
'comment'('lineComment'('-- \x9\borrower_default?_!InProgress -> ('),'src_position'(152,1,5432,38)).
'comment'('lineComment'('--     -- If no such notification occurs, nothing happens and so we loop back to'),'src_position'(154,1,5472,80)).
'comment'('lineComment'('--     -- the top of the side track and wait for another default event to occur.'),'src_position'(155,1,5553,80)).
'comment'('lineComment'('--     dont_notify_borrower?_!InProgress -> Side'),'src_position'(156,1,5634,48)).
'comment'('lineComment'('--     -- If the lender does notify the borrower, then we proceed as we did in the'),'src_position'(158,1,5684,82)).
'comment'('lineComment'('--     -- main track above, ie the borrower is then obliged to cure his default,'),'src_position'(159,1,5767,80)).
'comment'('lineComment'('--     -- and failing which, he is then obliged to make an accelerated payment'),'src_position'(160,1,5848,78)).
'comment'('lineComment'('--     -- of the remaining amount.'),'src_position'(161,1,5927,34)).
'comment'('lineComment'('--     [] notify_borrower_of_default?_!InProgress -> ('),'src_position'(162,1,5962,54)).
'comment'('lineComment'('--       cure_default?_!InProgress -> Side'),'src_position'(163,1,6017,42)).
'comment'('lineComment'('--       [] dont_cure_default?_!InProgress -> Side'),'src_position'(164,1,6060,50)).
'comment'('lineComment'('--     )'),'src_position'(165,1,6111,8)).
'comment'('lineComment'('--   )'),'src_position'(166,1,6120,6)).
'comment'('lineComment'('-- Accel ='),'src_position'(168,1,6128,10)).
'comment'('lineComment'('--   pay_accelerated?_!Fulfilled -> LoopFulfilled'),'src_position'(169,1,6139,49)).
'comment'('lineComment'('--   [] pay_accelerated_default!{Borrower}!Breached -> LoopBreached'),'src_position'(170,1,6189,67)).
'symbol'('STATE','STATE','src_span'(2,10,2,15,84,5),'Datatype').
'symbol'('InProgress','InProgress','src_span'(2,18,2,28,92,10),'Constructor of Datatype').
'symbol'('Breached','Breached','src_span'(2,31,2,39,105,8),'Constructor of Datatype').
'symbol'('Fulfilled','Fulfilled','src_span'(2,42,2,51,116,9),'Constructor of Datatype').
'symbol'('PARTY','PARTY','src_span'(3,10,3,15,135,5),'Datatype').
'symbol'('Borrower','Borrower','src_span'(3,18,3,26,143,8),'Constructor of Datatype').
'symbol'('Lender','Lender','src_span'(3,29,3,35,154,6),'Constructor of Datatype').
'symbol'('DEONTIC','DEONTIC','src_span'(4,10,4,17,170,7),'Datatype').
'symbol'('Ob','Ob','src_span'(4,20,4,22,180,2),'Constructor of Datatype').
'symbol'('Perm','Perm','src_span'(4,25,4,29,185,4),'Constructor of Datatype').
'symbol'('Prohib','Prohib','src_span'(4,32,4,38,192,6),'Constructor of Datatype').
'symbol'('tick','tick','src_span'(9,9,9,13,263,4),'Channel').
'symbol'('pay_normal','pay_normal','src_span'(14,9,14,19,358,10),'Channel').
'symbol'('pay_accelerated','pay_accelerated','src_span'(14,21,14,36,370,15),'Channel').
'symbol'('Set','Set','src_span'(14,64,14,67,413,3),'BuiltIn primitive').
'symbol'('request_principal','request_principal','src_span'(15,9,15,26,432,17),'Channel').
'symbol'('send_principal','send_principal','src_span'(15,28,15,42,451,14),'Channel').
'symbol'('borrower_default','borrower_default','src_span'(15,44,15,60,467,16),'Channel').
'symbol'('cure_default','cure_default','src_span'(16,9,16,21,530,12),'Channel').
'symbol'('notify_borrower_of_default','notify_borrower_of_default','src_span'(16,23,16,49,544,26),'Channel').
'symbol'('MAIN','MAIN','src_span'(26,1,26,5,915,4),'Ident (Groundrep.)').
'symbol'('Tick','Tick','src_span'(28,5,28,9,932,4),'Ident (Groundrep.)').
'symbol'('Contract','Contract','src_span'(32,1,32,9,987,8),'Ident (Groundrep.)').
'symbol'('P','P','src_span'(39,7,39,8,1221,1),'Ident (Groundrep.)').
'symbol'('exc','exc','src_span'(40,7,40,10,1261,3),'Ident (Groundrep.)').
'symbol'('Repayment','Repayment','src_span'(49,1,49,10,1557,9),'Ident (Groundrep.)').
'symbol'('stateIfHappened','stateIfHappened','src_span'(50,14,50,29,1584,15),'Ident (Prolog Variable)').
'symbol'('happened','happened','src_span'(50,41,50,49,1611,8),'Ident (Prolog Variable)').
'symbol'('match','match','src_span'(53,7,53,12,1653,5),'Funktion or Process').
'symbol'('Fulfilled','Fulfilled','src_span'(2,42,2,51,116,9),'Constructor of Datatype').
'symbol'('InProgress','InProgress','src_span'(2,18,2,28,92,10),'Constructor of Datatype').
'symbol'('AvoidDefault','AvoidDefault','src_span'(64,1,64,13,2005,12),'Funktion or Process').
'symbol'('n','n','src_span'(64,14,64,15,2018,1),'Ident (Prolog Variable)').
'symbol'('BorrowerDefault','BorrowerDefault','src_span'(70,1,70,16,2153,15),'Ident (Groundrep.)').
'symbol'('happened2','happened','src_span'(72,52,72,60,2287,8),'Ident (Prolog Variable)').
'symbol'('happened3','happened','src_span'(76,44,76,52,2430,8),'Ident (Prolog Variable)').
'symbol'('AcceleratedRepayment','AcceleratedRepayment','src_span'(80,1,80,21,2510,20),'Ident (Groundrep.)').