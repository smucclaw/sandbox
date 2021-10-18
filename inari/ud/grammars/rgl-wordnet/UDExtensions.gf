abstract UDExtensions = UDApp ** {

  cat
    UDFragment ; -- string to be plugged in to output

  fun
    -- if the UDS has no subject, add one
    -- if the UDS has already, replace with the 1st arg
    addSubj : NP -> UDS -> UDFragment ; -- add new or replace existing subject

    gerund,    -- upon [becoming aware a data breach has occurred]
    question,  -- has the data breach occurred on or after <date>?
    negation : UDS -> UDFragment ;
}