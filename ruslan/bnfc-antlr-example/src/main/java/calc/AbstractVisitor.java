package calc;

/** BNFC-Generated Abstract Visitor */

public class AbstractVisitor<R,A> implements AllVisitor<R,A> {
    /* Exp */
    public R visit(calc.Absyn.EAdd p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.ESub p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.EMul p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.EDiv p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.EInt p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(calc.Absyn.Exp p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }

}
