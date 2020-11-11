package cpp;

class TestError extends RuntimeException {
    int line;
    int column;

    public TestError(String msg, int l, int c) {
        super(msg);
        line = l;
        column = c;
    }
}
