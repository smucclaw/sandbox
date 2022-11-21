
MACHINE ContractMch
SETS /* enumerated */
  CONTRACTSTATE={breached,fulfilled,inProgress}
CONCRETE_CONSTANTS
  paymentAmt,
  paymentDeadline,
  sum,
  initialOutstanding,
  numPayments
ABSTRACT_VARIABLES
  currState,
  outstanding,
  nextPaymentNum
/* PROMOTED OPERATIONS
  pay_normal,
  pay_accelerated */
AXIOMS
    initialOutstanding ∈ ℤ
  & numPayments ∈ ℤ
  & /*@label ContractCtx:axmNumPayments  */ numPayments = 2
  & /*@label ContractCtx:axmPaymentAmt1  */ paymentAmt ∈ 1 ‥ numPayments → ℕ₁
  & /*@label ContractCtx:axmPaymentAmt2  */ paymentAmt = {(1↦550),(2↦525)}
  & /*@label ContractCtx:axmPaymentDeadline1  */ paymentDeadline ∈ 1 ‥ numPayments → ℕ
  & /*@label ContractCtx:axmPaymentDeadline2  */ paymentDeadline = {(1↦365),(2↦720)}
  & /*@label ContractCtx:axmSum1  */ sum ∈ 1 ‥ numPayments → ℕ₁
  & /*@label ContractCtx:axmSum2  */ sum(1) = paymentAmt(1)
  & /*@label ContractCtx:axmSum3  */ 
    ∀i.(
     i ∈ 2 ‥ numPayments
     ⇒
     sum(i) = sum(i - 1) + paymentAmt(i)
    )
  & /*@label ContractCtx:axmInitialOutstanding  */ initialOutstanding = sum(numPayments)
INVARIANT
    currState ∈ CONTRACTSTATE
  & /*@label ContractMch:invOutstanding  */ outstanding ∈ 0 ‥ initialOutstanding
  & /*@label ContractMch:invCurrPayment  */ nextPaymentNum ∈ 1 ‥ numPayments + 1
  & /*@label ContractMch:invNextPaymentNum  */ (
     nextPaymentNum = numPayments + 1
     ⇒
     outstanding = 0
    )
THEOREMS
     /*@label ContractCtx:thmInitialOutstandingEq  */ initialOutstanding = 1075
INITIALISATION
    EVENT /* of machine ContractMch */
    BEGIN 
         outstanding := initialOutstanding
      ||
         nextPaymentNum := 1
      ||
         currState := inProgress
    END
EVENTS
  pay_normal = 
    EVENT pay_normal = /* of machine ContractMch */
    WHEN 
        /*@label ContractMch:grd1  */ outstanding > 0
    THEN 
         outstanding := outstanding - paymentAmt(nextPaymentNum)
      ||
         nextPaymentNum := nextPaymentNum + 1
    END;
  
  pay_accelerated = 
    EVENT pay_accelerated = /* of machine ContractMch */
    WHEN 
        /*@label ContractMch:grd1  */ outstanding > 0
    THEN 
         outstanding := 0
    END
END
