package cclaw.sandbox;

import cpp.*;
import cpp.Absyn.Exp;
import cpp.Absyn.Program;
import cpp.Absyn.Type;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.io.IOException;
import java.util.List;
import java.util.stream.Stream;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Unit test for simple App.
 */
public class ExpressionTypeTest {
    private Env topEnv;
    private InferExp inferExp;

    @BeforeEach
    void setUp() {
        topEnv = new Env();
        inferExp = new InferExp();
    }

    @ParameterizedTest
    @MethodSource("arithExpressionProvider")
    void testArithMixedTypes(String expression) throws IOException {
        Program ast = getProgramAst(expression);
        Exp exp = extractExpressionUnderTest(ast);

        Assertions.assertThrows(TypeException.class, () ->
                exp.accept(inferExp, topEnv)
        );
    }

    @ParameterizedTest
    @MethodSource("compareMixedTypeExpressionProvider")
    void testCompareMixedTypes(String expression) throws IOException {
        Program ast = getProgramAst(expression);
        Exp exp = extractExpressionUnderTest(ast);

        Assertions.assertThrows(TypeException.class, () ->
                exp.accept(inferExp, topEnv)
        );
    }

    @ParameterizedTest
    @MethodSource("compareExpressionProvider")
    void testCompareSameTypes(String expression) throws IOException {
        Program ast = getProgramAst(expression);
        Exp exp = extractExpressionUnderTest(ast);

        Type expType = exp.accept(inferExp, topEnv);
        assertThat(expType.getTypeCode()).isEqualTo(TypeCode.CBool);
    }

    @ParameterizedTest
    @MethodSource("logicExpressionProvider")
    void testLogicMixedTypes(String expression) throws IOException {
        Program ast = getProgramAst(expression);
        Exp exp = extractExpressionUnderTest(ast);

        Assertions.assertThrows(TypeException.class, () ->
                exp.accept(inferExp, topEnv)
        );
    }

    @Test()
    void testAddDouble() throws IOException {
        Program ast = getProgramAst("1.3 + 5.7");
        Exp exp = extractExpressionUnderTest(ast);

        Type expType = exp.accept(inferExp, topEnv);
        assertThat(expType.getTypeCode()).isEqualTo(TypeCode.CDouble);
    }

    @Test()
    void testOr() throws IOException {
        Program ast = getProgramAst("true || false");
        Exp exp = extractExpressionUnderTest(ast);

        Type expType = exp.accept(inferExp, topEnv);
        assertThat(expType.getTypeCode()).isEqualTo(TypeCode.CBool);
    }

    @Test()
    void testAnd() throws IOException {
        Program ast = getProgramAst("true && false");
        Exp exp = extractExpressionUnderTest(ast);

        Type expType = exp.accept(inferExp, topEnv);
        assertThat(expType.getTypeCode()).isEqualTo(TypeCode.CBool);
    }

    @Test()
    void testAddInteger() throws IOException {
        Program ast = getProgramAst("1 + 5");
        Exp exp = extractExpressionUnderTest(ast);

        Type expType = exp.accept(inferExp, topEnv);
        assertThat(expType.getTypeCode()).isEqualTo(TypeCode.CInt);
    }

    @Test()
    void testAddIntegerAndDouble() throws IOException {
        Program ast = getProgramAst("1 + 5.0");
        Exp exp = extractExpressionUnderTest(ast);

        Assertions.assertThrows(TypeException.class, () ->
                exp.accept(inferExp, topEnv)
        );
    }

    private Exp extractExpressionUnderTest(Program ast) {
        ExpressionExtractor extractor = new ExpressionExtractor();
        List<Exp> expressions = ast.accept(extractor, topEnv);
        assertThat(expressions).hasSize(1);

        return expressions.get(0);
    }

    private Program getProgramAst(String s) throws IOException {
        cppParser p = embedExpressionInProgram(s);

        cppParser.Start_ProgramContext pc = p.start_Program();
        return pc.result;
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
