probcli M0.mch -nodead -csp-guide contract.csp \
  -ctlformula \
  "EF EX[pay1(TRUE, _)] EF EX[pay2(TRUE, _)] EF EG [tic]" \
  -dot history evidence.dot

dot -Tsvg evidence.dot -o evidence.svg