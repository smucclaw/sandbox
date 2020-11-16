package cpp;

import cpp.Absyn.*;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class StatementExtractor extends AbstractVisitor<List<Stm>, Env> {

    @Override
    public List<Stm> visit(SWhile p, Env arg) {
        return Collections.singletonList(p);
    }

    @Override
    public List<Stm> visit(SInit p, Env arg) {
        return Collections.singletonList(p);
    }

    @Override
    public List<Stm> visit(SDecls p, Env env) {
        p.listid().forEach(
                id -> env.updateVar(id, p.type())
        );
        return Collections.EMPTY_LIST;
    }

    @Override
    public List<Stm> visit(PDefs p, Env env) {
        return p.listdef_.stream().flatMap(
                def -> def.accept(this, env).stream()
        ).collect(Collectors.toList());
    }

    @Override
    public List<Stm> visit(DFun p, Env env) {
        return p.statements().stream().flatMap(
                stm -> stm.accept(this, env).stream()
        ).collect(Collectors.toList());
    }

}
