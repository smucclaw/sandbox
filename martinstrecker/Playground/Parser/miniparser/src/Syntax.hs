
module Syntax where
import Coordinates

type VarName = String

data Exp a =
        LetE a   [(VarName, Exp a)] (Exp a)|
        PlusE a  (Exp a) (Exp a)        |
        MinusE a (Exp a) (Exp a)        |
        TimesE a (Exp a) (Exp a)        |
        DivE a   (Exp a) (Exp a)        |
        NegE a   (Exp a)              |
        BoolE a  Bool          |
        IntE a   Int            |
        VarE a   VarName
        deriving Show

-- the coordinates component of an expression
expCoord :: Exp CoordRng -> CoordRng
expCoord x = case x of
  LetE c _ _ -> c
  PlusE c _ _ -> c
  MinusE c _ _ -> c
  TimesE c _ _ -> c
  DivE c _ _ -> c
  BoolE c _ -> c
  IntE c _ -> c
  VarE c _ -> c
  
-- update an expression with a new coordinate
updateCoord :: CoordRng -> Exp CoordRng -> Exp CoordRng
updateCoord nc x = case x of
  LetE c b e -> LetE nc b e
  PlusE c e1 e2 -> PlusE nc e1 e2
  MinusE c e1 e2 -> MinusE nc e1 e2
  TimesE c e1 e2 -> TimesE nc e1 e2
  DivE c e1 e2 -> DivE nc e1 e2
  BoolE c b -> BoolE nc b
  IntE c i -> IntE nc i
  VarE c v -> VarE nc v
  
