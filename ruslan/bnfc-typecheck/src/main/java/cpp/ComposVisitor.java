package cpp;
/** BNFC-Generated Composition Visitor
*/

public class ComposVisitor<A> implements
  cpp.Absyn.Program.Visitor<cpp.Absyn.Program,A>,
  cpp.Absyn.Def.Visitor<cpp.Absyn.Def,A>,
  cpp.Absyn.Arg.Visitor<cpp.Absyn.Arg,A>,
  cpp.Absyn.Stm.Visitor<cpp.Absyn.Stm,A>,
  cpp.Absyn.Exp.Visitor<cpp.Absyn.Exp,A>,
  cpp.Absyn.Type.Visitor<cpp.Absyn.Type,A>
{
    /* Program */
    public cpp.Absyn.Program visit(cpp.Absyn.PDefs p, A arg)
    {
      cpp.Absyn.ListDef listdef_ = new cpp.Absyn.ListDef();
      for (cpp.Absyn.Def x : p.listdef_)
      {
        listdef_.add(x.accept(this,arg));
      }
      return new cpp.Absyn.PDefs(listdef_);
    }

    /* Def */
    public cpp.Absyn.Def visit(cpp.Absyn.DFun p, A arg)
    {
      cpp.Absyn.Type type_ = p.type_.accept(this, arg);
      String id_ = p.id_;
      cpp.Absyn.ListArg listarg_ = new cpp.Absyn.ListArg();
      for (cpp.Absyn.Arg x : p.listarg_)
      {
        listarg_.add(x.accept(this,arg));
      }
      cpp.Absyn.ListStm liststm_ = new cpp.Absyn.ListStm();
      for (cpp.Absyn.Stm x : p.liststm_)
      {
        liststm_.add(x.accept(this,arg));
      }
      return new cpp.Absyn.DFun(type_, id_, listarg_, liststm_);
    }

    /* Arg */
    public cpp.Absyn.Arg visit(cpp.Absyn.ADecl p, A arg)
    {
      cpp.Absyn.Type type_ = p.type_.accept(this, arg);
      String id_ = p.id_;
      return new cpp.Absyn.ADecl(type_, id_);
    }

    /* Stm */
    public cpp.Absyn.Stm visit(cpp.Absyn.SExp p, A arg)
    {
      cpp.Absyn.Exp exp_ = p.exp_.accept(this, arg);
      return new cpp.Absyn.SExp(exp_);
    }
    public cpp.Absyn.Stm visit(cpp.Absyn.SDecls p, A arg)
    {
      cpp.Absyn.Type type_ = p.type_.accept(this, arg);
      cpp.Absyn.ListId listid_ = p.listid_;
      return new cpp.Absyn.SDecls(type_, listid_);
    }
    public cpp.Absyn.Stm visit(cpp.Absyn.SInit p, A arg)
    {
      cpp.Absyn.Type type_ = p.type_.accept(this, arg);
      String id_ = p.id_;
      cpp.Absyn.Exp exp_ = p.exp_.accept(this, arg);
      return new cpp.Absyn.SInit(type_, id_, exp_);
    }
    public cpp.Absyn.Stm visit(cpp.Absyn.SReturn p, A arg)
    {
      cpp.Absyn.Exp exp_ = p.exp_.accept(this, arg);
      return new cpp.Absyn.SReturn(exp_);
    }
    public cpp.Absyn.Stm visit(cpp.Absyn.SReturnVoid p, A arg)
    {
      return new cpp.Absyn.SReturnVoid();
    }
    public cpp.Absyn.Stm visit(cpp.Absyn.SWhile p, A arg)
    {
      cpp.Absyn.Exp exp_ = p.exp_.accept(this, arg);
      cpp.Absyn.Stm stm_ = p.stm_.accept(this, arg);
      return new cpp.Absyn.SWhile(exp_, stm_);
    }
    public cpp.Absyn.Stm visit(cpp.Absyn.SBlock p, A arg)
    {
      cpp.Absyn.ListStm liststm_ = new cpp.Absyn.ListStm();
      for (cpp.Absyn.Stm x : p.liststm_)
      {
        liststm_.add(x.accept(this,arg));
      }
      return new cpp.Absyn.SBlock(liststm_);
    }
    public cpp.Absyn.Stm visit(cpp.Absyn.SIfElse p, A arg)
    {
      cpp.Absyn.Exp exp_ = p.exp_.accept(this, arg);
      cpp.Absyn.Stm stm_1 = p.stm_1.accept(this, arg);
      cpp.Absyn.Stm stm_2 = p.stm_2.accept(this, arg);
      return new cpp.Absyn.SIfElse(exp_, stm_1, stm_2);
    }

    /* Exp */
    public cpp.Absyn.Exp visit(cpp.Absyn.ETrue p, A arg)
    {
      return new cpp.Absyn.ETrue();
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EFalse p, A arg)
    {
      return new cpp.Absyn.EFalse();
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EInt p, A arg)
    {
      Integer integer_ = p.integer_;
      return new cpp.Absyn.EInt(integer_);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EDouble p, A arg)
    {
      Double double_ = p.double_;
      return new cpp.Absyn.EDouble(double_);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EString p, A arg)
    {
      String string_ = p.string_;
      return new cpp.Absyn.EString(string_);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EId p, A arg)
    {
      String id_ = p.id_;
      return new cpp.Absyn.EId(id_);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EApp p, A arg)
    {
      String id_ = p.id_;
      cpp.Absyn.ListExp listexp_ = new cpp.Absyn.ListExp();
      for (cpp.Absyn.Exp x : p.listexp_)
      {
        listexp_.add(x.accept(this,arg));
      }
      return new cpp.Absyn.EApp(id_, listexp_);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.ETyped p, A arg)
    {
      cpp.Absyn.Exp exp_ = p.exp_.accept(this, arg);
      cpp.Absyn.Type type_ = p.type_.accept(this, arg);
      return new cpp.Absyn.ETyped(exp_, type_);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EPIncr p, A arg)
    {
      cpp.Absyn.Exp exp_ = p.exp_.accept(this, arg);
      return new cpp.Absyn.EPIncr(exp_);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EPDecr p, A arg)
    {
      cpp.Absyn.Exp exp_ = p.exp_.accept(this, arg);
      return new cpp.Absyn.EPDecr(exp_);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EIncr p, A arg)
    {
      cpp.Absyn.Exp exp_ = p.exp_.accept(this, arg);
      return new cpp.Absyn.EIncr(exp_);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EDecr p, A arg)
    {
      cpp.Absyn.Exp exp_ = p.exp_.accept(this, arg);
      return new cpp.Absyn.EDecr(exp_);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.ETimes p, A arg)
    {
      cpp.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      cpp.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new cpp.Absyn.ETimes(exp_1, exp_2);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EDiv p, A arg)
    {
      cpp.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      cpp.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new cpp.Absyn.EDiv(exp_1, exp_2);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EPlus p, A arg)
    {
      cpp.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      cpp.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new cpp.Absyn.EPlus(exp_1, exp_2);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EMinus p, A arg)
    {
      cpp.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      cpp.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new cpp.Absyn.EMinus(exp_1, exp_2);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.ELt p, A arg)
    {
      cpp.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      cpp.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new cpp.Absyn.ELt(exp_1, exp_2);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EGt p, A arg)
    {
      cpp.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      cpp.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new cpp.Absyn.EGt(exp_1, exp_2);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.ELtEq p, A arg)
    {
      cpp.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      cpp.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new cpp.Absyn.ELtEq(exp_1, exp_2);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EGtEq p, A arg)
    {
      cpp.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      cpp.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new cpp.Absyn.EGtEq(exp_1, exp_2);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EEq p, A arg)
    {
      cpp.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      cpp.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new cpp.Absyn.EEq(exp_1, exp_2);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.ENEq p, A arg)
    {
      cpp.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      cpp.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new cpp.Absyn.ENEq(exp_1, exp_2);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EAnd p, A arg)
    {
      cpp.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      cpp.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new cpp.Absyn.EAnd(exp_1, exp_2);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EOr p, A arg)
    {
      cpp.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      cpp.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new cpp.Absyn.EOr(exp_1, exp_2);
    }
    public cpp.Absyn.Exp visit(cpp.Absyn.EAss p, A arg)
    {
      cpp.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      cpp.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new cpp.Absyn.EAss(exp_1, exp_2);
    }

    /* Type */
    public cpp.Absyn.Type visit(cpp.Absyn.Type_bool p, A arg)
    {
      return new cpp.Absyn.Type_bool();
    }
    public cpp.Absyn.Type visit(cpp.Absyn.Type_int p, A arg)
    {
      return new cpp.Absyn.Type_int();
    }
    public cpp.Absyn.Type visit(cpp.Absyn.Type_double p, A arg)
    {
      return new cpp.Absyn.Type_double();
    }
    public cpp.Absyn.Type visit(cpp.Absyn.Type_void p, A arg)
    {
      return new cpp.Absyn.Type_void();
    }
    public cpp.Absyn.Type visit(cpp.Absyn.Type_string p, A arg)
    {
      return new cpp.Absyn.Type_string();
    }
}
