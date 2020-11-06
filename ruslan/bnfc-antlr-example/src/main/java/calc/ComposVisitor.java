package calc;
/** BNFC-Generated Composition Visitor
*/

public class ComposVisitor<A> implements
  calc.Absyn.Exp.Visitor<calc.Absyn.Exp,A>
{
    /* Exp */
    public calc.Absyn.Exp visit(calc.Absyn.EAdd p, A arg)
    {
      calc.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      calc.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new calc.Absyn.EAdd(exp_1, exp_2);
    }
    public calc.Absyn.Exp visit(calc.Absyn.ESub p, A arg)
    {
      calc.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      calc.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new calc.Absyn.ESub(exp_1, exp_2);
    }
    public calc.Absyn.Exp visit(calc.Absyn.EMul p, A arg)
    {
      calc.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      calc.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new calc.Absyn.EMul(exp_1, exp_2);
    }
    public calc.Absyn.Exp visit(calc.Absyn.EDiv p, A arg)
    {
      calc.Absyn.Exp exp_1 = p.exp_1.accept(this, arg);
      calc.Absyn.Exp exp_2 = p.exp_2.accept(this, arg);
      return new calc.Absyn.EDiv(exp_1, exp_2);
    }
    public calc.Absyn.Exp visit(calc.Absyn.EInt p, A arg)
    {
      Integer integer_ = p.integer_;
      return new calc.Absyn.EInt(integer_);
    }
}
