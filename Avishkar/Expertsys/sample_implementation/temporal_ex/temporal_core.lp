according_to(a_1, fluent(T+1)) :- legally_holds(fluent(T)),T<5.

explains(fluent(T), fluent(T+1) ,_N+1) :- query(fluent(T+1) ,_N),T<5.


caused_by(pos, legally_holds(fluent(T)), according_to(a_1, fluent(T+1)), _N+1) :- according_to(a_1, fluent(T+1)), legally_holds(fluent(T)),justify(according_to(a_1, fluent(T+1)), _N),T<5.
