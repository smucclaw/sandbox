package cclaw.sandbox;

import cpp.*;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.IOException;

/**
 * Unit test for simple App.
 */
public class AppTest {
    @Test
    void testGoodFile() throws IOException {
        cppParser p = getCppParserFromFileName("good.cc");

        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;

        System.out.println(PrettyPrinter.show(ast));
    }

    @Test
    void testBadFile() throws IOException {
        cppParser p = getCppParserFromFileName("bad.cc");

        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;

        System.out.println(PrettyPrinter.show(ast));
    }

    @Test()
    void testBadIf() throws IOException {
        cppParser p = getCppParserFromFileName("badif.cc");

        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;

        JumboCheckStm stm = new JumboCheckStm();
        Env topEnv = new Env();

        Assertions.assertThrows(TypeException.class, () ->
                ast.accept(stm, topEnv)
        );
    }

    @Test()
    void testBadIfText() throws IOException {
        cppParser p = getCppParserFromText("""
                int factr (int n)
                    {
                      if (true && false) return 1 ;
                      else return 0 ;
                    }
                """);

        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;

        JumboCheckStm stm = new JumboCheckStm();
        Env topEnv = new Env();

        ast.accept(stm, topEnv);
    }

    private cppParser getCppParserFromFileName(String s) throws IOException {
        var l = new cppLexer(CharStreams.fromStream(
                getClass().getClassLoader().getResourceAsStream(s)));
        return new cppParser(new CommonTokenStream(l));
    }

    private cppParser getCppParserFromText(String s) throws IOException {
        var l = new cppLexer(CharStreams.fromString(s));
        return new cppParser(new CommonTokenStream(l));
    }
}
