package cpp.Absyn; // Java Package generated by the BNF Converter.

public class ETrue implements Exp {
  public ETrue() { }

  public <R,A> R accept(cpp.Absyn.Exp.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof cpp.Absyn.ETrue) {
      return true;
    }
    return false;
  }

  public int hashCode() {
    return 37;
  }


}
