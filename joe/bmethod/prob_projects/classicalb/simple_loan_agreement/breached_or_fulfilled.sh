probcli M0.mch -csp-guide contract.csp \
  -ltlformula "WF(tic) => F G ({is_contract_breached = TRUE} & deadlock) or (G {is_contract_breached = FALSE} & F G [tic])" \
  -dot history evidence.dot

dot -Tsvg evidence.dot -o evidence.svg