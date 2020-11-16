package cpp;

import cpp.Absyn.*;


public class TypecheckStatement implements Stm.Visitor<Type, Env> {
    private InferExp inferExp = new InferExp();

    @Override
    public Type visit(SExp p, Env arg) {
        return null;
    }

    @Override
    public Type visit(SDecls p, Env arg) {
        return null;
    }

    @Override
    public Type visit(SInit p, Env arg) {
        return null;
    }

    @Override
    public Type visit(SReturn p, Env arg) {
        return null;
    }

    @Override
    public Type visit(SReturnVoid p, Env arg) {
        return null;
    }

    @Override
    public Type visit(SWhile p, Env arg) {
        Type expresionType = p.exp().accept(inferExp, arg);
        if (expresionType.getTypeCode() != TypeCode.CBool)
            throw new TypeException("Operands to -- must be int or double.");

        return new Type_void();
    }

    @Override
    public Type visit(SBlock p, Env arg) {
        return null;
    }

    @Override
    public Type visit(SIfElse p, Env arg) {
        Type expresionType = p.exp().accept(inferExp, arg);
        if (expresionType.getTypeCode() != TypeCode.CBool)
            throw new TypeException("Operands to -- must be int or double.");

        return new Type_void();
    }
}
