# export LD_LIBRARY_PATH=../../z3-4.8.14-x64-glibc-2.31/bin

probcli M0.mch -nodead \
  -ctlformula "AG true" \
  -dot state_space evidence.dot

dot -Tsvg evidence.dot -o evidence.svg