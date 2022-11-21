MACHINE PetriNet
SETS /* enumerated */
  PLACE={p0, p1, p2}
ABSTRACT_VARIABLES
  clock,
  marking
/* PROMOTED OPERATIONS
  tick,
  t0 */
INVARIANT
    /*@label PetriNet:invMarking1  */ marking ∈ PLACE → (ℕ ⇸ ℕ₁)
  & /*@label PetriNet:invMarking2  */ 
    ∀p.(
     p ∈ PLACE
     ⇒
     dom(marking(p)):FIN(dom(marking(p)))
    )
  & /*@label PetriNet:invMarking3  */ card(marking[{p1,p2}]) ≤ 2
  & /*@label PetriNet:invClock  */ clock ∈ ℕ
INITIALISATION
  marking := (λp. (p ∈ PLACE|∅)) <+ {p0 ↦ {0 ↦ 1}} ||
  clock := 0

OPERATIONS
  tick(n) = 
    PRE 
        n ∈ ℤ
        & /*@label PetriNet:grd1  */ n ∈ ℕ₁
        & /*@label PetriNet:grd2  */ clock + n ≤ 20
      THEN 
        clock := clock + n
        ||
        marking :=
          (λp. (p ∈ PLACE|{comp_result | comp_result ∈ ℤ × ℤ ∧ ∃tokenAge· (tokenAge ∈ dom(marking(p)) ∧ comp_result = tokenAge + n ↦ marking(p)(tokenAge))}))
    END;
  
  t0(p1NewTokens,tokenCount,tokenAge,p0NewTokens,p2NewTokens) = 
    PRE 
        p1NewTokens ∈ ℙ(ℤ × ℤ)
      & tokenCount ∈ ℤ
      & tokenAge ∈ ℤ
      & p0NewTokens ∈ ℙ(ℤ × ℤ)
      & p2NewTokens ∈ ℙ(ℤ × ℤ)
        &  /*@label PetriNet:grd1  */ tokenAge ∈ dom(marking(p0))
        & /*@label PetriNet:grd2  */ marking(p0)(tokenAge) = tokenCount
        & /*@label PetriNet:grd3  */ 
          ∀otherTokenAge.(
           otherTokenAge ∈ dom(marking(p0))
           ⇒
           otherTokenAge ≤ tokenAge
          )
        & /*@label PetriNet:grd4  */ (
           tokenCount > 1
           ⇒
           p0NewTokens = {tokenAge ↦ tokenCount - 1}
          )
        & /*@label PetriNet:grd5  */ (
           tokenCount = 1
           ⇒
           p0NewTokens = ∅
          )
        & /*@label PetriNet:grd6  */ (
           0 ∈ dom(marking(p1))
           ⇒
           p1NewTokens = {0 ↦ marking(p1)(0) + 1}
          )
        & /*@label PetriNet:grd7  */ (
           0 ∉ dom(marking(p1))
           ⇒
           p1NewTokens = {0 ↦ 1}
          )
        & /*@label PetriNet:grd8  */ (
           0 ∈ dom(marking(p2))
           ⇒
           p2NewTokens = {0 ↦ marking(p2)(0) + 1}
          )
        & /*@label PetriNet:grd9  */ (
           0 ∉ dom(marking(p2))
           ⇒
           p2NewTokens = {0 ↦ 1}
          )
      THEN 
           marking := marking
            <+ ({p0 ↦ (({tokenAge} ⩤ marking(p0)) <+ p0NewTokens)}
            <+ ({p1 ↦ (({0} ⩤ marking(p1)) <+ p1NewTokens)}
            <+ {p2 ↦ (({0} ⩤ marking(p2)) <+ p2NewTokens)}))
      END
END
