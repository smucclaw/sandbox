# Here we ask the model checker to prove that along any valid trace of the system,
# if the organization is prohibited from notifying the individual, it must not
# have notified the individual beforehand.
#
# For our semantics, we have:
# - a denotational trace-based semantics inspired by CSP and Deon Digital's CSL.
# - a small-step operational semantics inspired by Symeoleo and implemented as
#   a network of communicating processes in a combination of CSP and B.
#
# Extensionally, a contract classifies traces into those that fulfill the
# contract, and those that breach it.
# Our operational semantics is designed to agree with this, though that remains
# to be verified properly.
# Note that this means we take the notion of breached and fulfilled to be
# properties of individual execution traces.
# We say that a trace fulfills a contract iff it is an infinite run.
# All other traces are deemed to have breached the contract.
# This includes:
# - traces which are not accepted by the language of the transition system.
# - traces ending in deadlocks.
#
# The idea is that the violation of rules is determined by the deontic attached
# to the rule and works like throwing an exception to divert control-flow from
# the happy path where all goes right.
# Comepensatory clauses then function like catch blocks that try to recover
# from the error.
# If the error is taken care of successfully, the contract again succeeds silently.
# If instead, some unreparable clause is violated, then the exception goes
# uncaught and the whole execution flow is abruptly terminated via a deadlock.
#
# With this, we formalize the race condition in LTL as follows:
# Assume we have an arbitrary trace pi which fulfills the contract.
# For the sake of eliminating Zeno runs, we also assume that this trace is
# weakly fair wrt the discrete tic transition.
# In other words, we assume (F G e(tic) => G F [tic]).
# (This is not so much a concern here but is a big problem in Flood and Goodenough)
# Assume that pi(i) is the event where the organization is prohibited from
# notifying the individual.
# Then for j /= i, pi(j) is not the event where the organization notified the
# individual.
#
# Obviously, this fails and we get the expected counter-example.

probcli M0.mch -nodead -csp-guide pdpa.csp \
  -ltlformula \
  "WF(tic) => (((G not deadlock) & F [prohibit_notify_indiv(TRUE, _)]) => G not [notify_indiv(TRUE, _)])" \
  -dot history evidence.dot

dot -Tsvg evidence.dot -o evidence.svg