package sg.edu.smu.cclaw;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.junit.jupiter.api.Test;

import java.io.InputStream;

import static org.assertj.core.api.Assertions.assertThat;

class ParserTest {
    @Test
    void testLexiconOnly() throws Exception {
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

        ParseTree lexMapNode = extractor.locateParseTree(4, 3);
        assertThat(lexMapNode.getText()).isEqualTo("Business");

        ParseTree lexNode = extractor.locateParseTree(3, 3);
        assertThat(lexNode.getText()).isEqualTo("lexicon");

        ParseTree lexMapNode2 = extractor.locateParseTree(4, 20);
        assertThat(lexMapNode2.getText()).isEqualTo("\"business_1_N\"");
    }

    @Test
    void testLexiconAndClass() throws Exception {
        InputStream in = this.getClass().getClassLoader()
                .getResourceAsStream("lexAndClass.l4");
        CharStream input = CharStreams.fromStream(in);

        BabyL4Lexer lex = new BabyL4Lexer(input);

        CommonTokenStream tokens = new CommonTokenStream(lex);

        BabyL4Parser p = new BabyL4Parser(tokens);
        ParseTree tree = p.program();

        ParseTreeWalker walker = new ParseTreeWalker(); // create standard walker
        PositionExtractor extractor = new PositionExtractor();
        walker.walk(extractor, tree); // initiate walk of tree with listener

        ParseTree lexMapNode = extractor.locateParseTree(4, 3);
        assertThat(lexMapNode.getText()).isEqualTo("Business");

        ParseTree lexNode = extractor.locateParseTree(3, 3);
        assertThat(lexNode.getText()).isEqualTo("lexicon");

        ParseTree lexMapNode2 = extractor.locateParseTree(10, 10);
        assertThat(lexMapNode2.getText()).isEqualTo("Position");
    }

    @Test
    void testLexiconMappingMessage() throws Exception {
        InputStream in = this.getClass().getClassLoader()
                .getResourceAsStream("lexAndClass.l4");
        CharStream input = CharStreams.fromStream(in);

        BabyL4Lexer lex = new BabyL4Lexer(input);

        CommonTokenStream tokens = new CommonTokenStream(lex);

        BabyL4Parser p = new BabyL4Parser(tokens);
        ParseTree tree = p.lexiconBlock();

        System.out.println(tree.toStringTree(p));

        ParseTreeWalker walker = new ParseTreeWalker(); // create standard walker
        PositionExtractor extractor = new PositionExtractor();
        walker.walk(extractor, tree); // initiate walk of tree with listener

        ParseTree lexMapNode = extractor.locateParseTree(4, 19);

        if (lexMapNode.getParent() instanceof BabyL4Parser.LexiconMappingContext mappingContext){
            System.out.printf("This block maps variable %s to WordNet definion %s", mappingContext.getChild(0),  mappingContext.getChild(2));
        }
    }
}