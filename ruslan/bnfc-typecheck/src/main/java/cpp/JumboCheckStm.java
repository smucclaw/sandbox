package cpp;

import cpp.Absyn.*;

import java.util.ArrayList;
import java.util.List;

public class JumboCheckStm extends AbstractVisitor<Env, Env> {

    @Override
    public Env visit(SExp p, Env arg) {
        return null;
    }

    @Override
    public Env visit(SDecls p, Env env) {
        p.listid_.forEach(
                id -> env.updateVar(id, p.type_)
        );
        return env;
    }

    @Override
    public Env visit(PDefs p, Env env) {
        p.listdef_.forEach(
                def -> def.accept(this, env)
        );
        return env;
    }

    @Override
    public Env visit(DFun p, Env env) {
        FunctionArgTypeExtract argTypeExtractor = new FunctionArgTypeExtract();
        List<Type> functionArgTypes = new ArrayList<>();

        p.listarg_.forEach(arg ->
            functionArgTypes.add(arg.accept(argTypeExtractor, env))
        );

        FunType funSignature = new FunType(functionArgTypes, p.type_);

        env.updateFun(p.id_, funSignature);

        return env;
    }
}
