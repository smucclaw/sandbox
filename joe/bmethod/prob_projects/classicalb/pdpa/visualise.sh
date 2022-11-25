# export LD_LIBRARY_PATH=../../z3-4.8.14-x64-glibc-2.31/bin

probcli M0.mch -csp-guide pdpa.csp \
  -p ALLOW_LOCAL_OPERATION_CALLS TRUE \
  -ctlformula "AG true" \
  -dot state_space evidence.dot

dot -Tsvg evidence.dot -o evidence.svg