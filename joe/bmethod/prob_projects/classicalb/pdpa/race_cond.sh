# For our semantics, we have:
# - a denotational trace-based semantics inspired by CSP and Deon Digital's CSL.
# - a small-step operational semantics inspired by Symeoleo and implemented as
#   a network of communicating processes in a combination of CSP and B.
#
# Extensionally, a contract classifies non-Zeno traces into those that fulfill
# the contract, and those that breach it.
# In other words, we define breached and fulfilled to be properties of traces.
# Operationally, a contract describes a concurrent multi-player game
# (think Lorenzen prover-skeptic dialogues), between:
# - the actors in the real world performing events
# - the runtime status of the contract whose state updates in reaction to
#   real world events
# Though our operational semantics is designed to agree with the denotational
# interpretation, this remains to be proven formally.
#
# Note that we use an explicit time approach with a discrete tic transition and
# thus define a non-Zeno trace to be a trace that is weakly fair wrt the
# discrete tic transition, ie (F G e(tic) => G F [tic]).
# (This is not so much a concern here but is a major problem in Flood and
# Goodenough due to traces like ... -> default -> cure_default -> default -> ...)
#
# We then say that a non-Zeno trace fulfills a contract iff it is infinite, ie
# it never deadlocks.
# All other non-zeno traces are deemed to have breached the contract.
# This includes those:
# - which are not accepted by the language of the transition system.
# - ending in deadlocks.
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
# Assume we have an arbitrary non-Zeno trace pi which fulfills the contract.
# In other words, we assume that pi is an infinite trace that is weakly fair
# wrt the discrete tic transition.
# Assume that pi(i) is the event where the organization is prohibited from
# notifying the individual.
# Then for j /= i, pi(j) is not the event where the organization notified the
# individual.
#
# Obviously, this fails and we get the expected counter-example.

probcli M0.mch -nodead -csp-guide pdpa.csp \
  -ltlformula \
  "WF(tic) => ((G {is_contract_breached = FALSE}) & (F [prohibit_notify_indiv(TRUE, _)]) => G not [notify_indiv(TRUE, _)])" \
  -dot history evidence.dot

dot -Tsvg evidence.dot -o evidence.svg