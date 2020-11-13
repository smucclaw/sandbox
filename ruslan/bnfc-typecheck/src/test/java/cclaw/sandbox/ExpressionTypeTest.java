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
    @MethodSource("arithExpressionProvider")
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

    @ParameterizedTest
    @MethodSource("compareMixedTypeExpressionProvider")
    void testCompareMixedTypes(String expression) throws IOException {
        cppParser p = embedExpressionInProgram(expression);

        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;

        JumboCheckStm stm = new JumboCheckStm();
        Env topEnv = new Env();

        Assertions.assertThrows(TypeException.class, () ->
                ast.accept(stm, topEnv)
        );
    }

    @ParameterizedTest
    @MethodSource("compareExpressionProvider")
    void testCompareSameTypes(String expression) throws IOException {
        cppParser p = embedExpressionInProgram(expression);

        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;

        JumboCheckStm stm = new JumboCheckStm();
        Env topEnv = new Env();

        ast.accept(stm, topEnv);
    }

    @ParameterizedTest
    @MethodSource("logicExpressionProvider")
    void testLogicMixedTypes(String expression) throws IOException {
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
    void testOr() throws IOException {
        cppParser p = embedExpressionInProgram("true || false");

        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;

        JumboCheckStm stm = new JumboCheckStm();
        Env topEnv = new Env();

        ast.accept(stm, topEnv);
    }

    @Test()
    void testAdd() throws IOException {
        cppParser p = embedExpressionInProgram("true && false");

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

    static Stream<String> arithExpressionProvider() {
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

    static Stream<String> compareMixedTypeExpressionProvider() {
        List<String> firstArgs = List.of("2", "2.0", "true", "\"a\"");
        List<String> secondArgs = List.of("2", "2.0", "true", "\"a\"");
        List<String> operators = List.of("<", ">", "<=", ">=", "==", "!=");

        return firstArgs.stream().flatMap(
                arg1 ->
                        secondArgs.stream().
                                filter(arg2 -> !arg2.equals(arg1))
                                .flatMap(
                                        arg -> operators.stream().map(
                                                op -> arg1 + op + arg
                                        )
                                )
        );
    }

    static Stream<String> compareExpressionProvider() {
        List<String> firstArgs = List.of("2", "2.0", "true", "\"a\"");
        List<String> secondArgs = List.of("2", "2.0", "true", "\"a\"");
        List<String> operators = List.of("<", ">", "<=", ">=", "==", "!=");

        return firstArgs.stream().flatMap(
                arg1 ->
                        secondArgs.stream().
                                filter(arg2 -> arg2.equals(arg1))
                                .flatMap(
                                        arg -> operators.stream().map(
                                                op -> arg1 + op + arg
                                        )
                                )
        );
    }

    static Stream<String> logicExpressionProvider() {
        List<String> firstArgs = List.of("2", "2.0", "\"a\"");
        List<String> secondArgs = List.of("2", "2.0", "\"a\"");
        List<String> operators = List.of("&&", "||");

        return firstArgs.stream().flatMap(
                arg1 ->
                        secondArgs.stream().
                                filter(arg2 -> arg2.equals(arg1))
                                .flatMap(
                                        arg -> operators.stream().map(
                                                op -> arg1 + op + arg
                                        )
                                )
        );
    }
}
