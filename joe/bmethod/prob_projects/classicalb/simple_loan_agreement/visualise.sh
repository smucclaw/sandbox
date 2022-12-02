probcli M0.mch -csp-guide contract.csp \
  -ctlformula "AG true" \
  -p COMPRESSION true \
  -p OPERATION_REUSE true \
  -dotexpr transition_diagram "(is_contract_breached, active_rules, rules_to_trigger, rules_to_interrupt)" evidence.dot
  # -dot state_space evidence.dot

dot -Tsvg evidence.dot -o evidence.svg