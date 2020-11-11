package cpp;

import cpp.Absyn.*;

public class InferExp implements Exp.Visitor<Type,Env>{
    @Override
    public Type visit(ETrue p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EFalse p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EInt p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EDouble p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EString p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EId p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EApp p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EPIncr p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EPDecr p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EIncr p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EDecr p, Env arg) {
        return null;
    }

    @Override
    public Type visit(ETimes p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EDiv p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EPlus p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EMinus p, Env arg) {
        return null;
    }

    @Override
    public Type visit(ELt p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EGt p, Env arg) {
        return null;
    }

    @Override
    public Type visit(ELtEq p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EGtEq p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EEq p, Env arg) {
        return null;
    }

    @Override
    public Type visit(ENEq p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EAnd p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EOr p, Env arg) {
        return null;
    }

    @Override
    public Type visit(EAss p, Env arg) {
        return null;
    }

    @Override
    public Type visit(ETyped p, Env arg) {
        return null;
    }

    @Override
    public Type visit(Exp exp, Env arg) {
        return null;
    }
}
