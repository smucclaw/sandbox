package calc;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.FileInputStream;
import java.io.InputStream;

public class Calculator {
    public static void main(String args[]) throws Exception {
        String inputFile = null;
        if ( args.length>0 ) inputFile = args[0];
        InputStream is = System.in;
        if ( inputFile!=null ) {
            is = new FileInputStream(inputFile);
        }
        ANTLRInputStream input = new ANTLRInputStream(is);
        calcLexer lexer = new calcLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        CalcExpressionParser parser = new CalcExpressionParser(tokens);
        parser.setBuildParseTree(true);      // tell ANTLR to build a parse tree
        ParseTree tree = parser.start_Exp();
        // show tree in text form
        System.out.println(tree.toStringTree(parser));

        ParseTreeWalker walker = new ParseTreeWalker();
        TestLEvaluatorWithProps.EvaluatorWithProps evalProp = new TestLEvaluatorWithProps.EvaluatorWithProps();
        walker.walk(evalProp, tree);
        Interpreter icalc = new Interpreter();
        System.out.println("visitor result = "+ icalc.eval(evalProp.getValue(tree)));

    }
}
