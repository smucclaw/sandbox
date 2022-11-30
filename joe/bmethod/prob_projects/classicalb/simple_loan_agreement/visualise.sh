probcli M0.mch -csp-guide contract.csp \
  -ltlformula "G true" \
  -p COMPRESSION TRUE \
  -p OPERATION_REUSE TRUE \
  -dotexpr transition_diagram "(active_rules, rules_to_trigger, rules_to_interrupt)" evidence.dot
  # -dot state_space evidence.dot

dot -Tsvg evidence.dot -o evidence.svg