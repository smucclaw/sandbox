package calc;

/*** BNFC-Generated Visitor Design Pattern Skeleton. ***/

/* This implements the common visitor design pattern.
   Tests show it to be slightly less efficient than the
   instanceof method, but easier to use.
   Replace the R and A parameters with the desired return
   and context types.*/

public class VisitSkel
{
  public class ExpVisitor<R,A> implements calc.Absyn.Exp.Visitor<R,A>
  {
    public R visit(calc.Absyn.EAdd p, A arg)
    { /* Code for EAdd goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(calc.Absyn.ESub p, A arg)
    { /* Code for ESub goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(calc.Absyn.EMul p, A arg)
    { /* Code for EMul goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(calc.Absyn.EDiv p, A arg)
    { /* Code for EDiv goes here */
      p.exp_1.accept(new ExpVisitor<R,A>(), arg);
      p.exp_2.accept(new ExpVisitor<R,A>(), arg);
      return null;
    }
    public R visit(calc.Absyn.EInt p, A arg)
    { /* Code for EInt goes here */
      //p.integer_;
      return null;
    }
  }
}
