# Here we ask the model checker to prove that along any valid trace of the system,
# if the organization is prohibited from notifying the individual, it must not
# have notified the individual beforehand.
#
# More precisely, assume we have an arbitrary trace pi which does not breach the
# contract, ie it never deadlocks.
# For the sake of eliminating Zeno runs, we also assume that this trace is
# weakly fair wrt the discrete tic transition.
# In other words, we assume (F G e(tic) => G F [tic]).
# (This is not so much a concern here but is a big problem in Flood and Goodenough)
# Assume that pi(i) is the event where the organization is prohibited from
# notifying the individual.
# Then for j < i, pi(j) is not the event where the organization notified the
# individual.
#
# Obviously, this fails and we get the expected counter-example.
# Note that the model check succeeds if we change H to its dual, F.

probcli M0.mch -nodead -csp-guide pdpa.csp \
  -ltlformula \
  "WF(tic) => ((G not deadlock) => (G ([prohibit_notify_indiv(TRUE, _)] => H not [notify_indiv(TRUE, _)])))" \
  -dot history evidence.dot

dot -Tsvg evidence.dot -o evidence.svg