module Typing where

import Data.List
import Syntax

-- Static environment for typing
type SEnvironment = [(VarName, Tp)]

tp_constval :: SEnvironment -> Val -> Tp
tp_constval env x = case x of
  BoolV _ -> BoolT
  IntV _ -> IntT

  
tp_var :: SEnvironment -> VarName -> Tp
tp_var env v =
  case lookup v env of
    Nothing -> ErrT
    Just t -> t


tp_of_expr :: Exp t -> t
tp_of_expr x = case x of
  ValE t _      -> t
  VarE t _ _        -> t
  UnaOpE t _ _    -> t
  BinOpE t _ _ _  -> t
  IfThenElseE t _ _ _ -> t
  AppE t _ _  -> t
  FunE t _ _ _  -> t

tp_uarith :: Tp -> UArithOp -> Tp
tp_uarith t ua = if t == IntT then IntT else ErrT

tp_ubool :: Tp -> UBoolOp -> Tp
tp_ubool t ub = if t == BoolT then BoolT else ErrT

tp_unaop :: Tp -> UnaOp -> Tp
tp_unaop t uop = case uop of
  UArith ua  -> tp_uarith t ua
  UBool ub   -> tp_ubool t ub


tp_barith :: Tp -> Tp -> BArithOp -> Tp
tp_barith t1 t2 ba = if (t1 == t2) && t1 == IntT then IntT else ErrT

tp_bcompar :: Tp -> Tp -> BComparOp -> Tp
tp_bcompar t1 t2 bc = if (t1 == t2) then BoolT else ErrT

tp_bbool :: Tp -> Tp -> BBoolOp -> Tp
tp_bbool t1 t2 bc = if (t1 == t2) && t1 == BoolT then BoolT else ErrT

tp_binop :: Tp -> Tp -> BinOp -> Tp
tp_binop t1 t2 bop = case bop of
  BArith ba  -> tp_barith t1 t2 ba
  BCompar bc -> tp_bcompar t1 t2 bc
  BBool bb   -> tp_bbool t1 t2 bb

push_vardecl_env :: VarName -> Tp -> SEnvironment -> SEnvironment
push_vardecl_env vn t env = (vn, t):env


-- position of variable in environment

pos :: VarName -> SEnvironment -> Int
pos v [] = 0
pos v ((hv, _):r) = if v == hv then 0 else (pos v r) + 1

tp_expr :: SEnvironment -> Exp () -> Exp Tp
tp_expr env x = case x of
  ValE () c -> ValE (tp_constval env c) c
  VarE () v _ -> VarE (tp_var env v) v (pos v env)
  UnaOpE () uop e -> 
    let te = (tp_expr env e)
        t   = tp_unaop (tp_of_expr te) uop
    in  UnaOpE t uop te
  BinOpE () bop e1 e2 ->
    let te1 = (tp_expr env e1)
        te2 = (tp_expr env e2)
        t   = tp_binop (tp_of_expr te1) (tp_of_expr te2) bop
    in  BinOpE t bop te1 te2
  IfThenElseE () c e1 e2 -> 
    let tc = (tp_expr env c)
        te1 = (tp_expr env e1)
        te2 = (tp_expr env e2)
    in
      if tp_of_expr tc == BoolT && (tp_of_expr te1) == (tp_of_expr te2)
      then IfThenElseE (tp_of_expr te1) tc te1 te2
      else  IfThenElseE ErrT tc te1 te2
  AppE () fe ae -> 
    let tfe = (tp_expr env fe)
        tae = (tp_expr env ae)
        tf = (tp_of_expr tfe)
        ta = (tp_of_expr tae)
    in case tf of
      FunT tpar tbody ->
        if tpar == ta
        then AppE tbody tfe tae
        else AppE ErrT tfe tae
      _ -> AppE ErrT tfe tae
  FunE () v tparam e -> 
    let te = (tp_expr (push_vardecl_env v tparam env) e)
        t   = (tp_of_expr te)
    in FunE (FunT tparam t) v tparam te

