package cpp;

import cpp.Absyn.ADecl;
import cpp.Absyn.Arg;
import cpp.Absyn.Type;

public class FunctionArgTypeExtract implements Arg.Visitor<Type, Env>{

    @Override
    public Type visit(ADecl p, Env arg) {
        return p.type_;
    }
}
