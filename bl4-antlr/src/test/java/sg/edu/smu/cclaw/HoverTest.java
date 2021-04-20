package sg.edu.smu.cclaw;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.eclipse.lsp4j.Position;
import org.junit.jupiter.api.Test;
import sg.edu.smu.cclaw.lsp.BL4TextDocumentService;

import java.io.InputStream;

import static org.assertj.core.api.Assertions.assertThat;

class HoverTest {
    @Test
    void testLexicon() throws Exception {
        InputStream in = this.getClass().getClassLoader()
                .getResourceAsStream("mini.l4");
        CharStream input = CharStreams.fromStream(in);

        String lexiconHover = BL4TextDocumentService.getHoverMessage(input, new Position(2,2));
        assertThat(lexiconHover).isEqualTo("This is a lexicon");
    }

    @Test
    void testLexiconMapping() throws Exception {
        InputStream in = this.getClass().getClassLoader()
                .getResourceAsStream("mini.l4");
        CharStream input = CharStreams.fromStream(in);

        String lexiconMappingHover = BL4TextDocumentService.getHoverMessage(input, new Position(3,2));
        assertThat(lexiconMappingHover).isEqualTo("This block maps variable Business to WordNet definion \"business_1_N\"");
    }

    @Test
    void testClassDefinitionName() throws Exception {
        InputStream in = this.getClass().getClassLoader()
                .getResourceAsStream("cr.l4");
        CharStream input = CharStreams.fromStream(in);

        String classDefinitionNameHover = BL4TextDocumentService.getHoverMessage(input, new Position(21,10));
        assertThat(classDefinitionNameHover).isEqualTo("Declaration of new class : Business");
    }

    @Test
    void testClassDefinitionClassHeader() throws Exception {
        InputStream in = this.getClass().getClassLoader()
                .getResourceAsStream("cr.l4");
        CharStream input = CharStreams.fromStream(in);

        String classDefinitionClassHeaderHover = BL4TextDocumentService.getHoverMessage(input, new Position(21,2));
        assertThat(classDefinitionClassHeaderHover).isEqualTo("Declaration of new class : Business");
    }

    @Test
    void testClassFieldName() throws Exception {
        InputStream in = this.getClass().getClassLoader()
                .getResourceAsStream("cr.l4");
        CharStream input = CharStreams.fromStream(in);

        String classFieldNameHover = BL4TextDocumentService.getHoverMessage(input, new Position(22,8));
        assertThat(classFieldNameHover).isEqualTo("Declaration of field foo within class Business");
    }

    @Test
    void testClassFieldType() throws Exception {
        InputStream in = this.getClass().getClassLoader()
                .getResourceAsStream("cr.l4");
        CharStream input = CharStreams.fromStream(in);

        String classFieldTypeHover = BL4TextDocumentService.getHoverMessage(input, new Position(23,13));
        assertThat(classFieldTypeHover).isEqualTo("Declaration of type for field bar within class Business");
    }

    @Test
    void testGlobalVarType() throws Exception {
        InputStream in = this.getClass().getClassLoader()
                .getResourceAsStream("cr.l4");
        CharStream input = CharStreams.fromStream(in);

        String globalVarTypeHover = BL4TextDocumentService.getHoverMessage(input, new Position(38,30));
        assertThat(globalVarTypeHover).isEqualTo("Declaration of type for global variable AssociatedWith");
    }

    @Test
    void testGlobalVarDecl() throws Exception {
        InputStream in = this.getClass().getClassLoader()
                .getResourceAsStream("cr.l4");
        CharStream input = CharStreams.fromStream(in);

        String globalVarDeclHover = BL4TextDocumentService.getHoverMessage(input, new Position(38,12));
        assertThat(globalVarDeclHover).isEqualTo("Declaration of global variable AssociatedWith");
    }

    @Test
    void testRuleName() throws Exception {
        InputStream in = this.getClass().getClassLoader()
                .getResourceAsStream("cr.l4");
        CharStream input = CharStreams.fromStream(in);

        String ruleNameHover = BL4TextDocumentService.getHoverMessage(input, new Position(61,7));
        assertThat(ruleNameHover).isEqualTo("Declaration of rule r1a");
    }

}