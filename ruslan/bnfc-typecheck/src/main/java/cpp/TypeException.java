package cpp;

public class TypeException extends RuntimeException{
    public TypeException(String s) {
        super(s);
    }

    public TypeException() {
        super("Dummy");
    }
}
