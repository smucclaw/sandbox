probcli M1_mch.eventb -nodead -csp-guide contract.csp \
  -ctlformula "AG ((e(breached) => not e(fulfilled)) & (e(fulfilled) => not e(breached)))" \
  -p SYMMETRY_MODE flood \
  -p por ample_sets \
  -p COMPRESSION true \
  -p PROOF_INFO true \
  -p CLPFD true \
  -p SMT true