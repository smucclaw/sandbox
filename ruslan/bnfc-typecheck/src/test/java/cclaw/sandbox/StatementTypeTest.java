package cclaw.sandbox;

import cpp.Absyn.Program;
import cpp.Absyn.Stm;
import cpp.*;
import cpp.Absyn.Type_int;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Unit test for simple App.
 */
public class StatementTypeTest {
    private Env topEnv;
    private TypecheckStatement inferExp;

    @BeforeEach
    void setUp() {
        topEnv = new Env();
        inferExp = new TypecheckStatement();
    }

    @Test
    void testWhileNotBool() throws IOException {
        Program ast = getProgramAst("while(2+2) ++n");
        Stm exp = extractStatementUnderTest(ast);

        Assertions.assertThrows(TypeException.class, () ->
                exp.accept(inferExp, topEnv)
        );
    }

    @Test
    void testWhile() throws IOException {
        Program ast = getProgramAst("while(c) ++n");
        Stm exp = extractStatementUnderTest(ast);

        topEnv.updateVar("c", new Type_int());
        Assertions.assertThrows(TypeException.class, () ->
                exp.accept(inferExp, topEnv)
        );
    }

    private Stm extractStatementUnderTest(Program ast) {
        StatementExtractor extractor = new StatementExtractor();
        List<Stm> expressions = ast.accept(extractor, topEnv);
        assertThat(expressions).hasSizeGreaterThan(0);

        return expressions.get(expressions.size()-1);
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

}
