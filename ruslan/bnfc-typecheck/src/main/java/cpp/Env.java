package cpp;

import cpp.Absyn.Type;

import java.util.Deque;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

public class Env {
    private Map<String, FunType> signature;
    private Deque<Map<String, Type>> contexts ;

    public Env() {
        signature = new HashMap<>();
        contexts = new LinkedList<>();
        contexts.add(new HashMap<>());
    }

    public Type lookupVar(String id) {
        return null;
    }

    public FunType lookupFun(String id) {
        return null;
    }

    public void updateFun(String id, FunType ty){
        signature.put(id, ty);
    }

    public void updateVar(String id, Type ty) {
    }

    public void dump() {
        System.out.println("Functions");
        signature.forEach((id, ty) -> System.out.println(id + "->" + ty));
    }
}
