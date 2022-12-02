# The LTL formula says the following:
# Assume we have a trace that fulfills the contract, ie a non-Zeno that is
# non deadlocking.
# By non-Zeno, we mean weakly fair wrt the discrete tic transition.
# Further assume that:
# - the lender sends the principal at some point
# - the borrower never makes an accelerated repayment
# - the borrower never cures any default (payment or otherewise)
# Then it must be the case that the borrower made both payments on time.
#
# This fails as it is possible for the borrower to not pay the lender anything
# at all.
# This follows immediately from the following observations:
# - we assumed the deontic in the notify borrower of default rule is a
#   permission rather than a non-compensable (pre-emptive achievement) obligation.
# - the borrower is only obligated to make an accelerated payment upon receiving
#   a notification of his default from the lender.
#
# Changing the deontic from a permission to a non-compensable obligation yields
# the following result:
# No counter example found for WF(tic) => (((G not deadlock) & (G not [pay_accelerated(TRUE, _)]) & (G not [cure_default(TRUE, _)]) & F [send_principal(TRUE, _)]) => (F [pay1(TRUE, _)] & F [pay2(TRUE, _)])).

probcli M0.mch -csp-guide contract.csp \
  -ltlformula "WF(tic) => ((G ({is_contract_breached = FALSE} & not [pay_accelerated(TRUE, _)] & not [cure_default(TRUE, _)]) & F [send_principal(TRUE, _)]) => F [pay1(TRUE, _)] & F [pay2(TRUE, _)])" \
  -dot history evidence.dot

dot -Tsvg evidence.dot -o evidence.svg