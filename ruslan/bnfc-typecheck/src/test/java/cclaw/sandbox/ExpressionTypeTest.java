package cclaw.sandbox;

import cpp.*;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.io.IOException;
import java.util.List;
import java.util.stream.Stream;

/**
 * Unit test for simple App.
 */
public class ExpressionTypeTest {

    @ParameterizedTest
    @MethodSource("expressionProvider")
    void testArithMixedTypes(String expression) throws IOException {
        cppParser p = embedExpressionInProgram(expression);

        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;

        JumboCheckStm stm = new JumboCheckStm();
        Env topEnv = new Env();

        Assertions.assertThrows(TypeException.class, () ->
                ast.accept(stm, topEnv)
        );
    }

    @Test()
    void testAddDouble() throws IOException {
        cppParser p = embedExpressionInProgram("1.3 + 5.7");

        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;

        JumboCheckStm stm = new JumboCheckStm();
        Env topEnv = new Env();

        ast.accept(stm, topEnv);
    }

    @Test()
    void testAddInteger() throws IOException {
        cppParser p = embedExpressionInProgram("1 + 5");

        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;

        JumboCheckStm stm = new JumboCheckStm();
        Env topEnv = new Env();

        ast.accept(stm, topEnv);
    }

    @Test()
    void testAddIntegerAndDouble() throws IOException {
        cppParser p = embedExpressionInProgram("1 + 5.0");

        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;

        JumboCheckStm stm = new JumboCheckStm();
        Env topEnv = new Env();


        Assertions.assertThrows(TypeException.class, () ->
                ast.accept(stm, topEnv)
        );
    }

    private cppParser embedExpressionInProgram(String expression) throws IOException {
        String s = """
                void dummy () {
                      %s;
                }
                """;
        return getCppParserFromText(s.formatted(expression));
    }

    private cppParser getCppParserFromText(String s) throws IOException {
        var l = new cppLexer(CharStreams.fromString(s));
        return new cppParser(new CommonTokenStream(l));
    }

    static Stream<String> expressionProvider() {
        List<String> numbers = List.of("2", "2.0");
        List<String> arg2 = List.of("true", "\"a\"");
        List<String> operators = List.of("+", "-", "*", "/");

        return numbers.stream().flatMap(
                arg1 ->
                        arg2.stream().flatMap(
                                arg -> operators.stream().map(
                                        op -> arg1 + op + arg
                                )
                        )
        );
    }
}
