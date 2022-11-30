# export LD_LIBRARY_PATH=../../z3-4.8.14-x64-glibc-2.31/bin

probcli M0.mch -csp-guide pdpa.csp \
  -ltlformula "G true" \
  -dotexpr transition_diagram "(active_rules, rules_to_trigger, rules_to_interrupt)" evidence.dot

  # -dot state_space evidence.dot

dot -Tsvg evidence.dot -o evidence.svg