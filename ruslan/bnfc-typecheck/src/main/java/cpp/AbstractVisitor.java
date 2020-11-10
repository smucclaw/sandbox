package cpp;

/** BNFC-Generated Abstract Visitor */

public class AbstractVisitor<R,A> implements AllVisitor<R,A> {
    /* Program */
    public R visit(cpp.Absyn.PDefs p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(cpp.Absyn.Program p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }
    /* Def */
    public R visit(cpp.Absyn.DFun p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(cpp.Absyn.Def p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }
    /* Arg */
    public R visit(cpp.Absyn.ADecl p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(cpp.Absyn.Arg p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }
    /* Stm */
    public R visit(cpp.Absyn.SExp p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.SDecls p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.SInit p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.SReturn p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.SReturnVoid p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.SWhile p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.SBlock p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.SIfElse p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(cpp.Absyn.Stm p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }
    /* Exp */
    public R visit(cpp.Absyn.ETrue p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EFalse p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EInt p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EDouble p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EString p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EId p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EApp p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.ETyped p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EPIncr p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EPDecr p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EIncr p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EDecr p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.ETimes p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EDiv p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EPlus p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EMinus p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.ELt p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EGt p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.ELtEq p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EGtEq p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EEq p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.ENEq p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EAnd p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EOr p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.EAss p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(cpp.Absyn.Exp p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }
    /* Type */
    public R visit(cpp.Absyn.Type_bool p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.Type_int p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.Type_double p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.Type_void p, A arg) { return visitDefault(p, arg); }
    public R visit(cpp.Absyn.Type_string p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(cpp.Absyn.Type p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }

}
