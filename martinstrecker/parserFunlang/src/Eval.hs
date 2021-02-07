-- Evaluation of expressions

module Eval where

import Data.List
import Syntax
import Typing


-- Dynamic environment for evaluation
type DEnvironment = [(VarName, Exp Tp)]

lift_uarith_op :: UArithOp -> Val -> Val
lift_uarith_op u c = case (u, c) of
  (UAminus, IntV i) -> IntV (- i)
  _ -> ErrV

lift_ubool_op :: UBoolOp -> Val -> Val
lift_ubool_op u c = case (u, c) of
  (UBneg, BoolV b) -> BoolV (not b)
  _ -> ErrV

lift_unaop_expr :: UnaOp -> Exp Tp -> Exp Tp
lift_unaop_expr uop e = case (uop, e) of
  (UArith u, ValE t c) -> ValE t (lift_uarith_op u c)
  (UBool u, ValE t c) -> ValE t (lift_ubool_op u c)
  _ -> ValE ErrT ErrV

barith_fun :: BArithOp -> Int -> Int -> Int
barith_fun ba = case ba of
  BAadd -> (+)
  BAsub -> (-)
  BAmul -> (*)
  BAdiv -> (div)
  BAmod -> (mod)

lift_barith_op :: BArithOp -> Val -> Val -> Val
lift_barith_op ba c1 c2 = case (c1, c2) of
  (IntV i1, IntV i2) -> IntV ((barith_fun ba) i1 i2)
  _ -> ErrV


lift_binop_expr :: BinOp -> Exp Tp -> Exp Tp -> Exp Tp
lift_binop_expr bop e1 e2 = case (bop, e1, e2) of
    (BArith ba, ValE t1 c1, ValE t2 c2) ->
      ValE (tp_barith t1 t2 ba) (lift_barith_op ba c1 c2)


-- reduction semantics as in Lambda calculus

lift :: Exp Tp -> Int -> Exp Tp
lift ve@(ValE t v) ind = ve
lift (VarE t vn i) ind = (if i < ind then VarE t vn i else VarE t vn (i + 1))
lift (UnaOpE t uop e) ind = (UnaOpE t uop (lift e ind))
lift (BinOpE t bop e1 e2) ind = (BinOpE t bop (lift e1 ind) (lift e2 ind))
lift (IfThenElseE t c e1 e2) ind =
  (IfThenElseE t (lift c ind) (lift e1 ind) (lift e2 ind))
lift (AppE t f a) ind = AppE t (lift f ind) (lift a ind)
lift (FunE t vn fnt fe) ind = (FunE t vn fnt (lift fe (ind + 1)))

subst :: Exp Tp -> Exp Tp -> Int -> Exp Tp
subst ve@(ValE t v) sub ind = ve
subst (VarE t vn i) sub ind =
  if ind < i
  then VarE t vn (i - 1)
  else
    if i == ind
    then sub
    else (VarE t vn i)
subst (UnaOpE t uop e) sub ind = (UnaOpE t uop (subst e sub ind))
subst (BinOpE t bop e1 e2) sub ind = (BinOpE t bop (subst e1 sub ind) (subst e2 sub ind))
subst (IfThenElseE t c e1 e2) sub ind =
  (IfThenElseE t (subst c sub ind) (subst e1 sub ind) (subst e2 sub ind))
subst (AppE t f a) sub ind = AppE t (subst f sub ind) (subst a sub ind)
subst (FunE t fn fnt fe) sub ind = (FunE t fn fnt (subst fe (lift sub 0) (ind + 1)))


reduceExpr :: Exp Tp -> Exp Tp
reduceExpr x = case x of
  r@(ValE t c) ->  r
  r@(VarE t v i) -> r
  UnaOpE t uop e -> lift_unaop_expr uop (reduceExpr e)
  BinOpE t bop e1 e2 -> lift_binop_expr bop (reduceExpr e1) (reduceExpr e2)
  AppE t f a -> case reduceExpr f of
    (FunE tf fn fnt fe) -> reduceExpr (subst fe (reduceExpr a) 0)
    _ -> ValE ErrT ErrV
  r@(FunE t vn vt e) -> r


-- fetchAt :: Int -> DEnvironment -> Exp Tp
-- fetchAt pos env = snd (head (drop pos env))


-- evalExpr  :: DEnvironment -> Exp Tp -> Exp Tp
-- evalExpr  env x = case x of
--   ValE t c -> ValE t c
--   VarE t v i -> fetchAt i env
--   UnaOpE t uop e -> lift_unaop_expr uop (evalExpr  env e)
--   BinOpE t bop e1 e2 -> lift_binop_expr bop (evalExpr  env e1) (evalExpr  env e2)

