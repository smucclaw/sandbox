# export LD_LIBRARY_PATH=../../z3-4.8.14-x64-glibc-2.31/bin

probcli M1.mch \
  -ctlformula "AG true" \
  -disable_timeout \
  -dot state_space_sfdp evidence.dot
  # -dotexpr transition_diagram "(is_breached, dom(active_rules))" evidence.dot

  # -dot state_space evidence.dot

dot -Tsvg evidence.dot -o evidence.svg