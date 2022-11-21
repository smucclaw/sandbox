probcli M1_mch.eventb -nodead -csp-guide contract.csp \
  -ctlformula "AG (AF { state : {Breached, Fulfilled} })" \
  -p SYMMETRY_MODE flood \
  -p por ample_sets \
  -p COMPRESSION true \
  -p PROOF_INFO true \
  -p CLPFD true \
  -p SMT true \
  -dot history evidence.dot

dot -Tsvg evidence.dot -o evidence.svg