package sg.edu.smu.cclaw.calc;

import sg.edu.smu.cclaw.calc.Absyn.*;

/** BNFC-Generated Abstract Visitor */

public class AbstractVisitor<R,A> implements AllVisitor<R,A> {
    /* Exp */
    public R visit(EAdd p, A arg) { return visitDefault(p, arg); }
    public R visit(ESub p, A arg) { return visitDefault(p, arg); }
    public R visit(EMul p, A arg) { return visitDefault(p, arg); }
    public R visit(EDiv p, A arg) { return visitDefault(p, arg); }
    public R visit(EInt p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(Exp p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }

}
