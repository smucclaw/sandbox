probcli PDPA.mch -nodead \
  -model_check \
  -p COMPRESSION true \
  -p OPERATION_REUSE true \
  -dotexpr transition_diagram "(breached_by, dom(active_rules))" evidence.dot

  # -dot state_space evidence.dot

dot -Tsvg evidence.dot -o evidence.svg