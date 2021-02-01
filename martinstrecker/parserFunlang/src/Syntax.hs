module Syntax where

----- Names
{-
newtype VarName = VarNm String
  deriving (Eq, Ord, Show, Read)
-}

type VarName = String

----- Types 
data Tp
  = BoolT
  | IntT
  | FunT Tp Tp
  | ErrT
  deriving (Eq, Ord, Show, Read)

----- Expressions 
data Val
    = BoolV Bool
    | IntV Int    -- was: Integer
    | ErrV
  deriving (Eq, Ord, Show, Read)


-- unary arithmetic operators
data UArithOp = UAminus
  deriving (Eq, Ord, Show, Read)

-- unary boolean operators
data UBoolOp = UBneg
  deriving (Eq, Ord, Show, Read)

-- unary operators (union of the above)
data UnaOp
    = UArith UArithOp
    | UBool UBoolOp
  deriving (Eq, Ord, Show, Read)

-- binary arithmetic operators
data BArithOp = BAadd | BAsub | BAmul | BAdiv | BAmod
  deriving (Eq, Ord, Show, Read)

-- binary comparison operators
data BComparOp = BCeq | BClt | BClte | BCgt | BCgte | BCne
  deriving (Eq, Ord, Show, Read)

-- binary boolean operators
data BBoolOp = BBand | BBor
  deriving (Eq, Ord, Show, Read)

-- binary operators (union of the above)
data BinOp
    = BArith BArithOp
    | BCompar BComparOp
    | BBool BBoolOp
  deriving (Eq, Ord, Show, Read)

data Exp t
    = ValE t Val                                -- value
    | VarE t VarName                            -- variable
    | UnaOpE t UnaOp (Exp t)                    -- unary operator
    | BinOpE t BinOp (Exp t) (Exp t)            -- binary operator
    | IfThenElseE t (Exp t) (Exp t) (Exp t)     -- conditional
    | AppE t (Exp t) (Exp t)                    -- function application
    | FunE t VarName Tp (Exp t)                 -- function abstraction
    deriving (Eq, Ord, Show, Read)

