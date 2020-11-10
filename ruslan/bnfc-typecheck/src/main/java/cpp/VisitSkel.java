package cpp;

/*** BNFC-Generated Visitor Design Pattern Skeleton. ***/

/* This implements the common visitor design pattern.
   Tests show it to be slightly less efficient than the
   instanceof method, but easier to use.
   Replace the R and A parameters with the desired return
   and context types.*/

public class VisitSkel
{
  public class ProgramVisitor<R,A> implements cpp.Absyn.Program.Visitor<R,A>
  {
    public R visit(cpp.Absyn.PDefs p, A arg)
    { /* Code for PDefs goes here */
      for (cpp.Absyn.Def x: p.listdef_) {
        x.accept(new DefVisitor<R,A>(), arg);
      }
      return null;
    }
  }
  public class DefVisitor<R,A> implements cpp.Absyn.Def.Visitor<R,A>
  {
    public R visit(cpp.Absyn.DFun p, A arg)
    { /* Code for DFun goes here */
      p.type_.accept(new TypeVisitor<R,A>(), arg);
      //p.id_;
      for (cpp.Absyn.Arg x: p.listarg_) {
        x.accept(new ArgVisitor<R,A>(), arg);
      }
      for (cpp.Absyn.Stm x: p.liststm_) {
        x.accept(new StmVisitor<R,A>(), arg);
      }
      return null;
    }
  }
  public class ArgVisitor<R,A> implements cpp.Absyn.Arg.Visitor<R,A>
  {
    public R visit(cpp.Absyn.ADecl p, A arg)
    { /* Code for ADecl goes here */
      p.type_.accept(new TypeVisitor<R,A>(), arg);
      //p.id_;
      return null;
    }
  }
  public class StmVisitor<R,A> implements cpp.Absyn.Stm.Visitor<R,A>
  {
    public R visit(cpp.Absyn.SExp p, A arg)
    { /* Code for SExp goes here */
      p.exp_.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.SDecls p, A arg)
    { /* Code for SDecls goes here */
      p.type_.accept(new TypeVisitor<R,A>(), arg);
      for (String x: p.listid_) {
        //x;
      }
      return null;
    }
    public R visit(cpp.Absyn.SInit p, A arg)
    { /* Code for SInit goes here */
      p.type_.accept(new TypeVisitor<R,A>(), arg);
      //p.id_;
      p.exp_.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.SReturn p, A arg)
    { /* Code for SReturn goes here */
      p.exp_.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.SReturnVoid p, A arg)
    { /* Code for SReturnVoid goes here */
      return null;
    }
    public R visit(cpp.Absyn.SWhile p, A arg)
    { /* Code for SWhile goes here */
      p.exp_.accept(new ExpVisitor<R,A>(), arg);
      p.stm_.accept(new StmVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.SBlock p, A arg)
    { /* Code for SBlock goes here */
      for (cpp.Absyn.Stm x: p.liststm_) {
        x.accept(new StmVisitor<R,A>(), arg);
      }
      return null;
    }
    public R visit(cpp.Absyn.SIfElse p, A arg)
    { /* Code for SIfElse goes here */
      p.exp_.accept(new ExpVisitor<R,A>(), arg);
      p.stm_1.accept(new StmVisitor<R,A>(), arg);
      p.stm_2.accept(new StmVisitor<R,A>(), arg);
      return null;
    }
  }
  public class ExpVisitor<R,A> implements cpp.Absyn.Exp.Visitor<R,A>
  {
    public R visit(cpp.Absyn.ETrue p, A arg)
    { /* Code for ETrue goes here */
      return null;
    }
    public R visit(cpp.Absyn.EFalse p, A arg)
    { /* Code for EFalse goes here */
      return null;
    }
    public R visit(cpp.Absyn.EInt p, A arg)
    { /* Code for EInt goes here */
      //p.integer_;
      return null;
    }
    public R visit(cpp.Absyn.EDouble p, A arg)
    { /* Code for EDouble goes here */
      //p.double_;
      return null;
    }
    public R visit(cpp.Absyn.EString p, A arg)
    { /* Code for EString goes here */
      //p.string_;
      return null;
    }
    public R visit(cpp.Absyn.EId p, A arg)
    { /* Code for EId goes here */
      //p.id_;
      return null;
    }
    public R visit(cpp.Absyn.EApp p, A arg)
    { /* Code for EApp goes here */
      //p.id_;
      for (cpp.Absyn.Exp x: p.listexp_) {
        x.accept(new ExpVisitor<R,A>(), arg);
      }
      return null;
    }
    public R visit(cpp.Absyn.ETyped p, A arg)
    { /* Code for ETyped goes here */
      p.exp_.accept(new ExpVisitor<R,A>(), arg);
      p.type_.accept(new TypeVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.EPIncr p, A arg)
    { /* Code for EPIncr goes here */
      p.exp_.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.EPDecr p, A arg)
    { /* Code for EPDecr goes here */
      p.exp_.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.EIncr p, A arg)
    { /* Code for EIncr goes here */
      p.exp_.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.EDecr p, A arg)
    { /* Code for EDecr goes here */
      p.exp_.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.ETimes p, A arg)
    { /* Code for ETimes goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.EDiv p, A arg)
    { /* Code for EDiv goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.EPlus p, A arg)
    { /* Code for EPlus goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.EMinus p, A arg)
    { /* Code for EMinus goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.ELt p, A arg)
    { /* Code for ELt goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.EGt p, A arg)
    { /* Code for EGt goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.ELtEq p, A arg)
    { /* Code for ELtEq goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.EGtEq p, A arg)
    { /* Code for EGtEq goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.EEq p, A arg)
    { /* Code for EEq goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.ENEq p, A arg)
    { /* Code for ENEq goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.EAnd p, A arg)
    { /* Code for EAnd goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.EOr p, A arg)
    { /* Code for EOr goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(cpp.Absyn.EAss p, A arg)
    { /* Code for EAss goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
  }
  public class TypeVisitor<R,A> implements cpp.Absyn.Type.Visitor<R,A>
  {
    public R visit(cpp.Absyn.Type_bool p, A arg)
    { /* Code for Type_bool goes here */
      return null;
    }
    public R visit(cpp.Absyn.Type_int p, A arg)
    { /* Code for Type_int goes here */
      return null;
    }
    public R visit(cpp.Absyn.Type_double p, A arg)
    { /* Code for Type_double goes here */
      return null;
    }
    public R visit(cpp.Absyn.Type_void p, A arg)
    { /* Code for Type_void goes here */
      return null;
    }
    public R visit(cpp.Absyn.Type_string p, A arg)
    { /* Code for Type_string goes here */
      return null;
    }
  }
}
