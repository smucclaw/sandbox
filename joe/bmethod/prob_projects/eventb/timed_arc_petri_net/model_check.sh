probcli PetriNet_mch.eventb -nodead \
  -ctlformula "AG true" \
  -cs \
  -p SYMMETRY_MODE flood \
  -p por ample_sets \
  -p CLPFD true \
  -p SMT true \
  -p SMT_SUPPORTED_INTERPRETER true \
  -dotexpr transition_diagram marking evidence.dot

dot -Tsvg evidence.dot -o evidence.svg
