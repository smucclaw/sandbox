package cpp;

import cpp.Absyn.*;

public class CheckStm implements Stm.Visitor<Env, Env> {

    @Override
    public Env visit(SExp p, Env arg) {
        return null;
    }

    @Override
    public Env visit(SDecls p, Env env) {
        p.listid().forEach(
                id -> env.updateVar(id, p.type())
        );
        return env;
    }

    @Override
    public Env visit(SInit p, Env arg) {
        return null;
    }

    @Override
    public Env visit(SReturn p, Env arg) {
        return null;
    }

    @Override
    public Env visit(SReturnVoid p, Env arg) {
        return null;
    }

    @Override
    public Env visit(SWhile p, Env arg) {
        return null;
    }

    @Override
    public Env visit(SBlock p, Env arg) {
        return null;
    }

    @Override
    public Env visit(SIfElse p, Env arg) {
        return null;
    }
}
