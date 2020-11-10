package cpp;

/** BNFC-Generated All Visitor */

public interface AllVisitor<R,A> extends
  cpp.Absyn.Program.Visitor<R,A>,
  cpp.Absyn.Def.Visitor<R,A>,
  cpp.Absyn.Arg.Visitor<R,A>,
  cpp.Absyn.Stm.Visitor<R,A>,
  cpp.Absyn.Exp.Visitor<R,A>,
  cpp.Absyn.Type.Visitor<R,A>
{}
