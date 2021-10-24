according_to(a_1, mustPayCorpTax(P, C)) :- legally_holds(owner(P, C)), legally_holds(profitable(C)).
according_to(a_2, owner(P, C)) :- legally_holds(majorityShareholder(P, C)).
according_to(b_1, profitable(C)) :- legally_holds(highMarketShare(C)).
according_to(b_2, notprofitable(C)) :- legally_holds(madeLoss(C)).
explains(owner(P, C), mustPayCorpTax(P, C) ,_N+1) :- query(mustPayCorpTax(P, C) ,_N).
explains(profitable(C), mustPayCorpTax(P, C) ,_N+1) :- query(mustPayCorpTax(P, C) ,_N).
explains(majorityShareholder(P, C), owner(P, C) ,_N+1) :- query(owner(P, C) ,_N).
explains(highMarketShare(C), profitable(C) ,_N+1) :- query(profitable(C) ,_N).
explains(madeLoss(C), notprofitable(C) ,_N+1) :- query(notprofitable(C) ,_N).
caused_by(pos, legally_holds(owner(P, C)), according_to(a_1, mustPayCorpTax(P, C)), _N+1) :- according_to(a_1, mustPayCorpTax(P, C)), legally_holds(owner(P, C)), legally_holds(profitable(C)), justify(according_to(a_1, mustPayCorpTax(P, C)), _N).
caused_by(pos, legally_holds(profitable(C)), according_to(a_1, mustPayCorpTax(P, C)), _N+1) :- according_to(a_1, mustPayCorpTax(P, C)), legally_holds(owner(P, C)), legally_holds(profitable(C)), justify(according_to(a_1, mustPayCorpTax(P, C)), _N).
caused_by(pos, legally_holds(majorityShareholder(P, C)), according_to(a_2, owner(P, C)), _N+1) :- according_to(a_2, owner(P, C)), legally_holds(majorityShareholder(P, C)), justify(according_to(a_2, owner(P, C)), _N).
caused_by(pos, legally_holds(highMarketShare(C)), according_to(b_1, profitable(C)), _N+1) :- according_to(b_1, profitable(C)), legally_holds(highMarketShare(C)), justify(according_to(b_1, profitable(C)), _N).
caused_by(pos, legally_holds(madeLoss(C)), according_to(b_2, notprofitable(C)), _N+1) :- according_to(b_2, notprofitable(C)), legally_holds(madeLoss(C)), justify(according_to(b_2, notprofitable(C)), _N).
opposes(profitable(V0), notprofitable(V0)) :- according_to(R, profitable(V0)).
opposes(profitable(V0), notprofitable(V0)) :- according_to(R, notprofitable(V0)).
:- legally_holds(profitable(V0)), legally_holds(notprofitable(V0)).
