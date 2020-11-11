package cpp;

import cpp.Absyn.Program;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;

public class TypeChecker {
    cppLexer l;
    cppParser p;

    public TypeChecker(String[] args) {
        try {
            Reader input;
            if (args.length == 0) input = new InputStreamReader(System.in);
            else input = new FileReader(args[0]);
            l = new cppLexer(new ANTLRInputStream(input));
            l.addErrorListener(new BNFCErrorListener());
        } catch (IOException e) {
            System.err.println("Error: File not found: " + args[0]);
            System.exit(1);
        }
        p = new cppParser(new CommonTokenStream(l));
        p.addErrorListener(new BNFCErrorListener());
    }

    public cpp.Absyn.Program parse() throws Exception {
        /* The default parser is the first-defined entry point. */
        /* Other options are: */
    /* def, listDef, arg, listArg, stm, listStm, exp, listExp, type,
       listId */
        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;
        System.out.println();
        System.out.println("Parse Succesful!");
        System.out.println();
        System.out.println("[Abstract Syntax]");
        System.out.println();
        System.out.println(PrettyPrinter.show(ast));
        System.out.println();
        System.out.println("[Linearized Tree]");
        System.out.println();
        System.out.println(PrettyPrinter.print(ast));
        return ast;
    }

    public static void main(String args[]) throws Exception {
        TypeChecker t = new TypeChecker(args);
        try {
            Program p = t.parse();
            t.typecheck(p);
        } catch (TestError e) {
            System.err.println("At line " + e.line + ", column " + e.column + " :");
            System.err.println("     " + e.getMessage());
            System.exit(1);
        }
    }

    public void typecheck(Program p) {
        JumboCheckStm stm = new JumboCheckStm();
        Env topEnv = new Env();
        p.accept(stm,topEnv);

        topEnv.dump();
    }
}
