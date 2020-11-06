package calc;

import calc.Absyn.*;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeProperty;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.FileInputStream;
import java.io.InputStream;

public class TestLEvaluatorWithProps {
    /** Sample "calculator" using property of nodes */
    public static class EvaluatorWithProps extends CalcExpressionParserBaseListener {
        /** maps nodes to integers with Map<ParseTree,Integer> */
        ParseTreeProperty<Exp> values = new ParseTreeProperty<>();

        @Override
        public void exitStart_Exp(CalcExpressionParser.Start_ExpContext ctx) {
            setValue(ctx, getValue(ctx.x));
        }

        @Override
        public void exitStart_Exp1(CalcExpressionParser.Start_Exp1Context ctx) {
            setValue(ctx, getValue(ctx.x));
        }

        @Override
        public void exitStart_Exp2(CalcExpressionParser.Start_Exp2Context ctx) {
            setValue(ctx, getValue(ctx.x));
        }

        @Override
        public void exitESub(CalcExpressionParser.ESubContext ctx) {
            Exp left = getValue(ctx.left); // e '+' e   # Add
            Exp right = getValue(ctx.right);
            setValue(ctx, new ESub(left, right));
        }

        @Override
        public void exitEAdd(CalcExpressionParser.EAddContext ctx) {
            Exp left = getValue(ctx.left); // e '+' e   # Add
            Exp right = getValue(ctx.right);
            setValue(ctx, new EAdd(left, right));
        }

        @Override
        public void exitEDiv(CalcExpressionParser.EDivContext ctx) {
            Exp left = getValue(ctx.left); // e '+' e   # Add
            Exp right = getValue(ctx.right);
            setValue(ctx, new EDiv(left, right));
        }

        @Override
        public void exitEMul(CalcExpressionParser.EMulContext ctx) {
            Exp left = getValue(ctx.left); // e '+' e   # Add
            Exp right = getValue(ctx.right);
            setValue(ctx, new EMul(left, right));
        }

        @Override
        public void exitEInt(CalcExpressionParser.EIntContext ctx) {
            String intText = ctx.INTEGER().getText();
            setValue(ctx, new EInt(Integer.valueOf(intText)));
        }

        @Override
        public void exitEExp1(CalcExpressionParser.EExp1Context ctx) {
            setValue(ctx, getValue(ctx.x));
        }

        @Override
        public void exitEExp2(CalcExpressionParser.EExp2Context ctx) {
            setValue(ctx, getValue(ctx.x));
        }

        @Override
        public void exitEExp(CalcExpressionParser.EExpContext ctx) {
            setValue(ctx, getValue(ctx.x));
        }

        public void setValue(ParseTree node, Exp value) { values.put(node, value); }
        public Exp getValue(ParseTree node) { return values.get(node); }
    }

    public static void main(String[] args) throws Exception {
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
        EvaluatorWithProps evalProp = new EvaluatorWithProps();
        walker.walk(evalProp, tree);
        System.out.println("visitor result = "+PrettyPrinter.show(evalProp.getValue(tree)));
        System.out.println("visitor result = "+PrettyPrinter.print(evalProp.getValue(tree)));
    }
}
