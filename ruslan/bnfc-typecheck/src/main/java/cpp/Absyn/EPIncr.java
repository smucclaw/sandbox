package cpp.Absyn; // Java Package generated by the BNF Converter.

public class EPIncr implements Exp {
  public final Exp exp_;
  public EPIncr(Exp p1) { exp_ = p1; }

  public <R,A> R accept(cpp.Absyn.Exp.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof cpp.Absyn.EPIncr) {
      cpp.Absyn.EPIncr x = (cpp.Absyn.EPIncr)o;
      return this.exp_.equals(x.exp_);
    }
    return false;
  }

  public int hashCode() {
    return this.exp_.hashCode();
  }


}
