package cpp;

import cpp.Absyn.Type;

import java.util.List;

public record FunType(List<Type> args, Type type) {}
