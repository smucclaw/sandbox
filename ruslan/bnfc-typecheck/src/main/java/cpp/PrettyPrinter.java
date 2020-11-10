package cpp;

public class PrettyPrinter
{
  //For certain applications increasing the initial size of the buffer may improve performance.
  private static final int INITIAL_BUFFER_SIZE = 128;
  private static final int INDENT_WIDTH = 2;
  //You may wish to change the parentheses used in precedence.
  private static final String _L_PAREN = new String("(");
  private static final String _R_PAREN = new String(")");
  //You may wish to change render
  private static void render(String s)
  {
    if (s.equals("{"))
    {
       buf_.append("\n");
       indent();
       buf_.append(s);
       _n_ = _n_ + INDENT_WIDTH;
       buf_.append("\n");
       indent();
    }
    else if (s.equals("(") || s.equals("["))
       buf_.append(s);
    else if (s.equals(")") || s.equals("]"))
    {
       backup();
       buf_.append(s);
       buf_.append(" ");
    }
    else if (s.equals("}"))
    {
       int t;
       _n_ = _n_ - INDENT_WIDTH;
       for(t=0; t<INDENT_WIDTH; t++) {
         backup();
       }
       buf_.append(s);
       buf_.append("\n");
       indent();
    }
    else if (s.equals(","))
    {
       backup();
       buf_.append(s);
       buf_.append(" ");
    }
    else if (s.equals(";"))
    {
       backup();
       buf_.append(s);
       buf_.append("\n");
       indent();
    }
    else if (s.equals("")) return;
    else if (s.trim().equals(""))
    {
       backup();
       buf_.append(s);
    }
    else
    {
       buf_.append(s);
       buf_.append(" ");
    }
  }


  //  print and show methods are defined for each category.
  public static String print(cpp.Absyn.Program foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(cpp.Absyn.Program foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String print(cpp.Absyn.Def foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(cpp.Absyn.Def foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String print(cpp.Absyn.ListDef foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(cpp.Absyn.ListDef foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String print(cpp.Absyn.Arg foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(cpp.Absyn.Arg foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String print(cpp.Absyn.ListArg foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(cpp.Absyn.ListArg foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String print(cpp.Absyn.Stm foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(cpp.Absyn.Stm foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String print(cpp.Absyn.ListStm foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(cpp.Absyn.ListStm foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String print(cpp.Absyn.Exp foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(cpp.Absyn.Exp foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String print(cpp.Absyn.ListExp foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(cpp.Absyn.ListExp foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String print(cpp.Absyn.Type foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(cpp.Absyn.Type foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String print(cpp.Absyn.ListId foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(cpp.Absyn.ListId foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  /***   You shouldn't need to change anything beyond this point.   ***/

  private static void pp(cpp.Absyn.Program foo, int _i_)
  {
    if (foo instanceof cpp.Absyn.PDefs)
    {
       cpp.Absyn.PDefs _pdefs = (cpp.Absyn.PDefs) foo;
       if (_i_ > 0) render(_L_PAREN);
       pp(_pdefs.listdef_, 0);
       if (_i_ > 0) render(_R_PAREN);
    }
  }

  private static void pp(cpp.Absyn.Def foo, int _i_)
  {
    if (foo instanceof cpp.Absyn.DFun)
    {
       cpp.Absyn.DFun _dfun = (cpp.Absyn.DFun) foo;
       if (_i_ > 0) render(_L_PAREN);
       pp(_dfun.type_, 0);
       pp(_dfun.id_, 0);
       render("(");
       pp(_dfun.listarg_, 0);
       render(")");
       render("{");
       pp(_dfun.liststm_, 0);
       render("}");
       if (_i_ > 0) render(_R_PAREN);
    }
  }

  private static void pp(cpp.Absyn.ListDef foo, int _i_)
  {
     for (java.util.Iterator<cpp.Absyn.Def> it = foo.iterator(); it.hasNext();)
     {
       pp(it.next(), _i_);
       if (it.hasNext()) {
         render("");
       } else {
         render("");
       }
     }  }

  private static void pp(cpp.Absyn.Arg foo, int _i_)
  {
    if (foo instanceof cpp.Absyn.ADecl)
    {
       cpp.Absyn.ADecl _adecl = (cpp.Absyn.ADecl) foo;
       if (_i_ > 0) render(_L_PAREN);
       pp(_adecl.type_, 0);
       pp(_adecl.id_, 0);
       if (_i_ > 0) render(_R_PAREN);
    }
  }

  private static void pp(cpp.Absyn.ListArg foo, int _i_)
  {
     for (java.util.Iterator<cpp.Absyn.Arg> it = foo.iterator(); it.hasNext();)
     {
       pp(it.next(), _i_);
       if (it.hasNext()) {
         render(",");
       } else {
         render("");
       }
     }  }

  private static void pp(cpp.Absyn.Stm foo, int _i_)
  {
    if (foo instanceof cpp.Absyn.SExp)
    {
       cpp.Absyn.SExp _sexp = (cpp.Absyn.SExp) foo;
       if (_i_ > 0) render(_L_PAREN);
       pp(_sexp.exp_, 0);
       render(";");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.SDecls)
    {
       cpp.Absyn.SDecls _sdecls = (cpp.Absyn.SDecls) foo;
       if (_i_ > 0) render(_L_PAREN);
       pp(_sdecls.type_, 0);
       pp(_sdecls.listid_, 0);
       render(";");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.SInit)
    {
       cpp.Absyn.SInit _sinit = (cpp.Absyn.SInit) foo;
       if (_i_ > 0) render(_L_PAREN);
       pp(_sinit.type_, 0);
       pp(_sinit.id_, 0);
       render("=");
       pp(_sinit.exp_, 0);
       render(";");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.SReturn)
    {
       cpp.Absyn.SReturn _sreturn = (cpp.Absyn.SReturn) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("return");
       pp(_sreturn.exp_, 0);
       render(";");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.SReturnVoid)
    {
       cpp.Absyn.SReturnVoid _sreturnvoid = (cpp.Absyn.SReturnVoid) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("return");
       render(";");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.SWhile)
    {
       cpp.Absyn.SWhile _swhile = (cpp.Absyn.SWhile) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("while");
       render("(");
       pp(_swhile.exp_, 0);
       render(")");
       pp(_swhile.stm_, 0);
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.SBlock)
    {
       cpp.Absyn.SBlock _sblock = (cpp.Absyn.SBlock) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("{");
       pp(_sblock.liststm_, 0);
       render("}");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.SIfElse)
    {
       cpp.Absyn.SIfElse _sifelse = (cpp.Absyn.SIfElse) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("if");
       render("(");
       pp(_sifelse.exp_, 0);
       render(")");
       pp(_sifelse.stm_1, 0);
       render("else");
       pp(_sifelse.stm_2, 0);
       if (_i_ > 0) render(_R_PAREN);
    }
  }

  private static void pp(cpp.Absyn.ListStm foo, int _i_)
  {
     for (java.util.Iterator<cpp.Absyn.Stm> it = foo.iterator(); it.hasNext();)
     {
       pp(it.next(), _i_);
       if (it.hasNext()) {
         render("");
       } else {
         render("");
       }
     }  }

  private static void pp(cpp.Absyn.Exp foo, int _i_)
  {
    if (foo instanceof cpp.Absyn.ETrue)
    {
       cpp.Absyn.ETrue _etrue = (cpp.Absyn.ETrue) foo;
       if (_i_ > 15) render(_L_PAREN);
       render("true");
       if (_i_ > 15) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EFalse)
    {
       cpp.Absyn.EFalse _efalse = (cpp.Absyn.EFalse) foo;
       if (_i_ > 15) render(_L_PAREN);
       render("false");
       if (_i_ > 15) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EInt)
    {
       cpp.Absyn.EInt _eint = (cpp.Absyn.EInt) foo;
       if (_i_ > 15) render(_L_PAREN);
       pp(_eint.integer_, 0);
       if (_i_ > 15) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EDouble)
    {
       cpp.Absyn.EDouble _edouble = (cpp.Absyn.EDouble) foo;
       if (_i_ > 15) render(_L_PAREN);
       pp(_edouble.double_, 0);
       if (_i_ > 15) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EString)
    {
       cpp.Absyn.EString _estring = (cpp.Absyn.EString) foo;
       if (_i_ > 15) render(_L_PAREN);
       printQuoted(_estring.string_);
       if (_i_ > 15) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EId)
    {
       cpp.Absyn.EId _eid = (cpp.Absyn.EId) foo;
       if (_i_ > 15) render(_L_PAREN);
       pp(_eid.id_, 0);
       if (_i_ > 15) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EApp)
    {
       cpp.Absyn.EApp _eapp = (cpp.Absyn.EApp) foo;
       if (_i_ > 15) render(_L_PAREN);
       pp(_eapp.id_, 0);
       render("(");
       pp(_eapp.listexp_, 0);
       render(")");
       if (_i_ > 15) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.ETyped)
    {
       cpp.Absyn.ETyped _etyped = (cpp.Absyn.ETyped) foo;
       if (_i_ > 15) render(_L_PAREN);
       render("(");
       pp(_etyped.exp_, 0);
       render(":");
       pp(_etyped.type_, 0);
       render(")");
       if (_i_ > 15) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EPIncr)
    {
       cpp.Absyn.EPIncr _epincr = (cpp.Absyn.EPIncr) foo;
       if (_i_ > 14) render(_L_PAREN);
       pp(_epincr.exp_, 15);
       render("++");
       if (_i_ > 14) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EPDecr)
    {
       cpp.Absyn.EPDecr _epdecr = (cpp.Absyn.EPDecr) foo;
       if (_i_ > 14) render(_L_PAREN);
       pp(_epdecr.exp_, 15);
       render("--");
       if (_i_ > 14) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EIncr)
    {
       cpp.Absyn.EIncr _eincr = (cpp.Absyn.EIncr) foo;
       if (_i_ > 13) render(_L_PAREN);
       render("++");
       pp(_eincr.exp_, 14);
       if (_i_ > 13) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EDecr)
    {
       cpp.Absyn.EDecr _edecr = (cpp.Absyn.EDecr) foo;
       if (_i_ > 13) render(_L_PAREN);
       render("--");
       pp(_edecr.exp_, 14);
       if (_i_ > 13) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.ETimes)
    {
       cpp.Absyn.ETimes _etimes = (cpp.Absyn.ETimes) foo;
       if (_i_ > 12) render(_L_PAREN);
       pp(_etimes.exp_1, 12);
       render("*");
       pp(_etimes.exp_2, 13);
       if (_i_ > 12) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EDiv)
    {
       cpp.Absyn.EDiv _ediv = (cpp.Absyn.EDiv) foo;
       if (_i_ > 12) render(_L_PAREN);
       pp(_ediv.exp_1, 12);
       render("/");
       pp(_ediv.exp_2, 13);
       if (_i_ > 12) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EPlus)
    {
       cpp.Absyn.EPlus _eplus = (cpp.Absyn.EPlus) foo;
       if (_i_ > 11) render(_L_PAREN);
       pp(_eplus.exp_1, 11);
       render("+");
       pp(_eplus.exp_2, 12);
       if (_i_ > 11) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EMinus)
    {
       cpp.Absyn.EMinus _eminus = (cpp.Absyn.EMinus) foo;
       if (_i_ > 11) render(_L_PAREN);
       pp(_eminus.exp_1, 11);
       render("-");
       pp(_eminus.exp_2, 12);
       if (_i_ > 11) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.ELt)
    {
       cpp.Absyn.ELt _elt = (cpp.Absyn.ELt) foo;
       if (_i_ > 9) render(_L_PAREN);
       pp(_elt.exp_1, 9);
       render("<");
       pp(_elt.exp_2, 10);
       if (_i_ > 9) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EGt)
    {
       cpp.Absyn.EGt _egt = (cpp.Absyn.EGt) foo;
       if (_i_ > 9) render(_L_PAREN);
       pp(_egt.exp_1, 9);
       render(">");
       pp(_egt.exp_2, 10);
       if (_i_ > 9) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.ELtEq)
    {
       cpp.Absyn.ELtEq _elteq = (cpp.Absyn.ELtEq) foo;
       if (_i_ > 9) render(_L_PAREN);
       pp(_elteq.exp_1, 9);
       render("<=");
       pp(_elteq.exp_2, 10);
       if (_i_ > 9) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EGtEq)
    {
       cpp.Absyn.EGtEq _egteq = (cpp.Absyn.EGtEq) foo;
       if (_i_ > 9) render(_L_PAREN);
       pp(_egteq.exp_1, 9);
       render(">=");
       pp(_egteq.exp_2, 10);
       if (_i_ > 9) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EEq)
    {
       cpp.Absyn.EEq _eeq = (cpp.Absyn.EEq) foo;
       if (_i_ > 8) render(_L_PAREN);
       pp(_eeq.exp_1, 8);
       render("==");
       pp(_eeq.exp_2, 9);
       if (_i_ > 8) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.ENEq)
    {
       cpp.Absyn.ENEq _eneq = (cpp.Absyn.ENEq) foo;
       if (_i_ > 8) render(_L_PAREN);
       pp(_eneq.exp_1, 8);
       render("!=");
       pp(_eneq.exp_2, 9);
       if (_i_ > 8) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EAnd)
    {
       cpp.Absyn.EAnd _eand = (cpp.Absyn.EAnd) foo;
       if (_i_ > 4) render(_L_PAREN);
       pp(_eand.exp_1, 4);
       render("&&");
       pp(_eand.exp_2, 5);
       if (_i_ > 4) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EOr)
    {
       cpp.Absyn.EOr _eor = (cpp.Absyn.EOr) foo;
       if (_i_ > 3) render(_L_PAREN);
       pp(_eor.exp_1, 3);
       render("||");
       pp(_eor.exp_2, 4);
       if (_i_ > 3) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.EAss)
    {
       cpp.Absyn.EAss _eass = (cpp.Absyn.EAss) foo;
       if (_i_ > 2) render(_L_PAREN);
       pp(_eass.exp_1, 3);
       render("=");
       pp(_eass.exp_2, 2);
       if (_i_ > 2) render(_R_PAREN);
    }
  }

  private static void pp(cpp.Absyn.ListExp foo, int _i_)
  {
     for (java.util.Iterator<cpp.Absyn.Exp> it = foo.iterator(); it.hasNext();)
     {
       pp(it.next(), _i_);
       if (it.hasNext()) {
         render(",");
       } else {
         render("");
       }
     }  }

  private static void pp(cpp.Absyn.Type foo, int _i_)
  {
    if (foo instanceof cpp.Absyn.Type_bool)
    {
       cpp.Absyn.Type_bool _type_bool = (cpp.Absyn.Type_bool) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("bool");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.Type_int)
    {
       cpp.Absyn.Type_int _type_int = (cpp.Absyn.Type_int) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("int");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.Type_double)
    {
       cpp.Absyn.Type_double _type_double = (cpp.Absyn.Type_double) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("double");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.Type_void)
    {
       cpp.Absyn.Type_void _type_void = (cpp.Absyn.Type_void) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("void");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof cpp.Absyn.Type_string)
    {
       cpp.Absyn.Type_string _type_string = (cpp.Absyn.Type_string) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("string");
       if (_i_ > 0) render(_R_PAREN);
    }
  }

  private static void pp(cpp.Absyn.ListId foo, int _i_)
  {
     for (java.util.Iterator<String> it = foo.iterator(); it.hasNext();)
     {
       pp(it.next(), _i_);
       if (it.hasNext()) {
         render(",");
       } else {
         render("");
       }
     }  }


  private static void sh(cpp.Absyn.Program foo)
  {
    if (foo instanceof cpp.Absyn.PDefs)
    {
       cpp.Absyn.PDefs _pdefs = (cpp.Absyn.PDefs) foo;
       render("(");
       render("PDefs");
       render("[");
       sh(_pdefs.listdef_);
       render("]");
       render(")");
    }
  }

  private static void sh(cpp.Absyn.Def foo)
  {
    if (foo instanceof cpp.Absyn.DFun)
    {
       cpp.Absyn.DFun _dfun = (cpp.Absyn.DFun) foo;
       render("(");
       render("DFun");
       sh(_dfun.type_);
       sh(_dfun.id_);
       render("[");
       sh(_dfun.listarg_);
       render("]");
       render("[");
       sh(_dfun.liststm_);
       render("]");
       render(")");
    }
  }

  private static void sh(cpp.Absyn.ListDef foo)
  {
     for (java.util.Iterator<cpp.Absyn.Def> it = foo.iterator(); it.hasNext();)
     {
       sh(it.next());
       if (it.hasNext())
         render(",");
     }
  }

  private static void sh(cpp.Absyn.Arg foo)
  {
    if (foo instanceof cpp.Absyn.ADecl)
    {
       cpp.Absyn.ADecl _adecl = (cpp.Absyn.ADecl) foo;
       render("(");
       render("ADecl");
       sh(_adecl.type_);
       sh(_adecl.id_);
       render(")");
    }
  }

  private static void sh(cpp.Absyn.ListArg foo)
  {
     for (java.util.Iterator<cpp.Absyn.Arg> it = foo.iterator(); it.hasNext();)
     {
       sh(it.next());
       if (it.hasNext())
         render(",");
     }
  }

  private static void sh(cpp.Absyn.Stm foo)
  {
    if (foo instanceof cpp.Absyn.SExp)
    {
       cpp.Absyn.SExp _sexp = (cpp.Absyn.SExp) foo;
       render("(");
       render("SExp");
       sh(_sexp.exp_);
       render(")");
    }
    if (foo instanceof cpp.Absyn.SDecls)
    {
       cpp.Absyn.SDecls _sdecls = (cpp.Absyn.SDecls) foo;
       render("(");
       render("SDecls");
       sh(_sdecls.type_);
       render("[");
       sh(_sdecls.listid_);
       render("]");
       render(")");
    }
    if (foo instanceof cpp.Absyn.SInit)
    {
       cpp.Absyn.SInit _sinit = (cpp.Absyn.SInit) foo;
       render("(");
       render("SInit");
       sh(_sinit.type_);
       sh(_sinit.id_);
       sh(_sinit.exp_);
       render(")");
    }
    if (foo instanceof cpp.Absyn.SReturn)
    {
       cpp.Absyn.SReturn _sreturn = (cpp.Absyn.SReturn) foo;
       render("(");
       render("SReturn");
       sh(_sreturn.exp_);
       render(")");
    }
    if (foo instanceof cpp.Absyn.SReturnVoid)
    {
       cpp.Absyn.SReturnVoid _sreturnvoid = (cpp.Absyn.SReturnVoid) foo;
       render("SReturnVoid");
    }
    if (foo instanceof cpp.Absyn.SWhile)
    {
       cpp.Absyn.SWhile _swhile = (cpp.Absyn.SWhile) foo;
       render("(");
       render("SWhile");
       sh(_swhile.exp_);
       sh(_swhile.stm_);
       render(")");
    }
    if (foo instanceof cpp.Absyn.SBlock)
    {
       cpp.Absyn.SBlock _sblock = (cpp.Absyn.SBlock) foo;
       render("(");
       render("SBlock");
       render("[");
       sh(_sblock.liststm_);
       render("]");
       render(")");
    }
    if (foo instanceof cpp.Absyn.SIfElse)
    {
       cpp.Absyn.SIfElse _sifelse = (cpp.Absyn.SIfElse) foo;
       render("(");
       render("SIfElse");
       sh(_sifelse.exp_);
       sh(_sifelse.stm_1);
       sh(_sifelse.stm_2);
       render(")");
    }
  }

  private static void sh(cpp.Absyn.ListStm foo)
  {
     for (java.util.Iterator<cpp.Absyn.Stm> it = foo.iterator(); it.hasNext();)
     {
       sh(it.next());
       if (it.hasNext())
         render(",");
     }
  }

  private static void sh(cpp.Absyn.Exp foo)
  {
    if (foo instanceof cpp.Absyn.ETrue)
    {
       cpp.Absyn.ETrue _etrue = (cpp.Absyn.ETrue) foo;
       render("ETrue");
    }
    if (foo instanceof cpp.Absyn.EFalse)
    {
       cpp.Absyn.EFalse _efalse = (cpp.Absyn.EFalse) foo;
       render("EFalse");
    }
    if (foo instanceof cpp.Absyn.EInt)
    {
       cpp.Absyn.EInt _eint = (cpp.Absyn.EInt) foo;
       render("(");
       render("EInt");
       sh(_eint.integer_);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EDouble)
    {
       cpp.Absyn.EDouble _edouble = (cpp.Absyn.EDouble) foo;
       render("(");
       render("EDouble");
       sh(_edouble.double_);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EString)
    {
       cpp.Absyn.EString _estring = (cpp.Absyn.EString) foo;
       render("(");
       render("EString");
       sh(_estring.string_);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EId)
    {
       cpp.Absyn.EId _eid = (cpp.Absyn.EId) foo;
       render("(");
       render("EId");
       sh(_eid.id_);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EApp)
    {
       cpp.Absyn.EApp _eapp = (cpp.Absyn.EApp) foo;
       render("(");
       render("EApp");
       sh(_eapp.id_);
       render("[");
       sh(_eapp.listexp_);
       render("]");
       render(")");
    }
    if (foo instanceof cpp.Absyn.ETyped)
    {
       cpp.Absyn.ETyped _etyped = (cpp.Absyn.ETyped) foo;
       render("(");
       render("ETyped");
       sh(_etyped.exp_);
       sh(_etyped.type_);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EPIncr)
    {
       cpp.Absyn.EPIncr _epincr = (cpp.Absyn.EPIncr) foo;
       render("(");
       render("EPIncr");
       sh(_epincr.exp_);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EPDecr)
    {
       cpp.Absyn.EPDecr _epdecr = (cpp.Absyn.EPDecr) foo;
       render("(");
       render("EPDecr");
       sh(_epdecr.exp_);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EIncr)
    {
       cpp.Absyn.EIncr _eincr = (cpp.Absyn.EIncr) foo;
       render("(");
       render("EIncr");
       sh(_eincr.exp_);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EDecr)
    {
       cpp.Absyn.EDecr _edecr = (cpp.Absyn.EDecr) foo;
       render("(");
       render("EDecr");
       sh(_edecr.exp_);
       render(")");
    }
    if (foo instanceof cpp.Absyn.ETimes)
    {
       cpp.Absyn.ETimes _etimes = (cpp.Absyn.ETimes) foo;
       render("(");
       render("ETimes");
       sh(_etimes.exp_1);
       sh(_etimes.exp_2);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EDiv)
    {
       cpp.Absyn.EDiv _ediv = (cpp.Absyn.EDiv) foo;
       render("(");
       render("EDiv");
       sh(_ediv.exp_1);
       sh(_ediv.exp_2);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EPlus)
    {
       cpp.Absyn.EPlus _eplus = (cpp.Absyn.EPlus) foo;
       render("(");
       render("EPlus");
       sh(_eplus.exp_1);
       sh(_eplus.exp_2);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EMinus)
    {
       cpp.Absyn.EMinus _eminus = (cpp.Absyn.EMinus) foo;
       render("(");
       render("EMinus");
       sh(_eminus.exp_1);
       sh(_eminus.exp_2);
       render(")");
    }
    if (foo instanceof cpp.Absyn.ELt)
    {
       cpp.Absyn.ELt _elt = (cpp.Absyn.ELt) foo;
       render("(");
       render("ELt");
       sh(_elt.exp_1);
       sh(_elt.exp_2);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EGt)
    {
       cpp.Absyn.EGt _egt = (cpp.Absyn.EGt) foo;
       render("(");
       render("EGt");
       sh(_egt.exp_1);
       sh(_egt.exp_2);
       render(")");
    }
    if (foo instanceof cpp.Absyn.ELtEq)
    {
       cpp.Absyn.ELtEq _elteq = (cpp.Absyn.ELtEq) foo;
       render("(");
       render("ELtEq");
       sh(_elteq.exp_1);
       sh(_elteq.exp_2);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EGtEq)
    {
       cpp.Absyn.EGtEq _egteq = (cpp.Absyn.EGtEq) foo;
       render("(");
       render("EGtEq");
       sh(_egteq.exp_1);
       sh(_egteq.exp_2);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EEq)
    {
       cpp.Absyn.EEq _eeq = (cpp.Absyn.EEq) foo;
       render("(");
       render("EEq");
       sh(_eeq.exp_1);
       sh(_eeq.exp_2);
       render(")");
    }
    if (foo instanceof cpp.Absyn.ENEq)
    {
       cpp.Absyn.ENEq _eneq = (cpp.Absyn.ENEq) foo;
       render("(");
       render("ENEq");
       sh(_eneq.exp_1);
       sh(_eneq.exp_2);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EAnd)
    {
       cpp.Absyn.EAnd _eand = (cpp.Absyn.EAnd) foo;
       render("(");
       render("EAnd");
       sh(_eand.exp_1);
       sh(_eand.exp_2);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EOr)
    {
       cpp.Absyn.EOr _eor = (cpp.Absyn.EOr) foo;
       render("(");
       render("EOr");
       sh(_eor.exp_1);
       sh(_eor.exp_2);
       render(")");
    }
    if (foo instanceof cpp.Absyn.EAss)
    {
       cpp.Absyn.EAss _eass = (cpp.Absyn.EAss) foo;
       render("(");
       render("EAss");
       sh(_eass.exp_1);
       sh(_eass.exp_2);
       render(")");
    }
  }

  private static void sh(cpp.Absyn.ListExp foo)
  {
     for (java.util.Iterator<cpp.Absyn.Exp> it = foo.iterator(); it.hasNext();)
     {
       sh(it.next());
       if (it.hasNext())
         render(",");
     }
  }

  private static void sh(cpp.Absyn.Type foo)
  {
    if (foo instanceof cpp.Absyn.Type_bool)
    {
       cpp.Absyn.Type_bool _type_bool = (cpp.Absyn.Type_bool) foo;
       render("Type_bool");
    }
    if (foo instanceof cpp.Absyn.Type_int)
    {
       cpp.Absyn.Type_int _type_int = (cpp.Absyn.Type_int) foo;
       render("Type_int");
    }
    if (foo instanceof cpp.Absyn.Type_double)
    {
       cpp.Absyn.Type_double _type_double = (cpp.Absyn.Type_double) foo;
       render("Type_double");
    }
    if (foo instanceof cpp.Absyn.Type_void)
    {
       cpp.Absyn.Type_void _type_void = (cpp.Absyn.Type_void) foo;
       render("Type_void");
    }
    if (foo instanceof cpp.Absyn.Type_string)
    {
       cpp.Absyn.Type_string _type_string = (cpp.Absyn.Type_string) foo;
       render("Type_string");
    }
  }

  private static void sh(cpp.Absyn.ListId foo)
  {
     for (java.util.Iterator<String> it = foo.iterator(); it.hasNext();)
     {
       sh(it.next());
       if (it.hasNext())
         render(",");
     }
  }


  private static void pp(Integer n, int _i_) { buf_.append(n); buf_.append(" "); }
  private static void pp(Double d, int _i_) { buf_.append(String.format(java.util.Locale.ROOT, "%.15g ", d)); }
  private static void pp(String s, int _i_) { buf_.append(s); buf_.append(" "); }
  private static void pp(Character c, int _i_) { buf_.append("'" + c.toString() + "'"); buf_.append(" "); }
  private static void sh(Integer n) { render(n.toString()); }
  private static void sh(Double d) { render(String.format(java.util.Locale.ROOT, "%.15g", d)); }
  private static void sh(Character c) { render("'" + c.toString() + "'"); }
  private static void sh(String s) { printQuoted(s); }
  private static void printQuoted(String s) { render("\"" + s + "\""); }
  private static void indent()
  {
    int n = _n_;
    while (n > 0)
    {
      buf_.append(' ');
      n--;
    }
  }
  private static void backup()
  {
    int prev = buf_.length() - 1;
    if (buf_.charAt(prev) == ' ')
      buf_.setLength(prev);
  }
  private static void trim()
  {
    // Trim initial spaces
    int end = 0;
    int len = buf_.length();
    while (end < len && buf_.charAt(end) == ' ')
      end++;
    buf_.delete(0, end);
    // Trim trailing spaces
    end = buf_.length();
    while (end > 0 && buf_.charAt(end-1) == ' ')
      end--;
    buf_.setLength(end);
  }
  private static int _n_ = 0;
  private static StringBuilder buf_ = new StringBuilder(INITIAL_BUFFER_SIZE);
}

