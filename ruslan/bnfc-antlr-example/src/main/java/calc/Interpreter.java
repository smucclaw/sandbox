package calc;

import calc.Absyn.*;

public class Interpreter implements Exp.Visitor<Integer, Object> {

    public Integer eval(Exp e) {
        return e.accept(this, null);
    }

    public Integer visit(EAdd p, Object arg) {
        return eval(p.exp_1) + eval(p.exp_2);
    }

    @Override
    public Integer visit(ESub p, Object arg) {
        return eval(p.exp_1) - eval(p.exp_2);
    }

    public Integer visit(EMul p, Object arg) {
        return eval(p.exp_1) * eval(p.exp_2);
    }

    @Override
    public Integer visit(EDiv p, Object arg) {
        return eval(p.exp_1) / eval(p.exp_2);
    }

    public Integer visit(EInt p, Object arg) {
        return p.integer_;
    }

}
