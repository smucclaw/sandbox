package cpp;

import cpp.Absyn.*;


public class InferExp implements Exp.Visitor<Type,Env>{
    @Override
    public Type visit(ETrue p, Env arg) {
        return new Type_bool();
    }

    @Override
    public Type visit(EFalse p, Env arg) {
        return new Type_bool();
    }

    @Override
    public Type visit(EInt p, Env arg) {
        return new Type_int();
    }

    @Override
    public Type visit(EDouble p, Env arg) {
        return new Type_double();
    }

    @Override
    public Type visit(EString p, Env arg) {
        return new Type_string();
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
    public Type visit(EPIncr p, Env env) {
        Type t1 = p.exp_.accept(this, env);
        if (t1.getTypeCode() == TypeCode.CInt )
            return new Type_int();
        else
        if (t1.getTypeCode() == TypeCode.CDouble )
            return new Type_double();
        else
            throw new TypeException("Operands to -- must be int or double.");
    }

    @Override
    public Type visit(EPDecr p, Env env) {
        Type t1 = p.exp_.accept(this, env);
        if (t1.getTypeCode() == TypeCode.CInt )
            return new Type_int();
        else
        if (t1.getTypeCode() == TypeCode.CDouble )
            return new Type_double();
        else
            throw new TypeException("Operands to -- must be int or double.");
    }

    @Override
    public Type visit(EIncr p, Env env) {
        Type t1 = p.exp_.accept(this, env);
        if (t1.getTypeCode() == TypeCode.CInt )
            return new Type_int();
        else
        if (t1.getTypeCode() == TypeCode.CDouble )
            return new Type_double();
        else
            throw new TypeException("Operands to -- must be int or double.");
    }

    @Override
    public Type visit(EDecr p, Env env) {
        Type t1 = p.exp_.accept(this, env);
        if (t1.getTypeCode() == TypeCode.CInt )
            return new Type_int();
        else
        if (t1.getTypeCode() == TypeCode.CDouble )
            return new Type_double();
        else
            throw new TypeException("Operands to -- must be int or double.");
    }

    @Override
    public Type visit(ETimes p, Env env) {
        Type t1 = p.exp_1.accept(this, env);
        Type t2 = p.exp_2.accept(this, env);
        if (t1.getTypeCode() == TypeCode.CInt &&
                t2.getTypeCode() == TypeCode.CInt)
            return new Type_int();
        else
        if (t1.getTypeCode() == TypeCode.CDouble &&
                t2.getTypeCode() == TypeCode.CDouble)
            return new Type_double();
        else
            throw new TypeException("Operands to * must be int or double.");
    }

    @Override
    public Type visit(EDiv p, Env env) {
        Type t1 = p.exp_1.accept(this, env);
        Type t2 = p.exp_2.accept(this, env);
        if (t1.getTypeCode() == TypeCode.CInt &&
                t2.getTypeCode() == TypeCode.CInt)
            return new Type_int();
        else
        if (t1.getTypeCode() == TypeCode.CDouble &&
                t2.getTypeCode() == TypeCode.CDouble)
            return new Type_double();
        else
            throw new TypeException("Operands to * must be int or double.");
    }

    @Override
    public Type visit(EPlus p, Env env) {
        Type t1 = p.exp_1.accept(this, env);
        Type t2 = p.exp_2.accept(this, env);
        if (t1.getTypeCode() == TypeCode.CInt &&
                t2.getTypeCode() == TypeCode.CInt)
            return new Type_int();
        else
        if (t1.getTypeCode() == TypeCode.CDouble &&
                t2.getTypeCode() == TypeCode.CDouble)
            return new Type_double();
        else
            throw new TypeException("Operands to * must be int or double.");
    }

    @Override
    public Type visit(EMinus p, Env env) {
        Type t1 = p.exp_1.accept(this, env);
        Type t2 = p.exp_2.accept(this, env);
        if (t1.getTypeCode() == TypeCode.CInt &&
                t2.getTypeCode() == TypeCode.CInt)
            return new Type_int();
        else
        if (t1.getTypeCode() == TypeCode.CDouble &&
                t2.getTypeCode() == TypeCode.CDouble)
            return new Type_double();
        else
            throw new TypeException("Operands to * must be int or double.");
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
}
