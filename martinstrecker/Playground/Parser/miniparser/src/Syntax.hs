
module Syntax where
import Coordinates

data Exp a =
        LetE a   [(String, Exp a)] (Exp a)|
        PlusE a  (Exp a) (Exp a)        |
        MinusE a (Exp a) (Exp a)        |
        TimesE a (Exp a) (Exp a)        |
        DivE a   (Exp a) (Exp a)        |
        NegE a   (Exp a)              |
        IntE a   Int            |
        VarE a   String
        deriving Show

expCoord :: Exp CoordRng -> CoordRng
expCoord x = case x of
  LetE c _ _ -> c
  PlusE c _ _ -> c
  MinusE c _ _ -> c
  TimesE c _ _ -> c
  DivE c _ _ -> c
  IntE c _ -> c
  VarE c _ -> c
  
