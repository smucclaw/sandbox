package cpp;

import cpp.Absyn.*;

import java.util.ArrayList;
import java.util.List;

public class JumboCheckStm extends AbstractVisitor<Env, Env> {

    @Override
    public Env visit(SExp p, Env env) {
        InferExp inferExp = new InferExp();
        p.exp().accept(inferExp, env);
        return env;
    }

    @Override
    public Env visit(SDecls p, Env env) {
        p.listid().forEach(
                id -> env.updateVar(id, p.type())
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

        p.args().forEach(arg ->
                functionArgTypes.add(arg.accept(argTypeExtractor, env))
        );

        p.statements().forEach(
                stm -> stm.accept(this, env)
        );

        FunType funSignature = new FunType(functionArgTypes, p.type());

        env.updateFun(p.id(), funSignature);

        return env;
    }

    @Override
    public Env visit(SIfElse p, Env env) {
        InferExp inferExp = new InferExp();
        Type tt = p.exp().accept(inferExp, env);
        if (tt.getTypeCode() != TypeCode.CBool) {
            throw new TypeException();
        }
        return env;
    }
}
