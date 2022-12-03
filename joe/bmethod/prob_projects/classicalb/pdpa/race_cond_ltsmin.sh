export LD_LIBRARY_PATH=/opt/prob/lib:$LD_LIBRARY_PATH
export PATH=/opt/prob:$PATH

probcli PDPA.mch -nodead \
  -mc_with_lts-seq -p LTSMIN ~/ltsmin-v3.0.2/bin \
  -ctlformula "EF EX[event_happens(notify_indiv, _)] EF EX[event_happens(prohibit_notify_indiv, _)] EG EX[tic] true" \
  -dot history evidence.dot

dot -Tsvg evidence.dot -o evidence.svg