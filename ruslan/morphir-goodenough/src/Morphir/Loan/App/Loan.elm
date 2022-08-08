module Morphir.Loan.App.Loan exposing (..)

request : Int -> Int -> Result String Int
request availability requestedQuantity =
    if requestedQuantity <= availability then
        Ok requestedQuantity

    else
        Err "Insufficient availability"