package sg.edu.smu.cclaw.calc;

import sg.edu.smu.cclaw.calc.Absyn.*;

/** BNFC-Generated Composition Visitor
*/

public class ComposVisitor<A> implements
  Exp.Visitor<Exp,A>
{
    /* Exp */
    public Exp visit(EAdd p, A arg)
    {
      Exp exp_1 = p.exp_1.accept(this, arg);
      Exp exp_2 = p.exp_2.accept(this, arg);
      return new EAdd(exp_1, exp_2);
    }
    public Exp visit(ESub p, A arg)
    {
      Exp exp_1 = p.exp_1.accept(this, arg);
      Exp exp_2 = p.exp_2.accept(this, arg);
      return new ESub(exp_1, exp_2);
    }
    public Exp visit(EMul p, A arg)
    {
      Exp exp_1 = p.exp_1.accept(this, arg);
      Exp exp_2 = p.exp_2.accept(this, arg);
      return new EMul(exp_1, exp_2);
    }
    public Exp visit(EDiv p, A arg)
    {
      Exp exp_1 = p.exp_1.accept(this, arg);
      Exp exp_2 = p.exp_2.accept(this, arg);
      return new EDiv(exp_1, exp_2);
    }
    public Exp visit(EInt p, A arg)
    {
      Integer integer_ = p.integer_;
      return new EInt(integer_);
    }
}
