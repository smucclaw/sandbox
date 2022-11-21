SYSTEM M0

SETS
  Vehicle; Day; Road

ABSTRACT_CONSTANTS
  // Subsets
  Car, Truck, Highway, Workday, Holiday,

  // Predicates, expressed as n-ary relations.
  // Nullary predicates are interpreted in the 2 valued boolean algebra BOOL.
  maxSpeed,

  tCar, tDay, tRoad, tSpeed1, tSpeed2

DEFINITIONS
  subtypes(X, S) ==
    S : seq(POW(X)) &
    !i, j. ((i : dom(S) & j : dom(S) & i < j) =>
      S(i) /\ S(j) = {}
    )

PROPERTIES
  // Typing information for subsets.
  subtypes(Vehicle, [Car, Truck]) &
  subtypes(Road, [Highway]) &
  subtypes(Day, [Workday, Holiday]) &

  /*@label maxSpCarWorkdayHighway */
  !v, d, r, s. (
    (v : Car & d : Workday & r : Highway & s = 130) =>
    (v, d, r, s) : maxSpeed
  ) &

  /*@label maxSpCarWorkdayRoad */
  !v, d, r, s. (
    (v : Car & d : Workday & r : Road & s = 90) =>
    (v, d, r, s) : maxSpeed
  ) &

  /*@label maxSpClosure */
  !v, d, r, s. (
    (v, d, r, s) : maxSpeed => (
      (v : Car & d : Workday & r : Highway & s = 130) or
      (v : Car & d : Workday & r : Highway & s = 90)
    )
  ) &

  tCar : Car &
  tDay : Day &
  tRoad : Road &
  tSpeed1 : NATURAL &
  tSpeed2 : NATURAL

// INVARIANT
// maxSpeed : Vehicle * Day * Road +-> INTEGER

  /*
    This won't typecheck as maxSpeed is inferred to have the type
    Vehicle * Day * Highway <-> NATURAL
  */
  // & (0, 0, 0, 0) : maxSpeed

END