// -*- Java -*- This ANTLRv4 file was machine-generated by BNFC
parser grammar cppParser;

options {
  tokenVocab = cppLexer;
}

@members {
}

start_Program returns [ cpp.Absyn.Program result ]
  : x=program EOF
    { $result = $x.result; }
  ;
start_Def returns [ cpp.Absyn.Def result ]
  : x=def EOF
    { $result = $x.result; }
  ;
start_ListDef returns [ cpp.Absyn.ListDef result ]
  : x=listDef EOF
    { $result = $x.result; }
  ;
start_Arg returns [ cpp.Absyn.Arg result ]
  : x=arg EOF
    { $result = $x.result; }
  ;
start_ListArg returns [ cpp.Absyn.ListArg result ]
  : x=listArg EOF
    { $result = $x.result; }
  ;
start_Stm returns [ cpp.Absyn.Stm result ]
  : x=stm EOF
    { $result = $x.result; }
  ;
start_ListStm returns [ cpp.Absyn.ListStm result ]
  : x=listStm EOF
    { $result = $x.result; }
  ;
start_Exp15 returns [ cpp.Absyn.Exp result ]
  : x=exp15 EOF
    { $result = $x.result; }
  ;
start_Exp14 returns [ cpp.Absyn.Exp result ]
  : x=exp14 EOF
    { $result = $x.result; }
  ;
start_Exp13 returns [ cpp.Absyn.Exp result ]
  : x=exp13 EOF
    { $result = $x.result; }
  ;
start_Exp12 returns [ cpp.Absyn.Exp result ]
  : x=exp12 EOF
    { $result = $x.result; }
  ;
start_Exp11 returns [ cpp.Absyn.Exp result ]
  : x=exp11 EOF
    { $result = $x.result; }
  ;
start_Exp9 returns [ cpp.Absyn.Exp result ]
  : x=exp9 EOF
    { $result = $x.result; }
  ;
start_Exp8 returns [ cpp.Absyn.Exp result ]
  : x=exp8 EOF
    { $result = $x.result; }
  ;
start_Exp4 returns [ cpp.Absyn.Exp result ]
  : x=exp4 EOF
    { $result = $x.result; }
  ;
start_Exp3 returns [ cpp.Absyn.Exp result ]
  : x=exp3 EOF
    { $result = $x.result; }
  ;
start_Exp2 returns [ cpp.Absyn.Exp result ]
  : x=exp2 EOF
    { $result = $x.result; }
  ;
start_Exp returns [ cpp.Absyn.Exp result ]
  : x=exp EOF
    { $result = $x.result; }
  ;
start_Exp1 returns [ cpp.Absyn.Exp result ]
  : x=exp1 EOF
    { $result = $x.result; }
  ;
start_Exp5 returns [ cpp.Absyn.Exp result ]
  : x=exp5 EOF
    { $result = $x.result; }
  ;
start_Exp6 returns [ cpp.Absyn.Exp result ]
  : x=exp6 EOF
    { $result = $x.result; }
  ;
start_Exp7 returns [ cpp.Absyn.Exp result ]
  : x=exp7 EOF
    { $result = $x.result; }
  ;
start_Exp10 returns [ cpp.Absyn.Exp result ]
  : x=exp10 EOF
    { $result = $x.result; }
  ;
start_ListExp returns [ cpp.Absyn.ListExp result ]
  : x=listExp EOF
    { $result = $x.result; }
  ;
start_Type returns [ cpp.Absyn.Type result ]
  : x=type EOF
    { $result = $x.result; }
  ;
start_ListId returns [ cpp.Absyn.ListId result ]
  : x=listId EOF
    { $result = $x.result; }
  ;

program returns [ cpp.Absyn.Program result ]
  : p_1_1=listDef
    { $result = new cpp.Absyn.PDefs($p_1_1.result); }
  ;
def returns [ cpp.Absyn.Def result ]
  : p_1_1=type p_1_2=Id Surrogate_id_SYMB_0 p_1_4=listArg Surrogate_id_SYMB_1 Surrogate_id_SYMB_2 p_1_7=listStm Surrogate_id_SYMB_3
    { $result = new cpp.Absyn.DFun($p_1_1.result,$p_1_2.getText(),$p_1_4.result,$p_1_7.result); }
  ;
listDef returns [ cpp.Absyn.ListDef result ]
  :  /* empty */
    { $result = new cpp.Absyn.ListDef(); }
  | p_2_1=listDef p_2_2=def
    { $result = $p_2_1.result; $result.addLast($p_2_2.result); }
  ;
arg returns [ cpp.Absyn.Arg result ]
  : p_1_1=type p_1_2=Id
    { $result = new cpp.Absyn.ADecl($p_1_1.result,$p_1_2.getText()); }
  ;
listArg returns [ cpp.Absyn.ListArg result ]
  :  /* empty */
    { $result = new cpp.Absyn.ListArg(); }
  | p_2_1=arg
    { $result = new cpp.Absyn.ListArg(); $result.addLast($p_2_1.result); }
  | p_3_1=arg Surrogate_id_SYMB_4 p_3_3=listArg
    { $result = $p_3_3.result; $result.addFirst($p_3_1.result); }
  ;
stm returns [ cpp.Absyn.Stm result ]
  : p_1_1=exp Surrogate_id_SYMB_5
    { $result = new cpp.Absyn.SExp($p_1_1.result); }
  | p_2_1=type p_2_2=listId Surrogate_id_SYMB_5
    { $result = new cpp.Absyn.SDecls($p_2_1.result,$p_2_2.result); }
  | p_3_1=type p_3_2=Id Surrogate_id_SYMB_6 p_3_4=exp Surrogate_id_SYMB_5
    { $result = new cpp.Absyn.SInit($p_3_1.result,$p_3_2.getText(),$p_3_4.result); }
  | Surrogate_id_SYMB_27 p_4_2=exp Surrogate_id_SYMB_5
    { $result = new cpp.Absyn.SReturn($p_4_2.result); }
  | Surrogate_id_SYMB_27 Surrogate_id_SYMB_5
    { $result = new cpp.Absyn.SReturnVoid(); }
  | Surrogate_id_SYMB_31 Surrogate_id_SYMB_0 p_6_3=exp Surrogate_id_SYMB_1 p_6_5=stm
    { $result = new cpp.Absyn.SWhile($p_6_3.result,$p_6_5.result); }
  | Surrogate_id_SYMB_2 p_7_2=listStm Surrogate_id_SYMB_3
    { $result = new cpp.Absyn.SBlock($p_7_2.result); }
  | Surrogate_id_SYMB_25 Surrogate_id_SYMB_0 p_8_3=exp Surrogate_id_SYMB_1 p_8_5=stm Surrogate_id_SYMB_23 p_8_7=stm
    { $result = new cpp.Absyn.SIfElse($p_8_3.result,$p_8_5.result,$p_8_7.result); }
  ;
listStm returns [ cpp.Absyn.ListStm result ]
  :  /* empty */
    { $result = new cpp.Absyn.ListStm(); }
  | p_2_1=listStm p_2_2=stm
    { $result = $p_2_1.result; $result.addLast($p_2_2.result); }
  ;
exp15 returns [ cpp.Absyn.Exp result ]
  : Surrogate_id_SYMB_29
    { $result = new cpp.Absyn.ETrue(); }
  | Surrogate_id_SYMB_24
    { $result = new cpp.Absyn.EFalse(); }
  | p_3_1=INTEGER
    { $result = new cpp.Absyn.EInt(Integer.parseInt($p_3_1.getText())); }
  | p_4_1=DOUBLE
    { $result = new cpp.Absyn.EDouble(Double.parseDouble($p_4_1.getText())); }
  | p_5_1=STRING
    { $result = new cpp.Absyn.EString($p_5_1.getText().substring(1, $p_5_1.getText().length()-1)); }
  | p_6_1=Id
    { $result = new cpp.Absyn.EId($p_6_1.getText()); }
  | p_7_1=Id Surrogate_id_SYMB_0 p_7_3=listExp Surrogate_id_SYMB_1
    { $result = new cpp.Absyn.EApp($p_7_1.getText(),$p_7_3.result); }
  | Surrogate_id_SYMB_0 p_8_2=exp Surrogate_id_SYMB_1
    { $result = $p_8_2.result; }
  ;
exp14 returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp15 Surrogate_id_SYMB_7
    { $result = new cpp.Absyn.EPIncr($p_1_1.result); }
  | p_2_1=exp15 Surrogate_id_SYMB_8
    { $result = new cpp.Absyn.EPDecr($p_2_1.result); }
  | p_3_1=exp15
    { $result = $p_3_1.result; }
  ;
exp13 returns [ cpp.Absyn.Exp result ]
  : Surrogate_id_SYMB_7 p_1_2=exp14
    { $result = new cpp.Absyn.EIncr($p_1_2.result); }
  | Surrogate_id_SYMB_8 p_2_2=exp14
    { $result = new cpp.Absyn.EDecr($p_2_2.result); }
  | p_3_1=exp14
    { $result = $p_3_1.result; }
  ;
exp12 returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp12 Surrogate_id_SYMB_9 p_1_3=exp13
    { $result = new cpp.Absyn.ETimes($p_1_1.result,$p_1_3.result); }
  | p_2_1=exp12 Surrogate_id_SYMB_10 p_2_3=exp13
    { $result = new cpp.Absyn.EDiv($p_2_1.result,$p_2_3.result); }
  | p_3_1=exp13
    { $result = $p_3_1.result; }
  ;
exp11 returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp11 Surrogate_id_SYMB_11 p_1_3=exp12
    { $result = new cpp.Absyn.EPlus($p_1_1.result,$p_1_3.result); }
  | p_2_1=exp11 Surrogate_id_SYMB_12 p_2_3=exp12
    { $result = new cpp.Absyn.EMinus($p_2_1.result,$p_2_3.result); }
  | p_3_1=exp12
    { $result = $p_3_1.result; }
  ;
exp9 returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp9 Surrogate_id_SYMB_13 p_1_3=exp10
    { $result = new cpp.Absyn.ELt($p_1_1.result,$p_1_3.result); }
  | p_2_1=exp9 Surrogate_id_SYMB_14 p_2_3=exp10
    { $result = new cpp.Absyn.EGt($p_2_1.result,$p_2_3.result); }
  | p_3_1=exp9 Surrogate_id_SYMB_15 p_3_3=exp10
    { $result = new cpp.Absyn.ELtEq($p_3_1.result,$p_3_3.result); }
  | p_4_1=exp9 Surrogate_id_SYMB_16 p_4_3=exp10
    { $result = new cpp.Absyn.EGtEq($p_4_1.result,$p_4_3.result); }
  | p_5_1=exp10
    { $result = $p_5_1.result; }
  ;
exp8 returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp8 Surrogate_id_SYMB_17 p_1_3=exp9
    { $result = new cpp.Absyn.EEq($p_1_1.result,$p_1_3.result); }
  | p_2_1=exp8 Surrogate_id_SYMB_18 p_2_3=exp9
    { $result = new cpp.Absyn.ENEq($p_2_1.result,$p_2_3.result); }
  | p_3_1=exp9
    { $result = $p_3_1.result; }
  ;
exp4 returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp4 Surrogate_id_SYMB_19 p_1_3=exp5
    { $result = new cpp.Absyn.EAnd($p_1_1.result,$p_1_3.result); }
  | p_2_1=exp5
    { $result = $p_2_1.result; }
  ;
exp3 returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp3 Surrogate_id_SYMB_20 p_1_3=exp4
    { $result = new cpp.Absyn.EOr($p_1_1.result,$p_1_3.result); }
  | p_2_1=exp4
    { $result = $p_2_1.result; }
  ;
exp2 returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp3 Surrogate_id_SYMB_6 p_1_3=exp2
    { $result = new cpp.Absyn.EAss($p_1_1.result,$p_1_3.result); }
  | p_2_1=exp3
    { $result = $p_2_1.result; }
  ;
exp returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp1
    { $result = $p_1_1.result; }
  ;
exp1 returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp2
    { $result = $p_1_1.result; }
  ;
exp5 returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp6
    { $result = $p_1_1.result; }
  ;
exp6 returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp7
    { $result = $p_1_1.result; }
  ;
exp7 returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp8
    { $result = $p_1_1.result; }
  ;
exp10 returns [ cpp.Absyn.Exp result ]
  : p_1_1=exp11
    { $result = $p_1_1.result; }
  ;
listExp returns [ cpp.Absyn.ListExp result ]
  :  /* empty */
    { $result = new cpp.Absyn.ListExp(); }
  | p_2_1=exp
    { $result = new cpp.Absyn.ListExp(); $result.addLast($p_2_1.result); }
  | p_3_1=exp Surrogate_id_SYMB_4 p_3_3=listExp
    { $result = $p_3_3.result; $result.addFirst($p_3_1.result); }
  ;
type returns [ cpp.Absyn.Type result ]
  : Surrogate_id_SYMB_21
    { $result = new cpp.Absyn.Type_bool(); }
  | Surrogate_id_SYMB_26
    { $result = new cpp.Absyn.Type_int(); }
  | Surrogate_id_SYMB_22
    { $result = new cpp.Absyn.Type_double(); }
  | Surrogate_id_SYMB_30
    { $result = new cpp.Absyn.Type_void(); }
  | Surrogate_id_SYMB_28
    { $result = new cpp.Absyn.Type_string(); }
  ;
listId returns [ cpp.Absyn.ListId result ]
  : p_1_1=Id
    { $result = new cpp.Absyn.ListId(); $result.addLast($p_1_1.getText()); }
  | p_2_1=Id Surrogate_id_SYMB_4 p_2_3=listId
    { $result = $p_2_3.result; $result.addFirst($p_2_1.getText()); }
  ;
