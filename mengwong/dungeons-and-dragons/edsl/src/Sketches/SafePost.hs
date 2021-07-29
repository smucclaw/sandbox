module Sketches.SafePost where
import Types
sketch :: StateTree
sketch =
  leaf $ "Safe Contract" :-> [(Just "Equity Financing", state "Conversion")
                             ,(Just "Liquidity Event", "Greater of" :-> [(Just "Cash-Out Amount",   state "Residual Pro-Rata")
                                                                        ,(Just "Conversion Amount", state "Conversion Pro-Rata")])
                             ,(Just "Dissolution", state "Residual Pro-Rata")
                              -- Liquidiation Priority is not a state transition, it is a decorator to the Liquidity and Dissolution Events.
                             -- Termination is not actually a state transition, it just indicates exclusivity between the other state transitions, which is implicit here
                             ]
