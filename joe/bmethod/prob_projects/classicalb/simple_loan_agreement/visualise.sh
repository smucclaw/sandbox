# LTL model checking: memory usage approx. 39686 KiB, 420074 atoms and 662397 transitions generated
# LTL model checking: total time 166591ms, 210601 callbacks needed 165841ms, netto 750ms.
# LTL Formula TRUE.
# No counter example found for G true.
# Runtime: 134663 ms

probcli M0.mch -csp-guide contract.csp \
  -ltlformula "G true" \
  -p COMPRESSION TRUE \
  -p OPERATION_REUSE TRUE \
  -dotexpr transition_diagram "(active_rules, rules_to_trigger, rules_to_interrupt)" evidence.dot
  # -dot state_space evidence.dot

dot -Tsvg evidence.dot -o evidence.svg