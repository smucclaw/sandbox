probcli M1_mch.eventb -nodead -csp-guide contract.csp \
  -ctlformula "EF (EX[pay_normal] EF (EX[pay_normal] {state = Fulfilled}))" \
  -p SYMMETRY_MODE flood \
  -p por ample_sets \
  -p COMPRESSION true \
  -p PROOF_INFO true \
  -p CLPFD true \
  -p SMT true \
  -dot history evidence.dot
  # -dotexpr transition_diagram "(outstanding, state)" evidence.dot

dot -Tsvg evidence.dot -o evidence.svg