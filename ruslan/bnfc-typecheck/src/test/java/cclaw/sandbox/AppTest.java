package cclaw.sandbox;

import cpp.PrettyPrinter;
import cpp.cppLexer;
import cpp.cppParser;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.junit.jupiter.api.Test;

import java.io.IOException;

/**
 * Unit test for simple App.
 */
public class AppTest {
    @Test
    void testGoodFile() throws IOException {
        cppParser p = getCppParser("good.cc");

        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;

        System.out.println(PrettyPrinter.show(ast));
    }

    @Test
    void testBadFile() throws IOException {
        cppParser p = getCppParser("bad.cc");

        cppParser.Start_ProgramContext pc = p.start_Program();
        cpp.Absyn.Program ast = pc.result;

        System.out.println(PrettyPrinter.show(ast));
    }

    private cppParser getCppParser(String s) throws IOException {
        var l = new cppLexer(CharStreams.fromStream(
                getClass().getClassLoader().getResourceAsStream(s)));
        return new cppParser(new CommonTokenStream(l));
    }
}
