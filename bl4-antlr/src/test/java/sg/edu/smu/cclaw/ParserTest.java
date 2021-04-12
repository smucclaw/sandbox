package sg.edu.smu.cclaw;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.junit.jupiter.api.Test;

import java.io.InputStream;

import static org.assertj.core.api.Assertions.assertThat;

class ParserTest {
    @Test
    void test() throws Exception {
        InputStream in = this.getClass().getClassLoader()
                .getResourceAsStream("singleLexicon.l4");
        CharStream input = CharStreams.fromStream(in);

        BabyL4Lexer lex = new BabyL4Lexer(input);

        CommonTokenStream tokens = new CommonTokenStream(lex);

        BabyL4Parser p = new BabyL4Parser(tokens);
        ParseTree tree = p.lexiconBlock();

        System.out.println(tree.toStringTree(p));





        ParseTreeWalker walker = new ParseTreeWalker(); // create standard walker
        PositionExtractor extractor = new PositionExtractor();
        walker.walk(extractor, tree); // initiate walk of tree with listener

        ParseTree lexMapNode = locateParseTree(extractor, 4,  3);
        assertThat(lexMapNode.getText()).isEqualTo("Business");

        ParseTree lexNode = locateParseTree(extractor, 3,  3);
        assertThat(lexNode.getText()).isEqualTo("lexicon");

        ParseTree lexMapNode2 = locateParseTree(extractor, 4,  20);
        assertThat(lexMapNode2.getText()).isEqualTo("\"business_1_N\"");
    }

    private ParseTree locateParseTree(PositionExtractor tree, int i, int i1) {
        return tree.locateParseTree(i, i1);
    }
}