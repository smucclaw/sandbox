package cpp;

import cpp.Absyn.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class ExpressionExtractor extends AbstractVisitor<List<Exp>, Env> {

    @Override
    public List<Exp> visit(SExp p, Env env) {
        return Collections.singletonList(p.exp());
    }

    @Override
    public List<Exp> visit(SDecls p, Env env) {
        p.listid().forEach(
                id -> env.updateVar(id, p.type())
        );
        return Collections.EMPTY_LIST;
    }

    @Override
    public List<Exp> visit(PDefs p, Env env) {
        return p.listdef_.stream().flatMap(
                def -> def.accept(this, env).stream()
        ).collect(Collectors.toList());
    }

    @Override
    public List<Exp> visit(DFun p, Env env) {
        return p.statements().stream().flatMap(
                stm -> stm.accept(this, env).stream()
        ).collect(Collectors.toList());
    }

}
