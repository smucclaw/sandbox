according_to(s64_3_1aDisj0, significantHarm(Db, Indiv)) :- legally_holds(dataOfBreach(Dt, Db)), legally_holds(isNameOf(Indiv, Dt)).
according_to(s64_3_1aDisj1, significantHarm(Db, Indiv)) :- legally_holds(dataOfBreach(Dt, Db)), legally_holds(isAliasOf(Indiv, Dt)).
according_to(s64_3_1aDisj2, significantHarm(Db, Indiv)) :- legally_holds(dataOfBreach(Dt, Db)), legally_holds(isIdentificationNumberOf(Indiv, Dt)).
according_to(s64_3_1aDisj3, significantHarm(Db, Indiv)) :- legally_holds(dataOfBreach(Dt, Db)), legally_holds(dataSchedulePart1(Indiv, Dt)), legally_holds(notdataSchedulePart2(Indiv, Dt)).
according_to(s64_3_1bDisj0, significantHarm(Db, Indiv)) :- legally_holds(dataOfBreach(Dt, Db)), legally_holds(isAccountIdentifier(Indiv, Dt)).
according_to(s64_3_1bDisj1, significantHarm(Db, Indiv)) :- legally_holds(dataOfBreach(Dt, Db)), legally_holds(isAccessCode(Indiv, Dt)).
according_to(s64_4, exceedsPrescrNumberOfIndividuals(Db)) :- legally_holds(numberOfAffectedIndividuals(Db,N)),N >= 500.
% Missing commas, explains(dataOfBreach(Dt, Db), significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(isNameOf(Indiv, Dt), significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(dataOfBreach(Dt, Db), significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(isAliasOf(Indiv, Dt), significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(dataOfBreach(Dt, Db), significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(isIdentificationNumberOf(Indiv, Dt), significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(dataOfBreach(Dt, Db), significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(dataSchedulePart1(Indiv, Dt), significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(notdataSchedulePart2(Indiv, Dt), significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(dataOfBreach(Dt, Db), significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(isAccountIdentifier(Indiv, Dt), significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(dataOfBreach(Dt, Db), significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
explains(isAccessCode(Indiv, Dt), significantHarm(Db, Indiv) _N+1) :- query(significantHarm(Db, Indiv) _N).
%explains((numberOfAffectedIndividuals(Db) >= 500), exceedsPrescrNumberOfIndividuals(Db) _N+1) :- query(exceedsPrescrNumberOfIndividuals(Db) _N).
caused_by(pos, legally_holds(dataOfBreach(Dt, Db)), according_to(s64_3_1aDisj0, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1aDisj0, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds(isNameOf(Indiv, Dt)), justify(according_to(s64_3_1aDisj0, significantHarm(Db, Indiv)), _N).
caused_by(pos, legally_holds(isNameOf(Indiv, Dt)), according_to(s64_3_1aDisj0, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1aDisj0, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds(isNameOf(Indiv, Dt)), justify(according_to(s64_3_1aDisj0, significantHarm(Db, Indiv)), _N).
caused_by(pos, legally_holds(dataOfBreach(Dt, Db)), according_to(s64_3_1aDisj1, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1aDisj1, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds(isAliasOf(Indiv, Dt)), justify(according_to(s64_3_1aDisj1, significantHarm(Db, Indiv)), _N).
caused_by(pos, legally_holds(isAliasOf(Indiv, Dt)), according_to(s64_3_1aDisj1, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1aDisj1, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds(isAliasOf(Indiv, Dt)), justify(according_to(s64_3_1aDisj1, significantHarm(Db, Indiv)), _N).
caused_by(pos, legally_holds(dataOfBreach(Dt, Db)), according_to(s64_3_1aDisj2, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1aDisj2, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds(isIdentificationNumberOf(Indiv, Dt)), justify(according_to(s64_3_1aDisj2, significantHarm(Db, Indiv)), _N).
caused_by(pos, legally_holds(isIdentificationNumberOf(Indiv, Dt)), according_to(s64_3_1aDisj2, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1aDisj2, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds(isIdentificationNumberOf(Indiv, Dt)), justify(according_to(s64_3_1aDisj2, significantHarm(Db, Indiv)), _N).
caused_by(pos, legally_holds(dataOfBreach(Dt, Db)), according_to(s64_3_1aDisj3, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1aDisj3, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds(dataSchedulePart1(Indiv, Dt)), legally_holds(notdataSchedulePart2(Indiv, Dt)), justify(according_to(s64_3_1aDisj3, significantHarm(Db, Indiv)), _N).
caused_by(pos, legally_holds(dataSchedulePart1(Indiv, Dt)), according_to(s64_3_1aDisj3, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1aDisj3, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds(dataSchedulePart1(Indiv, Dt)), legally_holds(notdataSchedulePart2(Indiv, Dt)), justify(according_to(s64_3_1aDisj3, significantHarm(Db, Indiv)), _N).
caused_by(pos, legally_holds(notdataSchedulePart2(Indiv, Dt)), according_to(s64_3_1aDisj3, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1aDisj3, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds(dataSchedulePart1(Indiv, Dt)), legally_holds(notdataSchedulePart2(Indiv, Dt)), justify(according_to(s64_3_1aDisj3, significantHarm(Db, Indiv)), _N).
caused_by(pos, legally_holds(dataOfBreach(Dt, Db)), according_to(s64_3_1bDisj0, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1bDisj0, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds((N > 5)), legally_holds(isAccountIdentifier(Indiv, Dt)), justify(according_to(s64_3_1bDisj0, significantHarm(Db, Indiv)), _N).
% Check this line: caused_by(pos, legally_holds((N > 5)), according_to(s64_3_1bDisj0, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1bDisj0, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds((N > 5)), legally_holds(isAccountIdentifier(Indiv, Dt)), justify(according_to(s64_3_1bDisj0, significantHarm(Db, Indiv)), _N).
caused_by(pos, legally_holds(isAccountIdentifier(Indiv, Dt)), according_to(s64_3_1bDisj0, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1bDisj0, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds((N > 5)), legally_holds(isAccountIdentifier(Indiv, Dt)), justify(according_to(s64_3_1bDisj0, significantHarm(Db, Indiv)), _N).
caused_by(pos, legally_holds(dataOfBreach(Dt, Db)), according_to(s64_3_1bDisj1, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1bDisj1, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds((N > 5)), legally_holds(isAccessCode(Indiv, Dt)), justify(according_to(s64_3_1bDisj1, significantHarm(Db, Indiv)), _N).
% Check this line: caused_by(pos, legally_holds((N > 5)), according_to(s64_3_1bDisj1, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1bDisj1, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds((N > 5)), legally_holds(isAccessCode(Indiv, Dt)), justify(according_to(s64_3_1bDisj1, significantHarm(Db, Indiv)), _N).
caused_by(pos, legally_holds(isAccessCode(Indiv, Dt)), according_to(s64_3_1bDisj1, significantHarm(Db, Indiv)), _N+1) :- according_to(s64_3_1bDisj1, significantHarm(Db, Indiv)), legally_holds(dataOfBreach(Dt, Db)), legally_holds((N > 5)), legally_holds(isAccessCode(Indiv, Dt)), justify(according_to(s64_3_1bDisj1, significantHarm(Db, Indiv)), _N).
% Check this line: caused_by(pos, legally_holds(numberOfAffectedIndividuals(Db,N)), according_to(s64_4, exceedsPrescrNumberOfIndividuals(Db)), _N+1) :- according_to(s64_4, exceedsPrescrNumberOfIndividuals(Db)), legally_holds(numberOfAffectedIndividuals(Db,N)),N>=500, justify(according_to(s64_4, exceedsPrescrNumberOfIndividuals(Db)), _N).

% Opposes pred
opposes(dataSchedulePart2(V0, V1), notdataSchedulePart2(V0, V1)) :- according_to(R, dataSchedulePart2(V0, V1)).
opposes(dataSchedulePart2(V0, V1), notdataSchedulePart2(V0, V1)) :- according_to(R, notdataSchedulePart2(V0, V1)).
:- legally_holds(dataSchedulePart2(V0, V1)), legally_holds(notdataSchedulePart2(V0, V1)).
