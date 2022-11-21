# export LD_LIBRARY_PATH=../../z3-4.8.14-x64-glibc-2.31/bin

probcli M1_mch.eventb -nodead -csp-guide contract.csp \
  -ctlformula "AG true" \
  -dotexpr transition_diagram "(outstanding, state)" evidence.dot
  # -dot state_space evidence.dot

dot -Tsvg evidence.dot -o evidence.svg